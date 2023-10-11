Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539E67C5F4B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 23:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9110E1FD;
	Wed, 11 Oct 2023 21:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237C10E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 21:47:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50444e756deso503197e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697060827; x=1697665627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ob6zHKwHJe5DxnJ96DbFvUViHrwYllqlwZyDWW9S4Hw=;
 b=ApfKNnpMZ1WEdxGpjnKQ1y7mbuekjQo5/De4etoIQ0RlNCRDFV2KXrQHH6PUUIiHTV
 EC54niC07nJHD3/aLwv1gmBVbUmgXscbbcAYxP76SXSzPOo/eRw7mTQ/OigUYmoQ829+
 UWvTP6e1HaTDLcN4O6g7vqh6u3LULviXZb88DaSPwGLkXrnoXsaPwnCsXqpxD/J/mEns
 VbV/WqkOOni2Ma7PjzqYsy+FESpVushpn5VWz1fJjE0dWjTMPRbw4PEWRBTPO7mYFTz8
 U/9oEjODNzGSoVUdhNDCKQOAF2F6m9+dCV4n0W2/t+LnAYcM551lV3jxrZTkJP9ge28S
 MGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697060827; x=1697665627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ob6zHKwHJe5DxnJ96DbFvUViHrwYllqlwZyDWW9S4Hw=;
 b=lTFEHBvqFPhgiJjmnLwkGOZwtQx783HwcqxfO++SpoNJDjYkkHOLDfKMoUkpnCd7OQ
 1yjR/8Fa3LcptDSf9kajCwh4i8vohgDDCEYSG9l75xQh2B/bJIEajtwfbcYbD5BT29yt
 LMcV6y/vxfViktsXD1l5zH4qly2uX05ze/fDcIioZ5hB3UnKmvr8OT6Zru6b/TAe4kvh
 PTy6rHLsJU6vzOCi/0Jes8xmRLfBbopJzYyJTImnXFjClku+7zjGR3iZ8Q8lStbEMgdW
 3xRB8NU2ct4i8xla6zJe6yzz/q8InIxEDJmSRCmEW1HxGf3nmmqXi6I6bdXEHUmf2Tou
 jTLw==
X-Gm-Message-State: AOJu0Yyrk0zQlm4HF/BqncowzSuCr0HXOgpzrRB0FyC3u4yuU/eaAVEX
 YTfF2thqeZglBq+QR1tF8yUCJw==
X-Google-Smtp-Source: AGHT+IG+Jx7gvthKXOrv1eS5yhlvxjJN951Md2sT933/0bkGwRR9gQgLcgv3WVHRKMFaSmnk0mnxSQ==
X-Received: by 2002:ac2:5443:0:b0:503:34b8:20b with SMTP id
 d3-20020ac25443000000b0050334b8020bmr16731665lfn.65.1697060826927; 
 Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/3] drm/msm/dsi: use correct lifetime device for
 devm_drm_bridge_add
Date: Thu, 12 Oct 2023 00:47:03 +0300
Message-Id: <20231011214705.375738-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lifetime of the created drm_bridge is attached to the drm_device
rather than the DSI's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 5f403fd7d5c2 ("drm/msm/dsi: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 17aa19bb6510..896f369fdd53 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -485,7 +485,7 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
+	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)
 		return ret;
 
-- 
2.39.2

