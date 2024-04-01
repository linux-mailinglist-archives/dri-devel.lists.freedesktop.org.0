Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F6894175
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC1010F2E2;
	Mon,  1 Apr 2024 16:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FLeMla2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9FC10F2E2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711989751;
 bh=GXcuHIR2aLO/M7Ecmuh2cNcHg4o55p5/3iz9GsdEEuA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FLeMla2dhSGBer1eeLDew6OlcTAsszh3tTYKvpleLNILDUQoXtl2CCAoyTEY/59MW
 VfE4OZa4qUH8+65sx1T436lSXsIFO4KYJ5w9ArWaTL3JyvkFn/BNlH6Ri8ZpXHX9US
 VCchsAC4WBt4lPajc9TWGshXpGbuyMlZH56IYIVTSfcYiTQxL8xOXHt55hzSLswC2K
 KsRsyld2ECMGlET09CYQlQGnv1/IagkVuRT2KvDchf8yQv6xofFzfV00vQouUCk88X
 NgUvvVgLs+gsuPy3gkeACyfNbLAMMZUstaUnMVusSCoC7VNPQl+DZM8LolhJGrvkHH
 67Ul2fNjclSJw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 61624378143B;
 Mon,  1 Apr 2024 16:42:26 +0000 (UTC)
Message-ID: <7f958855-0be7-47d4-9b58-036646534217@collabora.com>
Date: Mon, 1 Apr 2024 13:42:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
 <20240401061235.192713-6-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240401061235.192713-6-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 01/04/2024 03:12, Vignesh Raman wrote:
> For mediatek mt8173, the GPU driver is powervr and for mediatek
> mt8183, the GPU driver is panfrost. So add support in drm-ci to
> test panfrost and powervr GPU driver for mediatek SOCs and update
> xfails. Powervr driver was merged in linux kernel, but there's no
> mediatek support yet. So disable the mt8173-gpu job which uses
> powervr driver.
> 
> Add panfrost specific tests to testlist and skip KMS tests for
> panfrost driver since it is not a not a KMS driver and skip
> driver-specific tests. Also update the MAINTAINERS file to include
> xfails for panfrost driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, add xfail
>      entry to MAINTAINERS.
> 
> v3:
>    - Add panfrost specific tests to testlist and skip KMS tests for
>      panfrost driver since it is not a not a KMS driver and update xfails.
>      Update the MAINTAINERS file to include xfails for panfrost driver.
>      Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME.
> 
> v4:
>    - Remove the gpu suffix in job and rename xfails accordingly.
>      Update the MAINTAINERS file to include xfails for panfrost driver.
> 
> v5:
>    - Add powervr-gpu and panfrost-gpu jobs and skip driver-specific tests.
> 
> ---
>   MAINTAINERS                                   |  1 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  2 ++
>   drivers/gpu/drm/ci/test.yml                   | 24 +++++++++++++++++++
>   .../drm/ci/xfails/panfrost-mt8183-fails.txt   |  1 +
>   .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  8 +++++++
>   5 files changed, 36 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f7d0040a6c21..333704ceefb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

Note: We'll also need an entry in MAINTAINERS file for powervr (but it 
is fine to only add it once we have tests running on it).

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> @@ -1666,6 +1666,7 @@ S:	Supported
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/panfrost.rst
>   F:	drivers/gpu/drm/ci/testlist.txt
> +F:	drivers/gpu/drm/ci/xfails/panfrost*
>   F:	drivers/gpu/drm/panfrost/
>   F:	include/uapi/drm/panfrost_drm.h
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index d03d76692f0e..5b5d4a324659 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -111,6 +111,8 @@ stages:
>     - meson
>     - msm
>     - rockchip
> +  - panfrost
> +  - powervr
>     - virtio-gpu
>   
>   # YAML anchors for rule conditions
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index d8af670ee51d..adeb05bdb440 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -292,6 +292,16 @@ amdgpu:stoney:
>     variables:
>       DRIVER_NAME: mediatek
>   
> +.powervr-gpu:
> +  stage: powervr
> +  variables:
> +    DRIVER_NAME: powervr
> +
> +.panfrost-gpu:
> +  stage: panfrost
> +  variables:
> +    DRIVER_NAME: panfrost
> +
>   .mt8173:
>     extends:
>       - .mediatek
> @@ -315,11 +325,25 @@ mediatek:mt8173:
>       - .mt8173
>       - .mediatek-display
>   
> +powervr:mt8173:
> +  extends:
> +    - .mt8173
> +    - .powervr-gpu
> +  rules:
> +    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
> +    # Remove the rule once mediatek support is added for powervr
> +    - when: never
> +
>   mediatek:mt8183:
>     extends:
>       - .mt8183
>       - .mediatek-display
>   
> +panfrost:mt8183:
> +  extends:
> +    - .mt8183
> +    - .panfrost-gpu
> +
>   # drm-mtk doesn't even probe yet in mainline for mt8192
>   .mediatek:mt8192:
>     extends:
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> new file mode 100644
> index 000000000000..6f5e760d5ec0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> @@ -0,0 +1 @@
> +panfrost_prime@gem-prime-import,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> new file mode 100644
> index 000000000000..41a846a59644
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> @@ -0,0 +1,8 @@
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> +
> +# Skip driver specific tests
> +msm_.*
> +^amdgpu.*
> +v3d_.*
> +vc4_.*
