Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD45581890
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2452695F3B;
	Tue, 26 Jul 2022 17:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C03395F05
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:45 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso184169pjo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
 b=CdKkn2TAJXxhAQ0zVV/bxvv+NtJ21HCRpY2zDxPmR+AKTLuroLHcxjjFP3IX++SaAY
 r4web3polSC0tU3jg59fs/V956n/OI3RrS6OndczV+r94MEKeyJyRNkG6Cc0DEM66YY7
 BIeGKM4svzgyhiOM6KEphErb3pwFkbUp8wUFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
 b=CkY6+gMaWFQoc9XvOBfy9UOlGTnKA7PlFM/rCQUGPCVPd/otiYus9cB69Z18SP142k
 1nohbiqPEjp+NgtK1vI/P2PG2XhfZe6rE6M6YRbuUfJQ/NeK9lFGiP6cspr1Gj4K1js8
 zv7OM8waet9wLX0lYrIsrQ6njFxVHMBAsgME47gBYDZuP9aqszPEc6b22QST9pPPg1yZ
 YVc/5uxBE7Ey32X/dmURBxFV7ig6m674nKSxGGBSCVCSoCn65GMCMkRxw8WAO3kZe4yj
 uT5bqG9NJEdrhxgitosFKMDuefA3UjxbYx2e7GMpvwuNYz+F4zTN2eK772TujcFJm9O6
 KEjg==
X-Gm-Message-State: AJIora8E4LHbv7Sf73t0hAFnI/Q6my5EiZ963ILJfjPFrn6/LceIL37b
 JnAiMlw+QO3hewBvJCEW062fMw==
X-Google-Smtp-Source: AGRyM1v4Qxmej3AUYLBc4E4fc1Qdq3OKx2v7JS9BtYZRthjbwBf3uE93fWlt0LAQ9pq0KRrfZkzpTA==
X-Received: by 2002:a17:90b:2407:b0:1ec:dd93:511a with SMTP id
 nr7-20020a17090b240700b001ecdd93511amr300477pjb.212.1658857124631; 
 Tue, 26 Jul 2022 10:38:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/7] drm/msm/dsi: Fix number of regulators for SDM660
Date: Tue, 26 Jul 2022 10:38:19 -0700
Message-Id: <20220726103631.v2.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1 regulators is specified listed but the number 2 is specified. This
presumably means we try to get a regulator with no name. Fix it.

Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.359.gd136c6c3e2-goog

