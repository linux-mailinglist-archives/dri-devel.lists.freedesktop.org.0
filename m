Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BCE85AD07
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7600F10E22A;
	Mon, 19 Feb 2024 20:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.b="vJuDBtbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214910E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 20:21:58 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
 t=1708374116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kp0URhMfvWbpdkL0k/GUMkRRGYQFzEpfZ2mEHZ+rImI=;
 b=vJuDBtbJv9vc8nkDV5W8HkNi/RotiChvYxU+iCCH//5OXnSXXFLGWEXjMo12APQduibzSs
 pUJdHP+aXrcsFVW2MF32O6dUnXcUTI1zU7ssWLM89GcKv7C0jPVonulxbEXvdinALRv0hY
 4Op3EwWKB+DhT+hzTdwpTGpcq5xWkAZlzx//r9qtE5pHaHr2IuNBjUzRO4MzQHOMbWUm0r
 qXjuh9Ycf+HOkXCYUSvPM4djzYi6V3x4wcIOFwTp9BuXQgsnVyPDDC9tp12sOPVJbimF34
 Ll5Bod0/JPiQvSviwcq0oUqdrNuMgKoyY98BOTSXDoTasebmIcyAPiKEEBm17A==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Mon, 19 Feb 2024 21:21:47 +0100
Subject: [PATCH v2] drm/bridge: adv7511: fix crash on irq during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240219-adv7511-cec-irq-crash-fix-v2-1-245e53c4b96f@bang-olufsen.dk>
X-B4-Tracking: v=1; b=H4sIAFq402UC/42OSw7CMAxEr1J5jVHdlH5YcQ/URUgcaoHakkAEq
 nJ3Qk/A8o00b2aFwF44wLFYwXOUIPOUodoVYEY9XRnFZoaqrBSVVKO2sT0QoWGD4h9ovA4jOnl
 j46zty15Z02rI/cVzjjf3ecg8SnjO/rNNRfql/1gjIaFSXV93jelUq06XfAvn+8sFnvb2BkNK6
 Qs4CESPyAAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mads Bligaard Nielsen <bli@bang-olufsen.dk>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT
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

From: Mads Bligaard Nielsen <bli@bang-olufsen.dk>

Moved IRQ registration down to end of adv7511_probe().

If an IRQ already is pending during adv7511_probe
(before adv7511_cec_init) then cec_received_msg_ts
could crash using uninitialized data:

    Unable to handle kernel read from unreadable memory at virtual address 00000000000003d5
    Internal error: Oops: 96000004 [#1] PREEMPT_RT SMP
    Call trace:
     cec_received_msg_ts+0x48/0x990 [cec]
     adv7511_cec_irq_process+0x1cc/0x308 [adv7511]
     adv7511_irq_process+0xd8/0x120 [adv7511]
     adv7511_irq_handler+0x1c/0x30 [adv7511]
     irq_thread_fn+0x30/0xa0
     irq_thread+0x14c/0x238
     kthread+0x190/0x1a8

Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
Signed-off-by: Mads Bligaard Nielsen <bli@bang-olufsen.dk>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
Changes in v2:
- rebase on latest drm-misc-fixes
- no other changes
- RESEND
- Link to v1: https://lore.kernel.org/r/20231014-adv7511-cec-irq-crash-fix-v1-1-3389486c8373@bang-olufsen.dk
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8be235144f6d..6fc292393c67 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1277,17 +1277,6 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
 
-	if (i2c->irq) {
-		init_waitqueue_head(&adv7511->wq);
-
-		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
-						adv7511_irq_handler,
-						IRQF_ONESHOT, dev_name(dev),
-						adv7511);
-		if (ret)
-			goto err_unregister_cec;
-	}
-
 	adv7511_power_off(adv7511);
 
 	i2c_set_clientdata(i2c, adv7511);
@@ -1311,6 +1300,17 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511_audio_init(dev, adv7511);
 
+	if (i2c->irq) {
+		init_waitqueue_head(&adv7511->wq);
+
+		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
+						adv7511_irq_handler,
+						IRQF_ONESHOT, dev_name(dev),
+						adv7511);
+		if (ret)
+			goto err_unregister_audio;
+	}
+
 	if (adv7511->info->has_dsi) {
 		ret = adv7533_attach_dsi(adv7511);
 		if (ret)

---
base-commit: 335126937753844d36036984e96a8f343538a778
change-id: 20231014-adv7511-cec-irq-crash-fix-6fdd9093dc7a

