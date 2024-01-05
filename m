Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B23A82563E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 15:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F7A10E04E;
	Fri,  5 Jan 2024 14:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54BE10E04E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q4DxjswBk0Om0r4v6qDvbU2iMPeeoYiyhwcskfXrNnE=; b=Bg6EItiZKEmpvR7yRMueYIDeHj
 qWCSS2r/9d7Sw1y3VmhyJiM+ByZGUFkl9ZQQPupN9YAmhw+0ehlKJ/jsuoaY2QDyp9h4B9yfVi6BC
 16C1aEg1wgwAy0JE95gWf+hvtEY+KG/YJrfULJcR95UZVAa2SaiTA6IF2TMuydbWyGWN7x9RXjgIn
 KKjhTPuwAjbzGpj+n7QGXdTobARdpVyuFguhuumVSZj5KmyV7CRZ4z/cVlBNm3EAp1cTZRXqL+bTr
 LN2WHvW7+t6mahgccY70GOfrUixu2PtPo1eXN5197NwBfq4BnCz/Z1THnqx7YV86SLIPl4qJZCYkm
 WrQ7qnwQ==;
Received: from [179.234.233.159] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rLlf6-003E8n-VF; Fri, 05 Jan 2024 15:59:05 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/v3d: Show the memory-management stats on debugfs
Date: Fri,  5 Jan 2024 11:57:42 -0300
Message-ID: <20240105145851.193492-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dump the contents of the DRM MM allocator of the V3D driver. This will
help us to debug the VA ranges allocated.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index f843a50d5dce..cdfe1d3bf5ee 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -260,11 +260,26 @@ static int v3d_measure_clock(struct seq_file *m, void *unused)
 	return 0;
 }

+static int v3d_debugfs_mm(struct seq_file *m, void *unused)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
+
+	spin_lock(&v3d->mm_lock);
+	drm_mm_print(&v3d->mm, &p);
+	spin_unlock(&v3d->mm_lock);
+
+	return 0;
+}
+
 static const struct drm_debugfs_info v3d_debugfs_list[] = {
 	{"v3d_ident", v3d_v3d_debugfs_ident, 0},
 	{"v3d_regs", v3d_v3d_debugfs_regs, 0},
 	{"measure_clock", v3d_measure_clock, 0},
 	{"bo_stats", v3d_debugfs_bo_stats, 0},
+	{"v3d_mm", v3d_debugfs_mm, 0},
 };

 void
--
2.43.0

