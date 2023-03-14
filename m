Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6F6B90D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C12E10E126;
	Tue, 14 Mar 2023 11:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8C89149
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:00:52 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c4so9474170pfl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678791652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Js/tHDer/Yr5TRaIcV1cVBSaKjsn5E+7833Z9Y2Z5oc=;
 b=gInm2BDdjwVTeHhR+bNfsdsL2pH8+qdgFc7TzHVJ4615z6q0HAoAtyj5pze2EYkGTz
 1jpip1tf8MIJ7tJqh0VMGZ7Zr0N3ZwCVJ1+5nwgQapiJNp7s27Y/MRo2oYpVreB3IqiZ
 sIto1wJGlyvGFDTiMNxtX2WNThMiOKoVNitN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678791652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Js/tHDer/Yr5TRaIcV1cVBSaKjsn5E+7833Z9Y2Z5oc=;
 b=vxozHTC+iNQLidE3J5YHEGeT8tN5rXqkWMbj8gZAei1Q78Me/lt0MREnLAh8sgDiaV
 EqK5xXVgOI1O/0laj5u1wELIuWMhv003ekQUS6Tm4jMtxMMyXiUzhi2/w+049NG4Ga9M
 W5JzwMqT2jATtle70PNT/Wi/vRfJPp7KkaHX5Hj/F8cx2L3KAOVs80eHx1TCyL2V+TEk
 pcUqSu5ocWE45ElWkZT1OPdERpIKK+lc6yz2DN1YdbK17gDxryieIbakn+M6mlb4nbQQ
 kbtd270eM+Ccoi3zTV2qNu+jqIH59PO/zSOHYKDzhIgsdnnPCxbRPk8qUwU3eB/ZG62v
 EwRQ==
X-Gm-Message-State: AO0yUKXIryMkRamjMEmwwlwShr0oGtjb7V57gjUQ6Ra+HvXkVxwc1XBR
 bIWEuY6fD/CDcuJ+IrXxNK7lVw==
X-Google-Smtp-Source: AK7set+M0m+PUk7VtHcQ/wCnMA01qfJFPe6qJcSy/J388yRSRSnOkJJyxAJrjvIqfPdAK5e4t4zAEA==
X-Received: by 2002:aa7:9511:0:b0:625:4d29:7390 with SMTP id
 b17-20020aa79511000000b006254d297390mr3123574pfp.13.1678791652359; 
 Tue, 14 Mar 2023 04:00:52 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:3718:fdeb:7d7e:b6c0])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a62fb02000000b005a909290425sm1362028pfm.172.2023.03.14.04.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:00:51 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
Date: Tue, 14 Mar 2023 19:00:42 +0800
Message-Id: <20230314110043.2139111-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Skip the drm_bridge_chain_pre_enable call when the bridge is already
pre_enabled. This make pre_enable and post_disable (thus
pm_runtime_get/put) symmetric.

Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 4b361d7d5e44..08de501c436e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
+	if (poweroff)
+		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
-- 
2.40.0.rc1.284.g88254d51c5-goog

