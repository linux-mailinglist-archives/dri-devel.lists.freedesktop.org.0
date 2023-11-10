Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6C7E7D04
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3EB10E09B;
	Fri, 10 Nov 2023 14:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CABE10E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:31:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 892B412FC;
 Fri, 10 Nov 2023 06:32:18 -0800 (PST)
Received: from [10.57.36.221] (unknown [10.57.36.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1A153F7C5;
 Fri, 10 Nov 2023 06:31:31 -0800 (PST)
Message-ID: <4e594d1e-5d9c-45c8-bffb-186615d69312@arm.com>
Date: Fri, 10 Nov 2023 14:31:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/panfrost: Turn off clocks and regulators in PM
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2023 10:25, AngeloGioacchino Del Regno wrote:
> Changes in v3:
>  - Fixed the order of set_opp/opp_put in patch [5/6]
>  - Clearly specified MediaTek SoC models in patches [4/6], [6/6]
>  - Reordered clk_disable() for suspend in patch [3/6]
>  - Fixed blank line removal and alignment in patch [1/6]
> 
> Changes in v2:
>  - Added hard reset GPU recovery
>  - Tightened polling time for soft reset and power on
>  - New execution time measurements after poweroff fix (see [1])
> 
> [1]: https://lore.kernel.org/all/20231102141507.73481-1-angelogioacchino.delregno@collabora.com/
> 
> At least MediaTek platforms are able to get the GPU clocks and regulators
> completely off during system suspend, allowing to save a bit of power.
> 
> Panfrost is used on more than just MediaTek SoCs and the benefits of this
> can be variable across different SoC models and/or different SoCs from
> different manufacturers: this means that just adding this ability for all
> could result in unexpected issues and breakages on untested SoCs.
> 
> For the aforemenetioned reasons, turning off the clocks and/or regulators
> was implemented inside of a capabilities barrier that shall be enabled on
> a per-SoC basis (in the panfrost_compatible platform data) after testing
> of both benefits and feasibility.
> 
> In this series, I am adding the ability to switch on/off clocks and
> regulators and enabling that on all MediaTek platforms, as I was able
> to successfully test that on multiple Chromebooks featuring different
> MediaTek SoCs; specifically, I've manually tested on MT8186, MT8192 and
> MT8195, while MT8183 got tested only by KernelCI.
> 
> Cheers!
> 
> AngeloGioacchino Del Regno (6):
>   drm/panfrost: Perform hard reset to recover GPU if soft reset fails
>   drm/panfrost: Tighten polling for soft reset and power on
>   drm/panfrost: Implement ability to turn on/off GPU clocks in suspend
>   drm/panfrost: Set clocks on/off during system sleep on MediaTek SoCs
>   drm/panfrost: Implement ability to turn on/off regulators in suspend
>   drm/panfrost: Set regulators on/off during system sleep on MediaTek
>     SoCs

Thanks for your work on this! I've pushed these patches (and 'Really
power off GPU cores') to drm-misc-next.

Steve

> 
>  drivers/gpu/drm/panfrost/panfrost_device.c | 78 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h | 13 ++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  3 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 21 ++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  1 +
>  5 files changed, 105 insertions(+), 11 deletions(-)
> 

