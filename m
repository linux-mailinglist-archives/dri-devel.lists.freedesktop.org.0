Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD5B3B8B0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 12:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE36910EB7B;
	Fri, 29 Aug 2025 10:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z79bxCEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5D910EB78;
 Fri, 29 Aug 2025 10:28:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6A474076E;
 Fri, 29 Aug 2025 10:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA46C4CEF0;
 Fri, 29 Aug 2025 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756463332;
 bh=8J1IzMo3NnCzGtvrH5epfwnEdZ4lAO3fgP6owIMX35c=;
 h=Date:From:To:Cc:Subject:From;
 b=Z79bxCEVLTByzDhfBQVphj6Rb1CrK7C+hy2bBVYdDqH1ni+tD9fuwYr5Lpc12a/pL
 dM4D0qraMY/Hi0v0s7Y4tZMu+Rq8pX6DpaVG0lx1nDLXh17GLtBMqFV4raqcFXuM8a
 NyiLdrGzRPLwnEa/mvSy4729ypPGAHiclCneoJ07bDfUTAl8YD7nGIpWmTyOZsb+jk
 KuAC5IVdRc0fd2I1Sy3Fgrtra0kr3xhvAGVNacTo4PZHKq+DD7sID+HhBjP9MBeNVY
 xG/D2tmLiQfViCqQmLbc/DtD45M9l3aqy+60283DP1dS4jOS6AS9Q6QHabko4jaEKR
 5FVy88QE2TelQ==
Date: Fri, 29 Aug 2025 12:28:45 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/xe: Avoid dozens of -Wflex-array-member-not-at-end
 warnings
Message-ID: <aLGA3RVR2JIEnNhc@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declaration to the end of the corresponding
structure. Notice that `struct dev_pagemap` is a flexible structure,
this is a structure that contains a flexible-array member.

Fix 56 of the following type of warnings:
drivers/gpu/drm/xe/xe_vram_types.h:69:28: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/xe/xe_vram_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 83772dcbf1af..183d358da741 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -66,8 +66,6 @@ struct xe_vram_region {
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @migrate: Back pointer to migrate */
 	struct xe_migrate *migrate;
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
 	/**
 	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
 	 * pages of this tile.
@@ -79,6 +77,8 @@ struct xe_vram_region {
 	 * This is generated when remap device memory as ZONE_DEVICE
 	 */
 	resource_size_t hpa_base;
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
 #endif
 };
 
-- 
2.43.0

