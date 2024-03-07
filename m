Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488A87512D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8F10F1A3;
	Thu,  7 Mar 2024 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="caoii48l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65410F1A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709820177;
 bh=d5ZrSPOMf8VZYJPnucyZwra5gETQB13G5oByO6C2mU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=caoii48lwHcK1xcG+TAPUzL/eS5HeSb/LsgWexTktJAixdiQI16cuK6nevouFsAZ8
 pEXTZJAW7btyAXaakdrdUJI2WL/ah3ATANAeGsM/YkG6EdyitYXV1u8jmzWXzNsTac
 lpnIIoCajGPywjQDOqbvDiHN8GXUCsgvw80NHYV8tHSg3uLOdG7hqKonus1cHB9Ugn
 KEj2XZZBxf6ryRhOSysQDbxypgoaC+PeEzGxXYn9ZY+uD2yyZXAJ8eZwZI8mkeq2Oh
 +U918b9ptRJR989V6LeSKmktnIjN5//YsNQS77nY9rR7mZ9JhEy0I68pJf88D4JnSO
 q//F4HvUnGNnw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBABB3780624;
 Thu,  7 Mar 2024 14:02:51 +0000 (UTC)
Message-ID: <5559672d-4f62-4ad1-95b7-94f69b8bb9ac@collabora.com>
Date: Thu, 7 Mar 2024 11:02:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] drm/ci: Add support for GPU and display testing
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
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
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



On 06/03/2024 00:06, Vignesh Raman wrote:
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson, the GPU driver is
> panfrost, and the display driver is meson.
> 
> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run tests
> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
> Meson platforms.
> 
> Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
> tests to testlist. Have testlist.txt per driver and include a base
> testlist so that the driver specific tests will run only on those hardware
> and add testlists to the MAINTAINERS file.
> 
> This series also includes patch to add vkms testing to drm-ci.
> 
> Working pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1119859

Hi Vignesh, thanks for this patchset.

Just to confirm, the new convention is:

stages are named per DRIVER_NAME

jobs are named DRIVER_NAME:GPU_VERSION

xfails files and testlist files are named DRIVER_NAME-<xfails-suffix>.txt

Looks good.

I just have some minor comments/questions in the series, please check.

Regards,
Helen

> 
> Vignesh Raman (11):
>    drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
>    drm/ci: uprev mesa version
>    drm/ci: uprev IGT and update testlist
>    drm/ci: amdgpu: update xfails
>    drm/ci: mediatek: Refactor existing mediatek jobs
>    drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
>    drm/ci: meson: Refactor existing meson jobs
>    drm/ci: meson: Add job to test panfrost GPU driver
>    drm/ci: rockchip: Refactor existing rockchip jobs
>    drm/ci: rockchip: Add job to test panfrost GPU driver
>    drm/ci: add tests on vkms
> 
>   MAINTAINERS                                   |  14 ++
>   drivers/gpu/drm/ci/arm64.config               |   1 +
>   drivers/gpu/drm/ci/build.sh                   |   1 -
>   drivers/gpu/drm/ci/container.yml              |   6 +-
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  13 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |  28 ++--
>   drivers/gpu/drm/ci/image-tags.yml             |   5 +-
>   drivers/gpu/drm/ci/test.yml                   | 136 +++++++++++++---
>   drivers/gpu/drm/ci/testlist-amdgpu.txt        | 151 ++++++++++++++++++
>   drivers/gpu/drm/ci/testlist-msm.txt           |  50 ++++++
>   drivers/gpu/drm/ci/testlist-panfrost.txt      |  17 ++
>   drivers/gpu/drm/ci/testlist-v3d.txt           |  73 +++++++++
>   drivers/gpu/drm/ci/testlist-vc4.txt           |  49 ++++++
>   drivers/gpu/drm/ci/testlist.txt               |  84 ++++------
>   drivers/gpu/drm/ci/x86_64.config              |   1 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  26 ++-
>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  17 +-
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  15 --
>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  13 ++
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 ++-
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   8 +
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   5 -
>   .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
>   .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   2 +
>   .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
>   .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   2 +
>   .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
>   .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   2 +
>   .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
>   .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   2 +
>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  58 ++-----
>   .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  20 +++
>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  54 +------
>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  38 +++--
>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +++-
>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 +-
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  33 ++++
>   .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  20 +++
>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |  16 ++
>   41 files changed, 784 insertions(+), 245 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/testlist-amdgpu.txt
>   create mode 100644 drivers/gpu/drm/ci/testlist-msm.txt
>   create mode 100644 drivers/gpu/drm/ci/testlist-panfrost.txt
>   create mode 100644 drivers/gpu/drm/ci/testlist-v3d.txt
>   create mode 100644 drivers/gpu/drm/ci/testlist-vc4.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> 
