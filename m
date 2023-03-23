Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC456C6193
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 09:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781010E1FB;
	Thu, 23 Mar 2023 08:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4B010E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 08:24:11 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E24946602083;
 Thu, 23 Mar 2023 08:24:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679559849;
 bh=UWXuvXPQgmw3d6w9F651414Ya/jCWnC0G3/dbhij6o8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DHfAr2uw3MKKXcYNKcEuDgZIWwbPq2uARctq8NYrQvUzyrWqVXhYzfgbiEUQtrWri
 0DtdQ87CpsW9bdDtxpQf0osiDTPSMPbHDMEx5wGQ3c1dMOk7dotCL0a30KqCKS7wAb
 4tLsZ+2UQ0O7fzQ3N+cK2HLwZ5X1DqrnyLEQaI/7GwhW9oXSq/MS25Wk9Fg5e7ggYI
 wnBehdiT1v+WIN//HJWALbjXjx5bUDbLM3z961HdU8vE85urUMaK2K5Ssg6HJn66Sb
 CMOV4fnuy9hRxtZjUx7f3x+CFjtLnueIQsqzWuXzDcd3lP3GXR4L80QsXzH3vbLUDn
 MJQqkhwTLE8Hg==
Message-ID: <0800ffeb-c7c4-1671-173e-1529b8eeb12c@collabora.com>
Date: Thu, 23 Mar 2023 09:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 00/12] Panfrost: Improve and add MediaTek SoCs support
Content-Language: en-US
To: airlied@gmail.com
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/03/23 11:20, AngeloGioacchino Del Regno ha scritto:
> Changes in v5:
>   - Changed minItems for power-domain-names in base schema as
>     suggested by Rob
> 
> Changes in v4:
>   - Refactored power-domains and power-domain-names exclusions as
>     suggested by Krzysztof
>   - Small changes in MT8192 bindings addition
> 
> Changes in v3:
>   - Changed MT8186 bindings to declare only two power domains
>   - Added a commit introducing MT8186 specific platform data to
>     panfrost_drv
> 
> Changes in v2:
>   - Add power-domain-names commit from Chen-Yu to the series
>   - Kept sram-supply in base schema, overridden for non-MediaTek
>   - Added Reviewed-by tags from Steven Price to the driver commits
>     (as released in reply to v1's cover letter - thanks!)
> 
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;
> 
> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
> 
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.
> 
> Alyssa Rosenzweig (3):
>    drm/panfrost: Increase MAX_PM_DOMAINS to 5
>    drm/panfrost: Add the MT8192 GPU ID
>    drm/panfrost: Add mediatek,mt8192-mali compatible
> 
> AngeloGioacchino Del Regno (9):
>    dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>      variation
>    dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
>    dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
>    dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power
>      domains
>    dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>    dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
>    dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>    drm/panfrost: Add new compatible for Mali on the MT8183 SoC
>    drm/panfrost: Add support for Mali on the MT8186 SoC
> 
>   .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
>   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
>   drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
>   4 files changed, 123 insertions(+), 4 deletions(-)
> 

Hello maintainers,

this series is fully tested, fully reviewed and fully ready.

Can anyone please pick it ASAP, so that we can finally get GPU support
on MediaTek SoCs (including lots of Chromebooks)?

Many thanks!
Angelo
