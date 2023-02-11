Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12043693095
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 12:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2B410E176;
	Sat, 11 Feb 2023 11:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994C10E176
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 11:51:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m8so7284228edd.10
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 03:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zW+Y9s4c1yRvon1yWv9+3TgQXnziiU3kCR/96B6KXds=;
 b=TQtaWs28pO9XDAkHX2tefGKjjdl83OBLBeG56rO5GUjRm9XsfeAimbleEl0ZRh2mC2
 eRDM+Ma9OWB6TYiNkL8AT0JjkSGNebW6zZIdSVashk9ppxa3ANoUSv8f1XZ9n9+rVQ6w
 naWH5YN+NqDFuyUBvuRDviqWa1chRnaQD6VCvk+pAI53txqtv7Xb4Z1+oS4G93dgdj7J
 A5dfiYoFW0Yrl1zdc/htvnzttiRtS5Ia9Di6auyv950ldDvHkcW6DSn6VzuJoYOpxzmz
 rz5IjzIlsGYRTjEVgtsbMsBjSj6f86R+y8q5Jk/Vh4CmojKWbkU7udIqt1IKOWK4dwhL
 VONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zW+Y9s4c1yRvon1yWv9+3TgQXnziiU3kCR/96B6KXds=;
 b=Z/e7Ji2veDRqwPGwmVmIhMKffM7MowidCQMd2Yo2GM8MIVOISXe3T1In37x1mzHrSk
 lZfnc/sFH9Rxpf4gQzPmnNFalby62bDrKmmHVawDdFJlefMYdxPFvA95mKhXuxAbLYhr
 8vSNuVzqaPcMgIv4eu8RP5vxwWJWnkjH1k/U9khqq4jp9ZWFph6O+98xwiUgAp/jVCb+
 C1aBdOt45lRtzA4r1XUgS/VysE91LNfTFHmLXrgq43uJKVYEVzEraTZvmzeQdZi01rVY
 YYUUmbA34SBuVtJDez3l5aqAz4s+2SYlGzeTb7d8s1efi72PRjOewd0ttUV9t/SGoLwz
 szKQ==
X-Gm-Message-State: AO0yUKUhknCsfbiCFl8TX6C1a/15RTmJY3MLNjXw5IeZFwVkhsOvptiz
 XetVIQSbBYB4n04YFYDTs8lxQA==
X-Google-Smtp-Source: AK7set/4aYd+qbpanSLKwt7HWW/q9Cv/BGaym6KARMys8+e4SWPJhZbGmGYx8lPFsJ5wssrev9LlGg==
X-Received: by 2002:a50:9feb:0:b0:4ac:b3af:1e1 with SMTP id
 c98-20020a509feb000000b004acb3af01e1mr3102029edf.13.1676116315918; 
 Sat, 11 Feb 2023 03:51:55 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:51:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 04/10] drm/msm/dsi: dsi_host: Fix DSI index detection when
 version clash occurs
Date: Sat, 11 Feb 2023 12:51:04 +0100
Message-Id: <20230211115110.1462920-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that msm_dsi_config is ready to accept multiple sets of registers
(where array[n][idx] holds the base registers of DSI(idx) for the nth
entry), loop through all available configs to resolve hw version
clashes.

Fixes: 32280d66fd44 ("drm/msm/dsi: Don't get DSI index from DT")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 03493cc6b772..4a47705234bd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -43,6 +43,7 @@ struct msm_dsi_config {
 	const int num_bus_clks;
 	/* Allow + 1 entry for the zero-terminator */
 	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX + 1];
+	const int num_variants;
 };
 
 struct msm_dsi_host_cfg_ops {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index f5092b4d0757..8dfa69bcff77 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1862,16 +1862,18 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 	struct platform_device *pdev = msm_host->pdev;
 	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
 	struct resource *res;
-	int i;
+	int i, j, num_variants;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi_ctrl");
 	if (!res)
 		return -EINVAL;
 
-	for (i = 0; cfg->io_start[0][i]; i++) {
-		if (cfg->io_start[0][i] == res->start)
-			return i;
-	}
+	num_variants = cfg->num_variants ? cfg->num_variants : 1;
+
+	for (i = 0; i < num_variants; i++)
+		for (j = 0; cfg->io_start[i][j]; j++)
+			if (cfg->io_start[i][j] == res->start)
+				return j;
 
 	return -EINVAL;
 }
-- 
2.39.1

