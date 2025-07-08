Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B262AFCF18
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA5410E694;
	Tue,  8 Jul 2025 15:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lUSpOW2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71F10E688
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 15:25:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 143DC443F2;
 Tue,  8 Jul 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751988340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctNrY6FQpoYSV7We6CT70dZdimTwCYy+eflvJWtBnks=;
 b=lUSpOW2/MCRwNf7eYoAJ+GQOwDwJ0uR0VIrzfcAqb/elXAv3HKZWnyaXZh4sGDi9S+RZZB
 bMXRhhf4nMTPozRLcpVh2gk4S17UPuqbWNwX1FnWFge+cNsubudwsBTni+qMxrByCHd5px
 UoNhCK8j8tEc3FrtUYh6t4CFqkXXBalLQ7GFvyd1l09bc8iATtn+6d0bFpMBJPasu+2HLh
 qD//hPbaCotLUmK+F8DU2shQkGlUe+L+XwL5yGEKuvbTK2QKtwg5MeIpW31abaOhz/SovB
 dYK6/wNYoAn0HIUwm6pBFV4CpTui/FPOPLV1+lGwtFGL3e93v5TQKhLsHJE+vw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 08 Jul 2025 17:24:43 +0200
Subject: [PATCH 2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-2-6285de8c3759@bootlin.com>
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
 drivers/gpu/drm/sti/sti_hda.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index d202b6c1eb8f6032fef547c9f00ca9cd2a914520..2c015f563de96ae58959801493ead870c49f70e5 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -246,6 +246,7 @@ struct sti_hda {
 	struct device dev;
 	struct drm_device *drm_dev;
 	struct drm_display_mode mode;
+	struct drm_bridge bridge;
 	void __iomem *regs;
 	void __iomem *video_dacs_ctrl;
 	struct clk *clk_pix;
@@ -262,6 +263,11 @@ struct sti_hda_connector {
 #define to_sti_hda_connector(x) \
 	container_of(x, struct sti_hda_connector, drm_connector)
 
+static struct sti_hda *drm_bridge_to_sti_hda(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct sti_hda, bridge);
+}
+
 static u32 hda_read(struct sti_hda *hda, int offset)
 {
 	return readl(hda->regs + offset);
@@ -401,7 +407,7 @@ static void sti_hda_configure_awg(struct sti_hda *hda, u32 *awg_instr, int nb)
 
 static void sti_hda_disable(struct drm_bridge *bridge)
 {
-	struct sti_hda *hda = bridge->driver_private;
+	struct sti_hda *hda = drm_bridge_to_sti_hda(bridge);
 	u32 val;
 
 	if (!hda->enabled)
@@ -426,7 +432,7 @@ static void sti_hda_disable(struct drm_bridge *bridge)
 
 static void sti_hda_pre_enable(struct drm_bridge *bridge)
 {
-	struct sti_hda *hda = bridge->driver_private;
+	struct sti_hda *hda = drm_bridge_to_sti_hda(bridge);
 	u32 val, i, mode_idx;
 	u32 src_filter_y, src_filter_c;
 	u32 *coef_y, *coef_c;
@@ -517,7 +523,7 @@ static void sti_hda_set_mode(struct drm_bridge *bridge,
 			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adjusted_mode)
 {
-	struct sti_hda *hda = bridge->driver_private;
+	struct sti_hda *hda = drm_bridge_to_sti_hda(bridge);
 	u32 mode_idx;
 	int hddac_rate;
 	int ret;
@@ -677,7 +683,6 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder;
 	struct sti_hda_connector *connector;
 	struct drm_connector *drm_connector;
-	struct drm_bridge *bridge;
 	int err;
 
 	/* Set the drm device handle */
@@ -693,13 +698,7 @@ static int sti_hda_bind(struct device *dev, struct device *master, void *data)
 
 	connector->hda = hda;
 
-	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	bridge->driver_private = hda;
-	bridge->funcs = &sti_hda_bridge_funcs;
-	drm_bridge_attach(encoder, bridge, NULL, 0);
+	drm_bridge_attach(encoder, &hda->bridge, NULL, 0);
 
 	connector->encoder = encoder;
 
@@ -745,9 +744,9 @@ static int sti_hda_probe(struct platform_device *pdev)
 
 	DRM_INFO("%s\n", __func__);
 
-	hda = devm_kzalloc(dev, sizeof(*hda), GFP_KERNEL);
-	if (!hda)
-		return -ENOMEM;
+	hda = devm_drm_bridge_alloc(dev, struct sti_hda, bridge, &sti_hda_bridge_funcs);
+	if (IS_ERR(hda))
+		return PTR_ERR(hda);
 
 	hda->dev = pdev->dev;
 	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");

-- 
2.50.0

