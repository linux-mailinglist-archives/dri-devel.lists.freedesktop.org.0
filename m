Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD2ABA102
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1613C10EB27;
	Fri, 16 May 2025 16:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RNSQfC13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2711910EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:48:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47127439BF;
 Fri, 16 May 2025 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747414123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnnSP8emWWczjXdhIVZKO3SpECVp47VYoxSTdeFsaMA=;
 b=RNSQfC13EHpHlLF5OTLrcVNSVg+iXrF/o1ABqCBCU2/viuS1dmupvKSYEcIeYxO0UuURDR
 bIDnAhXcDYhXFAC6cMG6xuGaKVu+Mke6U1esq4L5ivJW/2f7yVxI8CPNnXybg/GJyOpkJJ
 PyO+NdnRHzEEbuvROQigihlLVsMN9mskD3lujE2lX0XBSvtu5IOgT2pgax+aQoYihwuOXQ
 CXaGC+vwmJZmWzI/BsHjX/AjMoYD8gYqAxQlJu/tvyMQMJOixkvsrqgLGntMq6Ga+IhT6k
 N4UahVuxd23NQxEYYX6QMv2drB24VlPGib/J82mr5CRXq32yCk8FA1DXNwQ9nQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 May 2025 18:48:38 +0200
Subject: [PATCH v8 2/3] dmr/bridge: add a .destroy func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehjefgudegvddukeegvedtgfduudehtdfgteefvefgheekjeehvdeihfdtfffhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhop
 hdrohhrghdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
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
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch is new in v8. The .destroy callback had appeared in v5 as well
[5], but as part of a larger patch and for different reason that do not
apply anymore.

[5] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com/#t
---
 drivers/gpu/drm/drm_bridge.c |  2 ++
 include/drm/drm_bridge.h     | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264f0912c09c205fb467975dee 100644
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
index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c2ed1166f398eca27b464261 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -86,6 +86,16 @@ struct drm_bridge_funcs {
 	 */
 	void (*detach)(struct drm_bridge *bridge);
 
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
 	 * @mode_valid:
 	 *

-- 
2.49.0

