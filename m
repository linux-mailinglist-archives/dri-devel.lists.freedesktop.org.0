Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B8AAE186
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99810E7F4;
	Wed,  7 May 2025 13:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="miNjotDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2773210E7F0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:43 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so7693585e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626082; x=1747230882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZVbUU6uiGO6s2LXLXBEvhGBzCUPUBEIPxhrrxcfbfE=;
 b=miNjotDNbvsNQQiR1APrLt4Trzi1APYMu5oI4jYeqUh0Mxs4R/9wDStk2NgVbNWKl7
 bCa8QKh4vkRUDKi8yf9ddq5bYRSE7PTrekmXiENlb4zrgFTntMZHqc1D9B2S90xyT9Gi
 AxdsZu45EhIjuUInxsKV94DW1Jc634UyS+v8hEbslNtkiBAtVGWDgH3vRXoEfAY0ItRJ
 HAWIun7DL57quQwhJDBEcYieuGdJXSuT+NXLv6/XTwnc1NG3MuJBoj64S5EOtWSO9ySY
 3YZvfwQX4q8aAKZFmFWxshJZczNaYmRZRmDNOc0MIT6qdw5B4PpJlC4nyIu4HS9beU4d
 c6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626082; x=1747230882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZVbUU6uiGO6s2LXLXBEvhGBzCUPUBEIPxhrrxcfbfE=;
 b=WJBMrKHISk7Ib0igLrxrKop+Ith2eBg9L3CLW7+UCH8ZsxMYr+LgX5MyJZnJscvmDJ
 LsqNCdiCpNz82DEcuhMN+4jNgQvqUn80IOEzTMYeI4uqV5km1Fgj9DrQOotkCNmJEcUt
 jDyu47gkq1G/ymlOZZdmxRR20rXIcOQtlZkCjaOJ66tL+xFoXh+yVU9l4Z27pPlFLUao
 1VnCt6L4jcnUG5AKkkdl1BdfeJc1/Zi/4INAYHgCaTZAXJRUCscP7Aq9Ww1fQLANWeqj
 tHroLCvS16XdFSvx1cw04dcvkp27JuFqgFul/PU8hQYKH0bFWQEluOODnkdITRDKviCB
 HwPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpPd/nyDlTqYqyUr7hdG8Elw6Z3Fz23s8C1E0jPOmFK1eqVPjxzuvdg+BVpxaFzGob1Iog3l76j5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkdvR+QHmjrBwZJGRb7jx/odqgMeEDQxURdzJRmv4A9BD/I5ta
 WOh0nlSxMH9nPfGkZ+yQ3Dm/qlLt0mU1MeBPvVsTyT7kPuvKVvF7
X-Gm-Gg: ASbGncuMgNf/oC6gtQu+79g58AtxIgolsPVEywOT4tn6xgQ7RG3VsMNAjHemhY8ZK3h
 h9hTHBA6nINp29WHIZY9kTT53v773pKQL5wq4k7s2VkeZ/wjqmW3t0Ta0uuDIIoLSdQgXfA7cO+
 GfQKaVqudbDA730fhkNykz5w15YRaRYjRM3GOvPUPbwkzCuODu9+5aMVBzPzArJhAIFM/qcXLti
 iR1StNCNIVvMCHq0lGip6pF1WqmMiZgqWuK/sqfb+YI3Rjvs2ADrfQrwk6+j2QJrggOeEtQBsvm
 pEm7SXpNAWodYOF7nSsjR4LlgPBAgg+FMktZYLjUp3XaqvscwsdN
X-Google-Smtp-Source: AGHT+IE/HFFpPTOpfEpzIl30PLpsQqyo0q3tUVthULF3nTYwPJolDFr0WO8qqWwNpwyOwDFQWo0bJQ==
X-Received: by 2002:a05:600c:3f0b:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-441d446ea6amr36686905e9.3.1746626081537; 
 Wed, 07 May 2025 06:54:41 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Wed,  7 May 2025 15:54:21 +0200
Message-ID: <20250507135431.53907-7-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e0699603ef53..abe7a0f5a4ab 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -94,6 +94,10 @@ Continue by creating one or more CRTCs::
 
   sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
 
+CRTCs have 1 configurable attribute:
+
+- writeback: Enable or disable writeback connector support by writing 1 or 0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 62a82366791d..e9f445043268 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -74,6 +74,47 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	scoped_guard(mutex, &crtc->dev->lock)
+		writeback = vkms_config_crtc_get_writeback(crtc->config);
+
+	return sprintf(page, "%d\n", writeback);
+}
+
+static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	if (kstrtobool(page, &writeback))
+		return -EINVAL;
+
+	scoped_guard(mutex, &crtc->dev->lock) {
+		if (crtc->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_crtc_set_writeback(crtc->config, writeback);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(crtc_, writeback);
+
+static struct configfs_attribute *crtc_item_attrs[] = {
+	&crtc_attr_writeback,
+	NULL,
+};
+
 static void crtc_release(struct config_item *item)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -93,6 +134,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.49.0

