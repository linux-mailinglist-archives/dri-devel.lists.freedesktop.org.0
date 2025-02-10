Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5AA2EDAD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9104710E531;
	Mon, 10 Feb 2025 13:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Et9Uc8iG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C38F10E531
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:26:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BE9601F764;
 Mon, 10 Feb 2025 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739193988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33LQhdC4EtUzHstXwYyecFzMe0YnKNYXRGd/yoLLDLc=;
 b=Et9Uc8iGuYnjDbERVWUIMesDgpMzxmvcmt7Hz1vpFTGDvkKM5cP7Uhk1hwUjSMrZmUth/D
 O6w5MYQuSem9OC672tHNpzh3P6VkjJEKHdbpa3b4i03qntvYLpcq1IzAbqvswDQ/qKaMjN
 TOcR6hJhgJ69Lrci521b4NPjJwnRFvgvsANcqoFC723h9NC8Y4zT6R05OSVh9U3MM2Mu3k
 nXzCWeamtqFXQR8oiqZFYeEHxjpTuX53uKNl+eujnMrKouDf6+oiTZvazp7J/wXKQ3iYHY
 Ohg9NqYJV2ckJe48bn3AV63DtEB+ASjrXBM8AEIO5Czak7rc5Int3N+U0XKWXA==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Date: Mon, 10 Feb 2025 14:26:17 +0100
Message-ID: <20250210132620.42263-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210132620.42263-1-herve.codina@bootlin.com>
References: <20250210132620.42263-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdejpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtr
 dhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.

This resets all active components available between the CRTC and
connectors.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..0a636c398578 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3362,6 +3362,47 @@ int drm_atomic_helper_disable_all(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_disable_all);
 
+/**
+ * drm_atomic_helper_reset_crtc - reset the active outputs of a CRTC
+ * @crtc: DRM CRTC
+ * @ctx: lock acquisition context
+ *
+ * Reset the active outputs by indicating that connectors have changed.
+ * This implies a reset of all active components available between the CRTC and
+ * connectors.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
+				 struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_atomic_state_alloc(crtc->dev);
+	if (!state)
+		return -ENOMEM;
+
+	state->acquire_ctx = ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto out;
+	}
+
+	crtc_state->connectors_changed = true;
+
+	ret = drm_atomic_commit(state);
+out:
+	drm_atomic_state_put(state);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
+
 /**
  * drm_atomic_helper_shutdown - shutdown all CRTC
  * @dev: DRM device
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 9aa0a05aa072..53382fe93537 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -139,6 +139,8 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 
 int drm_atomic_helper_disable_all(struct drm_device *dev,
 				  struct drm_modeset_acquire_ctx *ctx);
+int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
+				 struct drm_modeset_acquire_ctx *ctx);
 void drm_atomic_helper_shutdown(struct drm_device *dev);
 struct drm_atomic_state *
 drm_atomic_helper_duplicate_state(struct drm_device *dev,
-- 
2.48.1

