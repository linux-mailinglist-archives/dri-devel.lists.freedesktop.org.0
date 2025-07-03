Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B5AF7DEE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DABC10E04C;
	Thu,  3 Jul 2025 16:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Q4X2hBv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE8610E04C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 16:33:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20FFA442AB;
 Thu,  3 Jul 2025 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751560390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=++u5S5RPzXhKBex/t5CbkjWaVjlj1TY8uieui7XWnyw=;
 b=Q4X2hBv6PMHXJQLRkiv4/YMIxX3ZWnAzONbzrmZBtD8hUdKmFsJHmPykufmHKr5kfEpKJu
 mSuSjpNdMHvtrlubKULrVRuW2N2ohsSP1kBhH05sdxWm4O1Ibc460+cyrhLPGWC+tL++2t
 tIYFaXtogWyr0CCm1rn9xkQS1JDQQNqyEmaQ3J39LftJeXtVrHdw70q/b8k/aggiNq92FN
 Pj+AJTKF9yICzXSSdKGGDKdbIMbo2snJt+kXeLiNr3iQMuK49HAU27cQUFBJO638aTP71Z
 AEY+dTTJp3MMSLGqEYfWrnZRPwoKipRMOEt7ZNREKY265mV3hAtVW3kCWpQsVA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 03 Jul 2025 18:32:32 +0200
Subject: [PATCH] drm/bridge: tc358767: fix uninitialized variable
 regression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-drm-bridge-alloc-fix-tc358767-regression-v1-1-8f224cd063c4@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ+wZmgC/x2NSwrDMAwFrxK0rsCxsR1yldCFayupID/kUgohd
 4/S5TCPeQdUEqYKfXOA0Jcrb6tC+2ggv9M6EXJRBmusN9E4LLLgS7ioSfO8ZRz5h5/sfBdDRKF
 JqN4R9C5Qsl1o0xhAc7uQTv9Xw/M8L5T0c9J6AAAA
X-Change-ID: 20250703-drm-bridge-alloc-fix-tc358767-regression-536ea2861af6
To: "Colin King (gmail)" <colin.i.king@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeuleetffeutdfhvedvjeffuddtteejtdfhffdvhedvleevteekjeejgfejgfehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghloheplgduledvrdduieekrddurdduleeingdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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

Commit a59a27176914 ("drm/bridge: tc358767: convert to
devm_drm_bridge_alloc() API") split tc_probe_bridge_endpoint() in two
functions, thus duplicating the loop over the endpoints in each of those
functions. However it missed duplicating the of_graph_parse_endpoint() call
which initializes the struct of_endpoint, resulting in an uninitialized
read.

Fixes: a59a27176914 ("drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API")
Reported-by: Colin King (gmail) <colin.i.king@gmail.com>
Closes: https://lore.kernel.org/all/056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 61559467e2d22b4b1b4223c97766ca3bf58908fd..562fea47b3ecf360e64a414e95ab5d645e610e9e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2422,6 +2422,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc, enum tc_mode mode)
 	struct device_node *node = NULL;
 
 	for_each_endpoint_of_node(dev->of_node, node) {
+		of_graph_parse_endpoint(node, &endpoint);
 		if (endpoint.port == 2) {
 			of_property_read_u8_array(node, "toshiba,pre-emphasis",
 						  tc->pre_emphasis,

---
base-commit: b4cd18f485687a2061ee7a0ce6833851fc4438da
change-id: 20250703-drm-bridge-alloc-fix-tc358767-regression-536ea2861af6

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

