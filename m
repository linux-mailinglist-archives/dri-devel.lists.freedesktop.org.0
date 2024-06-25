Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8AE917469
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 00:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5011E10E26B;
	Tue, 25 Jun 2024 22:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mg532DEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB910E136;
 Tue, 25 Jun 2024 22:51:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 077CECE1F93;
 Tue, 25 Jun 2024 22:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115E8C4AF09;
 Tue, 25 Jun 2024 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719355889;
 bh=jmVxUGP2wgHlH5PGgGw/MkCtBLhGZ+aIfigrOSdtbbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mg532DEpIcDg24k1+ZRFtGIP14dLvDqfezYhlPBpCwOo/vYyJ6/+qh/utJzpDojON
 +x6n0zqf55Wrt4hzU362RxbCZVI0O8fymXLbHsHoA2Tb4PmgQok6tFGExp7gSOuKcl
 UoIBJoOazo6vMysvsMU0KylCDriqL+VDND8/T61UVa/YNBqJAQZMgBn1TLuyFuPGb6
 Wn7xhD9Ezr+GZqTTw7ynPD4NC4HmAax/9PuzhduOh3gRyz6JF1/apKDenjYk6ExxEv
 LIzRiyUqEb/vOpMCC5ggKsIHT7I7ccRq3f1bEGfzfs84/I7E9JOZNiDI/JPqKTCAbE
 SGrvMOYhoyTZQ==
Date: Tue, 25 Jun 2024 16:51:27 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not
 applied
Message-ID: <20240625225127.GA361957-robh@kernel.org>
References: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
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

On Sun, Jun 23, 2024 at 02:59:30PM +0200, Krzysztof Kozlowski wrote:
> dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for

That should be just since db9c05a08709 ("validator: Rework selecting 
schemas for validation") AKA the 6x speed up in v2024.04.

> given binding validation if the schema contains compatible list with
> pattern and a const fallback.  This leads to binding being a no-op - not
> being applied at all.  Issue should be fixed in the dtschema but for now
> add a work-around do the binding can be used against DTS validation.

The issue is we only look at the first compatible. I'm testing out a fix 
and will apply it tomorrow assuming no issues. With that, I don't think 
we should apply this patch.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index b3837368a260..8d1b515f59ec 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -17,6 +17,18 @@ description: |
>    management and support to improve power efficiency and reduce the load on
>    the CPU.
>  
> +# dtschema does not select nodes based on pattern+const, so add custom select
> +# as a work-around:
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,adreno-gmu
> +          - qcom,adreno-gmu-wrapper
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
> -- 
> 2.43.0
> 
