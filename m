Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5407C6019
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 00:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13CF10E205;
	Wed, 11 Oct 2023 22:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A8F10E205
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 22:00:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50567477b29so448369e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697061603; x=1697666403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6dnOwyLkeu2poleUggkw2VTOJ6asuAXQcOkA3t8XKg0=;
 b=NwZtROgjGSowEg15Hu8QhuhYquIqYKtU4VV479vtHWdh8xPdpSwGJeWkbONgp8aV9R
 JbpTOAZvWYUd2G8Qnu6i432cApPdBM3i1FnmpIofkdAgM7wbVjXVvVYu43n7OE3BpPwi
 d9RioOsz2jmYKNJTyhyttzBr/NB3Bqkce4dNBr9fdA5TiQDra5oimbE3uBfn3cz2AE7N
 q7DsGajY+3JdK0y/oQe5trQCjxnXWzll2AuwcoMxSz2G9tlYuDt/YB9VzMH9K1DNJzDe
 fztKGuKNQATkOakiHVc5Sgaumsd0WamjcQlxSimmUgnKjFY4dbOt4/rgHIYy6v8gNdVY
 Yz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697061603; x=1697666403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6dnOwyLkeu2poleUggkw2VTOJ6asuAXQcOkA3t8XKg0=;
 b=FudaOWQMoj2OZBONsPeAnzOdIqSIj2x71VZ2TDkdD37ysNYZNphx/lUxoTfk0Br1C+
 1IjqPFvGK95qIOkitp57uya5qqRXbzDMfnBGoBfFb18GFIpx5baZGgRORcfPdqOpLdqd
 dyaA59RCptDHJUkMBJWhCdA+lqa9ZX5jhaGTamL152dOt5QUWy5KC5VX8KWNvEovzYUT
 +ZP6SU2ijapKsLEEbkPcLzfLEdvG/vu2gCxffvLrBdmkM32gRUJ/09x1HJNde42xHEQi
 h6JgJdPe1gFvREwB0ts8un/KjiKgDVfwklmKq5PdsSyW+nrP3d5wKWWV1dscCv9dm0G0
 UZxg==
X-Gm-Message-State: AOJu0YyvcyEa3MKB9IloWkrSfsni+UOUnL8KiBK8oQV1aGg4M4T2DmBe
 3faAehs8c1p635bUPBZR9XdlczTB2xLtofR4eL0=
X-Google-Smtp-Source: AGHT+IF/kXNPyNqyu2vPC5qLpcYMwT3qAa/akcYT73kRn3qd6eUvszcXinR7fcSIFXWGYFvfd5mowg==
X-Received: by 2002:a05:6512:128a:b0:503:3278:3221 with SMTP id
 u10-20020a056512128a00b0050332783221mr23787913lfs.69.1697061603349; 
 Wed, 11 Oct 2023 15:00:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a14-20020ac2520e000000b00502b04e2722sm2461092lfl.3.2023.10.11.15.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 15:00:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: lt9611uxc: fix the race in the error path
Date: Thu, 12 Oct 2023 01:00:02 +0300
Message-Id: <20231011220002.382422-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If DSI host attachment fails, the LT9611UXC driver will remove the
bridge without ensuring that there is no outstanding HPD work being
done. In rare cases this can result in the warnings regarding the mutex
being incorrect. Fix this by forcebly freing IRQ and flushing the work.

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:582 __mutex_lock+0x468/0x77c
Modules linked in:
CPU: 0 PID: 10 Comm: kworker/0:1 Tainted: G     U             6.6.0-rc5-next-20231011-gd81f81c2b682-dirty #1206
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events lt9611uxc_hpd_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __mutex_lock+0x468/0x77c
lr : __mutex_lock+0x468/0x77c
sp : ffff8000800a3c70
x29: ffff8000800a3c70 x28: 0000000000000000 x27: ffffd595fe333000
x26: ffff7c2f0002c005 x25: ffffd595ff1b3000 x24: ffffd595fccda5a0
x23: 0000000000000000 x22: 0000000000000002 x21: ffff7c2f056d91c8
x20: 0000000000000000 x19: ffff7c2f056d91c8 x18: fffffffffffe8db0
x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
x14: 000000000006efb8 x13: 0000000000000000 x12: 0000000000000037
x11: 0000000000000001 x10: 0000000000001470 x9 : ffff8000800a3ae0
x8 : ffff7c2f0027f8d0 x7 : ffff7c2f0027e400 x6 : ffffd595fc702b54
x5 : 0000000000000000 x4 : ffff8000800a0000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7c2f0027e400
Call trace:
 __mutex_lock+0x468/0x77c
 mutex_lock_nested+0x24/0x30
 drm_bridge_hpd_notify+0x2c/0x5c
 lt9611uxc_hpd_work+0x6c/0x80
 process_one_work+0x1ec/0x51c
 worker_thread+0x1ec/0x3e4
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20
irq event stamp: 15799
hardirqs last  enabled at (15799): [<ffffd595fc702ba4>] finish_task_switch.isra.0+0xa8/0x278
hardirqs last disabled at (15798): [<ffffd595fd5a1580>] __schedule+0x7b8/0xbd8
softirqs last  enabled at (15794): [<ffffd595fc690698>] __do_softirq+0x498/0x4e0
softirqs last disabled at (15771): [<ffffd595fc69615c>] ____do_softirq+0x10/0x1c

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 7835738a532e..e971b75e90ad 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -929,9 +929,9 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,
-					lt9611uxc_irq_thread_handler,
-					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+	ret = request_threaded_irq(client->irq, NULL,
+				   lt9611uxc_irq_thread_handler,
+				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		goto err_disable_regulators;
@@ -967,6 +967,8 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	return lt9611uxc_audio_init(dev, lt9611uxc);
 
 err_remove_bridge:
+	free_irq(client->irq, lt9611uxc);
+	cancel_work_sync(&lt9611uxc->work);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 err_disable_regulators:
@@ -983,7 +985,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
 {
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
-	disable_irq(client->irq);
+	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
-- 
2.39.2

