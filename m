Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B1AFCF17
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7EE10E693;
	Tue,  8 Jul 2025 15:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QZeV6BBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6E10E688
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 15:25:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEE91443E4;
 Tue,  8 Jul 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751988338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdiALbMjSC98BQrOYTgMnjsehTN/QLAP4GL7RBITAns=;
 b=QZeV6BBeqkeibFaCyYZoUTZYydxY55aEg9fjreHnmqR/ey1qV5uSq5qeAP7ZIAMiNKS31q
 IhtzUrcG89Olm4XAaGV/d54wTwZc11mpCB7IQYlT/itEmuMshaLw1aD/aRP5/TAwfu1N6R
 b0cQNGqNsWoZG/nXJxDrYmLL4S3KFAoJK1rkmaplFstUY2NTktLlOfDUNfrirf8tLFlRPk
 9XqywYBDauGi2GIc8if6F+V6s8Zu5W3sslToUMBa2CZIvvgWgtCep7ETmzkcwBck2fk96O
 F58dwC3uAXOt6ejjsyIh31xNWQwEbsy9YtF7f0Ty57LGbjI3KA8/xwBrYY9s7g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 08 Jul 2025 17:24:42 +0200
Subject: [PATCH 1/2] drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-1-6285de8c3759@bootlin.com>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
In-Reply-To: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheejgfdugedvudekgeevtdfgudduhedtgfetfeevgfehkeejhedviefhtdffhfeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghloheplgduledvrdduieekrddurddufegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtr
 giiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehrghgrlhhlrghishhpohhusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

devm_drm_bridge_alloc() is the new API to be used for allocating (and
partially initializing) a private driver struct embedding a struct
drm_bridge.

This driver was missed during the automated conversion in commit
9c399719cfb9 ("drm: convert many bridge drivers from devm_kzalloc() to
devm_drm_bridge_alloc() API") and following commits.

The lack of conversion for this driver is a bug since commit a7748dd127ea
("drm/bridge: get/put the bridge reference in drm_bridge_add/remove()")
which is the first commmit having added a drm_bridge_get/put() pair and
thus exposing the incorrect initial refcount issue.

Fix this by switching the driver to the new API.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/ce9c6aa3-5372-468f-a4bf-5a261259e459@samsung.com/
Fixes: a7748dd127ea ("drm/bridge: get/put the bridge reference in drm_bridge_add/remove()")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 26 ++++++++++++--------------
 drivers/gpu/drm/sti/sti_hdmi.h |  2 ++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 37b8d619066ef14a2def26e2e4f90a9c2194238d..4e7c3d78b2b971f8083deae96f3967b44a6499cb 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -168,6 +168,11 @@ struct sti_hdmi_connector {
 #define to_sti_hdmi_connector(x) \
 	container_of(x, struct sti_hdmi_connector, drm_connector)
 
+static struct sti_hdmi *drm_bridge_to_sti_hdmi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sti_hdmi, bridge);
+}
+
 static const struct drm_prop_enum_list colorspace_mode_names[] = {
 	{ HDMI_COLORSPACE_RGB, "rgb" },
 	{ HDMI_COLORSPACE_YUV422, "yuv422" },
@@ -749,7 +754,7 @@ static void hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_minor *minor)
 
 static void sti_hdmi_disable(struct drm_bridge *bridge)
 {
-	struct sti_hdmi *hdmi = bridge->driver_private;
+	struct sti_hdmi *hdmi = drm_bridge_to_sti_hdmi(bridge);
 
 	u32 val = hdmi_read(hdmi, HDMI_CFG);
 
@@ -881,7 +886,7 @@ static int hdmi_audio_configure(struct sti_hdmi *hdmi)
 
 static void sti_hdmi_pre_enable(struct drm_bridge *bridge)
 {
-	struct sti_hdmi *hdmi = bridge->driver_private;
+	struct sti_hdmi *hdmi = drm_bridge_to_sti_hdmi(bridge);
 
 	DRM_DEBUG_DRIVER("\n");
 
@@ -936,7 +941,7 @@ static void sti_hdmi_set_mode(struct drm_bridge *bridge,
 			      const struct drm_display_mode *mode,
 			      const struct drm_display_mode *adjusted_mode)
 {
-	struct sti_hdmi *hdmi = bridge->driver_private;
+	struct sti_hdmi *hdmi = drm_bridge_to_sti_hdmi(bridge);
 	int ret;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -1273,7 +1278,6 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct sti_hdmi_connector *connector;
 	struct cec_connector_info conn_info;
 	struct drm_connector *drm_connector;
-	struct drm_bridge *bridge;
 	int err;
 
 	/* Set the drm device handle */
@@ -1289,13 +1293,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	connector->hdmi = hdmi;
 
-	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -EINVAL;
-
-	bridge->driver_private = hdmi;
-	bridge->funcs = &sti_hdmi_bridge_funcs;
-	drm_bridge_attach(encoder, bridge, NULL, 0);
+	drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
 
 	connector->encoder = encoder;
 
@@ -1385,9 +1383,9 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 
 	DRM_INFO("%s\n", __func__);
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(dev, struct sti_hdmi, bridge, &sti_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	ddc = of_parse_phandle(pdev->dev.of_node, "ddc", 0);
 	if (ddc) {
diff --git a/drivers/gpu/drm/sti/sti_hdmi.h b/drivers/gpu/drm/sti/sti_hdmi.h
index 6d4c3f57bc46ea7d685682e6635840aaedd94fba..91d43dd46f1393ff182ee19804140897f216a260 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.h
+++ b/drivers/gpu/drm/sti/sti_hdmi.h
@@ -12,6 +12,7 @@
 
 #include <media/cec-notifier.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_property.h>
 
@@ -86,6 +87,7 @@ struct sti_hdmi {
 	struct hdmi_audio_params audio;
 	struct drm_connector *drm_connector;
 	struct cec_notifier *notifier;
+	struct drm_bridge bridge;
 };
 
 u32 hdmi_read(struct sti_hdmi *hdmi, int offset);

-- 
2.50.0

