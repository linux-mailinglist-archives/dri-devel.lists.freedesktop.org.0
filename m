Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E795DCD57C2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDBC10E604;
	Mon, 22 Dec 2025 10:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GeQ0JkCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A9910E619
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:11:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 123534E41D36;
 Mon, 22 Dec 2025 10:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D9FF6606C1;
 Mon, 22 Dec 2025 10:11:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6ACDE10AB01A2; Mon, 22 Dec 2025 11:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PwMByhJR+4NsqCHWSPeb2QraHeBUsFjjwUcbiSOuQ34=;
 b=GeQ0JkCIG48szOfosmjKDwaE6NSAd9KfO929f1qQ1MFH0clMrBf856dbiPvtSh+nTji5Yx
 V5MVIVGqD0BCDORktpCrN5kqMO4XeFAC3KYkoKdr9PPnZH8E/O2nE2sT2bOjXTPF2hAZ8H
 DOMtW9p9mzjE+bWjn8IyH6kPa7DUEiivWD3dLV1CfE/HK13SDGC4U2z9T+JTMqb7p8jkau
 zreuhr7k+Hvo7HGACG51yrDmkqkr6Yec/aKZMxmlof65U8u72X19g8U5kCYArPpQGGnAO9
 dqKhYXauxIs1gZNH0Gzg19lN6EsC3z5uRWPG7wbukBy0W6QvIgH7Llc+QdpPZw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:08 +0100
Subject: [PATCH v3 06/33] drm/vkms: Introduce config for plane name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-6-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BQDNwIoSJTYr0DnulbPemjrhDtzIGyub7yXHojx5ghc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlAasTheGGS778y05KfgykCAqv166BOYP5KD
 VQ5guQEawSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKYUw/+ODmVy8lBc46ozhglXutN1owtxoVFOFw
 /TKbv8KJpNZVxD85qWP++OjxHPgg5+OctkyGIodO+2iH6ugLOHYw9bgwps3Vkhy68DqwznYwXJB
 oVPQ93BvlLbuMSysVMXrswO1EPpJd4xodtr3XHthE2Di94lxj1O/rS28MDBSlsMyRksqbHVGaUW
 Es61bEnvALIIDwKEBFPSz1dwstrjIl+o1uRG5DBqQhUP5Ya0FlTFnldAaZyFFSpK8ZX2CwqdejD
 qFsIYEdpCIQfk9cltIXzpamyIgWJF5GD5jKoJkDQSnFJYWA8R+fmgKKa7lDg86UTN1a1JfotRvg
 9SXmYnXsGO824wqJajdOSGoUqMqeaJdpe/q5bgQ2FfoS+nBSDY0rYt7tZyzY/ahbmD0FLCtrD6U
 +BxnPgwrVcRG0xOKp6sIkQ/6xeSnlQcN+iG8LL6PKXhg57obqZbz9Vd7/NkOgUTBKMpMNREOUF+
 ptHwaq20zZuICH9DIJZk95EYiZd+nOHZzTI1uA/Y5YTdQYlw/aawMGJv197zTOapf8ZRuOrH2KL
 nSocmKqZqzZXue1wjld/04Xx38B4UWM3M6UWXgpqH7ROP4UFlCxos7p0SkQfOs4cyp1XsyjLU8B
 s++StK+xWEFnbZPCIR+O1Kr/PEZRakIbj7/KeddfSjWYm1dmLXmI=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

As planes can have a name in DRM, prepare VKMS to configure it using
ConfigFS.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  3 ++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index ed1cd8d153c5..f31a1eb8f811 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -356,6 +356,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\ttype=%s\n",
 			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
+		seq_printf(m, "\tname=%s\n",
+			   vkms_config_plane_get_name(plane_cfg) ?
+			   vkms_config_plane_get_name(plane_cfg) : "(null)");
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -397,6 +400,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	plane_cfg->config = config;
 	plane_cfg->default_pipeline = false;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	vkms_config_plane_set_name(plane_cfg, NULL);
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail(&plane_cfg->link, &config->planes);
@@ -409,6 +413,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 {
 	xa_destroy(&plane_cfg->possible_crtcs);
 	list_del(&plane_cfg->link);
+	kfree_const(plane_cfg->name);
 	kfree(plane_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8f7f286a4bdd..b9a41a22c011 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -35,6 +35,7 @@ struct vkms_config {
  *
  * @link: Link to the others planes in vkms_config
  * @config: The vkms_config this plane belongs to
+ * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
  * @possible_crtcs: Array of CRTCs that can be used with this plane
@@ -47,6 +48,7 @@ struct vkms_config_plane {
 	struct list_head link;
 	struct vkms_config *config;
 
+	const char *name;
 	enum drm_plane_type type;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
@@ -314,6 +316,30 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
 	plane_cfg->default_pipeline = default_pipeline;
 }
 
+/**
+ * vkms_config_plane_set_name() - Set the plane name
+ * @plane_cfg: Plane to set the name to
+ * @name: New plane name. The name is copied.
+ */
+static inline void
+vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
+			   const char *name)
+{
+	if (plane_cfg->name)
+		kfree_const(plane_cfg->name);
+	plane_cfg->name = kstrdup_const(name, GFP_KERNEL);
+}
+
+/**
+ * vkms_config_plane_get_name - Get the plane name
+ * @plane_cfg: Plane to get the name from
+ */
+static inline const char *
+vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->name;
+}
+
 /**
  * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
  * @plane_cfg: Plane to attach
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 19fe6acad306..d8612e28ac3f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -11,6 +11,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 
+#include "vkms_config.h"
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
@@ -228,7 +229,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
 					   NULL, vkms_config_plane_get_type(plane_cfg),
-					   NULL);
+					   vkms_config_plane_get_name(plane_cfg));
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.51.2

