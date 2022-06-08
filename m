Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF87E542FCC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC710FB05;
	Wed,  8 Jun 2022 12:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76E10FAEA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:34 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a2so26768658lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
 b=zoUeZmH6+YhsKGt/+OtsIOhd03KmWslGLbyTmHplE7q6dwzKeYTnmkZMQCrMqWcDT4
 ENB6eiVIws3hdUaLZdT7rxppqZHlo+EWfHPU84W/gP33F4LjDBgMyuC81kcjBD9S5OCC
 cuwIV0/NLZXekhh0WMbb+j2JCvJSr4LsfPAjkc0ls0fpP3HudjhWmku4oPh3Ohe4LQO1
 2DKDjG2noCZA5pYUZxuwmUzwcDVEyL6gQIoxOHw34jpoR/eCTsBdVRXGbb1J+9CLRYzR
 EtkWtXBnnY2ILHsYCcckQjGFNR3Ak8RymPgXJktw5q0lMU0Usxzou5FdvZPd6wFW6FcA
 l0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlsyCuI1r3kbK/vtjTE2HeZ8epmog4rrC1c8iQZTka0=;
 b=BhMPqc7NyX5/xyy+GT1cJVoVW8UOdQO6vPeVSwsq9oFH4KkBHdCiKllYFZi2Hannfa
 x6aKI+sHvVTHzgisZNj7xL1DJL7nKeFkJD2cABaFloC8yxerGnt5zUcRAN6UphmIKwCn
 wOuxynULbewcLCMWUHChtom8bXE1LFKv9jDQ+tUu1XcWV5BSbg0Mds0iWVg7EpQ5nOBx
 NMBS/4xJ0T39++dt3JV2Mk5m0zbksk3X1cI0RDQgUuPXnrt2B4yC/PSB2BiZ5EgbYofD
 LTf50KIgeMqST2baAlYM5Tx9gnKLQgDu2PIwMNHD3jlbCfCWRTTJJ2y326MsaCU06U3i
 aNug==
X-Gm-Message-State: AOAM532jkFINrPBRFygdUHa38h8+spcy+PKFTaU+u8DTQs9Qjj4ZSRZw
 4OB+rKAPNtc3mDXyDbfB/lO6nw==
X-Google-Smtp-Source: ABdhPJz2NiZWUioo69UFimWOsc7iqwnrDHZDOQ0ftc1GX9KufMOGeb3fHe9xiD6jbW0mKqaIQz5IgA==
X-Received: by 2002:a19:f24e:0:b0:479:1376:793c with SMTP id
 d14-20020a19f24e000000b004791376793cmr19393937lfk.526.1654690052543; 
 Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 07/12] drm/msm/hdmi: enable core-vcc/core-vdda-supply for
 8996 platform
Date: Wed,  8 Jun 2022 15:07:18 +0300
Message-Id: <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DB820c makes use of core-vcc-supply and core-vdda-supply, however the
driver code doesn't support these regulators. Enable them for HDMI on
8996 platform.

Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7cb687458a56..67397fff645c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -399,7 +399,7 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 };
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, none),
+		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-- 
2.35.1

