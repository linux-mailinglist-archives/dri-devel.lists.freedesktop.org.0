Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CA8696DD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0D310E265;
	Tue, 27 Feb 2024 14:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3euDZ3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24F010E265
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:16:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09BDD61241;
 Tue, 27 Feb 2024 14:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51190C433F1;
 Tue, 27 Feb 2024 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1709043373;
 bh=xVfocRMoWHUihPS3SogmE1oeUFt79/SX7r4pM2iBdLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M3euDZ3Rni/iTyERVdNOzVpFNbNArH97RsYPPn71MRJf58GO3g6goutAGAzXMzKR4
 8sqaye5cdGf7ITK4cMPPX7gK27jQZrUr8czkKDNncOyi3bdWr/Jw4ErYQF394Zt0xv
 zCGB+0sMaJgcMxBtxkwSQpd9nkY35+SorN8S0yzw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 6.1 085/195] drm/ttm: Fix an invalid freeing on already freed
 page in error path
Date: Tue, 27 Feb 2024 14:25:46 +0100
Message-ID: <20240227131613.291946379@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227131610.391465389@linuxfoundation.org>
References: <20240227131610.391465389@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 40510a941d27d405a82dc3320823d875f94625df upstream.

If caching mode change fails due to, for example, OOM we
free the allocated pages in a two-step process. First the pages
for which the caching change has already succeeded. Secondly
the pages for which a caching change did not succeed.

However the second step was incorrectly freeing the pages already
freed in the first step.

Fix.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240221073324.3303-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_pool.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -383,7 +383,7 @@ static void ttm_pool_free_range(struct t
 				enum ttm_caching caching,
 				pgoff_t start_page, pgoff_t end_page)
 {
-	struct page **pages = tt->pages;
+	struct page **pages = &tt->pages[start_page];
 	unsigned int order;
 	pgoff_t i, nr;
 


