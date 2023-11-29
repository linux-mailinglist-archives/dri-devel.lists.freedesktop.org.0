Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167327FD5E9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1C310E1AF;
	Wed, 29 Nov 2023 11:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E959E10E1AF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:38:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3DCD5B83EAC;
 Wed, 29 Nov 2023 11:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FF8C433C8;
 Wed, 29 Nov 2023 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701257935;
 bh=ufry6q9U5ZmREMm6xuUdy9QV3vgImT5VbY3R0cMBVYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aJvwWcWDK1PJDXxtbz3yC9wGeTMZuo3FPb8840B7EIqSF6i4F/8wPu5kDEiPa6ofB
 6gbB2wmIIWfgoMhCftIjLXb7/KuO0LrK3d1KxMxXg0IKms07CXk79yngHABb0vMYpt
 a/jgli2lJ4CBc2IWCB38u8uc9LSXoPISRDpvRIRn6n4aww9Pu54+qYRwIGgjE+tDxd
 L3xYxJD+ReUT6ltL47ZihjKKrSxnut15Dxfzk8IDZW9kD491OvfvB2a6180IcBOPIz
 Bm/RXJmP0eSaHBF9z9aDiiWmutNvi5PkdrdW9a0ykMjvCALbPuMOCvpMGBv3TMpNaf
 MSwNSDBGCoCAw==
From: Arnd Bergmann <arnd@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 2/2] drm/imagination: avoid -Woverflow warning
Date: Wed, 29 Nov 2023 12:33:08 +0100
Message-Id: <20231129113825.2961913-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129113825.2961913-1-arnd@kernel.org>
References: <20231129113825.2961913-1-arnd@kernel.org>
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The array size calculation in pvr_vm_mips_fini() appears to be incorrect based on
taking the size of the pointer rather than the size of the array, which manifests
as a warning about signed integer overflow:

In file included from include/linux/kernel.h:16,
                 from drivers/gpu/drm/imagination/pvr_rogue_fwif.h:10,
                 from drivers/gpu/drm/imagination/pvr_ccb.h:7,
                 from drivers/gpu/drm/imagination/pvr_device.h:7,
                 from drivers/gpu/drm/imagination/pvr_vm_mips.c:4:
drivers/gpu/drm/imagination/pvr_vm_mips.c: In function 'pvr_vm_mips_fini':
include/linux/array_size.h:11:25: error: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Werror=overflow]
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
      |                         ^
drivers/gpu/drm/imagination/pvr_vm_mips.c:106:24: note: in expansion of macro 'ARRAY_SIZE'
  106 |         for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
      |                        ^~~~~~~~~~

Just use the number of array elements directly here, and in the corresponding
init function for consistency.

Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor and MMU support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 7268cf6e630b..6c2e4cc4e6db 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -46,7 +46,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 	if (!mips_data)
 		return -ENOMEM;
 
-	for (page_nr = 0; page_nr < ARRAY_SIZE(mips_data->pt_pages); page_nr++) {
+	for (page_nr = 0; page_nr < PVR_MIPS_PT_PAGE_COUNT; page_nr++) {
 		mips_data->pt_pages[page_nr] = alloc_page(GFP_KERNEL | __GFP_ZERO);
 		if (!mips_data->pt_pages[page_nr]) {
 			err = -ENOMEM;
@@ -103,7 +103,7 @@ pvr_vm_mips_fini(struct pvr_device *pvr_dev)
 	int page_nr;
 
 	vunmap(mips_data->pt);
-	for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
+	for (page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
 		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
 			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 
-- 
2.39.2

