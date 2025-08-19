Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E070B2C309
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAA610E5D8;
	Tue, 19 Aug 2025 12:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="myFdG+zN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603A710E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:17:27 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b471756592cso3529654a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605847; x=1756210647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWV0vVeINjxfROFedsb1z6gg/iy2s16vpsTiJJvBM0c=;
 b=myFdG+zNG0sMSLue0zoQhL+P6k63EY7QbKVorEtj4XSv52LoKSlOCuALe8wVNQqLq0
 ZvWUKKyuOUCgSeKz8mLSedHFI1Y3YBkER0BYNDWNZgDFag7w6nxEZ1BH+SDDn9K56Ij+
 Ai2lxsUyXzoI+r+VlClMrJYQpIJPqw3uqOEaG3Lmig15YGPsmJRdXYCRAwxGQ1Z+O1Ez
 JyT3kxOjaL8FA1LvQ/x2MGUp4I4lxEwXzVxMyFEE+a7IoPCESIczud/N7+aRmT0EXFFu
 AVJQWXTK7Itvxtb5OF/PjhmXkbERy67U5K32k4g46dgbe6xGSkM5lp42Kdx4GWRyMzJk
 Tbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605847; x=1756210647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWV0vVeINjxfROFedsb1z6gg/iy2s16vpsTiJJvBM0c=;
 b=enwKxr3rTwanFrvFHh4LGsp7sOJe4dkjOPdhYT2gPuKdqm6nJ2FUkd2P2fr6sVFIQ7
 +x8IkCrXig//9jS0GG8Cj/WAUwNc0iO64HgD1JVKU/bMxoIOTznLRqNUZjWbAAXZwXp7
 yzn7X8UtA+Qx83uu7ZlK2dJiFJ05kmfz1dIhbEHVYU64L+b7I81KjjFr3ZQW1DRFMWdW
 fAHHcmGAy2CNxc+FDzex+8LAqsydSjqfjrntFT7M31s8sBp2MtG/sDjf42L9Bi0eZNNW
 b4zv/EAi/KMih+cX1WUfzmut3LNOzfA8zYMRJQi7dVEG7IwXZ7BXPRRmyQCtluZvB9Hc
 4T8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5laeGd+cXS20TVWS2Y0wIPzVv3rH2mAoXpHwWWE+FSe4xUsoM6ktT+BCuECp3+eLTs+SKIP9xqeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw++AW6stbh3NtZ8VHcozNpqiH/NPR8+3Il5RAN3pMHNFw+zxsb
 WM7xkDDBu+Gw9JtbLYRbKvjFz6azwvApGKmer0NvC5+O4ayaUXlnXQ4X
X-Gm-Gg: ASbGnct9Es3ncmPp4sZaswcL0s4eJkVLTdY36nFVeUVPduLrdtIFkqCdU/UH4TFtSFZ
 urVLKu5ICQqKLS0Fqk0XBt4As2bn9WG9Zvia8u+ImuEQLhScXnbELwlP+1BjN8WjVxUAewyVpWY
 lbs+H12gSOgiPrZqe4SI9CW4ze+UuYCOlQ2dagnir66qnty9saslL/YfTnB0kRxwRBiQ7sbafQM
 vMsyE7pEGZS8rs1TwHJOH9m0F6KmHmlJnAEXLXPkDYgZi/oADn+6fMr20mk9qGZ+655DyUeVj2s
 s6F01HBFyqEkvvwWsBMd4Qu6R2qy48UphEeIv/PsrM/j2SzLA6q1QvAGbF153+Io/IKaXqD7Oxy
 pvQzQv+E88sdtDIs84Q==
X-Google-Smtp-Source: AGHT+IF4qxL0U9vpZ0HxdELT3VX2+7tfvAlLdXWTxv3BAaxYCg97WMvRMcDAIOayDSjp3fkucWBHtw==
X-Received: by 2002:a17:903:b0d:b0:244:99aa:5484 with SMTP id
 d9443c01a7336-245e04704dfmr33200635ad.33.1755605846818; 
 Tue, 19 Aug 2025 05:17:26 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9ef54sm108352705ad.26.2025.08.19.05.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:17:26 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com,
	tzimmermann@suse.de
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, krathul3152@gmail.com,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org
Subject: [PATCH v3] drm: Replace the deprecated DRM_* logging macros in gem
 helper files
Date: Tue, 19 Aug 2025 17:41:03 +0530
Message-ID: <20250819121517.46998-2-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
References: <90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com>
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

Replace the DRM_* logging macros used in gem helper files with the appropriate
ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v3:
    - Revert all changes to drm_gem_objects_lookup()
    - Use drm_device as suggested in [1]. 
Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().

[1]
https://lore.kernel.org/dri-devel/90f79bba-bee6-47ea-9881-9ae37eae42e0@intel.com
---
 drivers/gpu/drm/drm_gem.c            | 10 +++++++---
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..fbea8c50f17c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+		drm_err(dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -787,6 +787,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	u32 *handles;
 	struct drm_gem_object **objs;
 
+	struct drm_device *dev = filp->minor->dev;
+
 	if (!count)
 		return 0;
 
@@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -856,9 +858,11 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 	long ret;
 	struct drm_gem_object *obj;
 
+	struct drm_device *dev = filep->minor->dev;
+
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.50.1

