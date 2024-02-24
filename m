Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14408624EF
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 13:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325A010E17F;
	Sat, 24 Feb 2024 12:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjL/ME58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EBD10E0F5;
 Sat, 24 Feb 2024 12:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 40014CE2BF5;
 Sat, 24 Feb 2024 12:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6462C433F1;
 Sat, 24 Feb 2024 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708776971;
 bh=FVqwkjBGiGZ+FrnuOmvhnP6hzKLmcnGCY/w4xZTohpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XjL/ME582gBj+PnpaYTcAJdRjWCltO0ujLpFGlmYasM9RQuSkdzve0IpVw+2qvHrb
 4oqTU1S+Iep91HOzIAgIb+hHbKAhsa9/b3uTFbcowMuARdI3FpC4SAwzG/DR+zo3CV
 aPrwkUhUDsQrdBsTyE5lAkwd3Rp5jpwNDIcIfx1X7WaWscenCVj97SVKk16zJe3L5U
 KF8z9/nNbY+1dQFiuJEnfp/+cJnxufDun68bUW1FNO2I8JVGO3cbkJ12p3x1s3Az1S
 IjrNd3LUfFkHv4PjvnnH+cDfNE5fHimeCIxJu5w8by24eFIaNEYMXmosPgkoyqsmSS
 MrYuj+UrUAwKQ==
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
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/xe/xe2: fix 64-bit division in pte_update_size
Date: Sat, 24 Feb 2024 13:15:01 +0100
Message-Id: <20240224121528.1972719-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224121528.1972719-1-arnd@kernel.org>
References: <20240224121528.1972719-1-arnd@kernel.org>
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

Fixes: ea97a66a2218 ("drm/xe: Disable 32bits build")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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

