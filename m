Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAADEA323A3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5249610E843;
	Wed, 12 Feb 2025 10:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pZBLa4OU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D55D10E842
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:41:07 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso7287181e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739356865; x=1739961665; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1iDkFXJdTLoJv5QQSzaQMxwjFb0WaoMFN/yVr47274=;
 b=pZBLa4OUS+BfGA3OCOF/zbUHmV468X3w2cHL/0zIRWsB8ApkI/ibBWxScdC6HLvhkK
 eY+r/D09MZXlOmsPIJmpQQ81XDh7FTgnlQS06gyY6EeKjYFmf+N/doZQTorbHyIFGUx5
 bJWy1wvD/ydk5JN0qne+DG/HhwHOXWiJJ/6CbYJw25G/UaSw89c8WO1eUltRuSnIirIt
 7Q5r+9UOF2VQXjEnhTMT8iNgiZ3kGi1HVohRIwtp7pt+JCID7GzD46XwIFdEQcJWka5I
 cbi90uR3QO5w5e/UzTuR4/7ftuJ/CDbBJOTEAizjiihdvor8pASIQ0+HBouRKOXlWcOD
 4xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739356865; x=1739961665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1iDkFXJdTLoJv5QQSzaQMxwjFb0WaoMFN/yVr47274=;
 b=bz4+lo8bypbFEuXtDjFKQiYMMMorl84easRMeWy09pREndyspuC0yvfWADamlLOZje
 QqKe9/vLolKeKDK1jweALySgsUjWiJY5KPlTC+KGQVeQtR6ZfV8h8H9itOxfC1rX2C4S
 TgLP6xnVnozu6G2tyQm4AkEj5qUyVHn1BDugDnSmXEmFB2HFi7sDS7T1YGJseiS9yukr
 r4eUQhebxEv3fi8xVsFUStMfr7A+nM63OPy1jywKTGTF2XXaZwjVx4BxVrfEq5Zdl4Zj
 VCh+G6m4wZIsyKGuR/Db6pyjGr91Rdq3GEXLTmgDN6FNQhHF1i/uUlmZKrKqg4l1Rr5r
 tACw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViD9d1M33lf8NRlaH9t0GPFTjtgKG9J0Bw7ulTdRdsyvMsMSitEATkphbrIpG58NtNd1jq4i3p+OY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2ijN7bcN5alYhtTDBecAbTEzr8uFpggPKWkSP4JmzoystgadN
 beo/iVaa7Z5a37YWmiaFWxqervk5r73sYIjnQfJ7WuiX6aVJXf7nVJ77ck3YrUc=
X-Gm-Gg: ASbGnctbPxTCxqQh8hxSuP0kzNVqiSTZ1M1I3cK1JA7fXXtHVeDXS2ZEu97M6lOSwBg
 6G3B0M+5PzOgPVD+X/yzuLnA+0zl0OaRPRxQYXAPYAeANSzjJrJCZkOG3rnoD79H/pQnw36uWuK
 oyzjTVJNd38fKB0xz2235vkgVd4Gpp+IaiqGMNVoi0n+XahnGs2MkrvtGa9s4jOWktTwc3ti2vt
 M/s1kAVqPU7MMyyj4aRG4fEMGj7eezWqYjBZ3fLJrXwqqajiYBUL+4mQCAKwVmFZkYBjlAtuluh
 zhWEitomJ5HDdUpISAwMXKvNtnz6NtHx3j23uDVhZaAySQlsMHf9wPecMpHtvOy8VkmvHrI=
X-Google-Smtp-Source: AGHT+IFSoauwUmjTLIfP8x5XTTgpa0CFQaxSPV+VulxRisj6BoyUTlqKfWl0RYYwgy038tCn23zfGQ==
X-Received: by 2002:a05:6512:3054:b0:545:b49:f96d with SMTP id
 2adb3069b0e04-54517f86bf8mr848075e87.0.1739356865416; 
 Wed, 12 Feb 2025 02:41:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504a2d1d9sm1310680e87.56.2025.02.12.02.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:41:04 -0800 (PST)
Date: Wed, 12 Feb 2025 12:41:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <wyd7i47pkafa7n2yjohuvlh4btasxle4rw5xm55h4bhv24yvah@pfo224xz4xfl>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
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

On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> output. So not reuse sm8650 dp controller driver and will add a new driver
> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> to compatible with the qcs8300-dp.

NAK for a different reason: QCS8300 is still compatible with SM8650.
Enable features instead of randomly reshuffle compats. In this case,
enable MST for both architectures.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 359e364d79b20469d41cd8416a55b6a5d5c7d8ce..59075d7f05147f1f477f236a76fee6ec5d8c5ad8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -37,10 +38,6 @@ properties:
>                - qcom,sm8450-dp
>                - qcom,sm8550-dp
>            - const: qcom,sm8350-dp
> -      - items:
> -          - enum:
> -              - qcom,qcs8300-dp
> -          - const: qcom,sm8650-dp
>  
>    reg:
>      minItems: 4
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
