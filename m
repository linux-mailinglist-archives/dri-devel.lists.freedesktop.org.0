Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E653353EEE7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B3610E581;
	Mon,  6 Jun 2022 19:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309AE10E5D8;
 Mon,  6 Jun 2022 19:54:28 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id p8so13543814pfh.8;
 Mon, 06 Jun 2022 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U22q+bCY4VehZDY1ro1wKhQ9JA/5THGWTqZ5PD1r04Q=;
 b=MsRh9c98MvoAppDPeqo38Vb739JyYwj+s41ar9mghVqyhGsmukgMPi8IRp/2ifr+/1
 wQUx2lZuy3g5xrM+gAYUS2bNFC3/1WHTkaJmkc6iVqDutQ5aYD6gdfcq+qxJ9r8B77Xl
 MSS2HCpHn+G/A/MNwYJ8UhktBiScFyL6xUiQZnY7PvOCVX9O5HdFIrRqph2pvjgMGBRJ
 G1007ZgbrDnvrFm3gcnAT64XrMDrUTQQG+JSzKGlArdPK5w4NiiM9gzegK8PDTkou/gF
 ej5Oe62IVuk91glANudWjZN9AxhpX9TOaxrB3G8ttEn79cmf3yPfPl1xGyuni1H/xeM/
 9Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U22q+bCY4VehZDY1ro1wKhQ9JA/5THGWTqZ5PD1r04Q=;
 b=KdOLu3r56S38sMlZjYdfJ+35dOjNX0RIC2jlgTzdYWzk8CvLMWgvPNOTXWAbZogDfD
 uBghqifuIbneZpGh+14qaDc4xbpT20NzWO+WoV8r+JjrhlimAy/kB4CgCTZ5HHEjxaCA
 djlemn5C+uuDPrcddSb+vUxrx9IUO2PGZQR1iPtztPWTMu5LSttE+636jBYg7ho5jmeX
 cwxlvqUjC60IKHsCHEJBC6X5lj/cjVTj2K2ehZSX0R3CoTbWX5GtHv54FuXvnwZkwUtO
 uWimnW9i2Sw4B44HR7PK75pVp8J8oF/rFAB1aiKhalU8juM7wrtpk3O7xTPtRxuLmd5v
 D7Gw==
X-Gm-Message-State: AOAM533ZQmiqphJ+SaX9agyMYJSv9nR6Nnf4j2UcM2mDZeAhEY+7A4kL
 Wogor2L5SliD1QtYiqiVdjRit5r4kZ4=
X-Google-Smtp-Source: ABdhPJyOhQAvqpntmLlHAcjV3qfEg+KW6muhda1YLTUDNbrs9eK1BvjRMgvyNwrpCI/PRLxHSCMoEw==
X-Received: by 2002:a65:64d9:0:b0:3fc:5285:5d63 with SMTP id
 t25-20020a6564d9000000b003fc52855d63mr22376970pgv.456.1654545266970; 
 Mon, 06 Jun 2022 12:54:26 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709026f1600b0016196bcf743sm4556724plk.275.2022.06.06.12.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 12:54:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
Date: Mon,  6 Jun 2022 12:54:31 -0700
Message-Id: <20220606195432.1888346-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
provide additional file ops, like show_fdinfo().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/drm/drm_gem.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9d7c61a122dc..dc88d4a2cdf6 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -314,6 +314,23 @@ struct drm_gem_object {
 	const struct drm_gem_object_funcs *funcs;
 };
 
+/**
+ * DRM_GEM_FOPS - Default drm GEM file operations
+ *
+ * This macro provides a shorthand for setting the GEM file ops in the
+ * &file_operations structure.
+ */
+#define DRM_GEM_FOPS \
+	.open		= drm_open,\
+	.release	= drm_release,\
+	.unlocked_ioctl	= drm_ioctl,\
+	.compat_ioctl	= drm_compat_ioctl,\
+	.poll		= drm_poll,\
+	.read		= drm_read,\
+	.llseek		= noop_llseek,\
+	.mmap		= drm_gem_mmap
+
+
 /**
  * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
  * @name: name for the generated structure
@@ -330,14 +347,7 @@ struct drm_gem_object {
 #define DEFINE_DRM_GEM_FOPS(name) \
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
-		.open		= drm_open,\
-		.release	= drm_release,\
-		.unlocked_ioctl	= drm_ioctl,\
-		.compat_ioctl	= drm_compat_ioctl,\
-		.poll		= drm_poll,\
-		.read		= drm_read,\
-		.llseek		= noop_llseek,\
-		.mmap		= drm_gem_mmap,\
+		DRM_GEM_FOPS,\
 	}
 
 void drm_gem_object_release(struct drm_gem_object *obj);
-- 
2.36.1

