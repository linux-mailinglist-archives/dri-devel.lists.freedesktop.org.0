Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EAACFE77
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022510E9B3;
	Fri,  6 Jun 2025 08:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ecdgv+ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9178D10E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F517432F6;
 Fri,  6 Jun 2025 08:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749199314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7gkpeD02m42+Q8lo9vTdVvKSU1AoFKlmD/QgXdBYsg=;
 b=ecdgv+ikCDahE6D4S7NyPFR/ttLSmH+B91yJFjdrSgrx26x7nEOM+OzC98EOcsGySK3/BO
 vSy3Jqd35x/Je6IaDOaRoIu02DZgcsagwAe4kaX7fMq9ssxIbARbZfHHTZV1K63y5Epwhx
 YQytrgZu7aY6yJUVhNAt7PtyMajBR372xhwYTLb3RPZEfOAzLgqMsUNsHwYRtd/6sRlkqC
 X5czCxs1vOXS49+N8gm3PrMUZHqZfNDzDxCp7L4Ec0mx7P3LJ9wGWR/ZVdKy+YGjnSmSAi
 Fp4aRRCNeDvvqZViox1omO1paE+g3Sr6hKcYcwbWn3RjU6ejUY8Ht+BDOVEo7w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 06 Jun 2025 10:41:20 +0200
Subject: [PATCH v9 2/3] drm/bridge: add a .destroy func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-drm-bridge-alloc-doc-test-v9-2-b5bf7b43ed92@bootlin.com>
References: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
In-Reply-To: <20250606-drm-bridge-alloc-doc-test-v9-0-b5bf7b43ed92@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehjefgudegvddukeegvedtgfduudehtdfgteefvefgheekjeehvdeihfdtfffhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeefjedrudeivddruddvfedrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfeejrdduiedvrdduvdefrdehvddphhgvlhhopegludelvddrudeikedrvdehvddrvdefhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepl
 hhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
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

Some users of DRM bridges may need to execute specific code just before
deallocation.

As of now the only known user would be KUnit tests.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9:
- move .destroy before .detach in struct drm_bridge_funcs declaration for
  alphabetic ordering
- Add Maxime's Acked-by
- Fix typo in commit message

This patch was added in v8. The .destroy callback had appeared in v5 as
well [5], but as part of a larger patch and for different reasons that do
not apply anymore.

[5] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com/#t
---
 drivers/gpu/drm/drm_bridge.c |  2 ++
 include/drm/drm_bridge.h     | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d0e81639927a73422671b7b43f3e8a946f1d4300..bf34cc5ab0316889186ddf5ebb3a984b09eeb86c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kref)
 {
 	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
 
+	if (bridge->funcs->destroy)
+		bridge->funcs->destroy(bridge);
 	kfree(bridge->container);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0af5db244db8580ea0c9af1d9a373b7bf62ee699..dbd6503f33ba917fbcfb73b985d9c34910f04e0f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -77,6 +77,16 @@ struct drm_bridge_funcs {
 	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encoder,
 		      enum drm_bridge_attach_flags flags);
 
+	/**
+	 * @destroy:
+	 *
+	 * This callback is invoked when the bridge is about to be
+	 * deallocated.
+	 *
+	 * The @destroy callback is optional.
+	 */
+	void (*destroy)(struct drm_bridge *bridge);
+
 	/**
 	 * @detach:
 	 *

-- 
2.49.0

