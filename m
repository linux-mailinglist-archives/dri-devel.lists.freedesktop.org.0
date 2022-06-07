Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E26540E9D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A80610F0E6;
	Tue,  7 Jun 2022 18:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AB610F047
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:13 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i29so12971434lfp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gv5EYCl70d4UF6tOM09XneWfVdh1zgj+7SojFdpo+zc=;
 b=yKYk7Q8nnTwrMBpssl31f24fbF3pY7T9HGazI+DZHx4+585LFDXw9KhEeNNkPD+4xB
 tkcxZR7H3H8k1VkN8nYcQbhSGRVYLr/bZVWR/NrzW6ZXGI5lclkDSYyT42AuJWhOIbHm
 TGv9L1GkLDIcDMW/ZO1e8o57aIM0kiQQsB71d6jKwWeAlYEu3oTbcDw3XvbchQGhD8Xr
 ioOxKKPM9dEsslR6d+uX4pPA1Mh4YIfFHSu87zrYrC3Qj1sv6Kw06qb+CQ9hyH8bDyBz
 vtf3cSc51zm7YVHQPipVkKeCZh2k9sPJMKB5D56ksbMmuUdNo1PH3clNIFhBlsKDC8Yk
 Vt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gv5EYCl70d4UF6tOM09XneWfVdh1zgj+7SojFdpo+zc=;
 b=gwGWWejVj8stSdWKMCTpluiCEygUcT4ldPANBmvUaaFD+BPhWIWJk9Vk+IoaHD3oR5
 Vr5uzJmNw+a2ZRs5wHR6hhJrlWylNI8iUhwEy0BCpJ2O7gdTKXs8k07Td8IX/Nc7WIem
 4aMng51ov9t15Kb43ktkjrbb4AeK1AuRgsQDABXOOMs7dZue+2i0cwB1DJEO8S6mjPBI
 UltKxomqAikWp3v9CmVxNU+J33pxDdleup4Tj8ytaCpJoz86mmPCH0K/Hi52Cj42AY04
 WIj2Hn2dFiQBzkUK9NWLEvkHiZmx09mk+OyE0rut5/J2+4Gihn1/pbcIU8WAsYgKfy4B
 3nHA==
X-Gm-Message-State: AOAM530N35tEEJqaNiwWHsPgmMjr9VaHYieeFi2emjc5opxmGjrzfzLr
 K4fXp3Z7XVGECvkNOSaWe8FPqifJevqCMnG3kGw6nQ==
X-Google-Smtp-Source: ABdhPJzAFNmVm1dYKasPIIqCWjqt4kOQVLQ3EaOAUgzny8Plt2Ngih2S2CB+D7ih2p2lMcN59i5vrA==
X-Received: by 2002:a19:4302:0:b0:479:52ea:af4a with SMTP id
 q2-20020a194302000000b0047952eaaf4amr6247458lfa.454.1654628292088; 
 Tue, 07 Jun 2022 11:58:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 4/7] drm/msm/hdmi: enable core-vcc/core-vdda-supply for
 8996 platform
Date: Tue,  7 Jun 2022 21:58:03 +0300
Message-Id: <20220607185806.2771739-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
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
index 6a22d6977ead..125712c3fca2 100644
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

