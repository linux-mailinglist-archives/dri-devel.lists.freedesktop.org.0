Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E7A10881
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ED410E347;
	Tue, 14 Jan 2025 14:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XOnQA1/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F0510E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 249BCC000F;
 Tue, 14 Jan 2025 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3siswyDnJUjiz5TlZzFY3sfnn2PJfMpAj4ZraYxKJs=;
 b=XOnQA1/pWekiCmg9bLJDQnKenlV+tnRbAvoyNX+AyQ0M8l8UleA+hbp5o9JDJSTuvCdeKK
 yX1F2LGzZ/hdMu0kRXZ19W68A7fNydnZ5Ncc31JtrRHjSq2qLcB+6qFR91EaCxg+/hK0c6
 VFcyCBAQnjV+jWKasdLGAKaxRt5Qsxo3GhyKULrbpwUSzgk8MuZUaUaxCwd2lj5BAi5DV0
 xl4q1N5grSGNoTOgE2A+NHPUF7+THweEZquunaKAEdgvbkfMyPcMlOIRp6Zl6DzdrvL8tM
 ozD/KoXCbnw/YmOizA109W7kfwJMjTDSE4CWmaZ4ALwO9p7Q+MyYSRlwUU+shA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:44 +0100
Subject: [PATCH v8 2/8] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250114-google-vkms-managed-v8-2-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Sp3pqA6hkZX9n+1YVNJEqNXdRm8N2eRH5m6LOQD3GtM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9EtcsIN2bJS1WgkcTQ7+4uLTXTuW6WX1Zs6
 3NW1xQYueWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRAAKCRAgrS7GWxAs
 4vXFD/4mechptPuL2c/AorSw65ExO3+ydrZJncHPi9FzQgejdJtIqHK2HXm7iLwOYhxAmDNLwqH
 5WLhZQuf1WI4OVD1GM7jwSHhfnMrw/NCwQfKnucBI75zNJJTQT+pMHPHwNmFRLbV6Cw8iuppaC6
 JnB6GED/4JO8TIVPfjdLmiXX7iRnx0CWaj58aRTU6uMJyQzyxlqjTgrJ9AyaF7zwi2I0WQNISXd
 WMTo0yKbBGMOX+Mjt4/T5e0JPUX2xBe+MsehJgkNaQ/nZiR+q75s7t6hHWE4L+V8iYrmN1dw6Wg
 gcis2pdOSUzqMUiv5vA0wLco1Ajx5KoyupHZ1cbkrRJPI6uwc4nGYTCEiaW6t48A4ynPrH3e7YN
 RGeHbb1ALanYm3onGzLuwKQ4uK1zKQhTPJHibMH/c6oprTng8RfGBKBAgnR1enmbeXBmepwdGAA
 btogZP3FjsE3+U+PQHTdpt2OyjIkwwq20yy9c+W5BETZMXI/v22DpbDQ7160gGtytydw9PCVLbt
 5DWNoyoraptdxeG2cmUk4+Yf25Gge7awgDmmLy6i4HdTuefHKmvZWwignUW5fve8YXahhZfI7m9
 0JkrDFdlQMEzUJ5UVar72jJSi8AF+qcPlqyrnGlT5XM5uG840tWukNVIqeeiazjdtg9+Sj2KHrq
 33u6GPdk2IrpFTg==
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

The current VKMS driver uses non-managed function to create encoders. It
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 570823ecb28f589e6323036590ec05a2f633bc9b..ab9affa75b66ce9f00fe025052439405206144ec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -84,8 +80,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drmm_encoder_init(dev, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
@@ -95,7 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -108,7 +104,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	return 0;
 
-err_attach:
-	drm_encoder_cleanup(encoder);
 	return ret;
 }

-- 
2.47.1

