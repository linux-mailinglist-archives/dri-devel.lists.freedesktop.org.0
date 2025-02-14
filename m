Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999FA35EA4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1965D10EC74;
	Fri, 14 Feb 2025 13:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e1EbzF2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EB810E2DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4395cf61014so1710345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539079; x=1740143879; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
 b=e1EbzF2IQ1rGhNya/r0M6IfTrJx0+hbVO1WaBxEn5fmIglGgACOLKB31xBkcNIf+DM
 pyPvis515G0hc486/bH0PIhONLG+KVF58IDrGeZeHELPtyNLIIGC4+1GewKPCeD2K3cd
 7drsVCFl4h7tQ4ITUzNvl8/TKJ/SHnxBjRBRppE6VRk6CTVqMZ7+xJABqLuG4/8H3hEY
 6+No30DeNX8qPDuHdN4bOr1nSjDnqRexX2I8dLSj7qI+O7bsZ65I4wCYR4IY1NrBQnpB
 DKp6VqjXf35/IK/eyhnXCruyn9Ubr0jBfBjNob9qxbl10F1h0FXGWZG9AWTozifZyeaf
 JO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539079; x=1740143879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
 b=RPKIfwvTHZWGKMHs7rqntARFuREvb/Rdggq/2pNTKDHQFN6Zt+qDC/z4RgIafcH/on
 dF68k+ZTha1F9QPWwVCiRgaUDtkl6EgXXPjqS9hFGu94Oy3vhKIZRsw3K0OyMlEhXQ9N
 gh70nZ31EdhPvsAY0QFeQW117ZJxRntqfz3hvTSClPXCCM0BpUtRJONdZ/5wSB+tDP3G
 ggA0wXwhX5jzKM+YRUYHykvGGYm0wHpj5diUY85SXqNFMA96fwr92qM6C2y+/iHU3BLP
 ylNgdIpkq3p1E9a91D0KwhYiM//u9rlTY1vmB0MZsx/f6tQCGfxlUBHzdVAtM2SVcgJ8
 Wg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ8g/pWh7/KL4Ph76mNYN6LpIbW4sEKMPmWiqob6GiHr1ncdCejEQ2FxwsApX5Z1BbX5u6iGo5Tm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWg3nfMr63ZCnhslW5IBY8pRHXJ45k/qP/tha9N8ZlPbcvPKWN
 86e7Dbms3rZZkHzTc4QNI2rzk9TtAqFVn1W2LtHT7NM1Dpp0LfxTFDK86vzQrI4=
X-Gm-Gg: ASbGnctVV/B61Pk0rHOnBOsIbcT11TNKBIcj/s3gDcZ/TLhrwExULr8jPn8sob7CtbJ
 +WjpZLlw0yCUoyclLkz7HovcMyj/+qXjohqOdchzSwQsnpPV3KbIZxJbs6Ypt6EYdCSdgQp9441
 401TVdUERvn66t6yICFotqWLaDl58G2JA6fU4ijBNfJq1T68kk74GpN2eUwLZnl9Q11u+GC5c+W
 RdzzhDfNDjwS/5snHOWXHBgZBbl81vDs+OKjaHuuhafZb5Ew/81wq/2jxa5ZYQFHAMtHqrrvg3P
 1CG9WxsNbub0Jx1i3sw8zNjaqScq0+M=
X-Google-Smtp-Source: AGHT+IF8ZnKnRDAen3JkbML52TX6uJAA3HnEdc/rv0itSdm1wPO0z++HDOBIO7lmH5u+PdSl8U/PYg==
X-Received: by 2002:a05:6000:1a8f:b0:38f:23d0:fdaa with SMTP id
 ffacd0b85a97d-38f2c7e8b5emr1623911f8f.8.1739539078710; 
 Fri, 14 Feb 2025 05:17:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:17:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:44 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LPkeNjhgTgrfE3w0Cx2k5M/6N8eDWwbeGgVJuvK3gw4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0J/cUZuSVvSZtf6PljGtni1J0rGlt4NnGK0S
 5mv+KmYp1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CfwAKCRDBN2bmhouD
 1629EACTRdHHc8EpKem2FnQ3ucYUjrK23Tt6Su45uxptKsF51W9HnDFOcGqHdmlU65lg7ByccqA
 G1XMyAMBZlLqgg7oM33y/k6NR6zUo/1Wnf6cY1/zQwhs4CZ/VaLIZw4DVkdjXzxulLGGOLpyx5O
 14mI6fLNfZNptj44gXDGOIjB060LxrhOVyfnhT6YW0ldvlo0ZZvSVGvLDbI+P1fHxur0ZXJTksG
 ERtk9CtWdgbZA2fbxXQUDbAZpuI934VpxiecQdiofbHrhoEAkO8XWh7uQUDkWrwKb4IBChIZAfa
 DGn7WLXADtFjENmQ3DtxfXUBQ+V2tY6rZSRH24+tq512zMU7O8lxB2eJFNpCirG7n9KVY8cbhu3
 nHewXucKN4QzNLUgoRd4T3Ofa7j9bPtZoi7NKtZ4cdbZOPbmCSqVG+j49bmMM53b+R2/zuwuYOY
 sXul99MxJiG6cRoII0P1saODFouJRTb8UgdNDCqH9PQtpOdRg90BMxIVr2B2M4NsDl40PwmxMvX
 BlWbZQQreXuDNh5GVqV5T+JlpPfI05yPcfWDf2jYF/SEUOjUPHhSpmavvzPLcimMrOnMnzOJHT+
 Zxe7zCghfP7/nAcHUM0x+Bc6TAzTcNOsfw7uTluJF2mWhiLrG9PLYniOH/M8If+eIVI8G3DHYUF
 po+1EidI/IGDpgA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dsi_clk_init(), which gets the clocks, is called only through platform
driver probe and its failure is a failure of the probe.  Therefore
NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
value stored there won't be used/dereferenced afterwards.  What's more,
variant-specific clock init calls like dsi_clk_init_6g_v2() are not
doing this cleanup.  Dropping redundant code allows later to make this a
bit simpler.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fdaa0462b05d53cd8a2aad0269b1727..397c9f1f588558b2081d6400d2cbae746c900697 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -292,7 +292,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->byte_clk);
 		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
 			__func__, ret);
-		msm_host->byte_clk = NULL;
 		goto exit;
 	}
 
@@ -301,7 +300,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->pixel_clk);
 		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
 			__func__, ret);
-		msm_host->pixel_clk = NULL;
 		goto exit;
 	}
 
@@ -310,7 +308,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->esc_clk);
 		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
 			__func__, ret);
-		msm_host->esc_clk = NULL;
 		goto exit;
 	}
 

-- 
2.43.0

