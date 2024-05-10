Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71E8C2B98
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C9910E3CA;
	Fri, 10 May 2024 21:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VV6lfcdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112710E3CA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:16:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CEFA0CE1EED;
 Fri, 10 May 2024 21:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C08C113CC;
 Fri, 10 May 2024 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715375775;
 bh=K6EhDqPaBDztZnvn/KM7LNk+8HMiGpLYxVSS9Ir0nE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VV6lfcdMZ0TEjobmN5Nzgr3+3HR8pdRWF9d4Tnw0OacGPSKaGVHIlittLNo2vJrfJ
 WHLsw1Dx9SSdjnHP4Fhea7jUQT/K8F1xt0pv0S6o4tbO96gx8ONtXYiIxV8Ygv75/z
 cjjqP5ML5eRiwqhovQDS7Jn+mbuVBzCvMGuR3sY1ujFgSBscZGBPlVpB0GxKWihM+x
 oJby08HePcWDP3vAiw++HgLIOXapLAZhB5wBd8C6bIHJgBlLXLI9v5UD8iDVlG0OIJ
 JOPmRKvMgaHqPzMpyxQ/KyLFhe1F00hbYN+rFEm5Esg2qTTXN82HpuFrjbU1d95o1Y
 eE2aByExTAlpQ==
Date: Fri, 10 May 2024 16:16:13 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
Message-ID: <20240510211613.GA751688-robh@kernel.org>
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-6-panikiel@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507155413.266057-6-panikiel@google.com>
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

On Tue, May 07, 2024 at 03:54:08PM +0000, Paweł Anikiel wrote:
> Add a DisplayPort bus type and a multi-stream-support property
> indicating whether the interface supports MST.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
>  include/dt-bindings/media/video-interfaces.h               | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 26e3e7d7c67b..7bf3a2c09a5b 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -94,6 +94,7 @@ properties:
>        - 5 # Parallel
>        - 6 # BT.656
>        - 7 # DPI
> +      - 8 # DisplayPort
>      description:
>        Data bus type.
>  
> @@ -217,4 +218,10 @@ properties:
>        Whether the clock signal is used as clock (0) or strobe (1). Used with
>        CCP2, for instance.
>  
> +  multi-stream-support:

If MST is a known term for DP, then perhaps "dp-mst-support" for the 
name. In any case, 'dp' should be in there somewhere.

> +    type: boolean
> +    description:
> +      Support transport of multiple independent streams. Used for
> +      DisplayPort MST-capable interfaces.

Wouldn't this be implied by the devices at each end of the link? The 
drivers for each device should really list out features supported for 
the link. The mode used is then the union of those 2 lists with DT 
properties only used when the union is not definitive.


> +
>  additionalProperties: true
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> index 68ac4e05e37f..b236806f4482 100644
> --- a/include/dt-bindings/media/video-interfaces.h
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -12,5 +12,7 @@
>  #define MEDIA_BUS_TYPE_CSI2_DPHY		4
>  #define MEDIA_BUS_TYPE_PARALLEL			5
>  #define MEDIA_BUS_TYPE_BT656			6
> +#define MEDIA_BUS_TYPE_DPI			7
> +#define MEDIA_BUS_TYPE_DISPLAYPORT		8
>  
>  #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog
> 
