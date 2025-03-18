Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA2A676F7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D992B10E4A6;
	Tue, 18 Mar 2025 14:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BojCAPIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBC210E4A6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:56:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0AEEA48947;
 Tue, 18 Mar 2025 14:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3DE0C4CEDD;
 Tue, 18 Mar 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742309761;
 bh=AlJhTygUnWi1A5x8xEuqFE55f0hkzllSofcaYubOFTo=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=BojCAPIVfs3nKtLXpvPBmvFo5VlYQsijKd93ZB/mY4N1ezEmihmKwmQtLU7HqmtWL
 y1XAd5/8tM9mSEVs0dfGtYdBkdKenEF8JeAwZ27Kl4n+BAFjJMmtQIZQ8uuOmSDHAT
 qob6dbDfv2VYND3jtPKJrPTbyKLXVk4PFUhru9d8bky45QOu9OolMLCB1Hb+iVfvRS
 mu3x7VlfjIRKZAdF+3edB05AxGEeUzh0jNRvQKB42c2UGeS9w+8Z+jprw/oTDLYuPM
 YkJ1NdiXKMi3KsvDTJV1OGLqQwt2Zxfx6sEmdl0vo0LmqqtWush0fVfeLUJZiYTFcS
 hm3GcDRSym03w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E75A3C282EC;
 Tue, 18 Mar 2025 14:56:00 +0000 (UTC)
From: Brendan King via B4 Relay <devnull+Brendan.King.imgtec.com@kernel.org>
Date: Tue, 18 Mar 2025 14:55:55 +0000
Subject: [PATCH] drm/imagination: fix firmware memory leaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAHqJ2WcC/x3NSwrCMBAA0KuUWTuQNAqtVxEXY2aiofmUifVD6
 d0tLt/qrdBEozQ4dyuovGKLteywhw78g8pdMPJu6E1/Ms4OyDzVualH69yIIWp+kwqqJHoKY5Z
 c9YtJaMJaMFdekuBSUiVGbwca6RjY8A32YVYJ8fPfL9dt+wEDxHlmjQAAAA==
X-Change-ID: 20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-c18a9a4fd0db
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Brendan King <brendan.king@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742309760; l=4351;
 i=Brendan.King@imgtec.com; s=20250203; h=from:subject:message-id;
 bh=/tpZNJco7ixoFS3Y/59hpGwTqnZcAO294fgaBdsHDXU=;
 b=bhs35S9gsWUOIZq7fNMzJbm/UE6mkSmy7amvUCpvBWNFf/P7mjoghfcdRsE0TZo+Wr0Rt7nOE
 L4Lq6EZAPvWB2K6upVhvX8xoy31VeQVdxjNuyYsNitTv0EA63v6Q3Fq
X-Developer-Key: i=Brendan.King@imgtec.com; a=ed25519;
 pk=i3JvC3unEBLW+4r5s/aEWQZFsRCWaCBrWdFbMXIXCqg=
X-Endpoint-Received: by B4 Relay for Brendan.King@imgtec.com/20250203 with
 auth_id=335
X-Original-From: Brendan King <Brendan.King@imgtec.com>
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
Reply-To: Brendan.King@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brendan King <Brendan.King@imgtec.com>

Free the memory used to hold the results of firmware image processing
when the module is unloaded.

Fix the related issue of the same memory being leaked if processing
of the firmware image fails during module load.

Ensure all firmware GEM objects are destroyed if firmware image
processing fails.

Fixes memory leaks on powervr module unload detected by Kmemleak:

unreferenced object 0xffff000042e20000 (size 94208):
  comm "modprobe", pid 470, jiffies 4295277154
  hex dump (first 32 bytes):
    02 ae 7f ed bf 45 84 00 3c 5b 1f ed 9f 45 45 05  .....E..<[...EE.
    d5 4f 5d 14 6c 00 3d 23 30 d0 3a 4a 66 0e 48 c8  .O].l.=#0.:Jf.H.
  backtrace (crc dd329dec):
    kmemleak_alloc+0x30/0x40
    ___kmalloc_large_node+0x140/0x188
    __kmalloc_large_node_noprof+0x2c/0x13c
    __kmalloc_noprof+0x48/0x4c0
    pvr_fw_init+0xaa4/0x1f50 [powervr]

