Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A0B3E2B0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E749010E436;
	Mon,  1 Sep 2025 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j0HFNzTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FE410E436
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:25:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3d118d8fa91so457158f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729554; x=1757334354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQmk72oHt5ION4ymwRgroNBMLcTWP/UF15XiNzL0gQU=;
 b=j0HFNzTmucdxLBEnSazpmz0ncvMMaSwjhMhYQfCrbdQ/yQ+8P+PcndKHEncculCsaN
 lv1gwqg6Oi/EDfEUukwId3wXUIdXeFkCnLtPxGMbEDUcFPb7J3ycmYLAnp5aW1h3GRww
 CLbfjmd+GUsVY/M36kPAchPsZ5ooD+UTs+rBfVjSkmAyFGFYN2DpXqDguTK2UZYPkDRi
 oKfJZfYZJip3JTy3WV4omqT3TJNCg7DbezSJXMuLIU/iQYQ0yJBrrOKvHakjASHKzGXO
 xTiR9WzvHZSFeeb8+BQZNzLNUNzfXt2WBqpZZ+TlyNvQqFw5d/bMPHyhjRyhUFIsGyso
 NR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729554; x=1757334354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQmk72oHt5ION4ymwRgroNBMLcTWP/UF15XiNzL0gQU=;
 b=VXe7Re6BvkmS6ZxFEiLDt5n4cW7khK7lhKDElYRb2tcqhx8tembkKhjkJFwBPB2tk3
 Lyx9HBJ2ZATY3JrvytU4HLGDne8wRGT2fTkTv3Nay++JsDBO5t8tqKKhq5bBiFIHES1v
 8FHp3h548Bkfa2pHqDDI7Qi3M2B4hSdbHYUYtNtWhlJurkPfWr5NgXi/xV/DlD80AMa4
 TMugKbT5R+BCN+zTIOkd1ujvKS+QjpLc4U1xQxt8PbJBQwT4olpWURZmu+fGlGH16P5v
 1NkGTbiKMJhcy0wVAdGm8Mkcqk+XGZGf6v1pXcnY8Wq+w5bavpMknos96XmBM1KHfwvd
 /75w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0JvlAApM4ZCieX7hp9rL1MGIaL1fpZNKuJX1qQUw+Sebex3jJFy/E+MTzVbdPf8gQnMXKyjSNwmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye9fMfqH55VmKAEZh1HygkTm5cz7J++TR7+/6wpswHKpIwZGqq
 9AkU2hviSSsxiWxaFFBsM95TtolfOzI3+pBCyw/uk9N8qzunDQbbGAro
X-Gm-Gg: ASbGncs6AV76Uq5E4pM2GDQJTOMO8ybAYMaobU4NtmXYvjeB0o5vT85Kwn2a/STQQBG
 OBdthJHukoV9CK3JP8ndXGxah+ICcEr8o982g3PaORYnFIOwiPTxFn9YbBq9N0VcrILhagiOZvZ
 gZL1+GwYVFPWXh76xc6klCfUz7t6TzOoFgKY4JCOUtxDKj4iAPMb8KYPV+LUc2SbGqxiILjDR6E
 vMwBemD1Zehwf97G4sIRgEm++roIvitmrkcGLezkeJa/A/9Ohar/QU7RczHQ5F5WHhMyhGINkoV
 wzgoU+GKYqloJB36flQasB1pniRyEXeRxu7Rd0NSadQjLowaK7QriGqbXBXFLj5y+El2uBakjNt
 703QlH/EI0qLabfUopeiT2GBfr5Jg5nDgiYLUEUQ=
X-Google-Smtp-Source: AGHT+IFEiQV6jVjHGLuh7HirhS/szOCkjsWzzdfQvVe86dY/G1MwA8SAqZnmENKihKawgY3W9gXhhQ==
X-Received: by 2002:a5d:64ee:0:b0:3c9:c344:1652 with SMTP id
 ffacd0b85a97d-3d1af84ae2amr7349821f8f.6.1756729554177; 
 Mon, 01 Sep 2025 05:25:54 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:25:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH v6 01/16] drm/vkms: Expose device creation and destruction
Date: Mon,  1 Sep 2025 14:25:26 +0200
Message-ID: <20250901122541.9983-2-jose.exposito89@gmail.com>
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e8472d9b6e3b..78af37c7bd83 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct faux_device *fdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct faux_device *fdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8013c31efe3b..959ab48fbb47 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -258,6 +258,26 @@ struct vkms_device {
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
2.51.0

