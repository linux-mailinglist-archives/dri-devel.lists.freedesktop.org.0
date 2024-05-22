Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33538CC377
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 16:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B47E10E4FD;
	Wed, 22 May 2024 14:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dGDVyM7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FEA10E4FD;
 Wed, 22 May 2024 14:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5143662A22;
 Wed, 22 May 2024 14:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D54C2BBFC;
 Wed, 22 May 2024 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716389147;
 bh=zOLj0B1mXhNR7COAnE/xY+vZVUvYeUNisjjhU/v/78g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGDVyM7ZQxZ3mpqoZ0uhm34b69z0buP3Izb2n9ZgDU3+feXDZN7rWMsfogNl/ivGd
 ZkOAdNJ/Kvsxhp2jbQUCeHEVB77MA58eAIqHjgwvaKK4vyI7Ub5LuB9dqnNCF+DhwE
 ovMWw1bpVyslIl/cA9hcyo1AA2jOwzt0Wj56GpgScEy5KJd6iMVTMavHx4ezyLckJE
 9uhsM39ri9aB9l3ro4ikqpIw+EkV+pduVJRl10bDw81LjIpB+4U/KexmhpSUUvniZV
 wfhM3c1ds+Dye2DNIyECRmbiYEQss2mYZ8gRrj1w7Gf0mFdkXkKX/aRWtnI96dXBzJ
 C4GWk6Z2ruZYw==
Date: Wed, 22 May 2024 09:45:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <20240522144545.GA3271320-robh@kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
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

On Mon, May 20, 2024 at 03:12:43PM +0300, Dmitry Baryshkov wrote:
> Command mode panels provide TE signal back to the DSI host to signal
> that the frame display has completed and update of the image will not
> cause tearing. Usually it is connected to the first GPIO with the
> mdp_vsync function, which is the default. In such case the property can
> be skipped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 1fa28e976559..c1771c69b247 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -162,6 +162,21 @@ properties:
>                  items:
>                    enum: [ 0, 1, 2, 3 ]
>  
> +              qcom,te-source:
> +                $ref: /schemas/types.yaml#/definitions/string
> +                description:
> +                  Specifies the source of vsync signal from the panel used for
> +                  tearing elimination. The default is mdp_gpio0.

default: mdp_gpio0

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
