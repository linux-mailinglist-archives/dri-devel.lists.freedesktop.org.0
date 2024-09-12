Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCB976379
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A098210E855;
	Thu, 12 Sep 2024 07:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JEH0b/hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114910E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:52:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso821821e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127563; x=1726732363; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eTkWSFh0slefdYYlB8sOq3Alq45nxHEpvtMyVah6e0Q=;
 b=JEH0b/hiBKJIYpdK2L6ojmChOOy7xZypatmjvzJbiTbfvJ5kv6g/BhhyQViqQ0v297
 zkK67xOP+2uWO9S/aW58hNzhBDkBuKTj4CoT1gfqgvKFG4k8xRVKBCRYg4J9jaqcdUkh
 2NcZc/Rde266SXx3D85O9dt7SLr9bVlV7psLnSj0iYRjjeDJIPgAeX+aI6rd1kJyfxKI
 zs8Z7dLnsVR80F4a15T7CyaqP/wozVHyVY6YuXM+zkOzUYh380tdalNHPi+vl6lzLLoo
 mmBBeoss+XYSsAhc5H2ibMOwEloUSuf4FdAVOVDILuCyeeC0Ba+20pCXw1NUSwO/O9IY
 ANRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127563; x=1726732363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTkWSFh0slefdYYlB8sOq3Alq45nxHEpvtMyVah6e0Q=;
 b=qkEVKimb6QVqieK/i+Lpzt0N3+U9WAczmjqDBKzGZi8AJfXCX2OycRFpnod9MkfIBA
 HijMqLVadXW0dZN+cPJiwyIBXNQCfYL33lMgpAN9It2WEIYq3b3qioem22dqPE6Rjuv/
 JSVyrc/y2aiGQZYOzlPlMQBhfLGFIxgwXndO5WWC1VRNLTi9kMzUFbJ/8P6cvolp7H+v
 kfVoSA5nsPmEAD6e6lT3AxlFzkAt6yinB2Preykjm5jOwCvrxv+1FnkQ8loqxE5/2RQm
 EgTonxUdS75ojmcmjT/GJrYtJ0oEqUOEOACTuieiA+S/xluOK2FuOhz3E4r7t18SYhf0
 aFEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ+8XIcgAr5yUOQhsmjRxsQ9nG3aFVqaK/ENHcyEngg6Tljc1grE++oA/KdY5nUn4dH+24ATRX7Kk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgVfqvjUCR9M28/mG+MNgob/El1e99OtA9dKAX+lLQ1bLjH+D/
 Ag6MDRSFLxx4GhczRbop0lqquhlvNK+48GBTARnEM9NRO8X4C0IO+pJhbcx0o/8=
X-Google-Smtp-Source: AGHT+IFreFJR91Jk0jO+3GaqJhwxC3JIon4VS/a8wOCAEnO6MaGHHHfffcWsljomGO5+V5BT8hHE/w==
X-Received: by 2002:a05:6512:4029:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-53678fec4fcmr1533271e87.52.1726127562565; 
 Thu, 12 Sep 2024 00:52:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8caba6sm1832730e87.169.2024.09.12.00.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:52:42 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:52:40 +0300
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
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for SA8775P
Message-ID: <73tpotwk5xotzpbbikzx2jx5re2i3g5w2ze3zqm2yrqcrt3ncx@oyid2nlcu65l>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-3-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-3-quic_mahap@quicinc.com>
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

On Thu, Sep 12, 2024 at 12:44:34PM GMT, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.

Please fix errors reported by DT tools before submission.

> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> new file mode 100644
> index 000000000000..4e1bf5ffa2ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> @@ -0,0 +1,120 @@
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
> +      - description: Display hf axi

AXI

> +      - description: Display ahb

AHB

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
> +    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sa8775p.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sa8775p.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sa8775p-dpu";
> +        reg = <0 0x0ae01000 0 0x8f000>,
> +              <0 0x0aeb0000 0 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> +                 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus",
> +                      "iface",
> +                      "lut",
> +                      "core",
> +                      "vsync";
> +
> +        assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> +        assigned-clock-rates = <19200000>;
> +        operating-points-v2 = <&mdss0_mdp_opp_table>;
> +        power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +        interrupt-parent = <&mdss0>;
> +        interrupts = <0>;

empty line

> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

empty line

> +            port@0 {
> +                reg = <0>;
> +                dpu_intf0_out: endpoint {
> +                    remote-endpoint = <&mdss0_dp0_in>;
> +                };
> +            };
> +        };
> +
> +        mdss0_mdp_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-375000000 {
> +                opp-hz = /bits/ 64 <375000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-500000000 {
> +                opp-hz = /bits/ 64 <500000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-575000000 {
> +                opp-hz = /bits/ 64 <575000000>;
> +                required-opps = <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-650000000 {
> +                opp-hz = /bits/ 64 <650000000>;
> +                required-opps = <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
