Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A99813F3D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 02:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069010E2FA;
	Fri, 15 Dec 2023 01:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0083B10E2FB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 01:32:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50c0f13ea11so113294e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 17:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702603944; x=1703208744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NvajZ+ZUy8QF9H1RwC0LbPByFG+e+2PVqzj8CMpNiSM=;
 b=jlK2VDRgWnge+WUqN8QnL8ew5eERQZTNzUeovboFw3D3tV3nJDCQHITXM+6K5MttR+
 i88ObfQ45KVvr6f4d9wMJMJ582GkSyjYVtIWD7zW8JvFqZWOaS6uGo/ieKIt+bMBLcaB
 Hz5qC/rPbcWQrc8hpruk2S5ZLY6StUhaCV3LsYaqzF6zOhw1zodKrblg1MF9JjrZi45V
 JyL3546eFJh7nALYTWewjc6Zovm58w0UgbOFRhCZw1fKR6DJWuxW35CfV4Wl5J49uH7J
 ShJc6mNDA0j+GKkyV9hZLSl/JKxy0+kWiRroVDVGqgk6mIz5HhCmyXC1GPBg4ozXOC7A
 WmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702603944; x=1703208744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NvajZ+ZUy8QF9H1RwC0LbPByFG+e+2PVqzj8CMpNiSM=;
 b=t/0CLnpdYRm4h4tiwCXlMjSP7cp/YTBiJmPi0kGGuDHd3NpEy6ODpdwrhRKUA632NZ
 UcdT6wde/F5Aqkkc5qJSD4VPfui6ycDXnu1ltWnzHoDESgKxPrbtnFmmwc4lZvYej+Uh
 XkkHkC3E/Ouqq2WGPYipKpPM0x5YnYPs0Ll+3+qqYmpu9gYuPlCdzfRX5HSU6lXqR4SC
 ulqT7/n10uXfDCmwas65To/x4IQ9301yrjxi8Kz52QYYlMctXRXY4WLlMiWEP3KLknIS
 qHJfLScb2J0VNxUdJLRntOEE+vm8gIVAE3wJqa4lOdtY7cLTtiO+p+5IIbAS/QkdQSnI
 IgWQ==
X-Gm-Message-State: AOJu0YzeCC5cBNDPXeJKpdEm8QHZx+nhp6SZcy9MqOvFuI/pWLs7xH3V
 /u71skmwr48LChGKFkhXkhj3Cg==
X-Google-Smtp-Source: AGHT+IG9AALVEdM99z/DNBleWnGYSw0gOO+GW35xtmr8C4UrkL9kLrHXdxVhfa1C376SrT6Cbs9q5w==
X-Received: by 2002:a05:6512:3053:b0:50d:faa1:acce with SMTP id
 b19-20020a056512305300b0050dfaa1accemr5091786lfb.56.1702603943944; 
 Thu, 14 Dec 2023 17:32:23 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g40-20020a0565123ba800b0050c0f7ab038sm2001587lfv.53.2023.12.14.17.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 17:32:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/mdss: specify cfg bandwidth for SDM670
Date: Fri, 15 Dec 2023 03:32:22 +0200
Message-Id: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lower the requested CFG bus bandwidth for the SDM670 platform. The
default value is 153600 kBps, which is twice as big as required by the
platform according to the vendor kernel.

Fixes: a55c8ff252d3 ("drm/msm/mdss: Handle the reg bus ICC path")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 455b2e3a0cdd..35423d10aafa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -562,6 +562,7 @@ static const struct msm_mdss_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
-- 
2.39.2

