Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27A80989C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A2C10E9C7;
	Fri,  8 Dec 2023 01:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DA210E249
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:25:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c9f7fe6623so18383991fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701998721; x=1702603521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/z8ttjuthA9TvzbZIjtwgrrvCWpxqoAfEEPAXm+j5bk=;
 b=P8dSJ9hRkKixWwn5SWqCmtZviiOHRkZ8SE+8BoPgA8uZsMkKXx40IGxYR45jPv/6yD
 Bz91/lfyaYVI18hfGl1FRNou+EfmtVq4Bw80/J2BRRZUY3v3J+dsWzk/9uCX3GZvw9yX
 KUf/EAR65+7Adsllln+rNiTXd3ddFNedbOW/IB3YcFMu44fSndraZozvC+XlwDucgHyo
 /HPNukhvOJLK7OrCYBWzslJLUTuCiZKZYO4tUqX0v+BC5+/snnFTxa5ja50XQ/lHXKrl
 oCAqv3wfOfOB1tlzEnpbfVopX4zolr6z+a9mS1/1d7I/jw1AV+Hr69rnV1H1vZscfKGh
 RQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701998721; x=1702603521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/z8ttjuthA9TvzbZIjtwgrrvCWpxqoAfEEPAXm+j5bk=;
 b=vAzP2ogZSps4zHZbyX37e6K0HagCKHFwtnm5jzYhQ7Bocm12vaxZm3PfR97FyRL3Xx
 jSln8cr3lxKA9p8YAq+KlpcC6IdmQirFPRRvr4nzluDp8KAupeurIHxrzBOMKenKoaBr
 SvL7R3Q9tOyadVBmGXPrmoOK1AqXgVoZgVkwWjjrMd81+XUSBcbOCWQd0EQYkYXPzP3K
 qVziQU8kDFrfl9SaBuo0hYisQSOqJryHYlKVx2F4YL2dI1hBN3LwqGD74eMNbQxKivRG
 qmdwHLC3HFBHcDPGQvKPbVZhZ9e9buTrF3xaAD7fe7/0vv7gT98zYtOm2yiiLLh8+RYi
 8KVA==
X-Gm-Message-State: AOJu0YydlP4VtfuCUm7kqF3Kp3bufMCBA0XupQzc2iCJEJSKx/neEZt5
 jtYUiiSHt482e/eu50VJRpOePw==
X-Google-Smtp-Source: AGHT+IED1aYK3F3bcWEyFFjhG4PnuYCSof6Qej8fBdgpS3Q3VImntL1MaQ3H87zPoqDDxO/1vki0ng==
X-Received: by 2002:a2e:a407:0:b0:2c9:feda:3923 with SMTP id
 p7-20020a2ea407000000b002c9feda3923mr1320753ljn.77.1701998721804; 
 Thu, 07 Dec 2023 17:25:21 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a2ea4ba000000b002c9f58169a8sm88639ljm.120.2023.12.07.17.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:25:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 0/3] arm64: qcom: sm8650: add support for
 DisplayPort Controller
Date: Fri,  8 Dec 2023 04:25:19 +0300
Message-Id: <170199868358.3399536.1110149612486448094.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 07 Dec 2023 17:37:16 +0100, Neil Armstrong wrote:
> This adds support for the DisplayPort Controller found in the SM8650
> SoC, but it requires a specific compatible because the registers offsets
> has changed since SM8550.
> 
> This also updates the SM8650 MDSS bindings to allow a displayport subnode,
> and adds the necessary changes in the SM8650 DTSI to declare the DisplayPort
> Controller.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: dp-controller: document SM8650 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/157fd368561e
[2/3] drm/msm/dp: Add DisplayPort controller for SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b2d98bdd7b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
