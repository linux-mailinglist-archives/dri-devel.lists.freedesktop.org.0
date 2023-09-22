Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFE7AB320
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F4A10E66C;
	Fri, 22 Sep 2023 13:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB03B10E66C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 13:53:45 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 284DF66072BD;
 Fri, 22 Sep 2023 14:53:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695390824;
 bh=WoiS3+8J2m0h7J1ZYU1c9DU2eQCub1jdA/yONAZ1bYk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QeM9MoNZ0/i5NssNN3eIMNJnh/KuVZ3GdFE4UdN3s1KKEbL+KzuAVB/ktU+FuhnJC
 2S/z3KiEBwnQuUKfuClAANB8gx1laSJWGF+dVNjSVsQibm/e4vVN6psO7SfYGcvB/O
 wd6txqBR8BO7J0rysd5/XpgWVU0bllFaaHRtRfQPlTCUh26jiIcFReYnN2yU+gCfqI
 Xidw9JbP3gAW8YpqOY5dmlydxyvDa2VschOrDhA/e7Y/qyiCUAq9Jz5eY7R923xCAo
 tCjp4fvc2Gd6CbX0qStK2UywRUBlsIjiX4tVIc2lKtP+QikTO5Dq5xf31grl3eStWs
 52QFxq9cMkqLQ==
Message-ID: <26cb3404-56ad-8e23-5da5-eee94c4c4350@collabora.com>
Date: Fri, 22 Sep 2023 10:53:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 0/7] drm: ci: fixes
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230914085426.883255-1-vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/09/2023 05:54, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> This series is intended for drm branch drm-next.
> 
> v2:
>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>    - Reworded the commit message for enabling jobs
>    - Added a new patch in the series to use scripts/config to enable/disable configs
> 
> v3:
>    - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
>    - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
>    - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig
> 
> v4:
>    - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
>    - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
>      This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

Jfyi, this patch got applied, see 
https://lore.kernel.org/lkml/169539077994.4014786.12440074307606036817.b4-ty@kernel.org/

Regards,
Helen
> 
> Vignesh Raman (7):
>    drm: ci: igt_runner: Remove todo
>    drm: ci: Force db410c to host mode
>    drm: ci: virtio: Update ci variables
>    drm: ci: Enable regulator
>    drm: ci: Update xfails
>    drm: ci: Enable new jobs
>    drm: ci: Use scripts/config to enable/disable configs
> 
>   drivers/gpu/drm/ci/arm64.config                  |  1 +
>   drivers/gpu/drm/ci/build.sh                      | 16 ++++++++--------
>   drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
>   drivers/gpu/drm/ci/test.yml                      | 16 +++++-----------
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
>   .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
>   .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
>   .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
>   .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
>   .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
>   14 files changed, 41 insertions(+), 26 deletions(-)
> 
