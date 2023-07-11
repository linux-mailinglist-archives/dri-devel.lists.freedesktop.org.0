Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F360274F1DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189610E3B2;
	Tue, 11 Jul 2023 14:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFD810E096
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so91970981fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085320; x=1691677320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DWVqty+49hJ6Ou5ZV1VCQ2wZFRYyEKX7786q3fgS8Y=;
 b=enn5A4LCsWyyvv2Jvz5C5NnQgsez56YVRG9VDJW+buVqdx2vuJhxjcAJUsWjRbwZtC
 2thZL55bvtxhhZNxpEesVyzWdwTWDTSvQ+KQnDdRPq64RZKbmXuX461+sVqUZMJz/+Wp
 KdwakIG/cO6e9wUtvEswrwU0NDSwoVGD7BnoNW9CS2rCXa3xeskoX6jAR/goObIPry4c
 EOL7cqrqr8QFcikdi9FdYFImPcNE7iI6PoeyHxCqZIf1ujuHz0BV6kmj0MPjEYJxOgPI
 m60R4qzPpsJaLGvx15SUf1zaT2eBp71sstXrXzqZsTUtyYl1ykkvbKgbD7iyV9ItA6ql
 JpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085320; x=1691677320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DWVqty+49hJ6Ou5ZV1VCQ2wZFRYyEKX7786q3fgS8Y=;
 b=Lane6c+1AMJO7dWWlP3K0C3MFq0iCHFxUIkLhzqAhTjLbDKnd6WGCkG25vIC7aF+3f
 fSGo2E3NccXooduiz7mb7tjZ2MVTO8RNgfD9RO1ihdXh6QJyeQLmS8qvkzGgkjDp1TaY
 NsqSEuwT5xAjj7Yj74Wxws21oVfYBKPpmxunHqYlzkXn3nuXRVrfaB/ZzPA5lb5aZSuv
 +YIjZFjLTII33CzRxVBodB7YOqS30UIjMHeqS3gdE/TFO0AWU8Sk/yCpK+l17Txkbw8h
 FD172AJrrXwWhXGpS4BTNrVTm2ZjQiO/Jt62TVyuI8qVicxp1vWzQWmllHil54ZaEyc8
 adrA==
X-Gm-Message-State: ABy/qLbVPtj5/G4yvmHJY3afR5W9IUvggGYikjrMdddHIlcXRqgMLeYR
 2YCHgy4QaphS0RlIGJ8kgw9pxQ==
X-Google-Smtp-Source: APBJJlGYIzCN54UshyQrjtzhpBdQPyx5aDjWikjVPne5sfVc51vjKTFMuCDQLmyuUUgVbJqPjHqFEA==
X-Received: by 2002:a2e:7a16:0:b0:2b6:ee6d:b647 with SMTP id
 v22-20020a2e7a16000000b002b6ee6db647mr13761996ljc.28.1689085319994; 
 Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 0/4] Qualcomm REFGEN regulator
Date: Tue, 11 Jul 2023 17:21:49 +0300
Message-Id: <168908465044.1869384.14451201608832170606.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 03 Jul 2023 20:15:53 +0200, Konrad Dybcio wrote:
> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
> responsible for providing a reference voltage to some on-SoC IPs (like DSI
> or PHYs). It can be turned off when unused to save power.
> 
> This series introduces the driver for it and lets the DSI driver
> consume it.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5cedc432fdf
[4/4] drm/msm/dsi: Hook up refgen regulator
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4bc71795761b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
