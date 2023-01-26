Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804FD67CFC2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CE710E2A3;
	Thu, 26 Jan 2023 15:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77B10E154
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v13so2121419eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=lKSIVY86+zq1xPchzjtResCxNKdOQBD6iUh60NPp69Mm9Vz1hpxXqAJiRUp+UuRoXm
 rt5+/jiDHZQ1nzJf5+m3JmJM4zM4Zbo6j/u9Vc1w0NqwQo/b0ETnG+rnARcvyzzs3qUh
 Mq8WNgi3QKGMpG4B7u1/qOeBxXzBErww35/dMfAfILy8tdEusUwccHpXn4UlNxBXbK0F
 nD0VUFe5qA0F7SIk1rnZ8yWLjk1Cj4hWAPdZxwJSI4BLkbfbkuVwt+XIrkvrNRSyy/uV
 GZZa4OfbKq246VX45TGaOTQ/rwQCpKh3mFUOxpYZKiCQT2pSKsG2l8229l7wXcHP9GUo
 4X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=5oFGilg9Je9kFDIHz0witeRsTky3vQSXxHzUIt3fuXs6wougJ0o1ugqzrTgGS3g4Tj
 xuclH84kaUQnI0VtIMOn2MNNJ/8N+iWXvzuxC2/OKcuaODrzrq+quewlpK+B80yIJ3TV
 oes6zsXE027vOVzict/mTxvp1MrbfNBvAPyDXykuxmhpQWiFh/4xOxtSvz7ny+LuVuE6
 CcM/v57KdbueonCwz4+XXrVFnOQLj5Qke4S5GW7XCoVSZFgEBloXUB1KPuX0HtTNB4Kz
 CFTWDjw2KtaRGt0iRWPf9Ih/WUfERBg+1vXDEtigcsrZmQoFUpKB0z0DebBQZuLdkKhN
 +HCg==
X-Gm-Message-State: AO0yUKVV2vO9d6i8mhIrKHcKk2hdO1Hc4HbSWdFFwjizKrI74F1YGek+
 jAgF0fFOjGUdDIW2UCeaoAUdq/SROL8dB9c6
X-Google-Smtp-Source: AK7set/prHz6j9mKe+q0SVim8Gk8tLhMF7E/oyiHuu4Cq5/Ipb7BZO9a0zhELcam1t9manYuz9ECKA==
X-Received: by 2002:aa7:cfc5:0:b0:4a0:b978:4533 with SMTP id
 r5-20020aa7cfc5000000b004a0b9784533mr3622092edy.32.1674746248802; 
 Thu, 26 Jan 2023 07:17:28 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 05/14] drm/msm/adreno: Disable has_cached_coherent for
 A610/A619_holi
Date: Thu, 26 Jan 2023 16:16:09 +0100
Message-Id: <20230126151618.225127-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These SKUs don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..82757f005a1a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
+
+	if (config.rev.core >= 6) {
+		/* Exclude A610 and A619_holi */
+		if (!(adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), config.rev) ||
+		      adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), config.rev)))
+			priv->has_cached_coherent = true;
+	}
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
-- 
2.39.1

