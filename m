Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC97B516CB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593D010E911;
	Wed, 10 Sep 2025 12:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R/T4K4kZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0148A10E911
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757507094;
 bh=XG4risedyzhaJlFOa2WbFkhBXqEGFq2jhFHoD1cXqr4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R/T4K4kZw5G7rkwD5a0Sq4j+YyADMkBxO1OodOyptZG1TrjWeBBUNrGXwz07dGe/i
 aMdRNzMIysVJHM5r1dTVZWwgU6IN4udQAQxWsCN4JGGrEghdzLo0fHGImO7R7GKIZq
 qRKwszp+DXoEE6PwPhewnq/V2q1DDhdD5D6GbU7xDN/8QMoJh6VTaNhR/bfbM3RGce
 zrL3xlJn9wusBsIhmsO0npRkyFeAR00ja0YWxjfTPU/aVfd8NwVStvIFAQFmBx+UK7
 0MnQDnXFDohowKRnJ4qxWqWOXgR+qrk+W3eVT5Aw4JGJk/VzvKRTmD1Eq1eSOV7tbY
 Nvg8B3JMLxGsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DDD0A17E0125;
 Wed, 10 Sep 2025 14:24:53 +0200 (CEST)
Message-ID: <4367758f-77d8-460c-887a-946b1c7cdd68@collabora.com>
Date: Wed, 10 Sep 2025 14:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/19] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
To: Paul Chen <paul-pl.chen@mediatek.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
 sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250828080855.3502514-19-paul-pl.chen@mediatek.com>
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

Il 28/08/25 10:07, Paul Chen ha scritto:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> To support multiple mmsys instances in the one mediatek-drm instance,
> providing improved flexibility and scalability by the following changes:
> 
> 1. Add DDP_COMPONENT_DRM_OVLSYS_ADAPTOR* to probe the
>    ovlsys_adaptor drivers and support different mmsys composition.
> 2. Added new component types MTK_DISP_VIRTUAL to support the
>    routing to virtual display components.
> 3. Added and adjusted the existed structure or interface to extend
>    the support of multiple mmsys instances.
> 4. Modified the component matching and binding logic to support
>    multiple mmsys instances.

This commit is huge and a bit difficult to read, but also you have split the
changes description in four points.

Please, split this in four commits, for each of the changes that you're actually
describing in the description of this single one: this not only makes reviewing a
bit easier, but will help understanding what's being done in case any uncaught
regression shows up "after the fact".

Thanks,
Angelo

> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_crtc.c     | 342 +++++++++++++++++++-----
>   drivers/gpu/drm/mediatek/mtk_crtc.h     |   6 +-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 105 +++++---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  85 +++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  13 +
>   6 files changed, 421 insertions(+), 132 deletions(-)
> 
