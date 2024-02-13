Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2D852D34
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 10:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7747110E081;
	Tue, 13 Feb 2024 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HLGi7my8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C210E081;
 Tue, 13 Feb 2024 09:57:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B293B61252;
 Tue, 13 Feb 2024 09:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55E0C433F1;
 Tue, 13 Feb 2024 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707818246;
 bh=kvqVpaVk50IzPZXU0zbw6srWa1WNF8IF4uR3vDkrvns=;
 h=From:To:Cc:Subject:Date:From;
 b=HLGi7my8bug6KjC9594j1s1zjeyGPS67H4uIlBCSZTwYYt3hKHFOep4cu2crIbocS
 8ZDjbcKKRvREI+oWMYpbd1R092rAAR2t7MuXElt/XsMzg4YKA1bFykJ3vvtZvixfav
 B4aJ7bTn9pp6AOe5GiZxTQxjkCgLEulvISVc+0KAnMzVLOtrDw9ajDmptCpR1W6mhb
 6yjEoJqSQqeuK62ts3lf8wIxGoPNDYTYcEozb6i8+2nMyBDcIxqkqtURhUdtWOBuR7
 0OkXKuzvXnmbofOY7tQoAe57fFV4+WU3C1vzBgFIG8asp/w9Sx8BabAPFGgar5KoWU
 Mw0bqGOnWx4sw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] drm/xe: avoid function cast warnings
Date: Tue, 13 Feb 2024 10:56:48 +0100
Message-Id: <20240213095719.454865-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang-16 warns about a cast between incompatible function types:

drivers/gpu/drm/xe/xe_range_fence.c:155:10: error: cast from 'void (*)(const void *)' to 'void (*)(struct xe_range_fence *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  155 |         .free = (void (*)(struct xe_range_fence *rfence)) kfree,
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Avoid this with a trivial helper function that calls kfree() here.

Fixes: 845f64bdbfc9 ("drm/xe: Introduce a range-fence utility")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_range_fence.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
index d35d9ec58e86..8510be4466eb 100644
--- a/drivers/gpu/drm/xe/xe_range_fence.c
+++ b/drivers/gpu/drm/xe/xe_range_fence.c
@@ -151,6 +151,11 @@ xe_range_fence_tree_next(struct xe_range_fence *rfence, u64 start, u64 last)
 	return xe_range_fence_tree_iter_next(rfence, start, last);
 }
 
+static void xe_range_fence_free(struct xe_range_fence * rfence)
+{
+	kfree(rfence);
+}
+
 const struct xe_range_fence_ops xe_range_fence_kfree_ops = {
-	.free = (void (*)(struct xe_range_fence *rfence)) kfree,
+	.free = xe_range_fence_free,
 };
-- 
2.39.2

