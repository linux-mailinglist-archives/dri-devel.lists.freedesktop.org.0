Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8699FE56C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863F110E496;
	Mon, 30 Dec 2024 10:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hy9do3z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CDD10E100
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A69265C5968;
 Mon, 30 Dec 2024 10:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F2B9C4AF0C;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=jR2JMfJCmR1wfBbhPP6zy7q7nwwmkUtFCoBy/b3loG4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hy9do3z7Bl8sVIOKc0w5bCs+/9m1aIMHq1zyj3KdmtyssiEmPeG1HOHNj3ZmMmSeq
 JrwxpNWnK7N+jFCkF8V+xnaZHyUzjDnWq5iGV9UVZoxHs+684TRocVCEa8yWKC1pT5
 MvS0fZy57QCeuc8t+DCGlKOyt8ot6btX8ou8cOkKOliTRt/SPIaGZXwQfpMYQYmVlg
 ZdGmffJmzj01tBUoMqrqsEbOT8DMKMhkST7niNQzgPoNQLWFmnB9xAvu70T04sURUw
 ZARUo4YkllvkXmCJOusNYvz00FplGOQjkLtzaV7X2zABU4RvU5zTRbLYSDrOPor7Vm
 jXgF6UoI/C/gQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 84D6FE7718F;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Date: Mon, 30 Dec 2024 18:51:24 +0800
Subject: [PATCH RESEND v7 06/10] drm/bridge: it6505: fix HDCP encryption
 when R0 ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-v7-upstream-v7-6-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=1834;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=sT+HSufURG0ocwd8z5VQGG+kfKlsP8Ww3M5fRH8xXGg=;
 b=sYRm799dFZ0Wq/1SIzT8o5vkH5LBGxD54eUkCDUWhE4HSGmdo/TTr5B5xamJD9I/nE5F9e6Nc
 o2DBMczhmQeALauy8AYezAJrKtfLmhaLv7omKusdLJFhQ4XVktVs6ZP
X-Developer-Key: i=Hermes.wu@ite.corp-partner.google.com; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for
 Hermes.wu@ite.corp-partner.google.com/20241230 with auth_id=307
X-Original-From: Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
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
Reply-To: Hermes.wu@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

When starting HDCP authentication, HDCP encryption should be enabled
when R0'is checked.

Change encryption enables time at R0' ready.
The hardware HDCP engine trigger is changed and the repeater KSV fails
will restart HDCP.

Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 760eab0b868874f96ccd4d5ec3e2f2d4ffb1e41c..614fbb6295237708aa5b692de87ab5548c499da5 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2092,15 +2092,12 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 	ksv_list_check = it6505_hdcp_part2_ksvlist_check(it6505);
 	DRM_DEV_DEBUG_DRIVER(dev, "ksv list ready, ksv list check %s",
 			     ksv_list_check ? "pass" : "fail");
-	if (ksv_list_check) {
-		it6505_set_bits(it6505, REG_HDCP_TRIGGER,
-				HDCP_TRIGGER_KSV_DONE, HDCP_TRIGGER_KSV_DONE);
+
+	if (ksv_list_check)
 		return;
-	}
+
 timeout:
-	it6505_set_bits(it6505, REG_HDCP_TRIGGER,
-			HDCP_TRIGGER_KSV_DONE | HDCP_TRIGGER_KSV_FAIL,
-			HDCP_TRIGGER_KSV_DONE | HDCP_TRIGGER_KSV_FAIL);
+	it6505_start_hdcp(it6505);
 }
 
 static void it6505_hdcp_work(struct work_struct *work)
@@ -2473,7 +2470,11 @@ static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
 {
 	struct device *dev = it6505->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "HDCP event Interrupt");
+	DRM_DEV_DEBUG_DRIVER(dev, "HDCP repeater R0 event Interrupt");
+	/* 1B01 HDCP encription should start when R0 is ready*/
+	it6505_set_bits(it6505, REG_HDCP_TRIGGER,
+			HDCP_TRIGGER_KSV_DONE, HDCP_TRIGGER_KSV_DONE);
+
 	schedule_work(&it6505->hdcp_wait_ksv_list);
 }
 

-- 
2.34.1


