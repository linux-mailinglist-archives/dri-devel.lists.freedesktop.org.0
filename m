Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52F127CB0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 15:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B802C6EC45;
	Fri, 20 Dec 2019 14:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5746EC43;
 Fri, 20 Dec 2019 14:30:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6910D21D7E;
 Fri, 20 Dec 2019 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852245;
 bh=zYukKoBtk75cwM0xfkpM0w8tOaNetdmGgDxMy7GLPrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=exwzzek7jGx44rFVCidj1EV/uLK66089uMsJ9nv3hWNpNI72Uk3ehFCnWk6m8mS9a
 1vP9nyqkRGsS69cNPjFHV292NGVGU3Lc7XgA2rhW6lAUOf4e53K3zXp3nibBls6tXD
 Sb3hMQqHzUJH+8w/DpqAcleA3xk3e9Sw27LWfOoM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 37/52] drm/nouveau: Fix drm-core using atomic
 code-paths on pre-nv50 hardware
Date: Fri, 20 Dec 2019 09:29:39 -0500
Message-Id: <20191220142954.9500-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 64d17f25dcad518461ccf0c260544e1e379c5b35 ]

We do not support atomic modesetting on pre-nv50 hardware, but until now
our connector code was setting drm_connector->state on pre-nv50 hardware.

This causes the core to enter atomic modesetting paths in at least:

1. drm_connector_get_encoder(), returning connector->state->best_encoder
which is always 0, causing us to always report 0 as encoder_id in
the drmModeConnector struct returned by drmModeGetConnector().

2. drm_encoder_get_crtc(), returning NULL because uses_atomic get set,
causing us to always report 0 as crtc_id in the drmModeEncoder struct
returned by drmModeGetEncoder()

Which in turn confuses userspace, at least plymouth thinks that the pipe
has changed because of this and tries to reconfigure it unnecessarily.

More in general we should not set drm_connector->state in the non-atomic
code as this violates the drm-core's expectations.

This commit fixes this by using a nouveau_conn_atom struct embedded in the
nouveau_connector struct for property handling in the non-atomic case.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1706557
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 28 +++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.h |  6 +++++
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 94dfa2e5a9abe..805b341db165b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -245,14 +245,22 @@ nouveau_conn_atomic_duplicate_state(struct drm_connector *connector)
 void
 nouveau_conn_reset(struct drm_connector *connector)
 {
+	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_conn_atom *asyc;
 
-	if (WARN_ON(!(asyc = kzalloc(sizeof(*asyc), GFP_KERNEL))))
-		return;
+	if (drm_drv_uses_atomic_modeset(connector->dev)) {
+		if (WARN_ON(!(asyc = kzalloc(sizeof(*asyc), GFP_KERNEL))))
+			return;
+
+		if (connector->state)
+			nouveau_conn_atomic_destroy_state(connector,
+							  connector->state);
+
+		__drm_atomic_helper_connector_reset(connector, &asyc->state);
+	} else {
+		asyc = &nv_connector->properties_state;
+	}
 
-	if (connector->state)
-		nouveau_conn_atomic_destroy_state(connector, connector->state);
-	__drm_atomic_helper_connector_reset(connector, &asyc->state);
 	asyc->dither.mode = DITHERING_MODE_AUTO;
 	asyc->dither.depth = DITHERING_DEPTH_AUTO;
 	asyc->scaler.mode = DRM_MODE_SCALE_NONE;
@@ -276,8 +284,14 @@ void
 nouveau_conn_attach_properties(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
-	struct nouveau_conn_atom *armc = nouveau_conn_atom(connector->state);
 	struct nouveau_display *disp = nouveau_display(dev);
+	struct nouveau_connector *nv_connector = nouveau_connector(connector);
+	struct nouveau_conn_atom *armc;
+
+	if (drm_drv_uses_atomic_modeset(connector->dev))
+		armc = nouveau_conn_atom(connector->state);
+	else
+		armc = &nv_connector->properties_state;
 
 	/* Init DVI-I specific properties. */
 	if (connector->connector_type == DRM_MODE_CONNECTOR_DVII)
@@ -749,9 +763,9 @@ static int
 nouveau_connector_set_property(struct drm_connector *connector,
 			       struct drm_property *property, uint64_t value)
 {
-	struct nouveau_conn_atom *asyc = nouveau_conn_atom(connector->state);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
+	struct nouveau_conn_atom *asyc = &nv_connector->properties_state;
 	struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index de95884208848..de84fb4708c7a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -118,6 +118,12 @@ struct nouveau_connector {
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight;
 #endif
+	/*
+	 * Our connector property code expects a nouveau_conn_atom struct
+	 * even on pre-nv50 where we do not support atomic. This embedded
+	 * version gets used in the non atomic modeset case.
+	 */
+	struct nouveau_conn_atom properties_state;
 };
 
 static inline struct nouveau_connector *nouveau_connector(
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
