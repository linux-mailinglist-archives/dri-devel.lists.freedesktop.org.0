Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422789416C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 18:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5F810F2DE;
	Mon,  1 Apr 2024 16:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xLbIBnl7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8545E10F2DE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711989729;
 bh=WopZIv1m6iHVZ5GAyDRjVH14xeI4Hdv9HeL4nql8kK4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xLbIBnl792sEhVS0hA7Ot1TsA6aXkyC3C/5TeYVOON+ULaJIJdlN8xkPR8yjC9OEK
 XB/LkzmhZy2/RHHSmut0sdP3JKhqkRiDPj2kAOQq252/UgQ6MNvJXZHRIfRDS4OvIP
 gqQW4by8jd6/CK06lRraJl+ZaZp4FGt1Vod8Ht3qWXJFVTzaGzjK1fU2hmebQpBD97
 fqJUuhFhOa1qj2VOAfLEWJAd7TBx56b6sFqkIer3HaTyVRUPpBQsfDAsXqURGIF98j
 GfGJce3xojpChU/ofabShSxisAE2x9OI+txzlIOYDgS0D7nosofAPPpuxTOFBdgGtU
 M+oQeOKIFQG/w==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E30A2378143B;
 Mon,  1 Apr 2024 16:42:03 +0000 (UTC)
