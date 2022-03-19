Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B94DEA5C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A971110EDA0;
	Sat, 19 Mar 2022 19:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468EE10F440
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 15:30:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qa43so22086292ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dc08fHOeIpp/zqKHKPZcsQKX+E5+zliKb0EU1qA1Tx0=;
 b=a0XVexLezO0KguYm2Gfx89Md+UTJ5XcGyrHziGo50UtYBe1RMkXoom7mQVaGQ4AnIh
 xmqbMIDW8dukxw9SqzZxiSLnGrHDBluesCZARoLd2EWtdgwfueJtF+hMz/K7topgPAaW
 y2ukizh4bt/CmR39I4daF0gw7R++8CZhrJaXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dc08fHOeIpp/zqKHKPZcsQKX+E5+zliKb0EU1qA1Tx0=;
 b=wj5oByK4QE9h3tNg9+TGl42VEYzVMbhK4Q0jmhTEdmTWX62T05s7QUu+daUMX7aA28
 BO9eSVFhJj5vV8UL/z9ObTElAOKhnqAEXiKr2DH92q5UTXJPm+Hp/dQwTfDLiZdvVpSp
 NwcvosYX8QO6+SdXAX4Qt5J0g0CwADO2rIR7p0OxP7umkV2J7Jj5zvsZNeL31l8P4StG
 dxYxsYF6InorHUk75SCQsHa+zh5XIHDqDiP0p+KnKJ2tq6nGH18pnc8PA9S28IJ1G34Y
 kGe5wBOa68sQOmUSmE9k0fQS/x/ZntjV6QMAj5X9+DF0s5x9jiIeSC3K0HyqvxibU8W4
 mHPw==
X-Gm-Message-State: AOAM530slcZS3ir45qU3QjAtqC3OQid1ss70mGTTijhRAjVzruswKqZ+
 ZFs/+XwLIkEPhAxjmxEQjinSAA==
X-Google-Smtp-Source: ABdhPJwOOO28ceZ/7wvRQA8Bm1LXeVE0UYFb7TsMzDUTb49VdJSJjlFg29DiZdhnqkwMa/NR6GasSQ==
X-Received: by 2002:a17:907:1690:b0:6db:325:3088 with SMTP id
 hc16-20020a170907169000b006db03253088mr13776392ejc.718.1647703847743; 
 Sat, 19 Mar 2022 08:30:47 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a50e08f000000b004134a121ed2sm5956000edl.82.2022.03.19.08.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 08:30:47 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Date: Sat, 19 Mar 2022 16:29:32 +0100
Message-Id: <20220319152932.995904-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The adv7511 driver is solely responsible for setting the physical
address of its CEC adapter. To do this, it must read the EDID. However,
EDID is only read when either the drm_bridge_funcs :: get_edid or
drm_connector_helper_funcs :: get_modes ops are called. Without loss of
generality, it cannot be assumed that these ops are called when a sink
gets attached. Therefore there exist scenarios in which the CEC physical
address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.

Address this problem by always fetching the EDID in the HPD work when we
detect a connection. The CEC physical address is set in the process.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---

Hi, I'm sending this as an RFC patch because:

- The added prototype is a bit crude, but I want feedback on the idea
  first before moving around a bunch of functions to avoid said
  prototype
- I'm not sure if the rationale stated above is correct. I am not very
  familiar with the drm subsystem so perhaps there is something obvious
  that I am missing. At any rate, this solved the issue of an inoperable
  CEC adapter when the downstream MIPI-DSI was not used.

I'm also wondering if this is robust enough to work when a sink just
pulses HPD to signal that its EDID has changed. Currently the hotplug
notifier is only invoked when the connected state changes (e.g. from
disconnected to connected), and so I only check the EDID in such
scenarios too. But is that always the case? Might we get an HPD
interrupt and the connectivity state remains the same?

Thanks in advance for any feedback.

---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 005bf18682ff..fb4ca277e4be 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -424,6 +424,9 @@ static bool adv7511_hpd(struct adv7511 *adv7511)
 	return false;
 }
 
+static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
+				     struct drm_connector *connector);
+
 static void adv7511_hpd_work(struct work_struct *work)
 {
 	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
@@ -457,6 +460,9 @@ static void adv7511_hpd_work(struct work_struct *work)
 		if (adv7511->connector.dev) {
 			if (status == connector_status_disconnected)
 				cec_phys_addr_invalidate(adv7511->cec_adap);
+			else
+				adv7511_get_edid(adv7511, &adv7511->connector);
+
 			drm_kms_helper_hotplug_event(adv7511->connector.dev);
 		} else {
 			drm_bridge_hpd_notify(&adv7511->bridge, status);
-- 
2.35.1

