Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1197CB3E2B4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E971010E43A;
	Mon,  1 Sep 2025 12:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BlHrUjm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2799410E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b86157e18so9947645e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729559; x=1757334359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pgFBa2DZZvz331tX1/wrGaAvtDbVvMgoXHb3q0CB7c=;
 b=BlHrUjm9rU1O37L1UAYc1sOCRAlVCGVbyTxbKBT/FfID9uMNagPLyMvKgvtFHKV3+7
 lYYXR7ge+sqTEpRx2C0Mb/0QQX0+whk/OnAx8qQqXYds11MAQ72/6evfRG1hlw9fJAmf
 5Jgu4YEhdMK115PBw/WMxO4aYAu8B9+h1lUkPNghQM8/bqscL0sBMCydYY1fjzy3x0Nb
 AL+CyjJh9phaHzh7CCcwa0kMGuhQFM+V62Uedz2t8GQRySaAEEW3UjVB2bhzvqpoyuiv
 noI2B6PDvHZDxqKRXVwFbOcTQ+abxKrCFIpWiuOdwKhq0nXVLEREDRfp6Ny1q8L6DlDG
 mWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729559; x=1757334359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pgFBa2DZZvz331tX1/wrGaAvtDbVvMgoXHb3q0CB7c=;
 b=qn1TNbvFwFgDcgQlxYMz7AnB+XfbfXDRi0wJjJwNP3yPPZ/xFiyOj5W8JLCkWkRSpc
 om6Isxbrzuvo9dqcBv/66q7lvYIjXZGLcs8s+m/1ny2jvKhS60PV5x4qsU7vsvbKf41N
 WBue8vy4/rY/aC3A3u5hSkXVSiM0wlPTDRCdS37u4uLWpcs60l0zdBoERSqTDadLhW1M
 Qkd7hQovmp99e3f36plGPEzjt/Fy7fjLg4sMUEqTMJ6jOgP+wrDNwFRbkzSQ2OMezMlP
 bkA/56WkPE/JVE7ClsBN2q8FRhm9mDxulUfsA6bDwzm4zEjSvxoUxXIIPXVhu5Ku+oeO
 LtNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5erqRXVzEMDYHYmcQJvxVDby5gHuZw5V4gV0sCUAcNv/zJjiuSHpPT46YyAV7K2fZB0rgQC4x6Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsZinsCw6RM5aoEXaqBiMgfQkmcwQDh5FdzdElxUzhfTaJPpuU
 KJCTUsokKpdyiWY2PGU8H0tayxglDdJn7r7f4j1T7pinAI5LTkkxEbEP
X-Gm-Gg: ASbGncvhoY8Ri5a+G+XDo2PyKC0YEeTn8jVAqK2ADv0AevPsEet7dejzVCWDJ/cKpZ9
 A+rSHjKZeuEt1ZYTP7qH86gHWHChJiSTY7gPs/b+Nx4XfgniYJTO8z3VY0n18hUvn3Gm7ENsSTi
 qk7cQ9IXOAHShuzXf26Z7N37KvWOux9qX7KdpicaT0qjG9GBeOSh5TPGvgcAon4X4utp+Cn02X+
 FmDE2V02TovuKMyBVle2gJTAs0M1UtnluSq5Aa7mTFUjBCwV79bogD0sKQprsq977vtLy1jvUIE
 aGacYMOVylOSmvVxuqECQS2YbTCO5wxVt4mKgWPZHGxbwACgQ+jogqu0ATwwXJHWRHiWa/VigOQ
 bVl+LgiqExiCxulMD5Q==
X-Google-Smtp-Source: AGHT+IFIQW8wGdqAahWA03USmO7rm9GTiSdBBhXJU4ifoMtia9kc/qorfnpam+G2efQI0Rxva99X7g==
X-Received: by 2002:a05:600c:3b28:b0:456:201a:99f with SMTP id
 5b1f17b1804b1-45b8730d443mr57225815e9.18.1756729558342; 
 Mon, 01 Sep 2025 05:25:58 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:25:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Mon,  1 Sep 2025 14:25:29 +0200
Message-ID: <20250901122541.9983-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Louis Chauvet <louis.chauvet@bootlin.com>

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 46 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c0c892e4e27c..dd880ce6811c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -84,6 +84,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
+Planes have 1 configurable attribute:
+
+- type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
+  exposed by the "type" property of a plane)
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a7c705e00e4c..398755127759 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -55,6 +55,51 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		type = vkms_config_plane_get_type(plane->config);
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t plane_type_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &type))
+		return -EINVAL;
+
+	if (type != DRM_PLANE_TYPE_OVERLAY && type != DRM_PLANE_TYPE_PRIMARY &&
+	    type != DRM_PLANE_TYPE_CURSOR)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_type(plane->config, type);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_item_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
 static void plane_release(struct config_item *item)
 {
 	struct vkms_configfs_plane *plane;
@@ -74,6 +119,7 @@ static struct configfs_item_operations plane_item_operations = {
 };
 
 static const struct config_item_type plane_item_type = {
+	.ct_attrs	= plane_item_attrs,
 	.ct_item_ops	= &plane_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.51.0