Message-ID: <f4b6cb98-0146-4f9c-a1ed-3324da01ca16@collabora.com>
Date: Mon, 1 Apr 2024 13:42:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/ci: mediatek: Refactor existing mediatek jobs
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
 <20240401061235.192713-5-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240401061235.192713-5-vignesh.raman@collabora.com>
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
> For mediatek mt8173 and mt8183, the display driver is mediatek.
> Currently, in drm-ci for mediatek, only the display driver is
> tested. Refactor the existing mediatek jobs so that gpu driver
> testing jobs can be added later and update xfails accordingly.
> Since the correct driver name is passed from the job to test gpu
> and display driver, remove the check to set IGT_FORCE_DRIVER
> based on driver name.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - Refactor the patch to rename job to indicate display driver testing,
>      rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
>      script since it's now set by the job.
> 
> v3:
>    - Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME. Also update xfails.
> 
> v4:
>    - Remove the display suffix in job and rename xfails accordingly.
>      Remove the change adding job name in GPU_VERSION.
> 
> v5:
>    - Add mediatek-display job.
> 
> ---
>   drivers/gpu/drm/ci/igt_runner.sh              | 10 ---------
>   drivers/gpu/drm/ci/test.yml                   | 21 +++++++++++++++----
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 15 -------------
>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 13 ++++++++++++
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 21 ++++++++++++-------
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  8 +++++++
>   6 files changed, 51 insertions(+), 37 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> 
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index f1a08b9b146f..ce6e22369d4d 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
>   set -e
>   
>   case "$DRIVER_NAME" in
> -    rockchip|meson)
> -        export IGT_FORCE_DRIVER="panfrost"
> -        ;;
> -    mediatek)
> -        if [ "$GPU_VERSION" = "mt8173" ]; then
> -            export IGT_FORCE_DRIVER=${DRIVER_NAME}
> -        elif [ "$GPU_VERSION" = "mt8183" ]; then
> -            export IGT_FORCE_DRIVER="panfrost"
> -        fi
> -        ;;
>       amdgpu)
>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
>           mv /install/modules/lib/modules/* /lib/modules/.
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 612c9ede3507..d8af670ee51d 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -282,14 +282,17 @@ amdgpu:stoney:
>   .mediatek:

Maybe we could s/.mediatek/.mediatek-device, so we know we are not 
talking about the driver name, what do you think?

>     extends:
>       - .lava-igt:arm64
> -  stage: mediatek
>     variables:
> -    DRIVER_NAME: mediatek
>       DTB: ${DEVICE_TYPE}
>       BOOT_METHOD: depthcharge
>       KERNEL_IMAGE_TYPE: ""
>   
> -mediatek:mt8173:
> +.mediatek-display:
> +  stage: mediatek
> +  variables:
> +    DRIVER_NAME: mediatek
> +
> +.mt8173:
>     extends:
>       - .mediatek
>     parallel: 4
> @@ -298,7 +301,7 @@ mediatek:mt8173:
>       GPU_VERSION: mt8173
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
>   
> -mediatek:mt8183:
> +.mt8183:
>     extends:
>       - .mediatek
>     parallel: 3
> @@ -307,6 +310,16 @@ mediatek:mt8183:
>       GPU_VERSION: mt8183
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
>   
> +mediatek:mt8173:
> +  extends:
> +    - .mt8173
> +    - .mediatek-display
> +
> +mediatek:mt8183:
> +  extends:
> +    - .mt8183
> +    - .mediatek-display

 From the code, panfrost was being used in IGT_FORCE_DRIVER for mt8183 
no? --> never mind, I just saw the next patch handles panfrost case. I 
guess these two commits could be squashed (up to you).

Regards,
Helen

> +
>   # drm-mtk doesn't even probe yet in mainline for mt8192
>   .mediatek:mt8192:
>     extends:
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> index ef0cb7c3698c..c63abd603b02 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
> @@ -9,28 +9,13 @@ kms_bw@linear-tiling-3-displays-1920x1080p,Fail
>   kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>   kms_color@invalid-gamma-lut-sizes,Fail
> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> -kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
>   kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>   kms_cursor_legacy@cursor-vs-flip-legacy,Fail
>   kms_flip@flip-vs-modeset-vs-hang,Fail
>   kms_flip@flip-vs-panning-vs-hang,Fail
>   kms_flip@flip-vs-suspend,Fail
>   kms_flip@flip-vs-suspend-interruptible,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_force_connector_basic@force-load-detect,Fail
> -kms_force_connector_basic@prune-stale-modes,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_plane_scaling@planes-upscale-20x20,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
>   kms_properties@get_properties-sanity-atomic,Fail
>   kms_properties@plane-properties-atomic,Fail
>   kms_properties@plane-properties-legacy,Fail
>   kms_rmfb@close-fd,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> new file mode 100644
> index 000000000000..64b30c092c85
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -0,0 +1,13 @@
> +# Board Name: mt8173-elm-hana.dtb
> +# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
> +# IGT Version: 1.28-gd2af13d9f
> +# Failure Rate: 50
> +# Linux Version: 6.7.0-rc3
> +
> +# Reported by deqp-runner
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> +
> +# Below test shows inconsistency across multiple runs,
> +# giving results of Pass and Timeout/Fail alternately
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> index 67d690fc4037..91cd1c4ec068 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> @@ -1,13 +1,18 @@
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> +core_setmaster_vs_auth,Fail
> +kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
>   kms_bw@linear-tiling-2-displays-1920x1080p,Fail
>   kms_bw@linear-tiling-2-displays-2560x1440p,Fail
>   kms_bw@linear-tiling-2-displays-3840x2160p,Fail
> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@primary,Fail
> -kms_plane_cursor@viewport,Fail
> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
> +kms_color@invalid-gamma-lut-sizes,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_flip@flip-vs-suspend,Fail
> +kms_flip@flip-vs-suspend-interruptible,Fail
> +kms_properties@get_properties-sanity-atomic,Fail
> +kms_properties@plane-properties-atomic,Fail
> +kms_properties@plane-properties-legacy,Fail
>   kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> new file mode 100644
> index 000000000000..5885a950fa72
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> @@ -0,0 +1,8 @@
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
> +# Bug Report: https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
> +# IGT Version: 1.28-gd2af13d9f
> +# Failure Rate: 100
> +# Linux Version: 6.7.0-rc3
> +
> +# Reported by deqp-runner
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
