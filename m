Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0D907AD3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742B410EB4A;
	Thu, 13 Jun 2024 18:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6D110EB4A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:16:31 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7C4593EF1E;
 Thu, 13 Jun 2024 20:16:28 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:16:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
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

On 2024-06-13 20:05:04, Dmitry Baryshkov wrote:
> Command mode panels provide TE signal back to the DSI host to signal
> that the frame display has completed and update of the image will not
> cause tearing. Usually it is connected to the first GPIO with the
> mdp_vsync function, which is the default. In such case the property can
> be skipped.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 1fa28e976559..e1cb3a1fee81 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -162,6 +162,22 @@ properties:
>                  items:
>                    enum: [ 0, 1, 2, 3 ]
>  
> +              qcom,te-source:
> +                $ref: /schemas/types.yaml#/definitions/string
> +                description:
> +                  Specifies the source of vsync signal from the panel used for
> +                  tearing elimination.
> +                default: mdp_vsync_p
> +                enum:
> +                  - mdp_vsync_p
> +                  - mdp_vsync_s
> +                  - mdp_vsync_e

When discussing that these should be renamed, was it also documented what the
suffix means?  I can only guess something like primary/secondary/e...?

Are the mdp_intfX variants missing here that you're handling in patch 7/8?

> +                  - timer0
> +                  - timer1
> +                  - timer2
> +                  - timer3
> +                  - timer4
> +
>      required:
>        - port@0
>        - port@1
> @@ -452,6 +468,7 @@ examples:
>                            dsi0_out: endpoint {
>                                     remote-endpoint = <&sn65dsi86_in>;
>                                     data-lanes = <0 1 2 3>;
> +                                   qcom,te-source = "mdp_vsync_e";
>                            };
>                    };
>             };
> 
> -- 
> 2.39.2
> 
