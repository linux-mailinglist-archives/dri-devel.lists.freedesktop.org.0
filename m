Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAb+OdAfk2mM1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:46:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF011440AE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F4F10E02A;
	Mon, 16 Feb 2026 13:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gTKHCro2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663A10E02A;
 Mon, 16 Feb 2026 13:46:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86A47600BB;
 Mon, 16 Feb 2026 13:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D363EC116C6;
 Mon, 16 Feb 2026 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771249611;
 bh=vPwDF8MJNcnBiZWSZeHRapffZWJMtIipr0elh3nylZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=gTKHCro2ySCTBE65L2zWi/J5LKjehFb3/zYpWaoC8o1AOO4Svv9Pzf+ZfqIDjR0rh
 xb6ayqBaO/7KT90X51Pl64yB9B9pFF+r+uEsdBZJd22d3bgoZwbz5I4shiyumR/7VO
 NRWiDvX90GX2Rx1qSeNgl3OKiz2lYRA6LvG30DVVaQefGEpDIfTltO8ocVkpRBZhOn
 Eb1MhWtmKqTG3snvY/F4u5VPOz6jGBQ56JwgjaCIXrb782ODPFJP9bY5NrudXkC2b6
 aqcynndEbp7LQtq2+LuoDPBh4bkPSWOGvNRcRRvMSLXMArXmh/SyJZzW3TBUJBKB0T
 Ne8xP+MQh5/Xg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: [PATCH] [v2] drm/pagemap: pass pagemap_addr by reference
Date: Mon, 16 Feb 2026 14:46:01 +0100
Message-Id: <20260216134644.1025365-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 5DF011440AE
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

Passing a structure by value into a function is sometimes problematic,
for a number of reasons. Of of these is a warning from the 32-bit arm
compiler:

drivers/gpu/drm/drm_gpusvm.c: In function '__drm_gpusvm_unmap_pages':
drivers/gpu/drm/drm_gpusvm.c:1152:33: note: parameter passing for argument of type 'struct drm_pagemap_addr' changed in GCC 9.1
 1152 |                                 dpagemap->ops->device_unmap(dpagemap,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1153 |                                                             dev, *addr);
      |                                                             ~~~~~~~~~~~

This particular problem is harmless since we are not mixing compiler versions
inside of the compiler. However, passing this by reference avoids the warning
along with providing slightly better calling conventions as it avoids an
extra copy on the stack.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_gpusvm.c  | 2 +-
 drivers/gpu/drm/drm_pagemap.c | 2 +-
 drivers/gpu/drm/xe/xe_svm.c   | 8 ++++----
 include/drm/drm_pagemap.h     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index c25f50cad6fe..81626b00b755 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1150,7 +1150,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 					       addr->dir);
 			else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
-							    dev, *addr);
+							    dev, addr);
 			i += 1 << addr->order;
 		}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index d0041c947a28..22579806c055 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -318,7 +318,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 			struct drm_pagemap_zdd *zdd = page->zone_device_data;
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 
-			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
+			dpagemap->ops->device_unmap(dpagemap, dev, &pagemap_addr[i]);
 		} else {
 			dma_unmap_page(dev, pagemap_addr[i].addr,
 				       PAGE_SIZE << pagemap_addr[i].order, dir);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..78f4b2c60670 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1676,13 +1676,13 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 
 static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
 					struct device *dev,
-					struct drm_pagemap_addr addr)
+					const struct drm_pagemap_addr *addr)
 {
-	if (addr.proto != XE_INTERCONNECT_P2P)
+	if (addr->proto != XE_INTERCONNECT_P2P)
 		return;
 
-	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
-			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_resource(dev, addr->addr, PAGE_SIZE << addr->order,
+			   addr->dir, DMA_ATTR_SKIP_CPU_SYNC);
 }
 
 static void xe_pagemap_destroy_work(struct work_struct *work)
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..c848f578e3da 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -95,7 +95,7 @@ struct drm_pagemap_ops {
 	 */
 	void (*device_unmap)(struct drm_pagemap *dpagemap,
 			     struct device *dev,
-			     struct drm_pagemap_addr addr);
+			     const struct drm_pagemap_addr *addr);
 
 	/**
 	 * @populate_mm: Populate part of the mm with @dpagemap memory,
-- 
2.39.5

