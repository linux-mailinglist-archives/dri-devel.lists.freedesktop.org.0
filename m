Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE419C3E83
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB7C10E4A4;
	Mon, 11 Nov 2024 12:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LDGfpUG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2C710E4A2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:36:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BBA01BF209;
 Mon, 11 Nov 2024 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731328589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW3wdr4EeYIZ0MLaRPPuH3cK65j246cHF8/ZPxNc2Bo=;
 b=LDGfpUG3r6SAvyB0iHpIkXFrP9CQ12QOeFNpf5UcYXU+t6/9WL1alKBVgF+NqLVOzt5HkI
 RJGaFAVgeOIrLylJ7JwiznbRhkMNuvvocphw1ONk+1dThmEvpatSqBARiAb25/GwZ4a1GR
 YrfybiCo/WwijUlYAx1GtV9kqRV5SKTESGb8JvTzm0iKsz8DKnl6/1rfwc3+I+zI7XgXfl
 I7Qo4HPnnGUrvbtY96L33pXfpABVFDglcVRP4l1bm7I8061+PnNU4oo6E//UVFw9KhHZpN
 0PwWzNw0s3X0htqCFXO6GvAL7MY/qW08qiShxEX04p93lqO2wA0c1TyWBsKdkg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 Nov 2024 13:36:23 +0100
Subject: [PATCH v3 4/4] drm/connector: warn when cleaning up a refcounted
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-drm-small-improvements-v3-4-a9f576111b41@bootlin.com>
References: <20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com>
In-Reply-To: <20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
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

Calling drm_connector_cleanup() should only be done via the free_cb =>
.destroy path, which cleans up the struct drm_connector only when the
refcount drops to zero.

A cleanup done with a refcount higher than 0 can result from buggy code,
e.g. by doing cleanup directly in the drivers teardown code. Serious
trouble can happen if this happens, so warn about it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..e0bf9c490af43055de4caaee1580a4befbd608c5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -624,6 +624,12 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *t;
 
+	/*
+	 * Cleanup must happen when the last ref is put, via the
+	 * drm_connector_free() callback.
+	 */
+	WARN_ON(drm_mode_object_read_refcount(&connector->base) != 0);
+
 	/* The connector should have been removed from userspace long before
 	 * it is finally destroyed.
 	 */

-- 
2.34.1

