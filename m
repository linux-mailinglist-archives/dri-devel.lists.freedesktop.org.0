Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026954C806
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 13:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F8210E1DA;
	Wed, 15 Jun 2022 11:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550510E178
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:59:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p18so18566388lfr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fxhig7S/wRtvHvzsbn9rHd0EStZ8R3uFvogUlmb/lgo=;
 b=p0x9cBSaRJyRVTcL/bQMqtCCAUZw8gAxE/Nip++Oi3MBE4TigpMJuno7ju74eI8ltQ
 AP7aVPu4D6KJBuYXDAQ+rFwf71t8rX8mv+yRHH/AyNTdrsGeXzuRZ77vgyPTssrXpaav
 IRBU74MOTjW/rBHX+rjOjTIu5oQxgtE5k9XDAXJ2rBnLcDFyjciaTkJn16fyjiZo5t7V
 UavKS9sBZA7+klaTmCiUE2pCd8Gd2rlNQGlsym2KyAFHvypx8LSECRSr3FAxva+czYtb
 sLEx3qdcvEyVPZkjaRlMc+FgXVsMtF3ONkmvCIZOy3BH9xZdM4tT4v6/oX13XqSfGCtl
 4PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fxhig7S/wRtvHvzsbn9rHd0EStZ8R3uFvogUlmb/lgo=;
 b=DAZjhtwdeC/T76wQTrZC7zwVb0ljwjPDag/9WfUlJUXtAlwbOJ+4lua0aQnCX3M154
 GwevZ5lHDP226bhAr4hgW5IJqCuqzDonpqHN9tdNUA/m4usarXkeg79/eCP1HxJWkpkw
 mP2adRn7Mpp2G4GZU+W9HtezCG9Exh+E8hPcAvYMHAIodD+qnEznZ9scRyw8JcPYKJLn
 Bz7ROaawcvY48/buBjT5eQYbudL99v5sF16xbbYpyLsO76xVDmg3LjoaZGuch7Hs3kUI
 ThhYxgOu1uiDVsbc6fEeehhMDLvcmy7do4p8hfhqdTaXuGp27BxYislALeqbm4cVaXCd
 lXZg==
X-Gm-Message-State: AJIora/Pa2EckxSA6wMZyu+jJds+XOM3c4lTfW6d9lwHjr+afTgaeUDU
 sZH6iuomQhTmbrgvFjMEAifbVQYuLHEgQo8c
X-Google-Smtp-Source: AGRyM1ucrkTItoEeZZkUTWkAu68SV/jCTVdq114h4nEOl2QUT54X0xVMh3MbsPpBZO+8vQHBq4wuAQ==
X-Received: by 2002:a05:6512:3d05:b0:479:4fc7:3332 with SMTP id
 d5-20020a0565123d0500b004794fc73332mr6146023lfv.463.1655294361968; 
 Wed, 15 Jun 2022 04:59:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x18-20020a2e7c12000000b00253ceefb668sm1603680ljc.60.2022.06.15.04.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 04:59:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dp: make dp_bridge_mode_valid() more precise
Date: Wed, 15 Jun 2022 14:59:20 +0300
Message-Id: <20220615115920.6768-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
than generic MODE_BAD in case the mode clock is higher than
DP_MAX_PIXEL_CLK_KHZ (675 MHz).

Reviewed-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce77935394f..6ecdd81d0555 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -989,7 +989,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_OK;
 
 	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_BAD;
+		return MODE_CLOCK_HIGH;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
-- 
2.35.1

