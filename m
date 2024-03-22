Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24469886C82
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 14:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9E1121A0;
	Fri, 22 Mar 2024 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="avp8i9QA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001B41121A0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 13:01:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C86E7CE17EF;
 Fri, 22 Mar 2024 13:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEC2C433F1;
 Fri, 22 Mar 2024 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711112491;
 bh=VKXZ5EiyC/sMfhPFARs9d2EI9ZmYp2NxpRRc4tFM258=;
 h=From:To:Cc:Subject:Date:From;
 b=avp8i9QABqS0tbhC4OSISqngSX7j2TBZ8uRtR48PjHP3iKXIYwsEL8qwYARpKdGAl
 aKiRYg8OMWoNmYE2vOokYymrMgxSmEXTuNZu6l0bv8piNRemsxwRRvYPcVjYaCwKUa
 uPLqM8c8/OTq0KeeTkarN4NAHwNIroWaes9u+ZC/iyLgxQ4lXmNQZ866rFVj6N+BA9
 ou8jc6irw8YnVsLTgubLbPw3fbCz1UOedbsUz1mfeddvCdsYfkPHsaIzkNYWjQ4v+5
 PQxYkBsDCBf15QHswHC70hSx1SGd16nGrG5LisEpZ5hTujgxCUaAHvh97Wob0Hwu6m
 IgPCdwMTpY8+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Donald Robson <donald.robson@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] drm/imagination: avoid -Woverflow warning
Date: Fri, 22 Mar 2024 14:01:09 +0100
Message-Id: <20240322130124.902165-1-arnd@kernel.org>
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
Reviewed-by: Donald Robson <donald.robson@imgtec.com>
Link: https://lore.kernel.org/lkml/9df9e4f87727399928c068dbbf614c9895ae15f9.camel@imgtec.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I sent this one last year when the warning appeared, it looks like it
got lost in the meantime, resending it unchanged.
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index b7fef3c797e6..4f99b4af871c 100644
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
@@ -102,7 +102,7 @@ pvr_vm_mips_fini(struct pvr_device *pvr_dev)
 	int page_nr;
 
 	vunmap(mips_data->pt);
-	for (page_nr = ARRAY_SIZE(mips_data->pt_pages) - 1; page_nr >= 0; page_nr--) {
+	for (page_nr = PVR_MIPS_PT_PAGE_COUNT - 1; page_nr >= 0; page_nr--) {
 		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
 			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 
-- 
2.39.2

