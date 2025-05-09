Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F8AB1635
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1AE10EA6A;
	Fri,  9 May 2025 13:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="H9d2GFtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C066610EA6A;
 Fri,  9 May 2025 13:57:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5F4043B67;
 Fri,  9 May 2025 13:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746799030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PS8lSBx0SgWehq3/+W/jHTYiLDqAvodlyxPqYctHkFA=;
 b=H9d2GFtYWgoDrwhx0NxqqRoMN7UDjEHOEPB2whIs9XvQYeziYN5s3nv07dUBSVKU0EFnWX
 mBXz0E5qWPkEMs9pae/VMgkJP/xMgO1zyvKfQpPqyC7VE0q3Gydx18DKv4ikdgq/pTvbXp
 i8EH98vCniHQyXPDhMKoTWtrEyLVs13n9OaFKo3sJN291iEfooOciLkIJJ5o4Hhr2ymWLV
 ONc784wWHHgKxJ3vWGB/kSbfJrDjSdvZqqAaS855dU6bUA7WCex1Ra8gi6eoaa/tgb19G4
 MJodIRbAD1G2Pi6+6lB17UXv4X1w8KJDtexFfAqrq5RQoOPz4d+4o12Rg/ujww==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:44 +0200
Subject: [PATCH v3 18/22] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-18-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
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

This is the new API for allocating DRM bridges.

This driver embeds an array of channels in the main struct, and each
channel embeds a drm_bridge. This prevents dynamic, refcount-based
deallocation of the bridges.

To make the new, dynamic bridge allocation possible:

 * change the array of channels into an array of channel pointers
 * allocate each channel using devm_drm_bridge_alloc()
 * adapt the code wherever using the channels
 * remove the is_available flag, now "ch != NULL" is equivalent

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>

Changes in v3:
- fix NULL pointer deref in .remove and remove is_available bool

Changes in v2: none
---
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 27 +++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 1f6fd488e7039e943351006d3373009f0c15cb08..8517b1c953d4e0fb9f5b6dbe25fbaaa63eef2b33 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -63,12 +63,11 @@ struct imx8qxp_pc_channel {
 	struct drm_bridge *next_bridge;
 	struct imx8qxp_pc *pc;
 	unsigned int stream_id;
-	bool is_available;
 };
 
 struct imx8qxp_pc {
 	struct device *dev;
-	struct imx8qxp_pc_channel ch[2];
+	struct imx8qxp_pc_channel *ch[2];
 	struct clk *clk_apb;
 	void __iomem *base;
 };
@@ -307,7 +306,14 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 
-		ch = &pc->ch[i];
+		ch = devm_drm_bridge_alloc(dev, struct imx8qxp_pc_channel, bridge,
+					   &imx8qxp_pc_bridge_funcs);
+		if (IS_ERR(ch)) {
+			ret = PTR_ERR(ch);
+			goto free_child;
+		}
+
+		pc->ch[i] = ch;
 		ch->pc = pc;
 		ch->stream_id = i;
 
@@ -333,9 +339,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 		of_node_put(remote);
 
 		ch->bridge.driver_private = ch;
-		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
 		ch->bridge.of_node = child;
-		ch->is_available = true;
 
 		drm_bridge_add(&ch->bridge);
 	}
@@ -345,8 +349,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0].next_bridge)
-		drm_bridge_remove(&pc->ch[0].bridge);
+	if (i == 1 && pc->ch[0]->next_bridge)
+		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);
 	return ret;
@@ -359,13 +363,10 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		ch = &pc->ch[i];
-
-		if (!ch->is_available)
-			continue;
+		ch = pc->ch[i];
 
-		drm_bridge_remove(&ch->bridge);
-		ch->is_available = false;
+		if (ch)
+			drm_bridge_remove(&ch->bridge);
 	}
 
 	pm_runtime_disable(&pdev->dev);

-- 
2.49.0

