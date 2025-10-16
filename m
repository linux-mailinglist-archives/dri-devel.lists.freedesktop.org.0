Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDABE4F26
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECFA10E09F;
	Thu, 16 Oct 2025 17:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hf+/LxOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8941410E322
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so14841205e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637407; x=1761242207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cs5dM47sF/Y4bgsvhg9twiO9ZwX955LLlWI9saGGMjg=;
 b=hf+/LxOGKrzajrBwvUwfanFQcI1UlF7Xp9WGoNnPQhHOeFYQmU/AY31Gdi2dKnD5I4
 M66159Kd5l6yRoQrRvZJ6VU6LOUSliGCqICZnHdFQVVA1uF6qPaAzeSNP/OTa9omjgWV
 YGQkv4VL/YLWSmCl1CXC5VOn5ZLNbaQWsQDF+PuqI1mub9PTW6rNfCue+S/xCh5XfLY8
 Mp/lF4+oZ9lMFdBLTpx+Hgdp3y/GKGCIrk4Nm5kIVDhSJJeDOQghsSUmj7Ua0wOYNmPB
 QegLKcLmxMnVkB++Dfcng3mbDeedqdBaoh3ZBZnafntrjO5g5yWIV9VvFTGnV3kBnDsZ
 wvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637407; x=1761242207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cs5dM47sF/Y4bgsvhg9twiO9ZwX955LLlWI9saGGMjg=;
 b=PcCbchEQ16SqUwzy9M8vFUxNfTlWQafmeXDy7ZRm/vGrTTo3TdTeon5tqOnG5rxieT
 dznXiCzYY/alurTvs4GdWzlFGRJzQu/QZG5Kn3PGOle2KMbs5sLhVNxTkwA5SIYaBCij
 t/+JLX6ad1JghmsQFiuFm2EgBGIkORkFEbEprCfspMkoTkO+YbRndD/DoiK0THtH1UJP
 eGahONU9Sj7MMWz+dRdxYoV2bQfI9aBeNVsfQEqiSq436WtKlkVdqOSRW5jyA1Nf1h0G
 coW4h98BgvWL+Hhn8HMbOEtkNK+BTFPYdo9658C7D0c9B0au4LKJfOnI/hAAX09xicu/
 ynnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxvMjjLdnGW1EBR5o9ExYyfCiws17g2HjsK7TTlilrHOZ6+ZQVhxo4Xx19C5midIvLwfoFh2oa1x0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoD5xp8wMVyGcFSb17fHFH2HyJs3MxDv/LEg1ewKsuMkX/LbsP
 naMVBXzmYNCl6Nefn2E7toLd59zykwyaro1XqQZsqsIo3Jvj2Se+kwfz
X-Gm-Gg: ASbGncv6ILkCClO6qbBoog6qyGVUkaE1jA7sXlPzKHn76e0rMhXhPePcxSp+HOK6f/+
 Hr9sns8s1Pfwn63zeRpDW+viPODEXWLkT+PsCbaMeBYKFtWujvNT1pbclaEnkofAWJs7XMlOqZN
 DQ6tl3HUXUARPGUco49k+MLrcDEmIpMhedOTGPPLTVEPgPFQCXvwWKvTlr7LkTuzV4YRObwXFCw
 Lqa5VffBkureS11yabKsYbDWeAZdcksTqkMzRaSCtw67aYgwaQrLp5MIoGHN+kz3mbf3HUobdma
 TVBE3oTokzZBy3w1EfjJ/m3nG3jTEs2loaZoLfdjkYr/dU2RdM6ftMG84TraEEMJC9RJc1KYOjj
 L7f6mskKeApuST8hGc8K9i2vbUsHuymtiReG3IAYiXuduwMICmnOIox0YQuRDzmprkT8y7v3EZj
 7GZi0Ce8a0/g==
X-Google-Smtp-Source: AGHT+IEj/8hmflX2zRse95tmGyeuygqLOq3b34S1Vq2F8xYfl/ZVNLq203bC8jvMr2KsaoiTtGRtvg==
X-Received: by 2002:a05:600c:548c:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-4711726289cmr10623405e9.8.1760637406877; 
 Thu, 16 Oct 2025 10:56:46 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v7 04/16] drm/vkms: Allow to configure the plane type via
 configfs
Date: Thu, 16 Oct 2025 19:56:06 +0200
Message-ID: <20251016175618.10051-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

