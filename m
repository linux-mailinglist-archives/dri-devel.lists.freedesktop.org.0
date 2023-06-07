Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29347272D7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149C510E56E;
	Wed,  7 Jun 2023 23:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A42010E56E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:20:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso63859e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180005; x=1688772005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyY/6IODHDlyeeop9FZuaK8o19bhh4JMPkyiNt+oF7I=;
 b=A9Vo0XkJIpgWyLRpiuu4l+nqzYPZyLpVqVdvCiGXgVQ1bC5U/NMMhRPj2tMBh1pHlz
 4E3UGxsRvR8xbq/CTMWAZEoIbXITXi8fPElZ5zapepohNCtK/0DWv/89o6AXmp0itP2O
 TWMW2xpyJylMKi+csThqo2mUbBuD8VdyBd3oySuu7CTWcEQDRdQv4GdGXv03pHoJastY
 B3nTDZc8VnZ9emMvGY4b/6QPd2nP+3NfvlmtSsvIqXvj+O+ehhxQAoT3W9qganeqYX/+
 icJ+rMTamrIocafOYueceNpwIpEAWwRFJ2UcGgRoTmfT0X3GKxwB29afKvLfGfk0+K58
 iEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180005; x=1688772005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyY/6IODHDlyeeop9FZuaK8o19bhh4JMPkyiNt+oF7I=;
 b=lNBoB6dnDFQhv4P7Jv8gh4YeUc3LNOXsvVqGdArfyurJrs3j/XzStqFDJ0c1TQygkD
 +uNMP3r2ZsBhBByY+wTJvpFwPBUEg2bXdecnCXic+frr3hN3/yW4JY8VIdwcpHzTizxG
 xj3EXbQ7rrWuThtNl8Xsqyy4mFUNVdBjbSq6UWrc/IJ2/eHANSchMZoXZvoaUt24XGpa
 ubvHjL0t5whVMWPDO3yVBtnhKlxjqC7FABTJpSnrt/22AongBdiwix3y/O5qFB7I32H6
 E1ce9Pf8naV6fuDda6JqZu8E0SEwLJLZmWfMG4gCbu46eRAhwBubVUzGfuj7eSsraFRC
 dc6g==
X-Gm-Message-State: AC+VfDyfndhrc8zOTbcbPdm/4JInfUY64CYZXBgnn4zarugjR3ffGV1r
 m4s3dOjU1cF1XgxMEOuLH2bxFQ==
X-Google-Smtp-Source: ACHHUZ7hRM7SbUTZb8qBUPmUIUaSTu0RbpCLtAbbhmsR/dpPRr3/MkmoarjoWZTP2QKK3G21z5N7rg==
X-Received: by 2002:ac2:430e:0:b0:4f6:2e4e:e41b with SMTP id
 l14-20020ac2430e000000b004f62e4ee41bmr2199648lfh.3.1686180004908; 
 Wed, 07 Jun 2023 16:20:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 h18-20020a197012000000b004f00189e1dcsm1908952lfc.117.2023.06.07.16.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:20:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v6 00/12] SM63(50|75) DPU support
Date: Thu,  8 Jun 2023 02:20:02 +0300
Message-Id: <168617996601.1879421.15966890603577062057.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 06 Jun 2023 14:43:51 +0200, Konrad Dybcio wrote:
> v5 -> v6:
> - Drop unnecessary items: level in bindings
> - Use INTF_SC7180_MASK for 6375 to avoid enabling DPU_INTF_DATA_COMPRESS on DPU6
> - Pick up tags
> 
> v5: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: display/msm: dsi-controller-main: Add SM6350
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e99b2d0670a7
[02/12] dt-bindings: display/msm: dsi-controller-main: Add SM6375
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27a869221bb7
[03/12] dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ed41005f5b7c
[04/12] dt-bindings: display/msm: Add SM6350 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3b7502b0c205
[05/12] dt-bindings: display/msm: Add SM6375 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a5c1021bc77
[06/12] drm/msm/dpu: Add SM6350 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3186acba5cdc
[07/12] drm/msm: mdss: Add SM6350 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c2c1217e61bd
[08/12] drm/msm/dpu: Add SM6375 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/27f0df03f3ff
[09/12] drm/msm: mdss: Add SM6375 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5ff3d3a0a09e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
