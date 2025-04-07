Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C2A7D749
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF05310E374;
	Mon,  7 Apr 2025 08:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ULCf70Rb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BB710E304
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4394a823036so36790235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013675; x=1744618475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=ULCf70RbQN87e6nDf/Tx6L63tZF/rsJTbzuI0g81ZOKVYOA8uQ78itKQ+kH+aGlhcW
 Jgfcp26YHMcqwzQcA9bVG1urf6y2IW1IezovZCx57K846awrw00OBmnYe9nnFPI+IPYc
 zJEXBvvQpRVTXEnPYkJpf2qofV/1yB1EqbDPGpCCIPG3ZIKu3fm/1m9IaX+6BkBFtcRl
 dKPnca8PpnGQOASL8sM1K4fCxWht39PuS9yIhwYtFYRg/anALLNMHbrnEcTv6hws/EJd
 Ui3npTXwbeKeWWWxpKSer3Iws0lp/iiZzJQBZfnNPN158cjxHWaMky0agArZ9iMHz9LK
 oDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013675; x=1744618475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=uENteDoRRneq3RGtbkL3mX+aM+cVQS+W2HWs0AE2/rSAsXejd6Rdw+VlXeriV10PfV
 mFnmcLvV02Y8qT7uSd4/RvIAje5URBdJrGYLRkfn7DY7rayCSZlLQ/KIIUVKSIahf4Sd
 QwXENtVOn2agKAmj9TvkDf3fb16rZxFW0HgJkxsxvbLynPyApi3QZoJchX0NRNo1kH6N
 MgyHpzsQ4QGnBAN0Rg7UXF0O7UNZRcyk3Ywcmc7H7cTwTlYTc9c/qcdWl+pC9FZlXAum
 4NLbIxXSs6pY77+rvwCyF3b++kMiZUzR6sgFJfdIxSMYTyOhKswDL1Sz1piO7wcjNmnu
 BlEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjWLYr4lz2rWxFx7uc8w+vhJV+YQIy+VGRs57nrT1W8ozJsd1vI8anZKiDxrT3/r3Ciw4UufDm9Oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzztPftZnLsmGQObQY4O4MfhyHNFofiU7QWi4aWtaEc/uwT1v8s
 WtQReevH4pGJ7kpH6jf4IeG8Qn7Zo8PIaePXyWb+hDqxboNZR5gY
X-Gm-Gg: ASbGnctsl7mfD8LCj95iGuKXVeibbtUvdix2pyB0ZxRrVOZ4eoL/dSemD7iPIoxA3eQ
 0e55MaqYB6OMJ0ZgtsksWpazMz0IflP5uV5UY8NEQpN88JN59ImadqkbsLIcjfiNfM5WZh7SnJo
 FzAYxaY/Qw6uXO/JgbiHG+Pj8+xq8QdJ7oq8I2VIKnQVrnI5f23CVM8yneztcT/6KE1VnJ75PRv
 /99ecj9pu5HqYCf2F2Eda4iMvzW3Ayfe6kq8waA7wF4Db7/G8cBZqJ3+6irTUBtmiPfpSWCHvsP
 GmTf5c0/FkT+SBJyByY08urz4yFm9KNp68NGl95gCB38
X-Google-Smtp-Source: AGHT+IHeQ6PKxLtWFAt3ZSnE3B1E9Vr4aedKoSG77fVWdG9+AIu5tdZ3hunUv2hLHfA45hJMDk73dw==
X-Received: by 2002:a05:600c:548d:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-43ee0640f37mr71172575e9.13.1744013675032; 
 Mon, 07 Apr 2025 01:14:35 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:34 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 01/16] drm/vkms: Expose device creation and destruction
Date: Mon,  7 Apr 2025 10:14:10 +0200
Message-ID: <20250407081425.6420-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8..23817c7b997e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..2ad8e3da3b7b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -223,6 +223,26 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/**
+ * vkms_create() - Create a device from a configuration
+ * @config: Config used to configure the new device
+ *
+ * A pointer to the created vkms_device is stored in @config
+ *
+ * Returns:
+ * 0 on success or an error.
+ */
+int vkms_create(struct vkms_config *config);
+
+/**
+ * vkms_destroy() - Destroy a device
+ * @config: Config from which the device was created
+ *
+ * The device is completely removed, but the @config is not freed. It can be
+ * reused or destroyed with vkms_config_destroy().
+ */
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.48.1

