Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF28106B5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4243310E224;
	Wed, 13 Dec 2023 00:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AD210E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bee606265so6696137e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427856; x=1703032656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Qy64QWxJAPVkUwYgcUS97lSr6WwyxeboAAZZoCa+8s=;
 b=AeT/JwZOeo8Mdhssjt2by6KWPkawfyjMV8lA0D3ATkCpagp9Nq1CpWX3QIdiN5UhaZ
 Zy3e3on124wxbLpbb6j3bBq4e0adCetwOzClMeq4rnJlcJxhn+Pe/vvA9GqaxoKBHczR
 xeG9T6vBNslc06D8hHetvjjcB4FlLLLTfcMsd/IV+yBWlqlpNiX7Xgfv7i+w2R+YFazJ
 Ne9s/kS9d6xCD8l6LcBeBaWAE8S1iILdi8eu2vG88nq0jDhsD108v8dnZjuJ42c227cM
 5YD8Z8X6rYYEcQLIhKnYaxE/uu3wNGZpPazQihuZ05DOA8oC6l6T2eOkDHJ8ORnsxD6C
 iP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427856; x=1703032656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Qy64QWxJAPVkUwYgcUS97lSr6WwyxeboAAZZoCa+8s=;
 b=LZD9t4Sx8+dZg0hwZnY5suwP9Bncma9512QpFma57sCQl4sAiwRVqMfyyReIX6Nqx+
 sL3XDLIWku68LbicpI/QCZO98juXBskFBiLtZuIQIotKmVdBBS1bTyM7Rpf+evVl9YJY
 3AZN426GbV//X7bZVMfcgsKl9dDDvfwrZOjWnLTNtYvlSpzGJvai4Go02zq1vatqPUsy
 bgLNyheQQccLy1+S2IBvhlGuv1ZraAlW+1UpJX11JcyJ/PEEkC3I8mnyYocKyBh6h2Se
 cxMUQiwn3cMTyQ2w75/6AypYyVgtp+Nd//coExzkWKClakebQUfcT9grIr/+VhValQp3
 nHiA==
X-Gm-Message-State: AOJu0YxEj2Zbzzg4PMeaCz1FQ+oiHl0Ro69XeCzA6OSD/ypKddN3Gkr6
 vgoabHhY1XM3s3Ljdl3GcwsP6w==
X-Google-Smtp-Source: AGHT+IHQFt8OQIXxdl03CphfReY+l9SomhKym2TaxIOF+GkTzz6HHzUSRNBIZeYP3zSDGey6ZCAOVA==
X-Received: by 2002:ac2:5f46:0:b0:50c:14d6:ebce with SMTP id
 6-20020ac25f46000000b0050c14d6ebcemr2634065lfz.54.1702427855498; 
 Tue, 12 Dec 2023 16:37:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Wed, 13 Dec 2023 02:37:28 +0200
Message-Id: <170242755505.12964.13391263979827367977.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 10 Dec 2023 02:21:23 +0300, Dmitry Baryshkov wrote:
> Enable display output on the SM8150 HDK device. This includes HDMI
> output through the onboard DSI-HDMI bridge and DP output on the USB-C
> port.
> 
> Dmitry Baryshkov (9):
>   dt-bindings: display: msm: dp: declare compatible string for sm8150
>   arm64: dts: qcom: sm8150: use SoC-specific compat for RPMh stats
>   arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
>   arm64: dts: qcom: sm8150-hdk: enable HDMI output
>   arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
>   arm64: dts: qcom: sm8150: add DisplayPort controller
>   arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
>   arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
>   arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display: msm: dp: declare compatible string for sm8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0d196633771c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
