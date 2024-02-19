Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F59585A33C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62C10E382;
	Mon, 19 Feb 2024 12:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wGVxy9wJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95C210E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:46 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512b700c8ebso835251e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345844; x=1708950644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
 b=wGVxy9wJQwXRkIYhKA+/aeWCwX66QeGM71n1aOS0TJ9kfoSt06E9XfLk2Fq+6buHQX
 bwFdJE09DvmpTiuzZzO3RRs3AIMLWwDzsZFb6YxvWT+YJD3PuijuOtpKNZ/d4vHdv/m8
 IxC/F+FSdGMK0GffeGwZ0MuAR8hk9y30pQNhYfQyxCLHtlKy0ZI1kQtkkyhubf08oqWP
 kq77bw/7QrtXjRlGRyu+yKFOVRsZoVYFefdbibwDqv/w0728vVtfuYQ5WPs1IDdmQiLr
 7GIWAzjsJLRQpcbdsLgowih/bglHGijA+m2lhopgOwTRTcNVP8wdLA9zTZCOC6yYItqn
 TJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345844; x=1708950644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7cz6IUziBIbxMgivwszuy8eOIkjtw8gK8yFchWpzBU=;
 b=Xtd3Hvoz9kllJRWnwW8FCSc/wOVvghDcWlm0bEX7oeuMkKi+08eBBwXvMy3V383BkA
 wBI+Bff3SDUqh//EzJQthQdB8hIFjz19i5MsLAgxORGy1yG0PTH0l+VCymb104Yiq8UO
 Kf2h2hBp9VsmEVthpA8xaPPy3DcYZaIK8MgzRPeSVApV3l/L5innd8wdWQ9IQvCOoZUL
 8ym9D6mlLofTDcZolgqr3Xp8bHNLJHTaGBsKauy9E+6Xrxk/yw3d5IpL0NQSh5H7iCHD
 DUgA1g+tz1vtYnq/GfEXnJx/8UhjMqnx97vdS/ZD0lOXlQiT2VHNPJt1WWybbxdUSL/g
 quQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9tJrPAgXCUXJ1Sz0Btcww+JPIQxu9R0ZVze1HomucF2ldxdeAhFt8oeVwlZjnLSEAV7XpK4+yc4CAFA7rtOLBULeHOYcsRnf14NSSXebe
X-Gm-Message-State: AOJu0Yy7d1wt3mita4FRvPA5loverGC61TOWfP0j7M+s9hSBOIEj3SlJ
 3064DjZXRP2TTnSE0I077FwKUMgCXQdNrkoFc+exTgWukHBtUuy9eTOdu5zHedA=
X-Google-Smtp-Source: AGHT+IGoP4Kc9T7+0vrUb3lFQohpsZ0w3oy4cAILJsX2XN0cHTj8EK4Nqbp0ilMeo3oHJesO9tXkfA==
X-Received: by 2002:ac2:5e8d:0:b0:512:912f:4bb with SMTP id
 b13-20020ac25e8d000000b00512912f04bbmr5296326lfq.68.1708345844597; 
 Mon, 19 Feb 2024 04:30:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 19 Feb 2024 14:30:30 +0200
Message-Id: <170834569497.2610898.8605974222285085772.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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


On Sun, 21 Jan 2024 20:40:58 +0100, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Adam Skladowski (8):
>   arm64: dts: qcom: msm8976: Add IOMMU nodes
>   dt-bindings: dsi-controller-main: Document missing msm8976 compatible
>   dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
>   arm64: dts: qcom: msm8976: Add MDSS nodes
>   dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
>   arm64: dts: qcom: msm8976: Add Adreno GPU
>   arm64: dts: qcom: msm8976: Declare and wire SDC pins
>   arm64: dts: qcom: msm8976: Add WCNSS node
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: dsi-controller-main: Document missing msm8976 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/db36595c6889
[3/8] dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b63880de42b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
