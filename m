Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CFA775B0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DC810E08B;
	Tue,  1 Apr 2025 07:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tXZak33d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83CA10E08B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:54:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CFC72A44123;
 Tue,  1 Apr 2025 07:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C035C4CEE9;
 Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743494050;
 bh=y9xM5x/9mDBXXIijOs8N9ZcgaLGefpK4A6S03ho3yEw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tXZak33dv2XlvqQjHjZNNfZqHCkygoFPVfCPH/d9+FfWqRP0eoglC0P7ivfWIQHiz
 /y7Jd1Agckv9+cpOuskmGrA+m7hL7kOHFCHbziGv6tTqwE+6Fkf0Ce0G4wxzD1ECUc
 p+gNQeurt9iX1zRI8CmZJUvfmUorYxEMIjjDSs01iDvzu906vqOcJEP7eo5IcL1mhb
 E3DNtxEz7eGJpe1jucfufz1iZzF1grGLTd43zjJUQEohdFT2BVLx4OSliAggBnchGl
 eOoZSGX1CcrGeJCS5eqBVLwJcKdKtNHwQ9cHqUl1vFAQrhsjcHz974hrtvcKMxkC5g
 EfdKWqADPk++g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2E5C36014;
 Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 01 Apr 2025 15:54:57 +0800
Subject: [PATCH v3 3/5] drm/bridge: it6505: modify DP link auto training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-fix-link-training-v3-3-7f60f2ab7b8c@ite.com.tw>
References: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
In-Reply-To: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743494115; l=2426;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=w0mjd1b/vD9l754Z7HEk7/mi9+TqCrQ9as279Ea9bf8=;
 b=+cLnmpKZvWnSs9nFSmMV3fSWd/NXpkMJSeeIgIE2+UcyeS8EhXzDTIWjwJTPJGmOt2XHyMZDw
 v4qlN1oPJnmCT5mrLTlbPUFcXYrkbweSP3VPKSWzUCfHJuxnaidBVMj
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

IT6505 supports HW link training which will write DPCD and check
training status automatically.

In the case that driver set link rate at 2.7G and HW fail to training,
it will change link configuration and try 1.65G. And this will cause
INT_VID_FIFO_ERROR triggered when link clock is changed.

When video error occurs, video logic is reset and link training restart,
this will cause endless auto link training.

Modify link auto training with disable INT_VID_FIFO_ERROR to avoid loop
and check INT_LINK_TRAIN_FAIL event to abort wait training done.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7f6227c278a51358c70a3de93454aafeef64f2bb..f9b99c70789eea6beb3c6513155c9a4ca103d219 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1806,6 +1806,13 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 	struct device *dev = it6505->dev;
 
 	mutex_lock(&it6505->aux_lock);
+
+	/* Disable FIFO error interrupt trigger  */
+	/* to prevent training fail loop issue   */
+	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
+
+	it6505_write(it6505, INT_STATUS_03,
+		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
 			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
 	/* reset link state machine and re start training*/
@@ -1818,8 +1825,10 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
 		int03 = it6505_read(it6505, INT_STATUS_03);
 		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
+			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
 			it6505_write(it6505, INT_STATUS_03,
-				     BIT(INT_LINK_TRAIN_FAIL));
+				     BIT(INT_LINK_TRAIN_FAIL) |
+				     BIT(INT_VID_FIFO_ERROR));
 
 			DRM_DEV_DEBUG_DRIVER(dev,
 					     "INT_LINK_TRAIN_FAIL(%x)!",
@@ -1837,6 +1846,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 		timeout--;
 	}
 unlock:
+	/* recover interrupt trigger*/
+	it6505_set_bits(it6505, INT_MASK_03,
+			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
 	mutex_unlock(&it6505->aux_lock);
 
 	return state;

-- 
2.34.1


