Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F16FA1A3
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21CE10E146;
	Mon,  8 May 2023 07:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3632110E13D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:54:05 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:8115:9300:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9BD426603283;
 Mon,  8 May 2023 08:54:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683532442;
 bh=+i2StJwB35cFnm3Egu+L97HEqYnYP0qSnw4b9yTX6fI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QMI8VfaoGAl01Am/pxknIOEO64J2EWijnrDVOYs9a+7KFYYgUpkKqCfGztSbnoUgp
 OAJ8pEoMibNdOGWEsTJ2fgZNx2mFpL0es3jGROnQ3YfJzUW3LGIXpRiQPehGeu4YgN
 lTpdJXPZMgK1WiIj4YY258H5ddsh4yYPnzLbha5XjKdbAlnC/8Hf1IzFyB8Npuxbzq
 rdjCSBxucCC7TuCjig6T1oRMefuCxO5woHAXf2tdSh0QjPcrCFvlRAV659zEUoAeic
 0OpXJuSNRvn8HWnf+lFQ4+HDzvYYcsigZWCfQY2YcL+tSf/luXUBMn+EOxbaw/yRI7
 HUe1g7FuR5RMA==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/4] drm/vkms: Add overlay_planes config
Date: Mon,  8 May 2023 10:53:54 +0300
Message-Id: <20230508075356.6511-3-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508075356.6511-1-marius.vlad@collabora.com>
References: <20230508075356.6511-1-marius.vlad@collabora.com>
MIME-Version: 1.0
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 yixie@chromium.org, mcanal@igalia.com, melissa.srw@gmail.com,
 jshargo@chromium.org, brpol@chromium.org, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And init it by default to NUM_OVERLAY_PLANES. This change would allow us
to configure the amount of overlay planes we can have in combination
with multiple pipes, in case we'll exceed the number of planes we can have.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 2 ++
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 +
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e3c9c9571c8d..bd53194f1525 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -99,6 +99,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "overlay_planes=%d\n", vkmsdev->config->overlay_planes);
 
 	return 0;
 }
@@ -230,6 +231,7 @@ static int __init vkms_init(void)
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
+	config->overlay_planes = NUM_OVERLAY_PLANES;
 
 	ret = vkms_create(config);
 	if (ret)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f152d54baf76..ae2b38360236 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -112,6 +112,7 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
+	unsigned int overlay_planes;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 1b8aa3a34e46..f4e67a0ad712 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -63,7 +63,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+		for (n = 0; n < vkmsdev->config->overlay_planes; n++) {
 			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
 			if (ret)
 				return ret;
-- 
2.39.2

