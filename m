Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E568E82913B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 01:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C3910E53E;
	Wed, 10 Jan 2024 00:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C6510E53E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 00:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=bF0k0tFraimuHpTxlpeFxettK+6lOSjFaik485rQmnU=; b=JHqplrN0VLcDSd2g3cK40qKbMv
 bLTSFEiVSde18qwFh1nAeDYleqtxs8pdl9m2FAUGQlIrlh8Pd4YxbtxAjAuRob8Ch6MJ7NGCjotZE
 oJybtbIYRtRpKPoaXNqbf7DrOJNTMzJ4RNuQsIs5l9wPT2OQAau3OSRrCgySeHXMHsYbBd5W8jdIO
 sLRH93vL3eW3qMyegjvFmWrQcZNZUYXTZChBC1YR4H2dpHtpnOb/l3/8/kmN7w/6o+QNDKJ18jbvt
 kP0+FUDwwIvtCbTYsDAgjpLXyZdey9EtVrnl8LIrChtKcmlkKEAgUIfOqMnaqJUFnwxUx4yj1/N5T
 LJlQwORA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rNMNr-009wAB-1h; Wed, 10 Jan 2024 00:23:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imagination: fix ARRAY_SIZE build error
Date: Tue,  9 Jan 2024 16:23:50 -0800
Message-ID: <20240110002350.1096-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a build error when using GCC 13.2.0 from kernel.org crosstools
by changing ARRAY_SIZE() to the macro PVR_MIPS_PT_PAGE_COUNT:

drivers/gpu/drm/imagination/pvr_vm_mips.c: In function 'pvr_vm_mips_fini':
../include/linux/array_size.h:11:25: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
      |                         ^
drivers/gpu/drm/imagination/pvr_vm_mips.c:105:24: note: in expansion of macro 'ARRAY_SIZE'
  105 |         for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
      |                        ^~~~~~~~~~

Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor and MMU support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Donald Robson <donald.robson@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -46,7 +46,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_
 	if (!mips_data)
 		return -ENOMEM;
 
-	for (page_nr = 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_nr++) {
+	for (page_nr = 0; page_nr < PVR_MIPS_PT_PAGE_COUNT; page_nr++) {
 		mips_data->pt_pages[page_nr] = alloc_page(GFP_KERNEL | __GFP_ZERO);
 		if (!mips_data->pt_pages[page_nr]) {
 			err = -ENOMEM;
@@ -102,7 +102,7 @@ pvr_vm_mips_fini(struct pvr_device *pvr_
 	int page_nr;
 
 	vunmap(mips_data->pt);
-	for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
+	for (page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
 		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
 			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 
