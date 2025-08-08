Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE72B1EAA0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFDA10E95D;
	Fri,  8 Aug 2025 14:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ED+pof/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBCA10E95C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 14:49:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36FE843987;
 Fri,  8 Aug 2025 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754664579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxTILuKlEXX8gx2CBbWGOC/3dK9iaEP97mQFbZ3GY8E=;
 b=ED+pof/Skjgct9BjsAqYpisQrGg+MT4eGYPLsICLxePz80/rpGBwuM0sZw3NqHlQ5LdoHL
 Fb94EZR1jteibT3epeD9mP2SFQMPD1eiydRNdq4ZObKxp6pp7QjH6y9UqClFOSzGMcicbY
 vGUgsrjRjtr82U9NFIlbn1n/Im4usiA2YHwQ+rir0xhMSg+rVV7Hc+7f5RbVBULds3OwMG
 DQnQfxsAP/8cVZjVpXKwIy+Nf0OVTIPmxNY0D67xZB34PE5GCZ7DK7pDfezoyMzn8LMeCM
 otGqXXgafOyE0wgoHXdJFZ8/hkTr2Q/2zXQk+Z4bOFPpgQ5A5IT6CI3dni3CSQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 08 Aug 2025 16:49:11 +0200
Subject: [PATCH v2 4/9] drm/display: bridge-connector: use
 drm_for_each_bridge_in_chain_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-4-edb6ee81edf1@bootlin.com>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-0-edb6ee81edf1@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepjeekrddvuddvrddvjedrudduheenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpeejkedrvdduvddrvdejrdduudehpdhhvghloheplgdujedvrdduiedrtddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghin
 hgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
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

Use drm_for_each_bridge_in_chain_scoped() instead of
drm_for_each_bridge_in_chain() to ensure the bridge being looped on is
refcounted.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 65d54019e5eab323ecd3dc568541ed1e1793a683..760ee00b6b02192dc1e59c213ef043a6bb9e3b60 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -136,10 +136,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
-	struct drm_bridge *bridge;
 
 	/* Notify all bridges in the pipeline of hotplug events. */
-	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
 			bridge->funcs->hpd_notify(bridge, status);
 	}
@@ -638,7 +637,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_bridge_connector *bridge_connector;
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
-	struct drm_bridge *bridge, *panel_bridge = NULL;
+	struct drm_bridge *panel_bridge = NULL;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	int connector_type;
@@ -665,7 +664,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	 * detection are available, we don't support hotplug detection at all.
 	 */
 	connector_type = DRM_MODE_CONNECTOR_Unknown;
-	drm_for_each_bridge_in_chain(encoder, bridge) {
+	drm_for_each_bridge_in_chain_scoped(encoder, bridge) {
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
 		if (!bridge->ycbcr_420_allowed)

-- 
2.50.1

