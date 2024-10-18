Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B129A3C6E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 13:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765C510E8EA;
	Fri, 18 Oct 2024 11:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S1zvOSUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E6510E8ED
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:59:58 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539f53973fdso1527087e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 03:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729249197; x=1729853997; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BDn3B2qj/hHbMDyr6HsfzwkGACEwdcb5vmYA2V4zZBg=;
 b=S1zvOSUqADsH2yXJEy07yCQNCKaojSokGftzdoT/J+S5++CKqo6lwrOiJlofOT4FPP
 uy3UJIt+thDmHg4XHM6WSayUotWUNM+2g+pzZglMrSdBQvgh4WmKgx8AwWrp1RBzHEzO
 b5DabgTn+tsfipynSuBipV7HpB10HCTzhkXkbaMLI2Gg3UgtiLb2erE5px8tBnOlbVYm
 pZ7rFZy8pDaZHWJlbldnQUwu0k/eLhrSmO5opCpoH77YJA1mlpKNbyW4n/bpR4dc503d
 dLTNhMB2d80Nh6D9S8WDe64i3Doow9bGIuXkmkVu0FpWe/HGw6iedoAJQ2WwGM3ohRBp
 2kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729249197; x=1729853997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDn3B2qj/hHbMDyr6HsfzwkGACEwdcb5vmYA2V4zZBg=;
 b=Lw9erBLgkRWQPzH60nWLS8es7Ag2tF/bTQhUKv1ri3r+4pR7DwY1TJQ/Hsxw3hwDvM
 y13EpdR1hVkGohSgXFWSS87OFcxxWTNuys5NDdLb7N6t+rpYsN9AXaoPQIuHXZOzkWs3
 ThSia9ES4+HAUhZpHzDTtfIxQx77n4090XXpvi/4QeHiyQ26ZaLckJxqj+q9yU1spIDD
 HCAuKNTzaxWJ4G0WTZZKjQ6B+ZtEBya+d8cBnZN3hPC7ayLPeYZWtmpmJMqF7qBVEREX
 eTl7LkD26RNO87dXPVQrExh16NOjNgL1T+4eb37BVukFJ6qQM/wWegS3R0au8J6QpeNJ
 NX3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyR2mTABHlRPHk7ydbnJR6dork5nm5x0CJARtDHqgFHksvS54ly3uHDzjm2ugeLp7kyLlVRb6EEG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxk4ykQCDYKecYJWna1EGdNbxwcGURmOwdiulmIo230LvI3Y7i
 60ZTCrzBqyIg+sduIoStY3wI9yK0iaErPrVTmAAyYhbjg7AVESb8Frm3ctdNtV8=
X-Google-Smtp-Source: AGHT+IFBl+2v8OAQ2fIrh0HeP3N6htiMXETE/IwmKI/CVl5P5tYrY6ccHdNQQtQ0wLclVVrPfSoqVg==
X-Received: by 2002:a05:6512:3094:b0:539:f539:73b2 with SMTP id
 2adb3069b0e04-53a15845c77mr582804e87.12.1729249196684; 
 Fri, 18 Oct 2024 03:59:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0d71sm185759e87.166.2024.10.18.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 03:59:55 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:59:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com>
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

On Wed, Oct 09, 2024 at 08:02:01PM +0530, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++++++++++++
>  1 file changed, 241 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..37c04ae6876f873c2cddc51b5160b1f54e2b5118
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml

[...]

> +
> +        display-controller@ae01000 {
> +            compatible = "qcom,sa8775p-dpu";
> +            reg = <0x0ae01000 0x8f000>,
> +                  <0x0aeb0000 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                     <&dispcc_ahb_clk>,
> +                     <&dispcc_mdp_lut_clk>,
> +                     <&dispcc_mdp_clk>,
> +                     <&dispcc_mdp_vsync_clk>;
> +            clock-names = "bus",
> +                          "iface",
> +                          "lut",
> +                          "core",
> +                          "vsync";
> +

It's been more than a week since Rob reported issues with the bindings.
Any updates? Obviously I can not pick up patches with binding errors.

> +            assigned-clocks = <&dispcc_mdp_vsync_clk>;
> +            assigned-clock-rates = <19200000>;
> +
> +            operating-points-v2 = <&mdss0_mdp_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            interrupt-parent = <&mdss0>;
> +            interrupts = <0>;
> +

-- 
With best wishes
Dmitry
