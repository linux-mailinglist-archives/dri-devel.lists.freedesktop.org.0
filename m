Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031C83E316
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6AB10FE1E;
	Fri, 26 Jan 2024 20:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504E110FE23
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:17 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-59a1948acf1so111505eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299695; x=1706904495;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/A7qOk8QDd5Yz67lgpk7+8hgL1mkotwXK8EZWcV03Ds=;
 b=WL7fnQM3OoHbKO4Qm3fBuqfpDadHDrYLFmA3bf/JxqU+40y/tOYKUZv6DoiBMlK4rh
 v/lSa06g35EAN9xOMzGDqSPYg3OwIFZjWBEVvvvz+bh5+VNx98l1N9QxoWxNbLFkF1cP
 Jp58d8wNL898jc8cdi6r5FZdpNwyHI+ot6t7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299695; x=1706904495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/A7qOk8QDd5Yz67lgpk7+8hgL1mkotwXK8EZWcV03Ds=;
 b=HILVPGComO46rOShpHGRTyhFA6vh6wy9zbMt+avA6RPXshS+G5QCU9a4m5jQn/8vfU
 Dak6HDRf6jLUh5//l93uxiHdXq4eMiUxI/VMHd7ausZRZyyocwPVewRBFdIT+ltB9uk9
 a9BHUvtsmnmC6GIhNuoH53v+zbMTLPdxoFzEfbVycXQ436hDhdrTGep9MdH95sq9J3zq
 yDHkULQ/L84sbClz4FNKRaveBPIU+Tu54dwYtDJD+rN00E1ui2M3EjBrssuKIMFCiq9w
 HkqA7bfDL7+G0G0jYQ0A3mr4n1rdDCGTQAxBqO6HXl3qYxAemYi39khMTdVhvEzRtSQ8
 9F7Q==
X-Gm-Message-State: AOJu0Yz9dXS7kRdVT4RQsPwWHgpebhl5e+1gnygfFo2qORqpO1MOqZbS
 adI7TdjebCl/CgdDid05zpjR4ZWrtG1WFTB9pdYW9G7SqceGLiS4txx1HOqBViMpuvOq+RUAk82
 3bU1zn7o9p7terr7rzOmy55nYF1pfJTbTdBlqkYV1GqTf0eJqawNY5ZDRDQ1WqPQMPqBGY2qXwz
 zZivM3J0U89kVptGi+LW7CsRwM8Znot1z8jFcVyWf0cuwjSkw8+w==
X-Google-Smtp-Source: AGHT+IEUMudoML2cm9VfzuI8RZIoYC109MMO6L95t9unacZaVPKF68RGWefB/clmv8+sPLT4sMVtbQ==
X-Received: by 2002:a4a:2457:0:b0:599:4235:f71a with SMTP id
 v23-20020a4a2457000000b005994235f71amr197633oov.9.1706299694707; 
 Fri, 26 Jan 2024 12:08:14 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:14 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmwgfx: Make all surfaces shareable
Date: Fri, 26 Jan 2024 15:08:01 -0500
Message-Id: <20240126200804.732454-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

There is no real need to have a separate pool for shareable and
non-shareable surfaces. Make all surfaces shareable, regardless of whether
the drm_vmw_surface_flag_shareable has been specified.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c     |  6 +++---
 drivers/gpu/drm/vmwgfx/ttm_object.h     |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 17 ++++++-----------
 include/uapi/drm/vmwgfx_drm.h           |  5 +++--
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index ddf8373c1d77..6806c05e57f6 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2009-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -648,7 +648,6 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
  * @tfile: struct ttm_object_file identifying the caller
  * @size: The size of the dma_bufs we export.
  * @prime: The object to be initialized.
- * @shareable: See ttm_base_object_init
  * @type: See ttm_base_object_init
  * @refcount_release: See ttm_base_object_init
  *
@@ -656,10 +655,11 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
  * for data sharing between processes and devices.
  */
 int ttm_prime_object_init(struct ttm_object_file *tfile, size_t size,
-			  struct ttm_prime_object *prime, bool shareable,
+			  struct ttm_prime_object *prime,
 			  enum ttm_object_type type,
 			  void (*refcount_release) (struct ttm_base_object **))
 {
+	bool shareable = !!(type == VMW_RES_SURFACE);
 	mutex_init(&prime->mutex);
 	prime->size = PAGE_ALIGN(size);
 	prime->real_type = type;
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index e6b77ee33e55..573e038c0fab 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright (c) 2006-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2006-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -288,7 +288,6 @@ extern void ttm_object_device_release(struct ttm_object_device **p_tdev);
 extern int ttm_prime_object_init(struct ttm_object_file *tfile,
 				 size_t size,
 				 struct ttm_prime_object *prime,
-				 bool shareable,
 				 enum ttm_object_type type,
 				 void (*refcount_release)
 				 (struct ttm_base_object **));
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 10498725034c..e7a744dfcecf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -832,8 +832,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		srf->snooper.image = NULL;
 	}
 
-	user_srf->prime.base.shareable = false;
-	user_srf->prime.base.tfile = NULL;
 	if (drm_is_primary_client(file_priv))
 		user_srf->master = drm_file_get_master(file_priv);
 
@@ -847,10 +845,10 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 
 	/*
-	 * A gb-aware client referencing a shared surface will
-	 * expect a backup buffer to be present.
+	 * A gb-aware client referencing a surface will expect a backup
+	 * buffer to be present.
 	 */
-	if (dev_priv->has_mob && req->shareable) {
+	if (dev_priv->has_mob) {
 		struct vmw_bo_params params = {
 			.domain = VMW_BO_DOMAIN_SYS,
 			.busy_domain = VMW_BO_DOMAIN_SYS,
@@ -869,8 +867,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	}
 
 	tmp = vmw_resource_reference(&srf->res);
-	ret = ttm_prime_object_init(tfile, res->guest_memory_size, &user_srf->prime,
-				    req->shareable, VMW_RES_SURFACE,
+	ret = ttm_prime_object_init(tfile, res->guest_memory_size,
+				    &user_srf->prime,
+				    VMW_RES_SURFACE,
 				    &vmw_user_surface_base_release);
 
 	if (unlikely(ret != 0)) {
@@ -1549,8 +1548,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	tmp = vmw_resource_reference(res);
 	ret = ttm_prime_object_init(tfile, res->guest_memory_size, &user_srf->prime,
-				    req->base.drm_surface_flags &
-				    drm_vmw_surface_flag_shareable,
 				    VMW_RES_SURFACE,
 				    &vmw_user_surface_base_release);
 
@@ -2052,8 +2049,6 @@ int vmw_gb_surface_define(struct vmw_private *dev_priv,
 	}
 
 	*srf_out  = &user_srf->srf;
-	user_srf->prime.base.shareable = false;
-	user_srf->prime.base.tfile = NULL;
 
 	srf = &user_srf->srf;
 	srf->metadata = *req;
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 26549c86a91f..26d96fecb902 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright © 2009-2022 VMware, Inc., Palo Alto, CA., USA
+ * Copyright © 2009-2023 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -902,7 +902,8 @@ struct drm_vmw_shader_arg {
 /**
  * enum drm_vmw_surface_flags
  *
- * @drm_vmw_surface_flag_shareable:     Whether the surface is shareable
+ * @drm_vmw_surface_flag_shareable:     Deprecated - all userspace surfaces are
+ *                                      shareable.
  * @drm_vmw_surface_flag_scanout:       Whether the surface is a scanout
  *                                      surface.
  * @drm_vmw_surface_flag_create_buffer: Create a backup buffer if none is
-- 
2.40.1

