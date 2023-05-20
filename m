Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FD270AACF
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 22:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CB910E050;
	Sat, 20 May 2023 20:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373B10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 20:01:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f24d8440c9so2573781e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684612864; x=1687204864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
 b=t1mexu5qxJBbBJltPPFF13MB0UFh19PpxpRwP6BJZkVT+8+Who4LFtvR5rRPJ6WZlf
 aF3vLsZKI/6m47koGyPqkQ70UlK6+FCGKwPDvOrnbFC8PNQfhP0qiApWMylsy0yMZfQU
 xvfiVtXg8VSS4yUPKmKCyljjLAAZ6erdXVUaW0xoQUQzWEmQ+vEWGSuF9Rl6a9+GwK04
 MjvFr6NVTJcMeOwmNqAvDtJoBI3hfXJWSgSWQh37YGFopku6dwx6cXsg41nbNgzynZi7
 bz1RCJHueQJ/y9/P6dR+NQfrYqmcGufHo/y4g0Tcz/g1fqtxutbRF7N1sgijjpkaOBXD
 JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684612864; x=1687204864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/m15tgiwhJVpYle1UwrR9+q7qYpgbGWpHSlEeT8UPN0=;
 b=G+Gc60WQPBy6l0Fm3ag8VPBwXmxjhGAiVF2f4dS44OA1+na5TenUfizZHu+82MOmEJ
 VAVM/vGOxBHtxuMJPo/mqkhuRiiIJIbchYswEVClXKbrXldihI3path+mUR4oRqNAYOH
 /MGAZfpAO+jNNjRtwFypwR9n4/n9s0t/mMQ+low1JgfkeYpwBxrod4oYlsXPvqPkRY2p
 yA37SYXtqV5GjtM8SyWMIyQlTNHM+EdARya7jkxqR6tt5yussxebljchXcbBspomdboj
 +vwh4wa9S0UjBCWVKiJxqlbqbRo+VZyX5n6/PXEaBQTwKOrgMEJxmKb2qSVSmt7m0msm
 JjRA==
X-Gm-Message-State: AC+VfDwmV4DCaxiZsRsbJQhhSUeWdpEbRf77oneSSNJQqtL6sOH2nn9c
 UBJUyTlIgrFEocRZRBoXAKzoCw==
X-Google-Smtp-Source: ACHHUZ4JAZCnM9aejw/rIPOad6sYyqPsXDK/bsqCMQMPQLijIi9hM33boelYXdGRDoI5/m9y8r3qjw==
X-Received: by 2002:a05:6512:1048:b0:4f1:276f:a25 with SMTP id
 c8-20020a056512104800b004f1276f0a25mr2170344lfb.5.1684612864403; 
 Sat, 20 May 2023 13:01:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05651c014400b002ad9b741959sm418061ljd.76.2023.05.20.13.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 13:01:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
Date: Sat, 20 May 2023 23:01:02 +0300
Message-Id: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
This function has just been called (from dsi_calc_pclk()) and its
result is stored at msm_host->pixel_clk_rate. Use this variable
directly.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fix typos in commit message (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 961689a255c4..2b257b459974 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -633,7 +633,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.39.2

