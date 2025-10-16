Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93A6BE4EF9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0B510E243;
	Thu, 16 Oct 2025 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eTjS3oA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E347A10E322
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so11889355e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637409; x=1761242209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtjodahfnBWK2idIHCN4z64kayvb9QbUktg8KpiV9BY=;
 b=eTjS3oA8jrckMxzFQe6AGtPzy5f6hn0VWLc8NUVC+Lz02C7rhVJyprFtOBoFQd8/WC
 ibSsK8k2fb6qmE6qBVVzsvuJXwWIjdioemBXNUXB48wIjw3NM9AVJRw0gx9EXKWc1Pu2
 FPXgZEG4s0/HLfM7gGGvMXks+P9w1Xtkkwo0XaY2ca1ikuDhUjzmMSrRWBAJBN/K/nsi
 NrTqW9KjBkfgBYVOG1xu7STYbggNvdAoCZcl4+wrHlBnGxeJB08tSnN+huORf4KnAxeX
 OxsNG4egWnRqMjBg2bTMHKOtvrM4wZx/kfyddUWXI5G2MZ0QG7HYfuq+N2cBkR268sbU
 B57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637409; x=1761242209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtjodahfnBWK2idIHCN4z64kayvb9QbUktg8KpiV9BY=;
 b=ebKZ4s4dk3Sp8Wldx52IXOmUmpcHvuz25xFxgyxHMH/7elnEz+CW0HxlBnFrGnxg3W
 Csw4pjbnmlZAhtDyOvc+qKBs93V/mZ+BsMGi7p4LPsQH7sFZJ3DMMyKaMle0u93eQx2D
 WL7XWt9ly/5ie1qGQdXSrc5cHXpUvevCYjerQq9Bh7vYZfg8j8Re3mkJKfYPBZR9+/T2
 HAHMoHf/Zt1uD7Wt2oi49uqXPRSKBsrtwfHOzPuS/yQ74iW8aEV/TxHA1Om9L9OtqAnk
 LR3ZuODYyw4MnocXuz51XSce63p0yXXO4fP0syWUx+npPHF1GkoshNZY27MBx2UYbP63
 TsgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWecE4L3uLPkaozanNQW5fAF8UG1p8OdLXJphrR3G2wlxQ9CzxRQfWZdjc1SeTXUNEwaj/SfQ5aW6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjD1E78WWcuyontgXb+LnLdXJ43vyaD4kLOzwV5slx6dqEpWSC
 +W+nXOgvvK/nhbjRtDqTu9E3IyW56zApPd6cRUQNkpuhz1Wmo4pshkMX
X-Gm-Gg: ASbGnctCw1tkZZ9NIUQvD/Uon0I5fzAAYr9Iwe6F0DkIIHxDlYIgg3AKASTpnQ2MER+
 KDpXdT+RTDaXoIdPkfu5Q90PWSnnJqvwpzuAtsidTMksTPERp8KwbuRI4zR2XU0EaD5A0t1JUFU
 vpp0AUCV+zhxan8J7fmT/8hmWRVcF7xnaAd/V287cRNuNgaYRE40w8rywo3aHQw9flhhV2Zbi9B
 dPs223S9eY1uG4dXABY8PI8UARa6hN1rL3hicCE7RCVeYPeMRJq7UEjzP2IH2LWDGQ9tZmbMBW3
 bc6/CCnjyvl+Z3hzCeOUpkdfc/HExohI7tvx3QBX5rSqbHiOY3J/qcl4HpAxzKzjEKcJDK6h9H/
 2VIeMmzCGoR0EhvR+eIbXQh7crMm5jNwKEb/VhEVhofAcGJD3XfzqeSpjDEIM5UNDtfzgUpnhfx
 CPXNQZbfcJeA==
X-Google-Smtp-Source: AGHT+IFxXmdNOlcVtdvS4hUg321uETDeeRq45sSYgBzQdlmRPckXfQEInsx2sGlszYksJDQMbCl6vQ==
X-Received: by 2002:a05:600c:3b0a:b0:46e:4499:ba30 with SMTP id
 5b1f17b1804b1-47117917a33mr7518345e9.30.1760637409294; 
 Thu, 16 Oct 2025 10:56:49 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:48 -0700 (PDT)
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
Subject: [PATCH v7 06/16] drm/vkms: Allow to configure CRTC writeback support
 via configfs
Date: Thu, 16 Oct 2025 19:56:08 +0200
Message-ID: <20251016175618.10051-7-jose.exposito89@gmail.com>
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

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

