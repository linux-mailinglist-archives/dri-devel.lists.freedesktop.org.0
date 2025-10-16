Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13031BE4EFF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA54410E336;
	Thu, 16 Oct 2025 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G6+bibnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31C10E322
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so930575f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637408; x=1761242208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gre0hLy87h83qf778dekTlWQHTtBdhwlJ9xEAc8W+IY=;
 b=G6+bibnqPiNFGig5evxuORXhC1pc+tuc13pXDzCw13bqszWQ+zaYSP0gOthSAk9XQt
 xpg/SEbovJFUcqvjYqUytFFR5PrDV2hYwZkZqhX2PkPeVCUubJz7pgkYtI+4n7TEAp4M
 7xiIcA8DGJ4s7QV2BysdUZJtFSJKnN+8ynbf+Ida8Tr3xjh3fhOJeLanimylgpjI5yrV
 RhMOETaKHcAHKqJjLp9EK5/h2weoEN6khKfNEGXBRtQGUy4kJlyLN5C4w2xoFLNxQco/
 xS8SqAM0JSB+0gHbXT0B5DKS9K1jBtkvn9VdFrWt84HCvhqTeR7RyYjFaYUv1TWrRMer
 QENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637408; x=1761242208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gre0hLy87h83qf778dekTlWQHTtBdhwlJ9xEAc8W+IY=;
 b=c4IVpcE0LO3mmWPLSMzrIhOE1aivgdh6NG3z2nfE395RdCsJhNbURDL+qCI3rfHdrF
 N72xAOZLX+LnB5Qbl4uS1ZNk8vqZ6TN8FH5GMa6/9zFmKMQmaEbIN364w5FXPY/rjNjr
 dxk7NN1K3E8vvK/ixeZMtnX2hell/m93MoVO9N+axh4ycLE5aR8pVZztj+C50WwLLh81
 Er2IqtQCSStLuRhAsDhwlA5PP/GMRdaVhqSg8q75aeqfKmAJHEKPWumUAYsSCxO6C1l+
 iDjCRcGmSFHMT+ua4ApMPVh6j6Jw4CkPMYYxZ7jziyXv4Ezrcc9bGzy2yy0j/qyRuLaG
 Tn/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLU0BJEWim7OeiIEcuOXZc2hLr/6j3Zakb/UWSoi1K6uUtsgWKy1UKQ8hZrCScnyqo5xclB8z3Ltg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiF/D8vaqgJGdo25f3m/bpufrFaoeFwfUCWTuFS80A5oT5AqJp
 3Uahm0r75FAu9EtBbAP66knqddGD93EjwW9NG6DtYuQ0y+j7yqzoBgWn
X-Gm-Gg: ASbGncve+7N5zAyZ+nx/d/yeKKUn0m552otRcTCDxadWWWfUlc04CAZruqwne3ELxML
 Z9uMDz9RHAFmuoBIAWAVhCLrItRgpnp0arbHgrQPB+sO1JMUimb7ex2Tl4t8wmSRUYyYGpH5/Kg
 tCdcLPPhq0BBFdvDLIoH7UxfhtTHXSSxfzSbYv/YkHMHoC+sKnEweIzEdyziyVqLihD6LZo8bHd
 6ywBZSHgsjn1lqHCfpzXbJR/0a6XHMVCd8bWPozuGwmWQEzOxS6JCevAoar9IVs3MDfp6kXufrC
 +PQlHSf55vFQBbnRA8Vq2hwQjQGJ3QQ2d0sFhncvfpQQfuLdD28EOC3u/Qm9di9Hv5SgZRs3x+8
 +nG0JCnJQxEohNe2O1yYbqI3YgsmFeJy/RcwO0aDr9/+k/Rg/+8Z6SGOehqQ7BfMZXrGi8CDuk5
 M=
X-Google-Smtp-Source: AGHT+IEMrIcCCPx1egEJk/xcCf7qUPRTvLrGolE5Y+y/fcEGOEgUDziNz/gt1rNFE8EOQYTWRi0o5A==
X-Received: by 2002:a5d:5d13:0:b0:427:45f:ee1a with SMTP id
 ffacd0b85a97d-42704d7b5ddmr804030f8f.25.1760637408141; 
 Thu, 16 Oct 2025 10:56:48 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:47 -0700 (PDT)
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
Subject: [PATCH v7 05/16] drm/vkms: Allow to configure multiple CRTCs via
 configfs
Date: Thu, 16 Oct 2025 19:56:07 +0200
Message-ID: <20251016175618.10051-6-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 85 ++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index dd880ce6811c..7396447b5e58 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── crtcs
   ├── enabled
   └── planes
 
@@ -89,6 +90,10 @@ Planes have 1 configurable attribute:
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
 
+Continue by creating one or more CRTCs::
+
+  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -100,6 +105,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rmdir /config/vkms/my-vkms/planes/*
+  sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 398755127759..62a82366791d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,7 @@ static bool is_configfs_registered;
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
+ * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -25,6 +26,7 @@ static bool is_configfs_registered;
 struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
+	struct config_group crtcs_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -45,6 +47,20 @@ struct vkms_configfs_plane {
 	struct vkms_config_plane *config;
 };
 
+/**
+ * struct vkms_configfs_crtc - Configfs representation of a CRTC
+ *
+ * @group: Top level configuration group that represents a CRTC.
+ * Initialized when a new directory is created under "/config/vkms/crtcs"
+ * @dev: The vkms_configfs_device this CRTC belongs to
+ * @config: Configuration of the VKMS CRTC
+ */
+struct vkms_configfs_crtc {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_crtc *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -55,6 +71,71 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define crtc_item_to_vkms_configfs_crtc(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
+
+static void crtc_release(struct config_item *item)
+{
+	struct vkms_configfs_crtc *crtc;
+	struct mutex *lock;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+	lock = &crtc->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_crtc(crtc->dev->config, crtc->config);
+		kfree(crtc);
+	}
+}
+
+static struct configfs_item_operations crtc_item_operations = {
+	.release	= &crtc_release,
+};
+
+static const struct config_item_type crtc_item_type = {
+	.ct_item_ops	= &crtc_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_crtc_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_crtc *crtc;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+		if (!crtc)
+			return ERR_PTR(-ENOMEM);
+
+		crtc->dev = dev;
+
+		crtc->config = vkms_config_create_crtc(dev->config);
+		if (IS_ERR(crtc->config)) {
+			kfree(crtc);
+			return ERR_CAST(crtc->config);
+		}
+
+		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
+	}
+
+	return &crtc->group;
+}
+
+static struct configfs_group_operations crtcs_group_operations = {
+	.make_group	= &make_crtc_group,
+};
+
+static const struct config_item_type crtc_group_type = {
+	.ct_group_ops	= &crtcs_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -262,6 +343,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &plane_group_type);
 	configfs_add_default_group(&dev->planes_group, &dev->group);
 
+	config_group_init_type_name(&dev->crtcs_group, "crtcs",
+				    &crtc_group_type);
+	configfs_add_default_group(&dev->crtcs_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.51.0

