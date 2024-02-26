Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A5886758F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1493E10F161;
	Mon, 26 Feb 2024 12:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j5gwv/oL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAB210F161;
 Mon, 26 Feb 2024 12:48:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AD80ACE17B0;
 Mon, 26 Feb 2024 12:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD553C43390;
 Mon, 26 Feb 2024 12:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708951734;
 bh=Q3NH181a85YRTFivknWhvRlGzUVX6ut6yEVQtESkJik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j5gwv/oLxGBvshYM4XJsakKQspn+4PiYoY+JB8H+VNY+uM3lMbovSewvvS7qT4pPq
 NSpcoaLyasTfkJ9GZE0Ekv0zTg4XXDqtbcUNwIa2GVPeWQe70PVIrWjdD6hzUaCMKg
 hG24PwowVape7egBViKaXaknYe26QfBheDfrpqGdB6IE4W81shxhUm6pSrLgtDMM9C
 +RDgNYsJh8GwsjSI8kboes7lAMcB+jJH7zl70rs8XL+f6J+pgewKs/puDY8dj2mX3U
 5h1Khj5tIT8dSvdkzBje5gz/b6PPaTcopUTRzqdEVRU6BHxqN8SfcOcS0G42nq+oWN
 54jKq5HRKHgiw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] [v2] drm/xe/xe2: fix 64-bit division in pte_update_size
Date: Mon, 26 Feb 2024 13:46:38 +0100
Message-Id: <20240226124736.1272949-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226124736.1272949-1-arnd@kernel.org>
References: <20240226124736.1272949-1-arnd@kernel.org>
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

This function does not build on 32-bit targets when the compiler
fails to reduce DIV_ROUND_UP() into a shift:

ld.lld: error: undefined symbol: __aeabi_uldivmod
>>> referenced by xe_migrate.c
>>>               drivers/gpu/drm/xe/xe_migrate.o:(pte_update_size) in archive vmlinux.a

There are two instances in this function. Change the first to
use an open-coded shift with the same behavior, and the second
one to a 32-bit calculation, which is sufficient here as the size
is never more than 2^32 pages (16TB).

Fixes: 237412e45390 ("drm/xe: Enable 32bits build")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use correct Fixes tag
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a66fdf2d2991..ee1bb938c493 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -462,7 +462,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	} else {
 		/* Clip L0 to available size */
 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
-		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+		u32 num_4k_pages = (size + XE_PAGE_SIZE - 1) >> XE_PTE_SHIFT;
 
 		*L0 = size;
 		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
-- 
2.39.2