unreferenced object 0xffff000042d20000 (size 20480):
  comm "modprobe", pid 470, jiffies 4295277154
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 09 00 00 00 0b 00 00 00  ................
    00 00 00 00 00 00 00 00 07 00 00 00 08 00 00 00  ................
  backtrace (crc 395b02e3):
    kmemleak_alloc+0x30/0x40
    ___kmalloc_large_node+0x140/0x188
    __kmalloc_large_node_noprof+0x2c/0x13c
    __kmalloc_noprof+0x48/0x4c0
    pvr_fw_init+0xb0c/0x1f50 [powervr]

Cc: stable@vger.kernel.org
Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")
Signed-off-by: Brendan King <brendan.king@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 3debc9870a82ae7de9b2dc173df84c466c137bb3..d09c4c68411627714c14dee5ed4e61b07baca1ba 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -732,7 +732,7 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 					       fw_mem->core_data, fw_mem->core_code_alloc_size);
 
 	if (err)
-		goto err_free_fw_core_data_obj;
+		goto err_free_kdata;
 
 	memcpy(fw_code_ptr, fw_mem->code, fw_mem->code_alloc_size);
 	memcpy(fw_data_ptr, fw_mem->data, fw_mem->data_alloc_size);
@@ -742,10 +742,14 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 		memcpy(fw_core_data_ptr, fw_mem->core_data, fw_mem->core_data_alloc_size);
 
 	/* We're finished with the firmware section memory on the CPU, unmap. */
-	if (fw_core_data_ptr)
+	if (fw_core_data_ptr) {
 		pvr_fw_object_vunmap(fw_mem->core_data_obj);
-	if (fw_core_code_ptr)
+		fw_core_data_ptr = NULL;
+	}
+	if (fw_core_code_ptr) {
 		pvr_fw_object_vunmap(fw_mem->core_code_obj);
+		fw_core_code_ptr = NULL;
+	}
 	pvr_fw_object_vunmap(fw_mem->data_obj);
 	fw_data_ptr = NULL;
 	pvr_fw_object_vunmap(fw_mem->code_obj);
@@ -753,7 +757,7 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 
 	err = pvr_fw_create_fwif_connection_ctl(pvr_dev);
 	if (err)
-		goto err_free_fw_core_data_obj;
+		goto err_free_kdata;
 
 	return 0;
 
@@ -763,13 +767,16 @@ pvr_fw_process(struct pvr_device *pvr_dev)
 	kfree(fw_mem->data);
 	kfree(fw_mem->code);
 
-err_free_fw_core_data_obj:
 	if (fw_core_data_ptr)
-		pvr_fw_object_unmap_and_destroy(fw_mem->core_data_obj);
+		pvr_fw_object_vunmap(fw_mem->core_data_obj);
+	if (fw_mem->core_data_obj)
+		pvr_fw_object_destroy(fw_mem->core_data_obj);
 
 err_free_fw_core_code_obj:
 	if (fw_core_code_ptr)
-		pvr_fw_object_unmap_and_destroy(fw_mem->core_code_obj);
+		pvr_fw_object_vunmap(fw_mem->core_code_obj);
+	if (fw_mem->core_code_obj)
+		pvr_fw_object_destroy(fw_mem->core_code_obj);
 
 err_free_fw_data_obj:
 	if (fw_data_ptr)
@@ -836,6 +843,12 @@ pvr_fw_cleanup(struct pvr_device *pvr_dev)
 	struct pvr_fw_mem *fw_mem = &pvr_dev->fw_dev.mem;
 
 	pvr_fw_fini_fwif_connection_ctl(pvr_dev);
+
+	kfree(fw_mem->core_data);
+	kfree(fw_mem->core_code);
+	kfree(fw_mem->data);
+	kfree(fw_mem->code);
+
 	if (fw_mem->core_code_obj)
 		pvr_fw_object_destroy(fw_mem->core_code_obj);
 	if (fw_mem->core_data_obj)

---
base-commit: 96c85e428ebaeacd2c640eba075479ab92072ccd
change-id: 20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-c18a9a4fd0db

Best regards,
-- 
Brendan King <Brendan.King@imgtec.com>


