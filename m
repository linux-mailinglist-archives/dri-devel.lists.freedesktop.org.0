Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597214E953
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E26FA89;
	Fri, 31 Jan 2020 08:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851F56F8F7;
 Thu, 30 Jan 2020 08:32:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c84so3137979wme.4;
 Thu, 30 Jan 2020 00:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vj+vPdCuY/CAQ3aMiPYuTj5faykMsBgab7cIAMUBapk=;
 b=SDueHcmsBoNCzvLdtvygZ2/A8Ol97TSnN+xBWJPawn1gdPn6Dp1KTt43HpXKkdjRQX
 oxi9B+H6AfB7pCov2SqulibR9wZvfyPI2z4MBPfMXgYN0lxGGPuk7jNgWAqJ9B7rVeh3
 kIubHQ8+rNLpoLYo/biLSF7Bkx544v2D3SmwhwOZsuThPb0b32SlKOO/IQ8LLzYmU2z+
 Vv3IyyjDrLVjj+4T1VI6c8SAIfheviu5Fz5Tkbn9aZzdWwzyi86ALYiqWdKbEwP8YUOA
 ZwhaDwbBsDnLLHjdly9Hgdn2NoyiWB9/39LTK4TQZwUOqXeKlRPwAG85oK0xZVVUEA6c
 H53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vj+vPdCuY/CAQ3aMiPYuTj5faykMsBgab7cIAMUBapk=;
 b=Tja6OxrvxjGULyffWxkQivMaDof47PRlCqx3huKSNk69Nky0fe5Hz3PP5RkpZ3K+ow
 RUw6Pt089fPYxN3mqbJcZ0vApRt8ySOax7xtdAuY6GN/LgUNbvWtUfRLIhkGaiAtvjhb
 gZOXrvK76b+We6sDC3uqCjdf/p3OEaJTjvixUJjxFprkmWg/chLYtjpvcNcltFYOSKnf
 XNMspzCStLCUxW+Ge40Kj5uNwMPXPku5avYHVKhkzqE0kCyNS0Q4IdI/PRqpOKHp76zq
 z3PMYTJpj0nlgptP5q13eFMHdNcdaPgLyGTFSg0W3oZJWksH1m2/UnEiV9XnoEgZoqpQ
 cR5A==
X-Gm-Message-State: APjAAAWW44aMbJaMidWmf6vO7RApaHoBv1O+yuxPoy91o6AJi/789jDi
 D8zRJ2Z2rLaRYSyP8iVH78w=
X-Google-Smtp-Source: APXvYqxAahDEhEt1uYDy+1mDAT1sYhKkpzFB0Bq/xaiQbnNvYABUZ7D+M2XdSEWu1u+KX2ULjR9J8w==
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr4030315wme.53.1580373165030; 
 Thu, 30 Jan 2020 00:32:45 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:44 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 03/12] drm/i915/vga: conversion to drm_device based logging
 macros.
Date: Thu, 30 Jan 2020 11:32:20 +0300
Message-Id: <20200130083229.12889-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts the printk based logging macros to the struct drm_device based
logging macros in i915/display/intel_vga.c using the following
coccinelle script that matches based on the existence of a
drm_i915_private device pointer:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 7eb23f623661..be333699c515 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -46,7 +46,8 @@ void intel_vga_redisable_power_on(struct drm_i915_private *dev_priv)
 	i915_reg_t vga_reg = intel_vga_cntrl_reg(dev_priv);
 
 	if (!(intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)) {
-		DRM_DEBUG_KMS("Something enabled VGA plane, disabling it\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Something enabled VGA plane, disabling it\n");
 		intel_vga_disable(dev_priv);
 	}
 }
@@ -99,7 +100,7 @@ intel_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 	u16 gmch_ctrl;
 
 	if (pci_read_config_word(i915->bridge_dev, reg, &gmch_ctrl)) {
-		DRM_ERROR("failed to read control word\n");
+		drm_err(&i915->drm, "failed to read control word\n");
 		return -EIO;
 	}
 
@@ -112,7 +113,7 @@ intel_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 		gmch_ctrl |= INTEL_GMCH_VGA_DISABLE;
 
 	if (pci_write_config_word(i915->bridge_dev, reg, gmch_ctrl)) {
-		DRM_ERROR("failed to write control word\n");
+		drm_err(&i915->drm, "failed to write control word\n");
 		return -EIO;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
