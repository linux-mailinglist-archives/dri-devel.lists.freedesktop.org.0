Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9BAAE187
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7F910E7FA;
	Wed,  7 May 2025 13:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+wU8IKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05094890D2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso52888605e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626076; x=1747230876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NPtwIJHLj3TQvXijdYLwA2OCGkSxKtnzx80mLMYtA0=;
 b=c+wU8IKaX+kA5vtFVbLAyZPp1namPXMb2xFvbyt8XHDh6RxQGuQnEPTA90FqI6jf4R
 SOY6SXwV767F78dqG1trS5Nxi2rwEqFPs0gXWyC+1CQUtSdNUhmTC2bA9lYbwI1z7sbo
 KYjnCsXtoajixMKJ3CzigVjsBgT74nmVveIZx5FPP2UaJBfuEzNkJWy0xUQ/LUVeE3lZ
 ta1gHhguIUdUMf2gdHCLoFzdOhCYWFk7CnP4UYdb/oADmag1D2qqVWij3YxWKeuPD/oZ
 C8RIOYq6AZmMD0N3XWTEiMUmy71ER4AjfByzyPLPk7Azb3p7ZOyIl4K/wO+NF6hAk8da
 XbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626076; x=1747230876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NPtwIJHLj3TQvXijdYLwA2OCGkSxKtnzx80mLMYtA0=;
 b=mf43HoKbLmY/RMLb5rSkGmKqGOyUQ+Hm+bYpDZucdD8Or5S1x3+a5+AH+t1CCmwEcd
 OevHhbD2BSOdLnVchztqy5Ha4rTWXTnPAagDOeh6KEBCZ9HLEiLG8Sugn3k1rL/Vcxaq
 o/DqCEqlLLR+fSdPV3/e1pt4KdemjfoLsVKiQ4VR9TbNhXfR7L42nGz+tgcJkz04uJkE
 rvmL0MJ9Dcgbv53xTooasBl3Jut45JdDIbzszB94qSaIutsCzbPo3LEQs+nZPT1svcpt
 rg4jN7dCW0f4S2Rwt/Xa+6+Y77umcKhqln4Q/xfcQjwovCZQvVzH31yl5rI4gMvOwg7q
 BR5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUynP0LfZEfYqvUehSJC/fb772nrw7Elk6mhXQJDQ2zG6JsN9fQpandAKODCw1zAb0N9AIx1ArN9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtZs61QHHkk6cCccgnuXBh/8mi6TkWDEVRjJKnUo8rhbUnEPZ/
 YpnVfAe7IlITZ3rNi9tm0T6OtaPSm39lPaTr8HPNx3zHuDYFSjif6LpCAt4o
X-Gm-Gg: ASbGncsqMSbVpNkrzOQcwstTkcKn4fNgaAdxQHs1dXDTW0T4oBWdXb25OuUadS4+16W
 Bksbly6Sc3kagsaaIRUpKfeaZ0/rXhw9FCUpXkScIEZC8s7tdfbl513Ut/G2oo4v80DBfSPhG7S
 8RLs/Qst0JipqOFxXpz7n3B5c1WN6Rxtn8KHp8XsBF6ILbJ0g8KtgyZQ6nED+1uLTyzrqPm2rxa
 kaR1gF7u/8pA/6NqjnfOPKZ86o0tcBnu4DMq7RisxnTSeZT0PemJ/gEb/WXijHpzpEzJwgWmUHs
 OL3WFGW4IRoF7+QQKmkdminugFm1VRYqWOd1ZADRHQ==
X-Google-Smtp-Source: AGHT+IEfmPBJDkQT4D/MvLcBOELc+mm/2hp0Cx6VyNjVr+QGxE66AppcyN93pmqNQP3ScgoUD3Mr7w==
X-Received: by 2002:a05:600c:8289:b0:441:b00d:e9d1 with SMTP id
 5b1f17b1804b1-441d44bbf50mr33147135e9.2.1746626076352; 
 Wed, 07 May 2025 06:54:36 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 01/16] drm/vkms: Expose device creation and destruction
Date: Wed,  7 May 2025 15:54:16 +0200
Message-ID: <20250507135431.53907-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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
2.49.0

