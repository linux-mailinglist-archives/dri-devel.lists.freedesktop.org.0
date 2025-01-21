Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB81A17C5F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05EC10E56D;
	Tue, 21 Jan 2025 10:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AhIakmnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E510E562
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D345940015;
 Tue, 21 Jan 2025 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roVOu8bJHELSDbob9WYzi+I7LS1qlkprNDsb4qlKyIY=;
 b=AhIakmnXB1WOqDAMQyJoe1hMJlH8SiICaY44XPzgkE73SwmGAIxLR+4ChfWxryOKu5rSkx
 4JJiI35Ewct1JWJ8yuaDu5nuCYtaWVWO2UrvPWTVcaPFXxshrECWcGVjyip1kY07cTriAC
 JgUnHyLFd/MM1bAbbg+T7up4hYPQemd6nSlbX2DibtaP0XDBqWHEW6dzCErO3JW7qQQ4Kf
 exdBL5pKVGNTdBlPy3Aw+PNNUX24DcGHLHVyphpUw3/t8fkMTGn+NVVboN/mCY5sQ42tJp
 /GBvAQgr+zZ3svxI/LQU0sFrZME8rnA9TcRI4044eP9d28+VP+Ml1C5nahPYoQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:33 +0100
Subject: [PATCH v3 09/16] drm/vkms: Introduce config for CRTC name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-9-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Hg4byqydaR4gdFBvGZisOfOByyHA174ZUU2M0mdzfJw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30i31CkbGfjxau+9M889MNtvUJXe7xDQGf4o
 XQnWurJg8WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IgAKCRAgrS7GWxAs
 4gJrEACsppOUxfTK8hg17CsbWctsIaeO8/PnXZR181531IGwLYVm4vPQD2I6oHQcpbV9e9013rs
 tu2FGk7Yoe1blGvIP5DuTiibhJXjwVBfDDMEhGriwULMAyIMbKqUZD1jeQ9RD85J/Was3zjGRKz
 qQoclRjgNrVMxHqatnzu16kENTGv5HZ5oWNQvDq9EATpxwnTfNHG4UY6U2oMGdxG4KHg5O2rW4b
 c7RlCoIRY++Uzf/+AS6gLMWPMyjJ1iK1UradMar5uJuteI0XjEHpqgjdM+73iUWM3QIiUbqOZEX
 VsZ/XOkrX22V8Dj6sBFEl9PyzuomBwx/z2AzlUGPFWRk/wOJwel/7iXt2QcT3LExqJVMOSSeDgk
 sFReXlxa2n233sS6bqoRBiKnbnNsmvqj86Z2j6dSnzhR1EN4b1WizxkfazfD2d/CpPd7GLhYhjN
 7qk47yUSLA46Cz7JV3BmKZlczp4Ckeb+qn9s40nc5g76tK2KSLjX/uqgLcCNW7+H0CewJPXPDx0
 lVFkNlAYSNVkgCBjEb2SfQwKr87CmFdBpYwr9Re7sqFfQCa84WCuzmm+mkL98prRRkMnWrh6eoB
 Pvr603cMyuIa1Bmq+OyPVN6dPKEZ099mxblcRRoVY1H8sanvBzMEGQo2FOINQmK7BUJKi2Nh+5R
 RA1wjx0yU9VHw6w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As a CRTC will be a directory in ConfigFS, add the name configuration for
CRTC name so we will be able to reflect the configfs directory name in the
drm name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++++
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_crtc.c   | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8c88af745eb208a52f58fbf5def3f16c29d31063..b610d37b675efaea7ca717f08e525beaf18d8d9e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -37,6 +37,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	if (!crtc)
 		goto err_alloc;
 	crtc->writeback = enable_writeback;
+	crtc->name = kzalloc(sizeof("Main CRTC"), GFP_KERNEL);
+	if (!crtc->name)
+		goto err_alloc;
+	sprintf(crtc->name, "Main CRTC");
 
 	encoder = vkms_config_create_encoder(vkms_config);
 	if (!encoder)
@@ -212,6 +216,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
 		}
 	}
 
+	kfree(vkms_config_crtc->name);
 	kfree(vkms_config_crtc);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 874d631f8895c47eca6eba8bfe20b56b88966b67..efe984113fb664ff38a68b3be90063c366bb2892 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,6 +29,7 @@ struct vkms_config {
  * struct vkms_config_crtc
  *
  * @link: Link to the others CRTCs
+ * @name: Name of the CRTC
  * @possible_planes: List of planes that can be used with this CRTC
  * @possible_encoders: List of encoders that can be used with this CRTC
  * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
@@ -38,6 +39,7 @@ struct vkms_config {
 struct vkms_config_crtc {
 	struct list_head link;
 
+	char *name;
 	bool writeback;
 	struct xarray possible_planes;
 	struct xarray possible_encoders;
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index f4da196fd7774ee1dcc5148e6420186f1384b3fa..0c795de19db5359f968cb0c0a396626deb3f8e27 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -282,7 +282,7 @@ struct vkms_output *vkms_crtc_init(struct vkms_device *vkms_device,
 
 	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
 					       primary, cursor,
-					       &vkms_crtc_funcs, NULL);
+					       &vkms_crtc_funcs, config->name);
 	if (IS_ERR(vkms_out)) {
 		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
 		return vkms_out;

-- 
2.47.1

