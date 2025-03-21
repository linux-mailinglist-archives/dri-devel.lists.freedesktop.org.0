Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200BA6C3EA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57810E836;
	Fri, 21 Mar 2025 20:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="dbkJVkNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3EE10E832
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:07:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7E5D101E8FE7; Fri, 21 Mar 2025 21:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587635; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=O8iECVKqUngmbLKesdAXdxuc21AF1mv3PVk149t7akU=;
 b=dbkJVkNrAiPA1y2flaykkwgNtX4AnewryWHqt5l/Jmoaw6Rwx0rMnsDXHOlEHmWHlDHHlQ
 kA1TiweR3QTmtoSMyfYo5B/pghhZnm24wn/bT/5ogob2FiFAQL8uVlT47avHBNP1PsaS9H
 v6UhNwzQ+eBXsTb+H3TigCcr/jK7g/cuXzb7lCrVnT8AHQdC4S5Wrd7aaqbO9hVv2bLsab
 QNJyixNjnHnTHfuBzNEYcItV0h+7tVXaELiv38kwsvH9Gya72u07w6MQAK9BpHYa2GfNdQ
 IsU7AlUuBi0Rg5eYyPQ7clJYJPC1iXpQik3JyOMyGDjyZG3SwQGgPgn8QFahtw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: [PATCH v2 6/9] drm/panthor: Reset GPU after L2 cache power off
Date: Fri, 21 Mar 2025 21:05:56 +0100
Message-ID: <20250321200625.132494-7-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
from runtime PM suspend. Without this, if only the L2 is powered down
on RPM entry, the GPU gets stuck and does not indicate the firmware is
booted after RPM resume.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: No change
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afaa..0f07ef7d9aea7 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
  */
 void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
-	/* On a fast reset, simply power down the L2. */
-	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
-	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+	/*
+	 * Power off the L2 and soft reset the GPU, that makes
+	 * iMX95 Mali G310 resume without firmware boot timeout.
+	 */
+	panthor_gpu_power_off(ptdev, L2, 1, 20000);
+	panthor_gpu_soft_reset(ptdev);
 
 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
-- 
2.47.2

