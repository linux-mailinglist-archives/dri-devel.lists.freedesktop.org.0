Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2D3C8772
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 17:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4196E41B;
	Wed, 14 Jul 2021 15:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7176E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 15:29:16 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id j184so1938147qkd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4jCOWKK2r5jgZTbCUOYvMEXvZbDZSv0WVPwWg90rq8=;
 b=ACReAEi4qwPkaPSxn/LOSkJXIIiEkvgczkP9gFhZdzcFsT254w8PRzentIzeUQw+Dd
 HjWMDC/R5YSmfjgBgs5L78DR4AKrWwh9+7AwL0I4fEPpBTL8VzTWCy0Kb8gLx47FK7Fw
 cAxRJpDKm4eR9FeJ1XRJcSG2+1gl1FqBwBYqFGHBhCpQnkRvu2/F7+lLTYdh0QWRW835
 692Dxw9s7vk6gT0BcqTlxVWtcvM/VZxvtZ2GsuHc6PJi/df7C+mC1WLxCl+hnFwTi8dW
 7FKZtDYzxKYZDIinUvQ5Ub2csMUoczkBa+P1bwNHIX8KddETekE1k+ADf4TAbH6teaj7
 zbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4jCOWKK2r5jgZTbCUOYvMEXvZbDZSv0WVPwWg90rq8=;
 b=MUnmBxbY4vPVUV7Audcf3m7IiPL2Tv8S4r8zSKha9jzFXkSyXouC/t6gFgvUYZqYzv
 e1ByvJ2rF9Looh+3949UqBOp6Wd/zKO8U85kvl2Br5y0sbNWV2nRmwUK+pCLGzcD4G/F
 VGc+ww37JnnGvg2ftYalPp1nvaXt3atWiI3d8ehvqnL4/2t1wFMxq7y8oDFRsEkjNHQi
 k0qlzi8jgeICdbfCbTPxiyzMlwHXpdjbhcwAkrI70hDV5HcjS/3dlGVqSpeTc4+u9Ml3
 S+1kMUraYGoHWnSUdW/xJ2KLL2Aix9ymlJoWN1KIaOfCP4m6VEfeu7s5dXyajY5N3ig5
 xKjg==
X-Gm-Message-State: AOAM530quC2zUhn6UugietenIVp3BqO1k9Zi+tTyKFT1Cvt9SVaN7tzL
 Dl20FrX9LdRxc9BPMVZmuXF6NA==
X-Google-Smtp-Source: ABdhPJzk7N6e6/pcmg5UdDV7+6eO38VugrJou7wFvpBfR+nOkkRgMINXSGQQ83j13KQeouUh3evGZQ==
X-Received: by 2002:a05:620a:410f:: with SMTP id
 j15mr2552344qko.434.1626276555948; 
 Wed, 14 Jul 2021 08:29:15 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id y24sm1253295qkj.4.2021.07.14.08.29.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Jul 2021 08:29:15 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: Initialize dp->aux->drm_dev before registration
Date: Wed, 14 Jul 2021 11:28:56 -0400
Message-Id: <20210714152910.55093-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Avoids the following WARN:
[    3.009556] ------------[ cut here ]------------
[    3.014306] WARNING: CPU: 7 PID: 109 at
drivers/gpu/drm/drm_dp_helper.c:1796 drm_dp_aux_register+0xa4/0xac
[    3.024209] Modules linked in:
[    3.027351] CPU: 7 PID: 109 Comm: kworker/7:8 Not tainted 5.10.47 #69
[    3.033958] Hardware name: Google Lazor (rev1 - 2) (DT)
[    3.039323] Workqueue: events deferred_probe_work_func
[    3.044596] pstate: 60c00009 (nZCv daif +PAN +UAO -TCO BTYPE=--)
[    3.050761] pc : drm_dp_aux_register+0xa4/0xac
[    3.055329] lr : dp_aux_register+0x40/0x88
[    3.059538] sp : ffffffc010ad3920
[    3.062948] x29: ffffffc010ad3920 x28: ffffffa64196ac70
[    3.067239] mmc1: Command Queue Engine enabled
[    3.068406] x27: ffffffa64196ac68 x26: 0000000000000001
[    3.068407] x25: 0000000000000002 x24: 0000000000000060
[    3.068409] x23: ffffffa642ab3400 x22: ffffffe126c10e5b
[    3.068410] x21: ffffffa641dc3188 x20: ffffffa641963c10
[    3.068412] x19: ffffffa642aba910 x18: 00000000ffff0a00
[    3.068414] x17: 000000476f8e002a x16: 00000000000000b8
[    3.073008] mmc1: new HS400 Enhanced strobe MMC card at address 0001
[    3.078448] x15: ffffffffffffffff x14: ffffffffffffffff
[    3.078450] x13: 0000000000000030 x12: 0000000000000030
[    3.078452] x11: 0101010101010101 x10: ffffffe12647a914
[    3.078453] x9 : ffffffe12647a8cc x8 : 0000000000000000
[    3.084452] mmcblk1: mmc1:0001 DA4032 29.1 GiB
[    3.089372]
[    3.089372] x7 : 6c6064717372fefe x6 : ffffffa642b11494
[    3.089374] x5 : 0000000000000000 x4 : 6d006c657869ffff
[    3.089375] x3 : 000000006c657869 x2 : 000000000000000c
[    3.089376] x1 : ffffffe126c3ae3c x0 : ffffffa642aba910
[    3.089381] Call trace:
[    3.094931] mmcblk1boot0: mmc1:0001 DA4032 partition 1 4.00 MiB
[    3.100291]  drm_dp_aux_register+0xa4/0xac
[    3.100292]  dp_aux_register+0x40/0x88
[    3.100294]  dp_display_bind+0x64/0xcc
[    3.100295]  component_bind_all+0xdc/0x210
[    3.100298]  msm_drm_bind+0x1e8/0x5d4
[    3.100301]  try_to_bring_up_master+0x168/0x1b0
[    3.105861] mmcblk1boot1: mmc1:0001 DA4032 partition 2 4.00 MiB
[    3.112282]  __component_add+0xa0/0x158
[    3.112283]  component_add+0x1c/0x28
[    3.112284]  dp_display_probe+0x33c/0x380
[    3.112286]  platform_drv_probe+0x9c/0xbc
[    3.112287]  really_probe+0x140/0x35c
[    3.112289]  driver_probe_device+0x84/0xc0
[    3.112292]  __device_attach_driver+0x94/0xb0
[    3.117967] mmcblk1rpmb: mmc1:0001 DA4032 partition 3 16.0 MiB,
chardev (239:0)
[    3.123201]  bus_for_each_drv+0x8c/0xd8
[    3.123202]  __device_attach+0xc4/0x150
[    3.123204]  device_initial_probe+0x1c/0x28
[    3.123205]  bus_probe_device+0x3c/0x9c
[    3.123206]  deferred_probe_work_func+0x90/0xcc
[    3.123211]  process_one_work+0x218/0x3ec
[    3.131976]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    3.134123]  worker_thread+0x288/0x3e8
[    3.134124]  kthread+0x148/0x1b0
[    3.134127]  ret_from_fork+0x10/0x30
[    3.134128] ---[ end trace cfb9fce3f70f824d ]---

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..987f9e330138 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -219,6 +219,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
+	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
 	if (rc) {
 		DRM_ERROR("DRM DP AUX register failed\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

