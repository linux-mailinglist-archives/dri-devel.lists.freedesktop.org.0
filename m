Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672D09D62E8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BF610EC36;
	Fri, 22 Nov 2024 17:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R1NabfzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73C10EC2F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D09E21C0009;
 Fri, 22 Nov 2024 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ng8HIjJ5WKO/B/KgkTLuuX73lEr5Mvi5DID38i4cXk=;
 b=R1NabfzXe7vbzmDKMRhyUDjGH/oe0DQQvr3Pd6MTwx/yXFhXMXhIWvsjH/BkuKp7gPn7mK
 eF1ptn22OT/auilUHmb9ysMzM1hn4gJt5M4P1p5dOOgtq5MsmY924oXDBCeNvp5m2pIbnt
 8/tswg0pED4gjG4/PfK+nBaPrKNUoPXVQO6UQG1Op/3W2NtZYXAIMqcRko4yOpSS9GbfIu
 AwDLIqy9LU5RJ1QALCpXWbARK+LVnTEv/fnblMe/n7A+cpOxb9YeEBMq9sxRBCng9TMW7A
 WDVKJ/03hxzjF+/wa6SrTxTM5LFjxRqNfQN8o5ZH8rmGHWpQKsaHotmTwysiPQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:21 +0100
Subject: [PATCH RFC v2 17/18] drm/vkms: Introduce config for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-17-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3463;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WmeSrjtBmfwRHkFWb5YcawuoDv1h/e6bqt11lWh1plI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1RH2ywbySfqdkYO6lLhI9Urdh663Fqn1Hge
 k19dC0SJJaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UQAKCRAgrS7GWxAs
 4vf+EACKzvaNuROasKjIezksY9fhX0J4Nh/HDvR6m1UiygnBO4A1QVCri4N98YTe3JzdXJkzKg8
 Dxryg26XXP1Gz6tRQJ8lQaKqIW1zDYifqA9wuds1UrxfpLJ+p79QCkk6ba93KFdOarBYw1ALNO6
 rIl6wwjZfs+kB9fR+47PT1XPhurHjDa8pEKtDxqk4tZzxkUlEq4CLkr8NDVrxQyUGGaxz4ztY+F
 n/XUk15p++0/cCcBjuAyT0GuT7IOVbSnp7PiKehnd9W3IiR6m0X+3AvdG7OZYuYCOcusR6CaJdW
 Gt/tKGgRecx3F3X55umztzrjl9ha+ywV9B35fPAvV0Nq+z0qCTcspQ4OCCAeW29Q8lHu92feNCP
 mhve5HQGPED755XzHahwNGblktE94UAQ/cuJcmViut9i/LdSb2zSXVRlgvxgHwCXFbuOSRbT3Hv
 4gz1uDC646AIUXbpenxP1dpdbJpl6fesKdeRgtSOZ+1KHTrEuGNM2Y+s+4RpTN2haHFpB6qYRzX
 LUjYtLjzHPEpMI8dBYT9nOBga/LjRA4faJUzcvGfVhmzTrMRP6GKHs3w34jC/j6OiRBjEkCN6my
 n2+A4A2tUmN7jsnggP++JEhLOoDXBV8TykRwcukRfngQhUW6da2HdJ7DahWCFuy2y7i0hDGiqJt
 DtnrNvG3eKiKMbA==
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

To properly test the EDID reading without using the DRM override, add an
option to configure the EDID for a connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  1 +
 drivers/gpu/drm/vkms/vkms_config.h |  2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 37 ++++++++++++++++++++++++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index ac1a9658c5075c118d59da965ca3392355ccb2b2..1a1234d4f10fa8e5ea6bd649139ecc10c991f875 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -199,6 +199,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
 	vkms_config_connector->type = DRM_MODE_CONNECTOR_VIRTUAL;
 	vkms_config_connector->status = connector_status_unknown;
+	vkms_config_connector->edid_blob_len = 0;
 
 	return vkms_config_connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index bba56c9d8aeceac97a4339ef42ab663c5dc54e65..1220b16f6c98d1ebb0ae55d662a84fe25e1a6a02 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -112,6 +112,8 @@ struct vkms_config_connector {
 	struct xarray possible_encoders;
 	int type;
 	enum drm_connector_status status;
+	char edid_blob[PAGE_SIZE];
+	int edid_blob_len;
 
 	/* Internal usage */
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index fc6a0cdade0739b94820ed4e0924cf355137fe79..56590afb33d75465971d10a282040690840cdbee 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -31,13 +31,44 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int vkms_connector_read_block(void *context, u8 *buf, unsigned int block, size_t len)
+{
+	struct vkms_config_connector *config = context;
+
+	if (block * len + len > config->edid_blob_len)
+		return 1;
+	memcpy(buf, &config->edid_blob[block * len], len);
+	return 0;
+}
+
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
+	const struct drm_edid *drm_edid = NULL;
 	int count;
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(connector->dev);
+	struct vkms_config_connector *context = NULL;
+
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, link) {
+		if (connector_cfg->connector == connector) {
+			context = connector_cfg;
+			break;
+		}
+	}
+	if (context)
+		drm_edid = drm_edid_read_custom(connector, vkms_connector_read_block, context);
+
+	/*
+	 * Unconditionally update the connector. If the EDID was read
+	 * successfully, fill in the connector information derived from the
+	 * EDID. Otherwise, if the EDID is NULL, clear the connector
+	 * information.
+	 */
+	drm_edid_connector_update(connector, drm_edid);
+
+	count = drm_edid_connector_add_modes(connector);
 
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+	drm_edid_free(drm_edid);
 
 	return count;
 }

-- 
2.47.0

