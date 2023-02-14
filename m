Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23846696BAB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F17710E94D;
	Tue, 14 Feb 2023 17:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2D10E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:24 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id cq19so15760630edb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1VnqaeSXrO+gCHDWuaerBua6k+Y5bwVYRUkuUYOrlE=;
 b=YeeydWfoX2xfVh03xRn1ywPqXFmedWgX1EOrwzb3sUM0wWK8I6R8NL20s9kLEsC7Pt
 dII5UE0fby2W2wTs5fQKq5QNNLUZM2OgnezieqWsn9CTlG4JDeNEfxLOtNfVu/spvMbh
 BICjgaTIAzY87jk8CI1v3ZKWz695+D6jvea7jvz3PYjzuki+fvLevr2HCvcyT25cny28
 fSLFV3UX3VvCU9Xfgfu/216qdMVeQ3lXFcP/UCNfvJv+uhfM7Mp+GHw6kweh9DM+c6/R
 jVXBjr6SPlVCIK2pHwss49m4QatVKSFwZTHdRtAVT34Y6u6f+7BuoPShldWw9q+ImBmz
 Ruwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1VnqaeSXrO+gCHDWuaerBua6k+Y5bwVYRUkuUYOrlE=;
 b=fQQrKsfCuioRM9Ci0mOg/noRSDq/UixvET5RzQSF/SC1cYqK34b8ImgEgOGY4RURIN
 5hRftShSNuEhS1ydI6pDvvywEMxXz8jRKctdk2mgcWpwF0t9/oC9WAVT8CX06PKa/9ek
 H0pDskO7zwiWpN4C/GRp7OCwa28DwpCJcryBREag6rVZwkYHYalWAZryKioMNvszkFfv
 vLgEo7VmPw3/LqLvK7+NWRi29aL+lM3Fx2IWEEcdBUWw6oPb4P0f7EpU9zLzeOhaLQj4
 yqzG4K++RZ/3UMo8P9dDddJRZbIYXeAJEjKsVfxSjs0FR634DKc/5QzytXP0QIHcsWuY
 ThkQ==
X-Gm-Message-State: AO0yUKWgRuJIeA//f6DcocCGb65Q9fGoIBs+mcPQinzCoKEJH6GlUsTv
 +q5DVs0cTY6d+B6aGftA5oEGZg==
X-Google-Smtp-Source: AK7set8YiZfP/xwaOzQhPzlA/7gYfk6dMCXFLDqoEk9YJK72ZblW4knHYFjE0YxrGl+/HlIxgI5c9g==
X-Received: by 2002:a50:c304:0:b0:4ac:b2dc:8d51 with SMTP id
 a4-20020a50c304000000b004acb2dc8d51mr4339498edb.38.1676395944230; 
 Tue, 14 Feb 2023 09:32:24 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 10/14] drm/msm/a6xx: Fix up A6XX protected registers
Date: Tue, 14 Feb 2023 18:31:41 +0100
Message-Id: <20230214173145.2482651-11-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the protected ranges was too small (compared to the data we
have downstream). Fix it.

Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 503c750216e6..d6b38bfdb3b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
 	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
 	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
 	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
 	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
 	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
 	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-- 
2.39.1

