Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70962645114
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 02:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8183D10E171;
	Wed,  7 Dec 2022 01:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3D10E16A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b13so15480133lfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65TLYKE4m/VwNED2qssio3XMhUo6hg23hdeNmUUoCLg=;
 b=NwVJ4h8TpvPPYtlIK885VXwf6jYnfU/gxVGjtpPpd2SoJcAlvYljS4hKi0e9k4uLZo
 gPx0phjlX/WHPOra4Mq9dpB75BA0J9x1BZQIG4niiIssztuWdZO5hYPhUJseZfwkJVvn
 EyrO9hJI+pQ/xxHvkAIVs7FKlLe2G0apg/Wm/ovKb7C8Y6C8vKreFuOiPvIXKxieC9uX
 Zm/BjqnVSYw5pLQQHkkmue0xPorIx4gt1IGQ3MrFgalezMYa3g+CX0o1uvSlvfiT40rH
 aihm3nkcRKR3s4uPxSZ5zpjci3aKq42TWulWXCd3l0CFi6NlFXl2ycrjyX2q55Ju7ywY
 CJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65TLYKE4m/VwNED2qssio3XMhUo6hg23hdeNmUUoCLg=;
 b=BUTrC2M5/G2axmQWop2Qxoi0M8GKB7mTn/YW6KEAE2T5x0t0p9GA3aVtW434o0wA3t
 sjpMOzrpO8Ib1XY9yAbr3x17ANfvDwajl7yixUAFyqaNU5mkewu9SPzmqUByo1T2oQLR
 FMFyW+42th26U4c0R1kfzde/hwZiUd/ZVblKdtprE3mk4yitful0+7kpbXYkQPDiUpNQ
 TlNrHAFYGhJ/er2aXFIFkGTn1I4z1BYSraizxqRiFZQ4m5AfUOmzfncNTn8FPCj+y5en
 MDl9Z5HLLfpQLHVz1aUGxxQirGrR1rId+hDxinQsS52NVSp/TmUeVpSABQ/wqa4JoxSF
 UcBQ==
X-Gm-Message-State: ANoB5pnXwJNpRe/C1S5x8zYLIeo2wBgHflN3ygszkJZ+G8W/jzpIMee0
 RKr3yq1NdNsp2tAWFTWKupL7AQ==
X-Google-Smtp-Source: AA0mqf4qS5I9697gg4dibpPGYdVbNtJ7Fx0zbTIumwATeqkKlD8w1bc2gjXymlR2CN8qYD4u8aLPuA==
X-Received: by 2002:ac2:4f0c:0:b0:4ac:2f5f:5c9b with SMTP id
 k12-20020ac24f0c000000b004ac2f5f5c9bmr22924848lfr.206.1670376161763; 
 Tue, 06 Dec 2022 17:22:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 11/11] drm/msm: mdss add support for SM8450
Date: Wed,  7 Dec 2022 03:22:31 +0200
Message-Id: <20221207012231.112059-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 86b28add1fff..144c8dd82be1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -287,6 +287,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -516,6 +520,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

