Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83656FAB7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5488D232;
	Mon, 11 Jul 2022 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1638D237
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:21:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a9so7657497lfk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzyxFMZ8+v3M9761rPjYYx/omswzn2E+B+Q/gfA4aSc=;
 b=nFO7gQ/FPS+MTeaVZG+0v8Jm/7VLBPBrc03BKwNMjeRFEOQ+WugsLRAf8dLd18albj
 /jRYxHWCOrsx62hqvamnn9fszsypRS/MhvxY0+vvFFEthtIAzwKihRlhyLQlMnzAWOwL
 2pDUvO3A+V1+yHA2i76K1qyndREAZBCnX2MNujn9iPGANcewT8mwW+KarV1kh8XngTDR
 mDMQ7jrPbQ5t8KHxZW960MhRjJ2uOr3G626StGKv6PM43SEbq2iaXKftUyltJbPl6hTJ
 BYSn3U1nAVXW6JnuhoM1sLNTaAr6E7uy21AeSVY3YWR+4qYv0eFzeiwO58/u40s4i6UZ
 AkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzyxFMZ8+v3M9761rPjYYx/omswzn2E+B+Q/gfA4aSc=;
 b=Sw9G7FmuVIAnAiFcZMzVIHRRkG8lyh9ECpNaH/E++lRzOu1qdoJDRPzt0nQ1zHXomi
 KeF0HamlLHtAC2VfA1nGEl4ZePNaJvGC+PLDKrpraXEjyOtEsEInO1ZZdzqS22uQoKdC
 7nbQoe23wsDT5MLSMoyGD9SH4iyjK86zLYd5bZ9yzjcSI10TH2lsFAZLSA+aufq+S6Yc
 aFV+s53BqFRYndW7v2Jx6ltJ1+XYcdiivUNp6bQx6W6DqvBgPPmeONmdpV9RE2yVi4A0
 a1JL2tJOcTiX3OVisRFPJZfcMcGTA/ag50Mm7XO6ZBRWzNwizi+fNVntvB7rQ5mkSDfn
 SR8A==
X-Gm-Message-State: AJIora8dob52JGF0w+8KssxcIWRyDr2xJLFTj13MciWCYFYVBLlE76FG
 v0lT6Df16NuUxQMr485WCMa1zA==
X-Google-Smtp-Source: AGRyM1u0RQeE4xvkfbL2vxSwvz3+rBdnCRyIlPAIvTLoWC2N4sGyrvCsiWUEH03acFh+GnG+pRwqcA==
X-Received: by 2002:a05:6512:3985:b0:483:ccc5:9494 with SMTP id
 j5-20020a056512398500b00483ccc59494mr10560070lfu.623.1657531278325; 
 Mon, 11 Jul 2022 02:21:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c30-20020a05651200de00b00473c87152bcsm1434195lfp.127.2022.07.11.02.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:21:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH v3 0/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Mon, 11 Jul 2022 12:21:15 +0300
Message-Id: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An RFC (or rather RFT, Request-for-Testing) series adding support for
DRM_BRIDGE_ATTACH_NO_CONNECTOR. Note, it was compile-tested only.  This
bridge is the last one used on the Qualcomm platforms (in
upstream-supported devices) and thus it is the only bridge that prevents
us from removing support for bridge-created connectors from MSM DSI
code.

Changes since RFC v2:
 - Changed DRM_DEV_ERR_RATELIMITED to dev_err_ratelimited()

Changes since RFC v1:
 - Dropped first patch (conversion to atomic), corresponding patch has
   been already applied upstream
 - Added DRM_DEV_ERR_RATELIMITED to notifiy users/developers that
   corresponding connector was not found.

Dmitry Baryshkov (2):
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.35.1

