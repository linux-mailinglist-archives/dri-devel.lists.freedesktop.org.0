Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728B265D3A7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35110E0B0;
	Wed,  4 Jan 2023 13:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEB610E109
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:03:16 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3ADD86602D13;
 Wed,  4 Jan 2023 13:03:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672837395;
 bh=0y+rpVvzwhYvzmKLYw7lUlliQJlfh+XouQYi3mXOc9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L+7pfP4B1Lti5ZHJx+HbX4csgBhSzIrg9ZCr/jLYHHf1ZPPr14osi983dz8nxUhCH
 ciXqpefQrJRrFzA5YDFdRXf0HN9gdabLE6cMits/9jVdwAqpy41GnKZE6z4GyEdm3W
 /O4oEkcP9RWLIUZnFWkrFlUebwWBJquoTzL4qJsIoHDOSeg+/b+IZ2+Tbmpcb+Oa9Q
 ESVV/kqvEbNETSrpz2AKVZOlaX68aTw+IFxw3V5ONMS3A1tS5s0pr7nIEJUD7G14YM
 GnSWpOuhO1+SlNXSQUK0kp9uiLrQ8xKHXN5+UFsZ2lhZm2wQnL5nZrw5M+q/PMbanG
 KxRuiKxcbUFRw==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RFC 1/4] drm/panfrost: Provide a dummy show_fdinfo()
 implementation
Date: Wed,  4 Jan 2023 14:03:05 +0100
Message-Id: <20230104130308.3467806-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104130308.3467806-1-boris.brezillon@collabora.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide a dummy show_fdinfo() implementation exposing drm-driver and
drm-client-id. More stats will be added soon.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 2fa5afe21288..6ee43559fc14 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -515,7 +515,22 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
+static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
+
+	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
+	seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);
+}
+
+static const struct file_operations panfrost_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+#ifdef CONFIG_PROC_FS
+	.show_fdinfo = panfrost_show_fdinfo,
+#endif
+};
 
 /*
  * Panfrost driver version:
-- 
2.38.1

