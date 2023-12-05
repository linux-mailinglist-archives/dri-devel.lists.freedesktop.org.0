Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F33804501
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53310E473;
	Tue,  5 Dec 2023 02:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE36110E469
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso2473025e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743649; x=1702348449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
 b=AHok73nVneLWhGOHYpLkXZHAH3f5+nxtxkAa7+oYVdnLDpGIlblBd4PfHI2xJueEtb
 GUfXEExlsghIVUed8Z2hyNgJWPQ7CM3edNmKrnAOZJ/TYTJQU0Ox6F4epuj7U2sCQP89
 LQRZdTqZvezd593KjsgsjsjiLFz0w57tuPwPDb6n90WDSzVCM+15GM9eB+GcThijZtN3
 GeVTFbZ2oJznCQMdAgoOyyz+DLIsD2jAMpFcoqVhV0pD6Nh8hT4kpiB/pTMoP72KbzfG
 TrpfH0nKvlnSDv7wpQbRuWY2dLjYImHGTvQwwr12L7UZUCxGuFCnVupumiT58+oY9kt8
 +agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743649; x=1702348449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
 b=sPoQlkUECrXwZnZ4iOSQyLZTDqeNbY0+iRtId4g/rzI2DSBXJoDEoX3W5i+iPW6bpk
 9e3IacAP3jX+hT9w3//C2Te63537I7Fqh+DRo+b1MA7M8WvBW8n/mEfmaYVa3IY3jAYB
 pl0Ikga3IsjupgIVBL3/U7KQQUdQHXH3y15jxZeNTjtZka1SS5azw8lfjnGaN6w4p1sy
 fkq7dl61wgX9yT3ktMByrd+Qre4nru2eBFz61mB73MAEm/Jg1Y/QMAwG885c0y6nDH4u
 I0PdbopHjUR67Td6hkGoIekW+oG8Ia17vmUCPVxHMjSqrCjsi8hGOfHvqJItIiYxOmfz
 RVRw==
X-Gm-Message-State: AOJu0Yy8nmXB9RMjPCTNl77bjPUWoAaj+bYVYh/pQi7r8xTmjbFWEt3Z
 GAo6aYZnmuRiYmKB5w4ha+4bug==
X-Google-Smtp-Source: AGHT+IG67aMeKoeDw3yoE/uU1x+gMjg4dCzQH2MkY+v8uyNXuNXe+gI3Tpdid7xpUI5eboGQBS4Uew==
X-Received: by 2002:ac2:46d1:0:b0:50b:e1ea:b61c with SMTP id
 p17-20020ac246d1000000b0050be1eab61cmr2454905lfo.49.1701743649146; 
 Mon, 04 Dec 2023 18:34:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v4 0/6] SDM670 display subsystem support
Date: Tue,  5 Dec 2023 05:34:05 +0300
Message-Id: <170174354266.1582017.6964573131829397385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Oct 2023 22:18:07 -0400, Richard Acayan wrote:
> Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
>  - move status properties down (review tag retained) (6/6)
>  - accumulate review tag (3/6)
> 
> Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
>  - rebase on series and reference generic sblk definitions (5/6)
>  - add interconnects properties in example (3/6)
>  - remove phy-names properties from dtsi (6/6)
>  - accumulate review tags (4/6, 6/6)
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf5a80695311
[2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e1af3ec823b
[3/6] dt-bindings: display: msm: Add SDM670 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c965007970ed
[4/6] drm/msm: mdss: add support for SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3c13a56e4353
[5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e140b7e496b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
