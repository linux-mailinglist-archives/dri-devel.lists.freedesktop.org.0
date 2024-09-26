Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5A9873FF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CE910E27E;
	Thu, 26 Sep 2024 13:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f4L/Ms5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9E410E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:00:24 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f75c6ed397so9946001fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727355623; x=1727960423; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8VbPVLJo90gF6bloxyF3+VghcH4b6zy2e3AKb4JKXSg=;
 b=f4L/Ms5ENqlmN5YN6kswbW1ifvskX19MD45/h7Tyf8cwWh62m30YuJ0p8fS66nTdUI
 xy7YecoXyDpSeWTmZDBpcV6PwTW3ttipvxQxfjhYOF9xzzNXG+hA4/5x4RWlHOPttiKX
 uT+iKebyTqCGx6SeOHPSzkERxjtT79mc/lMXhPM8mKThZEGRAd+nL2OFxk99Pu7YfFkt
 nk7as/K8FnsIovqVyLRu54gAGz6ZAtUCKReDm/9p1167uNC9m896P00CM45a15hZIbf5
 +GOkUvCyX0hW5HxzweQUaRoIBruaSnA7l2FCdA155o3TsSvjZRYNP7wBtMqZjp41N7dh
 Z5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727355623; x=1727960423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VbPVLJo90gF6bloxyF3+VghcH4b6zy2e3AKb4JKXSg=;
 b=T/1PNpRzuhUatAtytSfwQt31NVIVpsllQCQ4CQ3Dc365jpQitU/Uni1TF/ZFd2O6ZD
 LDWzmZtNeqztfOcPQ0GzT0lXoApuD5fJkFS8ixwbyC/M3nK9feDYvYLVUAqnowaGoW0A
 6wMQzXpnm9G0q1yVW6E6f34bS2l5C1QQckXIINLYIItQVjgI85m7qAtbXVFp3R7j2OrY
 lBaHyGVDR0dyg4A2ppl3zZhCz8Z0YWDT4qpggWZJx0EXciF38Rt8+Tzk9TUa9pJ+0Hp4
 pYIqpmwdCuilYUPVYnap0pMVL2+WLyzv7aMTW7GJlzt4oywJzNxMnoPkIO/ds21b7Ef+
 T4KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX5xClmJ0JbbYs/4Ng8x4qz+g2DuKSBU8YRWV4gaEaFVHqlQoTdA1/KG/A3V7tJCnZJBi+V1s+IIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw23z+RR8P1/8ARooQLMfRp7mF18I6p5fYBCz8rUptV7gsHeayj
 lPu0SvDY6ucpxDCk4e0Fh27gmAjo/GQ7Nq3xOSImV1hmLjCUYi9TiF02DNsrgOw=
X-Google-Smtp-Source: AGHT+IFGi69LdpsEvft8/gS6khZ1h2DKOt4lRFK2QIM9OQPs45u9Jci7vJjN3PDBuQNJ9jEkKW2v6A==
X-Received: by 2002:a05:6512:230b:b0:536:55a9:caf0 with SMTP id
 2adb3069b0e04-538693aaac7mr4063854e87.0.1727355622822; 
 Thu, 26 Sep 2024 06:00:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e0d1bsm792908e87.19.2024.09.26.06.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:00:20 -0700 (PDT)
Date: Thu, 26 Sep 2024 16:00:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH v2 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P
Message-ID: <rp6z2xpaeshzoa34r3wptbx6ovv3gl46qorovlxk65ccrgfon6@fhcba7scaczu>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-3-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926110137.2200158-3-quic_mahap@quicinc.com>
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

On Thu, Sep 26, 2024 at 04:31:34PM GMT, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
> 
> [v2]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in binding example. [Dmitry, Rob]
> - Capitalize clock names in description. [Dmitry]
> 
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> new file mode 100644
> index 000000000000..435e4c028bb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SA8775P Display DPU
> +
> +maintainers:
> +  - Mahadevan <quic_mahap@quicinc.com>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8775p-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display hf AXI
> +      - description: Display AHB
> +      - description: Display lut
> +      - description: Display core
> +      - description: Display vsync
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: lut
> +      - const: core
> +      - const: vsync
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sa8775p-dpu";
> +        reg = <0 0x0ae01000 0 0x8f000>,
> +              <0 0x0aeb0000 0 0x2008>;

Same here. 0x0 instead of just 0.

> +        reg-names = "mdp", "vbif";
> +

-- 
With best wishes
Dmitry
