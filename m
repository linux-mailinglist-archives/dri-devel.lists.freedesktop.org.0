Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F0DB3E2BA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B7710E437;
	Mon,  1 Sep 2025 12:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZ5hrngT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C32110E43F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:03 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d758so1754501f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729561; x=1757334361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhgkvBTCE0C0PpkJQl0fVQ7vOytz85QGtS9e86SU8oY=;
 b=TZ5hrngTuDLd8rGFHjWXRQL83lbokEAxOQ1SKqX5gUcZ5ag44xwsr8rH/wde0K6NNC
 l9uSv3vJCIzBnZxSlxQcJxLSCu8vmC4gl+d/lVye8Pv23C/2vVhy8sugiESENzPn2hna
 KgQsZMQ3wBUqxVaDt8ClL+QbQ/X3ybEOlRFyx7nA0E8lpN/NNIbE/pbcMkIf1McZSvVb
 71C8J3mEMemxD3y87F3vX9SVwQwAPHC9OwtVEVhE46gMFYu9EQ1+/p1nuRzVsDa9Qiwe
 bRCWRYZcEWZUfMviE8xvqk3yAqhwG23QvLTjJwpSc/Bp4h/Y9pPaxWDHZxLanXupAyIV
 3RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729561; x=1757334361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhgkvBTCE0C0PpkJQl0fVQ7vOytz85QGtS9e86SU8oY=;
 b=MMXfee9nfan2LZGEwMZiD41+uJBBEDvGTvsPyGiFG1RHlV/ty/qGolLry71kvfTqYq
 F0Ee8H+vHrQkYupSf5r4Mq4wNQwok6ncjM7JTqdsAarczepAGHEIKsDeu9ELARdzhLJ6
 3M9+LEMOs/lZdwNdM0C3KQQWOlPoxUDwDbFHub+8uH0d1IcUaZTE0DEIfhGDkuqcWYE9
 MJyvBGnzs/bUy+OK4Fk1N6IBig2tujCceJj5McIKGpsfZOoLrHVCcOIV/iJK52Y67PEA
 oZTDwkbpHa3l2o/5ln+K26duS4SBncTRqeGt6MBMWe4BYnq/nqpJ/Htj7PFmQMPnkpFQ
 lBwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrZX8Cu6bkPOJNL4JHDlvbfZQOetoiK85NEkIT/q7TrdRix+BcxG1fy9mJcUnk9D+rfpQa2Skswro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVIAmDB8KiEGcAflnw4tTt5Ts5DWXMuWQ9Alptkteq0E3msKLe
 AbjlezUbGYqv+ZMcw+Frqyw5ahzfCdN8prHQYjkovoVHMycEItBza+MY
X-Gm-Gg: ASbGncujvKv0c76D9wuCt8mPGKr5KVu6Nopy9N7k7JsW4SDmcpBNeIVL9YGZhFJXUwG
 8Fcw1GFjqbTv/exyMiEnA+3NAdaWC1Y6DXI10hdJViNfbMvNsjuEuF1RcYaiFAZ3m4YJ2T2owrJ
 eVkZsvN866YRjhBwLErykguFml/qtAN+d1kKQLezUGRjGKJ+zqYuRj7BLmIU0s9B/aot1jz7vZt
 xU+212kRq/EIW7yGyU9+X+wb5+yUDU99DyXE5w7SbNin/3aMXc0vplLDf1ksLqvz6zbngYm276l
 xh4wR9LHwA7Wx2nqvtB1HuIuLi0GJd0bue799xhN4GrfgrljSqMFNXe9ggv/6Oa2RomcUugN4T2
 S0AYimx/JL3hVp9Gj79Lu6phNnXt4
X-Google-Smtp-Source: AGHT+IFyxCd/v1nUFUVSnKjpf2X7+zw+bdrPnqE3ZWLFkWIx3xO0PpowOJcQy9w6v5eXOmfgB96NYg==
X-Received: by 2002:a05:6000:2889:b0:3d1:61f0:d256 with SMTP id
 ffacd0b85a97d-3d1e01d549cmr6713622f8f.42.1756729561295; 
 Mon, 01 Sep 2025 05:26:01 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Mon,  1 Sep 2025 14:25:31 +0200
Message-ID: <20250901122541.9983-7-jose.exposito89@gmail.com>
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

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 7396447b5e58..9f76918bb1d1 100644
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
2.51.0

