Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563894C583
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 22:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D5510E7F5;
	Thu,  8 Aug 2024 20:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="NYEtSdT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287EC10E7F5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 20:06:50 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-70b3b62025dso867415a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723147610; x=1723752410;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+d690MXqBd4ZOM3IXz+2UEKXsC/sKhGNvU0C5A0MH10=;
 b=NYEtSdT7LNMZbW7eTaJzW8Y9pvTxCa5iO8cWv1O6GkuxP94lL5jtHdkj/5o4sGJ7Gd
 i+tHwdZHpeXVwUBikpcy6qMTGA3eGBkLbnZzhZ0LW8NtDO/rsCm3jX6t+2wz0jhp58TT
 pSUTZxts1LjPLVeIHVcTggQi6+y8Mt8Il3Euk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723147610; x=1723752410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+d690MXqBd4ZOM3IXz+2UEKXsC/sKhGNvU0C5A0MH10=;
 b=mEJcqgAoFASofX73cIFCGSoljW3PEHfDzgrNkeTmOOc5IbzALsJCNC0FYK/FvmhrGo
 ghVuE/h00n+plVzPxazboa1uLzRKvdaLnn+cjTEeZ5qYACfVXSaU4CPj4B8cre2azybs
 1/S0IEI9SJ9AnBgCwRfRgFlzh4ywlF1TC9AqzYjiwc8lH8qldw7j+ewtHGzmQChlKVU0
 w2q9B5JCE0ukUhQbd2w7YHv6wFCI7pW25S5ZeJ8Gzuvdhnm3ixZCqW2W70LhKQZvis3v
 fHBmNlLOzkyhQe3FS1S+pY42Jc7WczoLZB/LLfu6uJ78gdNUgrV8B6Rma6y9vJ0rhjGn
 +e6g==
X-Gm-Message-State: AOJu0Yw+kJ4lx4zMfEpBQ7ySw/JcMXM6Pktv4B/Vz6rFdbsmROczsY2v
 BAja0PY20un6OI2WMhbrlzlfWmcQiWk1aiiPLxfxpaMthATNHM4aPw6KHQNBulQiaYHEF6w7oae
 MX53r+F6nj8R+0y97d7UW7gw+fgWPWPB1UZwMAAw6LHKIWadrCTtW2d5hD93TcHPrzeYPhrrMJP
 jSOo9R4rHIdVVZ4YU2Bsiu3ga/atg+EkXOdpTsiniUcJREwm2zwA==
X-Google-Smtp-Source: AGHT+IH4jfOk2choPm+SaZCcmxtT6fFJjcOYntrFmVS/hxqmYA7IbemKZr29KpwlZpEwa+VvEdCjgQ==
X-Received: by 2002:a05:6808:1688:b0:3db:1f8a:2aec with SMTP id
 5614622812f47-3dc3b41d08amr3191144b6e.19.1723147609848; 
 Thu, 08 Aug 2024 13:06:49 -0700 (PDT)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a3786e3cdfsm190687785a.128.2024.08.08.13.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 13:06:49 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 zack.rusin@broadcom.com
Subject: [PATCH] drm/vmwgfx: Limit display layout ioctl array size to
 VMWGFX_NUM_DISPLAY_UNITS
Date: Thu,  8 Aug 2024 15:06:34 -0500
Message-Id: <20240808200634.1074083-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Currently the array size is only limited by the largest kmalloc size which
is incorrect. This change will also return a more specific error message
than ENOMEM to userspace.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 3 ---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 32f50e595809..888349f2aac1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -62,7 +62,7 @@
 #define VMWGFX_DRIVER_MINOR 20
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
-#define VMWGFX_MAX_DISPLAYS 16
+#define VMWGFX_NUM_DISPLAY_UNITS 8
 #define VMWGFX_CMD_BOUNCE_INIT_SIZE 32768
 
 #define VMWGFX_MIN_INITIAL_WIDTH 1280
@@ -82,7 +82,7 @@
 #define VMWGFX_NUM_GB_CONTEXT 256
 #define VMWGFX_NUM_GB_SHADER 20000
 #define VMWGFX_NUM_GB_SURFACE 32768
-#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_MAX_DISPLAYS
+#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_NUM_DISPLAY_UNITS
 #define VMWGFX_NUM_DXCONTEXT 256
 #define VMWGFX_NUM_DXQUERY 512
 #define VMWGFX_NUM_MOB (VMWGFX_NUM_GB_CONTEXT +\
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb..884804274dfb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2225,7 +2225,7 @@ int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_vmw_update_layout_arg *arg =
 		(struct drm_vmw_update_layout_arg *)data;
-	void __user *user_rects;
+	const void __user *user_rects;
 	struct drm_vmw_rect *rects;
 	struct drm_rect *drm_rects;
 	unsigned rects_size;
@@ -2237,6 +2237,8 @@ int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 					    VMWGFX_MIN_INITIAL_HEIGHT};
 		vmw_du_update_layout(dev_priv, 1, &def_rect);
 		return 0;
+	} else if (arg->num_outputs > VMWGFX_NUM_DISPLAY_UNITS) {
+		return -E2BIG;
 	}
 
 	rects_size = arg->num_outputs * sizeof(struct drm_vmw_rect);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 6141fadf81ef..2a6c6d6581e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -199,9 +199,6 @@ struct vmw_kms_dirty {
 	s32 unit_y2;
 };
 
-#define VMWGFX_NUM_DISPLAY_UNITS 8
-
-
 #define vmw_framebuffer_to_vfb(x) \
 	container_of(x, struct vmw_framebuffer, base)
 #define vmw_framebuffer_to_vfbs(x) \
-- 
2.34.1

