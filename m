Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF8A6BA5CD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 04:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C0510E2D3;
	Wed, 15 Mar 2023 03:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB8D10E2D3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 03:55:16 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id p6so18776313plf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 20:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678852515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGPhTm2xXTX9SZzSC6N4Q9IoG+nmSEEb9/PORbnLy0A=;
 b=ZDG8fL713b301hTiq1x9F5hFdpR3HMZYFNXk4tKHoW2LPgzAMZ6QnQ8RtJiUaVPybh
 lbFg02/OpMcs7UKmQ56kWTTU7kdQkE7xEfnhkG8UhwsAhvuCpcPmKzsfWwbi4VvDp4s1
 Wvku0K8jYswJC3YUnrb74MhfG1/l8TdBIbrRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678852515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGPhTm2xXTX9SZzSC6N4Q9IoG+nmSEEb9/PORbnLy0A=;
 b=b1wcPa7Ai273lsp80QA+c0+BM61DlyOHMGiyaKH9JG3+VxEsbeWPfeRjHVQzD4ZKMI
 d/mbBg8dPtQzkHnm/HenyGw+PCcpycacZNE+fxP9J44BoLsmW0GI9mPl7oGeuNenA6Fe
 vgBuuc/W9TT+2ul16s+3mv/fimin9S6nYD7F6gPcFU+zUWMT8RmICiIfSj15EWOOEvy6
 q7VMhYrpd4ZKcM+pljd4iwmkLnWdFnmeuU0UocTFrJXZdok0v4r6+alOvwLsyqApTuwd
 UOzuBymSk930uOuA4Nji3xgvlrUvs/Yk9OAjuYFHQGrwtKNHbvSO1brALmKX2X6wlgHp
 11bw==
X-Gm-Message-State: AO0yUKU7HhWS9LUQdqoDJI7kQI+K1gmRZwcy24m1kFyFjjP8pDK5/R4L
 aEEeyBqYsQVSf8j0+tX3JMilRg==
X-Google-Smtp-Source: AK7set/5N7Cl/sUaBcNmnMU62DRuK94lIT7muZs9u0wEBnJT5Q9iDNVCoIqXOPoEDS87tQvZGYECyg==
X-Received: by 2002:a17:90a:2c2:b0:23a:340d:fa53 with SMTP id
 d2-20020a17090a02c200b0023a340dfa53mr41651640pjd.44.1678852515602; 
 Tue, 14 Mar 2023 20:55:15 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:3a77:bf68:24f0:1c75])
 by smtp.gmail.com with ESMTPSA id
 z31-20020a17090a6d2200b001fde655225fsm3208372pjj.2.2023.03.14.20.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 20:55:15 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/bridge: ps8640: Skip redundant bridge enable
Date: Wed, 15 Mar 2023 11:55:07 +0800
Message-Id: <20230315035508.2874915-1-treapking@chromium.org>
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
Reviewed-by: Robert Foss <rfoss@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

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

