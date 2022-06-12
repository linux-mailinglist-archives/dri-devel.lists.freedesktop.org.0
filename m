Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05A54810A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A682110EC1A;
	Mon, 13 Jun 2022 08:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1510E9EE
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 14:49:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id o7so6622499eja.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc9EKbluzjQbPf5iJBQyy57Za56oj94XsJi9//DUTBs=;
 b=QAe6zVMMuPfsOQVPhxjW7XQINSyvokcP1UXdDMRe3lQrtwNAX48p8aTaJq+fVtUi2W
 tdKGv1ukA3ximfBZb+wbyixuIibc+PNndOgm0dQmTnezjVki/HaSY3bW2E63Ce9htt6q
 OyI2DQuX5UQ6ukHBMmmH6YcQHHH2f0dbWFjOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc9EKbluzjQbPf5iJBQyy57Za56oj94XsJi9//DUTBs=;
 b=3Z+7P49DG+y4bwQUQcUkD7xmT8uravy348ZMu8P12zGmBVBV0XIIbM9AqGSAebBTwT
 EEpUqySiLfWu7PU1XQZ5UqhegkaqwknucgKpVDBCR6lyud0fUYlafiodoAd/+SdZk0Cp
 Q0mn7Cwij+XKu2IrobgF1CJA546bbBJkTbpmsxE3hb1g5ZPjAd0XVHA4pTDUv4qq4c17
 N0LuBh1IfOMbCxwZhA9MaaiA+Eo0dBD9OV0jkPzkAOoyHQvLgSoNAeFKDQZ0/Vx8DRQ6
 IKNdSO1ewptJkOueRo9jM/p7NZkPwmoc3r7XTdi5XLSWJXr/ZTcRAAp50ZCRpZF72hzC
 UaOg==
X-Gm-Message-State: AOAM5302/dCNf6rZVP1eS0XdUcgo3S2+N/Fr4Yl0X/HABebsRBqazHBA
 foe+1x53aqlesmXtSeLOT2+m/Q==
X-Google-Smtp-Source: ABdhPJyvv3bZy0x8EdZVGn713v6ewfo8zGpqATwhEb2GGbMj9l6HERl46xAPhCd2QbNHUwuDFardFg==
X-Received: by 2002:a17:907:da2:b0:711:f408:f098 with SMTP id
 go34-20020a1709070da200b00711f408f098mr20945715ejc.208.1655045357616; 
 Sun, 12 Jun 2022 07:49:17 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a0564020c9400b004316f94ec4esm3257076edb.66.2022.06.12.07.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 07:49:17 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH RESEND 2/2] drm: bridge: adv7511: unregister cec i2c device
 after cec adapter
Date: Sun, 12 Jun 2022 16:48:54 +0200
Message-Id: <20220612144854.2223873-3-alvin@pqrs.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612144854.2223873-1-alvin@pqrs.dk>
References: <20220612144854.2223873-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Jun 2022 08:00:14 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

cec_unregister_adapter() assumes that the underlying adapter ops are
callable. For example, if the CEC adapter currently has a valid physical
address, then the unregistration procedure will invalidate the physical
address by setting it to f.f.f.f. Whence the following kernel oops
observed after removing the adv7511 module:

    Unable to handle kernel execution of user memory at virtual address 0000000000000000
    Internal error: Oops: 86000004 [#1] PREEMPT_RT SMP
    Call trace:
     0x0
     adv7511_cec_adap_log_addr+0x1ac/0x1c8 [adv7511]
     cec_adap_unconfigure+0x44/0x90 [cec]
     __cec_s_phys_addr.part.0+0x68/0x230 [cec]
     __cec_s_phys_addr+0x40/0x50 [cec]
     cec_unregister_adapter+0xb4/0x118 [cec]
     adv7511_remove+0x60/0x90 [adv7511]
     i2c_device_remove+0x34/0xe0
     device_release_driver_internal+0x114/0x1f0
     driver_detach+0x54/0xe0
     bus_remove_driver+0x60/0xd8
     driver_unregister+0x34/0x60
     i2c_del_driver+0x2c/0x68
     adv7511_exit+0x1c/0x67c [adv7511]
     __arm64_sys_delete_module+0x154/0x288
     invoke_syscall+0x48/0x100
     el0_svc_common.constprop.0+0x48/0xe8
     do_el0_svc+0x28/0x88
     el0_svc+0x1c/0x50
     el0t_64_sync_handler+0xa8/0xb0
     el0t_64_sync+0x15c/0x160
    Code: bad PC value
    ---[ end trace 0000000000000000 ]---

Protect against this scenario by unregistering i2c_cec after
unregistering the CEC adapter. Duly disable the CEC clock afterwards
too.

Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 5bb9300040dd..023c0ad132e0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1339,9 +1339,6 @@ static int adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	i2c_unregister_device(adv7511->i2c_cec);
-	clk_disable_unprepare(adv7511->cec_clk);
-
 	adv7511_uninit_regulators(adv7511);
 
 	drm_bridge_remove(&adv7511->bridge);
@@ -1349,6 +1346,8 @@ static int adv7511_remove(struct i2c_client *i2c)
 	adv7511_audio_exit(adv7511);
 
 	cec_unregister_adapter(adv7511->cec_adap);
+	i2c_unregister_device(adv7511->i2c_cec);
+	clk_disable_unprepare(adv7511->cec_clk);
 
 	i2c_unregister_device(adv7511->i2c_packet);
 	i2c_unregister_device(adv7511->i2c_edid);
-- 
2.36.1

