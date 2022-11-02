Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F146171A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD9D10E562;
	Wed,  2 Nov 2022 23:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2972E10E54B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:19 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id d3so242375ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=S/Qn87B4jnSh43bul90tVbTclkpZH/Y50HfauJztlau09yFmuoH1d8a1yyHe+uC36W
 DhgE78HyyH9C3yAS+M9EClBqIKclKGuMupTlCFSEr21/fHTUDVigVIrjTgAf4Rd4Nvym
 evat0hleuK3VJHMFXnp3xe8MjGJ/tqfkIYYIAsQdQ5mTretwovhNKYVGlMufVuK/vijb
 sp7GilUmoeRW90PLaH4bFFP2sSCKPO3kG4bPWNvMTROkEIKwBxV9uQhlC8tpMrWXF3FC
 FrTqZSUu2va1E3zB5r6HLB8k5bPaGkt6x801Z8eCeMfBrliHKOJ+VS6OViOrnN6FjvMR
 jCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=uifS4k5EpbXcvap/Lhws0b+Tm/uBZCb9RbFUM4qBnKK3g/nhMe//wdA5AYvbBVDnhf
 yhzEfzvuOA4W1oOTbHh6Fnm31mhbixS+8jsVQ2QvQ8KXDFnSnLcXs180FQN4307lPZhf
 Q746var+zQxDb2wlNvJh1bo2PW5yW+UZ4rEvhbLlCqavWHuqOScV28m7VDtZ7s8Cxcoe
 y8o0d/MQFKed5vZAcJedA3JN7IRnqayzmnpYnCtV7yXhIrdNLy367Rqlno1QgTwHvU+x
 CVCO4OzBKtmojzWT9s/xe/sGYnmAV7/LA+u8ERUrNWDO5bzKOBsqZiMEfS4maCVOZ5vK
 /p9g==
X-Gm-Message-State: ACrzQf1HwTgR5WdICXTa4Bk994Kv31LiQkYpXJF1awaHB+FrLgRlorUy
 1zGTCZnW07S+ovVC9P1cZuT0/w==
X-Google-Smtp-Source: AMsMyM62Nxy/dRZPZAs2gcgoUqkXQxFxmZiU7olOjBRCzkBHDJDDMj7lCMuIOg7k31mvS1+VKomMdw==
X-Received: by 2002:a2e:a48f:0:b0:277:6102:5561 with SMTP id
 h15-20020a2ea48f000000b0027761025561mr5570227lji.67.1667430798748; 
 Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 8/8] drm/msm: mdss add support for SM8450
Date: Thu,  3 Nov 2022 02:13:09 +0300
Message-Id: <20221102231309.583587-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

