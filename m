Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2715D37C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C250A6EB51;
	Fri, 14 Feb 2020 08:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1AF6E56A;
 Thu, 13 Feb 2020 11:59:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a6so6406226wme.2;
 Thu, 13 Feb 2020 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPDnQoPm/TisYTEDZZ9TQob1WhA4sC65mCOv36PT5K0=;
 b=fo5iOOUEBIzHaK+0AMfELUaW2SO2oZXPIRVxvxxl3AiyB6aVNRjHZJdhmgBlGs6Jlk
 rbsKFgGM0Gxg59d7bC5f6mCMOfmTNW5kHk0smtnJceoDQTfyJor2eEeZUTroFXyxNDOF
 PtEZWVWPeZWuIy6VDVeRN8ALcARXC08phUy+o6HZxkQoh1LjG2YKvH/WO7KKgBTrSXX+
 e9gnes1vV1KYwb9auaGvvXDm/40hz5yzKqWXRIGiGe5jaII0EkXu/9pGG6rxAI+X9oMm
 cwBPyO8hdF1BPy6H98WBQ70Dffi7IZojGdociS84y4W/Az9geSO70NyVzVV3OewdjHhR
 YTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPDnQoPm/TisYTEDZZ9TQob1WhA4sC65mCOv36PT5K0=;
 b=mAWb1hdcSyTfoMxXjqtS+BBLlCXdijhZp8yFy/Kgm78A28RKgmdcuwgglm+i2yqRrx
 Rqt6/S2XOxKrqTkmrfBsAwAH/tgbZ3xABWOhkM8+uzyuPefpeh3n0yW7TJTaLaqObph4
 wbRS8V9D+LXvPvZTifqzje+MwdYxZhDlrLiKtO7ttS/aJEJkFHl5xzTY0FBNg+6m3aCr
 IaAElRRDizs3PbVEeEwTLp6ZxX43f+OEl6kBKYsx1nXwwcovjs5BK2vfzNJ0OY8C9/KC
 N2wPHNmkBlNG+URiywdD2WtTFQPx1uxH15jU8hfRmeDwiaxaUsCW5oSUCd01cX8bk3aZ
 42qw==
X-Gm-Message-State: APjAAAVAGJ4ok4pSDLEMivydEoa35u3hxq1cM7SAL8PTKYV934JUcXEk
 VINK+wEXl4pubpSb16UD2JqaoWGhwoXTsQ==
X-Google-Smtp-Source: APXvYqy7wfcG6zfEgUr2p9/ErhggUnI94xe1Mb+HamfeOEKwm0/TuGzWwckxW3UHU96OO0N0AqsWdw==
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr5504417wmi.104.1581595178128; 
 Thu, 13 Feb 2020 03:59:38 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2A5E004DB99F42976E8A13.dip0.t-ipconnect.de.
 [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13])
 by smtp.gmail.com with ESMTPSA id y131sm2803985wmc.13.2020.02.13.03.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 03:59:37 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 5/6] drm/qxl: don't use ttm bo->offset
Date: Thu, 13 Feb 2020 13:02:02 +0100
Message-Id: <20200213120203.29368-6-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/qxl/qxl_drv.h    | 6 ++----
 drivers/gpu/drm/qxl/qxl_kms.c    | 3 +++
 drivers/gpu/drm/qxl/qxl_object.h | 5 -----
 drivers/gpu/drm/qxl/qxl_ttm.c    | 9 ---------
 4 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 27e45a2d6b52..9a76a2a0283d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -311,10 +311,8 @@ qxl_bo_physical_address(struct qxl_device *qdev, struct qxl_bo *bo,
 		(bo->tbo.mem.mem_type == TTM_PL_VRAM)
 		? &qdev->main_slot : &qdev->surfaces_slot;
 
-	WARN_ON_ONCE((bo->tbo.offset & slot->gpu_offset) != slot->gpu_offset);
-
-	/* TODO - need to hold one of the locks to read tbo.offset */
-	return slot->high_bits | (bo->tbo.offset - slot->gpu_offset + offset);
+	return slot->high_bits | ((bo->tbo.mem.start << PAGE_SHIFT) +
+				  slot->gpu_offset + offset);
 }
 
 /* qxl_display.c */
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 611cbe7aee69..937cac9ba384 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -71,11 +71,14 @@ static void setup_slot(struct qxl_device *qdev,
 		       unsigned long size)
 {
 	uint64_t high_bits;
+	unsigned int gpu_offset_shift =
+		64 - (qdev->rom->slot_gen_bits + qdev->rom->slot_id_bits + 8);
 
 	slot->index = slot_index;
 	slot->name = slot_name;
 	slot->start_phys_addr = start_phys_addr;
 	slot->size = size;
+	slot->gpu_offset = (uint64_t)slot_index << gpu_offset_shift;
 
 	setup_hw_slot(qdev, slot);
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 8ae54ba7857c..21fa81048f4f 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -48,11 +48,6 @@ static inline void qxl_bo_unreserve(struct qxl_bo *bo)
 	ttm_bo_unreserve(&bo->tbo);
 }
 
-static inline u64 qxl_bo_gpu_offset(struct qxl_bo *bo)
-{
-	return bo->tbo.offset;
-}
-
 static inline unsigned long qxl_bo_size(struct qxl_bo *bo)
 {
 	return bo->tbo.num_pages << PAGE_SHIFT;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 16a5e903533d..2a43d0ef9ba1 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -56,11 +56,6 @@ static int qxl_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
 static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 			     struct ttm_mem_type_manager *man)
 {
-	struct qxl_device *qdev = qxl_get_qdev(bdev);
-	unsigned int gpu_offset_shift =
-		64 - (qdev->rom->slot_gen_bits + qdev->rom->slot_id_bits + 8);
-	struct qxl_memslot *slot;
-
 	switch (type) {
 	case TTM_PL_SYSTEM:
 		/* System memory */
@@ -71,11 +66,7 @@ static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 	case TTM_PL_PRIV:
 		/* "On-card" video ram */
-		slot = (type == TTM_PL_VRAM) ?
-			&qdev->main_slot : &qdev->surfaces_slot;
-		slot->gpu_offset = (uint64_t)type << gpu_offset_shift;
 		man->func = &ttm_bo_manager_func;
-		man->gpu_offset = slot->gpu_offset;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED |
 			     TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_MASK_CACHING;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
