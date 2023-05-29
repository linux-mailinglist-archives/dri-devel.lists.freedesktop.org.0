Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877B714753
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7D10E273;
	Mon, 29 May 2023 09:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4C10E273;
 Mon, 29 May 2023 09:45:34 +0000 (UTC)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at
 [217.149.172.244])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 83F58CFC29;
 Mon, 29 May 2023 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685353502; bh=Pw/tZJzdE92dqB5g65+01DVbNHwSCp+HTkrhVc7vhDQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=xaTDwxwxipXWTzZ8oghu7wOEUErbqayRlrch8IEtgWPWG19IHihBvIB9MMlVpQlob
 9OXzQF3L7WXCBslmKDtil2z94gZVfmzHdhz85GrDIUeKurmjhCErW1axLi4Z4J2/1j
 C/TBelcvKr+SDMTmSyIJweRul2RwB8o9IuDsikoI=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 29 May 2023 11:44:02 +0200
Subject: [PATCH 5/7] drm/msm/dsi: Add configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v1-5-679f335d3d5b@z3ntu.xyz>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Pw/tZJzdE92dqB5g65+01DVbNHwSCp+HTkrhVc7vhDQ=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQXOlXijtO852UPpnlIg90qlR4MN3zR81Avh
 77qBL9ZSDiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0FwAKCRBy2EO4nU3X
 Vn9yD/0Z6AqFRQtU4+CdXfKWFfJSwiR5sWlSwFhLRwQnAuBualX0I8ESk3FVmeB1GlQ8FSB/6ZA
 99MzWjny6n0lkf67+TvTjGOyhYZEskjGjnV3xDT45q96WTd5vUMROANkgf6ZDVljuZdZSc5Dkcy
 laPOw4pFFgpLOrBR9qivQdlARkQ291EltQ/T/MiwJxZjK8QcwkQ6TIaJTOEu60qvKa5rMfkx5QG
 TG3yrerfNgCspdDrJImMSjo2V+IRNZRa7c+iMzmEPCM8dodZi8r8jW/+V6YVyloRpu9HIE7oZ4K
 N+FJaToslOTwKajqwFny9kfs2qj7NvzUdEpt/rC/ZpL31iQYpQkb3J9QQHh/QDQ1i6LOycznslG
 vI120GksPJTV2QxlFdF8vRHUsKYKHCQ4dBKMwgH9O3chrvaTWnNCxtIBOpXyFERt77wfZZIfbcs
 itdto2mZ8G4MHTwyZwWzrGuFRryC5+bJoqLrhfromXyzBdi+AfaY8FmJsNRntptYGFsrJTMy8Gu
 YzT74YzceyM4Kn864Hr0QAr5fMsJ3ybCJF23lzk1zGb5tlhxYrmneM6/Ij/veTIZcXeYE+w85hR
 cpqthUod5rSSJD+NuhTUl/YW4hwNlJQWgrxj5gZ63lw1DpIE75wwagAuRiSdWOYGqw7ppOltfQ9
 Q4aVDvFrPaCjYvQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
existing bits from other revisions that are identical for v1.0.2.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 29ccd755cc2e..8a5fb6df7210 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -245,6 +245,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0_2,
+		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 91bdaf50bb1a..43f0dd74edb6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -11,6 +11,7 @@
 #define MSM_DSI_VER_MAJOR_V2	0x02
 #define MSM_DSI_VER_MAJOR_6G	0x03
 #define MSM_DSI_6G_VER_MINOR_V1_0	0x10000000
+#define MSM_DSI_6G_VER_MINOR_V1_0_2	0x10000002
 #define MSM_DSI_6G_VER_MINOR_V1_1	0x10010000
 #define MSM_DSI_6G_VER_MINOR_V1_1_1	0x10010001
 #define MSM_DSI_6G_VER_MINOR_V1_2	0x10020000

-- 
2.40.1

