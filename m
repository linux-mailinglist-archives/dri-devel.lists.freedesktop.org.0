Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5FA60EF2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 11:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD15F10E9BD;
	Fri, 14 Mar 2025 10:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V5JWfu5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7FB10E9BB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:31:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 267114333F;
 Fri, 14 Mar 2025 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741948314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMRuXNJQ91MiX1jBJa/pd03aZsq6PMaQrbW5zeLajvU=;
 b=V5JWfu5SO2uDAuf84Ru0idEusJzCBpo4EBZSNCBD0mIxNuJ5yJmMF9tWe2oyDV1wsoo9ZG
 ffUeQ4v7ZFyY7z2YOiBedjerS9Bvvhd/HLz1FiGL7yB6fXPbbcH5hDR563hM/MzXnC/qX0
 NRp5e9O5+c+qLsQPjTfAG+izmBK12WJESpVLZSUq4IlXeZJXkjmXQw1on7IBwI7f3zd+8S
 r0VG5j4Ua/EIpghGmy/AnOygXLOQb8scz/DtHO/nufA4dXXer91ZoanskMdmEVKqr+Kf2/
 ahqhuLTcz42TptBpPow9Q0IceHs9Pl+kmfB+jenO/yM2U3y23cIxn4J1aJcLeQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 14 Mar 2025 11:31:21 +0100
Subject: [PATCH v7 08/11] drm/atomic-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-bridge-refcount-v7-8-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehjvghrn
 hgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
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

The bridge returned by drm_bridge_chain_get_first_bridge() is
refcounted. Put it when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: I suspect most or all of the involved functions here could just
receive the encoder instead of the first bridge in the chain, and then walk
the encoder chain on their own. For the sake of simplicity and to show how
to put a bridge in general I've kept this patch in this form, for the time
being.

This patch was added in v7.
---
 drivers/gpu/drm/drm_atomic_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..fcd9139ef98e9f57659b7e447cf57702e99a5165 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -455,6 +455,7 @@ mode_fixup(struct drm_atomic_state *state)
 		ret = drm_atomic_bridge_chain_check(bridge,
 						    new_crtc_state,
 						    new_conn_state);
+		drm_bridge_put(bridge);
 		if (ret) {
 			drm_dbg_atomic(encoder->dev, "Bridge atomic check failed\n");
 			return ret;
@@ -526,6 +527,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
 	bridge = drm_bridge_chain_get_first_bridge(encoder);
 	ret = drm_bridge_chain_mode_valid(bridge, &connector->display_info,
 					  mode);
+	drm_bridge_put(bridge);
 	if (ret != MODE_OK) {
 		drm_dbg_atomic(encoder->dev, "[BRIDGE] mode_valid() failed\n");
 		return ret;
@@ -1226,6 +1228,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 
 		drm_atomic_bridge_chain_post_disable(bridge, state);
+		drm_bridge_put(bridge);
 	}
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1433,6 +1436,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		drm_bridge_chain_mode_set(bridge, mode, adjusted_mode);
+		drm_bridge_put(bridge);
 	}
 }
 
@@ -1564,6 +1568,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 		}
 
 		drm_atomic_bridge_chain_enable(bridge, state);
+		drm_bridge_put(bridge);
 	}
 
 	drm_atomic_helper_commit_writebacks(dev, state);

-- 
2.48.1

