Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AAA56DCB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1560410EBEB;
	Fri,  7 Mar 2025 16:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CElAJYUc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047F10EBEB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso24147385e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365247; x=1741970047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adxvT7ii/BhGf5+g/wbSaeJv9L6Vrv0AMOExKXchHM4=;
 b=CElAJYUcXtdRRAuiUuaQbSQA+jL+uHm27pVhVJ9iiMevZnI4WQC9Shql8Y8zMis8Jz
 PacJHL/Zx1PPunRsVX6oAzwKIzdEGDsWCuC8/s57u66/lv5ZmHSF0WFVHg+dqFiMhnmq
 zRinHjZP8S4A/zuWmll0uYfsNU6PEjPGfUcUW2Frtd9MK8NpDAsLRt3s2RlOGrI3Vmdm
 ADIYNbCTxcGpDrIIT0Nqhzt/kZG1NzpCGH/xcLXJt27ThX6YpwmPZuVfNcqgPZ5Vzqm8
 mUZg6u4KvYvIFwwYWAZG+KHKtHc0axfTpOY76TijKzQ/kpcv5Z7fw6XCMlI/ValrG6z3
 SCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365247; x=1741970047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adxvT7ii/BhGf5+g/wbSaeJv9L6Vrv0AMOExKXchHM4=;
 b=gkcmQeuy1iO3nb/3rCt8LgcJYTBBOIg4Fp/ZKV7R77xEXUxqv4hhL8atb8T9ytD7m7
 w8AJLS3MjtqleEq2iGydLJ/OiQAROZ9IdTy+t5k8A8Q2J0WaCiCZN6SMhqQNYUmBcvD7
 mn+hkY7xogSU4zSZjc2jXwzcKS72lplViYj71XiAEbQ3jP3Zo53O2svFedIj9DImFNVO
 tXb8AFX5xmOHuqVo4aHJzK+BY+6yetlzQ7bhd6Mq1Z56AGqyHYix3ECC9ikk1I+AKTb/
 m8KlNnogb2WuqeXrngrvUNislQboG53D0JFBkPcLX7CXp5TyaL+rw8zM8tBYv1wpo//e
 2YTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQjbWEOv9PK9xo++L47dKRw97UbTfPC+H01avPhPX4DzEKs4w64s4jY0T3dU4Tj5IsYF3bUaln0kQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKIinB/h8SHKK387S0bkKSbHsT88N8+OH0b+5UlwJskJmYiZYM
 C8ul43fqAagy5fP149OubwzyPbCWv/DThmDZGpzMFtkUCJT4tw/1
X-Gm-Gg: ASbGncu/sO4JMuk8HXrFeL2a3/0b9au5ONZLULFSxEOZo70dkhWThRDDrS6Xfpt2YjF
 ZraZoelbH6m+ZPUSVm+2Z8LqbG5gzfCjDXpvmI18tKs/7WbIehwy5BVEZTZwPNwrkPWmVRGtaTG
 zJd/wZ11sZ/kT8goU2MT5CzpAMA0F/iW5jlD2hhHeeIiupTEvQzhkUtOcpgSiHBoGKdZtOyr2Ir
 NfnBHufg/gBDRSpm3DyHHdNyd02WY9A0HqwWBYVIzv5PdZZSvRAUpQUP/8oaX4ZF0Qc00WtZiGo
 KgeXLrgdisWFmmJTN653OXQVzHZtTM78SdI8RBdSWV/x+p4=
X-Google-Smtp-Source: AGHT+IG5OJlDQkUEWLTKW9FjBSL7uf+mEOU/9qxTIBuGznGo8NW21a6bnmcM0Z6BWJ1f1cOvwRXYgA==
X-Received: by 2002:a05:600c:4e91:b0:43b:d116:6483 with SMTP id
 5b1f17b1804b1-43c6021f13cmr34597475e9.27.1741365246562; 
 Fri, 07 Mar 2025 08:34:06 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:05 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Fri,  7 Mar 2025 17:33:43 +0100
Message-ID: <20250307163353.5896-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.48.1

