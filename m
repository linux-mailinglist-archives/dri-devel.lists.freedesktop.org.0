Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9AA4FA1C1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F104210E240;
	Sat,  9 Apr 2022 02:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147DE10E209
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:15 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so6908006pja.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GRUl59HS+3kIJaHkhNRsC+uDBDA3ykeO3cGjaLdlqT4=;
 b=CauMoP36hw/My6kTj0xHbH3I/vgeGoE5r6qOsDM1oBALiaD5VgEqwKzw3bc5b1e6xv
 xsBdzDpI5v56V2lc31/4fXcJ5iSKsi5n/sZDErwdJ+Dlgnkua6nKFC+riYU8jXpNfuI6
 njExO59mFknKxVM1+EcREmTxf9rf5f6RtRVJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GRUl59HS+3kIJaHkhNRsC+uDBDA3ykeO3cGjaLdlqT4=;
 b=wQzrS/hlLHSZWPZGx8kIup+Ztf/FwjegDEY/DiGGIuvJkm+rMSf0f1P+BxZm70rupL
 wGDOQOLxVK26ZwaTuPoA0piqGonr1RwP8JEuHoV1DlY605Z/M5qaSDdH2seLO943rQKV
 bV+FuL5+BYY4eKXTjpAh2/Z5xnuXT0xlq2l9jC8cfVWB63bH9m1UTJp/TWQtKJaJUgm5
 jSEl7fC4K5k3uCMHxGNc7sLcsQsWrTS29aC1XbLfHFecMWvYKkLef2b3FIewQkJbsB0w
 4Fq3s57wWPpzkgVrVOzI8hAqNBM6OW30z17FBXHFhWRykby7aln2+nyoKvqg+ipJjo0V
 ReLQ==
X-Gm-Message-State: AOAM532esFUaDl4va+F0CEY/xNjZXb/SqOaSZmYIL2bsjIchPqWV9HgI
 F04sh7/plaZhpAYBWs+hguLhPKPlzcJ1YZK3gIpk6g==
X-Google-Smtp-Source: ABdhPJxZ7Pqlo45QY22NAolHTEUTLzi46MpCGEQydMm3iAjUaV6osMVmGoBxIwb2Ikn3JQsXaigMug==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id
 l6-20020a170903120600b001517d672924mr21812991plh.45.1649471834502; 
 Fri, 08 Apr 2022 19:37:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 6/6] drm/bridge: parade-ps8640: Provide is_hpd_asserted()
 in struct drm_dp_aux
Date: Fri,  8 Apr 2022 19:36:28 -0700
Message-Id: <20220408193536.RFC.6.Ie827321ce263be52fdb8c1276f6f8cc00d78029f@changeid>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220409023628.2104952-1-dianders@chromium.org>
References: <20220409023628.2104952-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements the callback added by the patch ("drm/dp: Add
is_hpd_asserted() callback to struct drm_dp_aux").

With this change and all the two "DP AUX Endpoint" drivers changed to
use is_hpd_asserted(), we no longer need to have an long delay in the
AUX transfer function. It's up to the panel code to make sure that the
panel is powered now. If someone tried to call the aux transfer
function without making sure the panel is powered we'll just get a
normal transfer failure.

We'll still keep the "ensure" for HPD in the pre_enable()
function. Though it's probably not actually needed there, this driver
is used in the old mode (pre-DP AUX Endpoints) and it may be important
for those cases. If nothing else, it shouldn't cause any big problems.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 96e883985608..13c3cb5d34f3 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -190,6 +190,22 @@ static int ps8640_ensure_hpd(struct ps8640 *ps_bridge)
 	return ret;
 }
 
+static bool ps8640_is_hpd_asserted(struct drm_dp_aux *aux)
+{
+	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
+	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
+	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
+	unsigned int status = 0;
+
+	pm_runtime_get_sync(dev);
+	regmap_read(map, PAGE2_GPIO_H, &status);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	/* GPIO9 signals HPD. See ps8640_ensure_hpd() */
+	return status & PS_GPIO9;
+}
+
 static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 				       struct drm_dp_aux_msg *msg)
 {
@@ -324,9 +340,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 
 	pm_runtime_get_sync(dev);
-	ret = ps8640_ensure_hpd(ps_bridge);
-	if (!ret)
-		ret = ps8640_aux_transfer_msg(aux, msg);
+	ret = ps8640_aux_transfer_msg(aux, msg);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
@@ -679,6 +693,7 @@ static int ps8640_probe(struct i2c_client *client)
 	ps_bridge->aux.name = "parade-ps8640-aux";
 	ps_bridge->aux.dev = dev;
 	ps_bridge->aux.transfer = ps8640_aux_transfer;
+	ps_bridge->aux.is_hpd_asserted = ps8640_is_hpd_asserted;
 	drm_dp_aux_init(&ps_bridge->aux);
 
 	pm_runtime_enable(dev);
-- 
2.35.1.1178.g4f1659d476-goog

