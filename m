Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FD4733AF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F50610E82E;
	Mon, 13 Dec 2021 18:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6DB10E833
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 18:11:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p18so12565500wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L26QAQQcTwvk9g4RJGDyk1KPZJQ2+Mcn67zF6WZ46Tk=;
 b=nwMF68xQhLMQiy7BGFuGPjIv1QBzKA/WhAhJ5WVxTQi/YF71dqNQ93w/BLlNfP/5/w
 6He4QIGp5qN95RSQoEqSqTbKIHcKp+4xnxs9wtYlEOuCgfUJp8D8trc1vKNJhTFC7/eC
 hROi9dKHCth6SXl8/Dlzufy+j4DoWYxdyw3FfiD/23O+7ogooJK4h+vy6dSvNCIZegM9
 BYES8GOewV+blDJxwRfIl8qw8gCop8ECuJ81EJv1PuOVXr5A3G8pvS/sRoOt9ZEdWTcM
 VCEZqjTX6yAFSSPZIzd1YaTXUGYaXwp/PNgDC3uuLcJZ3iX4XT+oBWsdTekYUWRg7V1Y
 IFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L26QAQQcTwvk9g4RJGDyk1KPZJQ2+Mcn67zF6WZ46Tk=;
 b=78CJFw3ZXKWIwI69+K8c17UIQyYYrVNyjgErmxOj53LNytpivgVdhKZSckr5H40Mo8
 3QKxuL+NISQ6LX3b65Llecz//u5ktomtb8xrcI3cuIybDdRPwBYxADCK1HpTtMqNCT39
 IoM0uwWKBqlozr/Ly8aRC12o2RbH0+RYpYYIfJ0fZt1ALub8SQYlcuWcGYKJ+0EuhDSc
 M3mLyiN4ShoUd7uA1GATLMqFZOT2mkzMsBm68egMPKD9Uh3/Hn6C0ZMAJQD2V8n+COEe
 Rjp77MTf1I2uSQyFZmqALba+kzv+Nd088fMVlYfrAxQaotQVgthFAAlJjViRvwMUf2CH
 Tzvw==
X-Gm-Message-State: AOAM530yipeUpF32/Lps1RxNUBbsKXjd4j0jroRtfj2PQN+sqd5ocEKJ
 80c9zNTwIAnHMxTdw6sATjGLkbVdEgAGAw==
X-Google-Smtp-Source: ABdhPJxvheQ548tVU0F3sUfSNeeyzYRs2JPHAldsQSo1hKrHqAEVEVgrIqC9DKXrXlsUPoOeDKMzHA==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr335168wmc.56.1639419100775;
 Mon, 13 Dec 2021 10:11:40 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id t127sm8750956wma.9.2021.12.13.10.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:11:40 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 2/3] drm/vkms: add support for multiple overlay planes
Date: Mon, 13 Dec 2021 19:11:30 +0100
Message-Id: <20211213181131.17223-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213181131.17223-1-jose.exposito89@gmail.com>
References: <20211213181131.17223-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new module parameter to allow to set the number of overlay planes
to create. Set it to 1 by default in order to keep the "enable_overlay"
backwards compatible.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 5 +++++
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 +
 drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..bb98f6c6c561 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,6 +51,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static unsigned int num_overlay_planes = 1;
+module_param_named(num_overlay_planes, num_overlay_planes, uint, 0444);
+MODULE_PARM_DESC(num_overlay_planes, "Number of overlay planes to create");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -229,6 +233,7 @@ static int __init vkms_init(void)
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
+	config->num_overlay_planes = num_overlay_planes;
 
 	return vkms_create(config);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..33bdf717e3cd 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -97,6 +97,7 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
+	unsigned int num_overlay_planes;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2e805b2d36ae..6f26998fdb7e 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -57,15 +57,18 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
+	unsigned int n;
 
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
-		ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-		if (ret)
-			return ret;
+		for (n = 0; n < vkmsdev->config->num_overlay_planes; n++) {
+			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (vkmsdev->config->cursor) {
-- 
2.25.1

