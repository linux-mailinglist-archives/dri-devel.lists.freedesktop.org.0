Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455DC68F1AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 16:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F60110E04B;
	Wed,  8 Feb 2023 15:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DADE510E061
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 15:11:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54511477;
 Wed,  8 Feb 2023 07:12:35 -0800 (PST)
Received: from [10.57.12.246] (unknown [10.57.12.246])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28A33F8C6;
 Wed,  8 Feb 2023 07:11:49 -0800 (PST)
Message-ID: <7e08656f-4908-43e3-57d6-2928b1eb12d5@arm.com>
Date: Wed, 8 Feb 2023 15:11:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/9] Panfrost: Improve and add MediaTek SoCs support
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/02/2023 10:37, AngeloGioacchino Del Regno wrote:
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;

Yay! ;) I never did like Panfrost dealing with two regulators.

> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
> 
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.

It's a shame to need a new compatible, but it seems sensible to me.

For the panfrost changes:

Reviewed-by: Steven Price <steven.price@arm.com>

I'll let others comment on the DT binding changes.

Thanks,

Steve

> Alyssa Rosenzweig (3):
>   drm/panfrost: Increase MAX_PM_DOMAINS to 5
>   drm/panfrost: Add the MT8192 GPU ID
>   drm/panfrost: Add mediatek,mt8192-mali compatible
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: gpu: mali-bifrost: Don't allow sram-supply by default
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 68 +++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
>  4 files changed, 99 insertions(+), 7 deletions(-)
> 

