Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E474F1E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA610E3B9;
	Tue, 11 Jul 2023 14:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB45910E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so9128987e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085322; x=1691677322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+V2uuNbOn3Muk9n8CeQ4nOJuVUNz0Zj/TDQmddJIhU=;
 b=S9dQ47SwbBW3oGPhUV8DPizCswnKCe5cJCWx8pO66iA0Mbo5IdI48lHD9Rph7lIy13
 jyKNclwutD4Sbme/JtyALBG9fN2Lyub51h2oUK1OlUtrxo+WlPfNb0zqp+/sRfneJf0W
 RWkWUTngS5QuTK9/9q30zmY4E4UODCZR7EZEKMNJLo4/Lmf+Z3ziTmWkxTfXe9NM6h1j
 eOV2lZKbZyce0WDnu2zdVBJOMukOjBr4gvcFjZSep72SmZ7oBZ2f5yywx73nNq1pf+PQ
 RAEjXJZmE78aFKULmdiDma95XStiGIc0BpFAdLrKKxkpIkKUQtdXk76iGLBuosEiG7ea
 hwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085322; x=1691677322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+V2uuNbOn3Muk9n8CeQ4nOJuVUNz0Zj/TDQmddJIhU=;
 b=VlYODr2Fq1eAwqrdp8yZlX1wPckaQk1zPwpOtFio/WETIMMSgL18BumsekmFsJFn8r
 SA5FeMpfAN4dVM5R5kmVzAZ+af+xJ+29BLejSzxT5hTenoc6OkEdGi8z2GqwZMbg5xFX
 CD70WkslXQ5ryiQKpLbOlOd+XemZ25kODenHz2w8Dhve4V+vTo3/IDviGfyCxD+3LFCm
 7Qu7jQALBP30+b7mK4SpVFaXisuGWcHJLiFpxiV3VEZBhgfBms/U9kFMlZAYhuv0zya6
 lOl8MP/JXmdjAlABa/trypGrXGlaj3+4opfUXx4ZSqvOw2j4WFIVsK9OVNS1hk3yRsZR
 eaVg==
X-Gm-Message-State: ABy/qLZnzBsLyD5F2U7ItTFiY7GiXuT4PEp8wK0epQ2bZNjzsnh5RgWX
 2PjFQDoF+e/mBEQaEMotRuH9mA==
X-Google-Smtp-Source: APBJJlE/mNiHcKUnyFMHAWcIULKZ7SEoMxh6r0VW3F2iROzDvMcbdiDX2kWWpW+2f/2YQIxM3E4gIg==
X-Received: by 2002:a2e:7c0c:0:b0:2b6:cf5e:5da0 with SMTP id
 x12-20020a2e7c0c000000b002b6cf5e5da0mr13185789ljc.40.1689085322058; 
 Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] dt-bindings: display: msm: document the SM8[345]50
 displayport MDSS subnode
Date: Tue, 11 Jul 2023 17:21:51 +0300
Message-Id: <168908465044.1869384.13770179079731144435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 23 Jun 2023 14:32:52 +0200, Neil Armstrong wrote:
> Document the displayport subnode to fix the bindings check error:
> 
> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)
>         From schema: Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> 
> And same for SM8350 and SM8450.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: sm8350-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c474443b723a
[2/3] dt-bindings: display: msm: sm8450-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8d3850881242
[3/3] dt-bindings: display: msm: sm8550-mdss: document displayport controller subnode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a1506d2fd7a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
