Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64368996659
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAF710E294;
	Wed,  9 Oct 2024 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MVJ0xQTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCE010E138
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728468095;
 bh=yOp0NvImxbBTVc57uS8Sx//uC+khLg+Tk6wsD0DGbDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MVJ0xQTnYZR94WuYkCWwYcsuy6YLWhhKTXsPzouu5dQ6DYBslc3Jt9mzfRrklehvg
 XeVVoVcvFZ2PuR+gcstE3Wp0TsHHpQllffj/ERLVmnN+rki++mY7yU1HROcieNHA1W
 gP+d4CRN/7LmC4hRpwhzjMallThcgz6pwfhhHnJ+dM6rgGfR/US/lYHEnM4EhB6uPA
 YodryI9xvPRGEwwh+rMVV+rdQzq/hKthbGHj4J8LniHm93Ff8I6d1eg1R4DAjmLW3h
 DrHbU6vDGbiViAFP6MC8rXkc//fIImKsorDeKxFXyW8CGUVjDrDXd85/7aTaAPcT97
 KledHZ4R/o5VQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CB78E17E1232;
 Wed,  9 Oct 2024 12:01:34 +0200 (CEST)
Message-ID: <59470ed7-621b-43c5-82a0-9384df7c7e9f@collabora.com>
Date: Wed, 9 Oct 2024 12:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
 <20241009034646.13143-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009034646.13143-2-jason-jh.lin@mediatek.com>
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

Il 09/10/24 05:46, Jason-JH.Lin ha scritto:
> OVL_CON_AEN is for alpha blending enable.
> For the SoC that is supported the blend_modes, OVL_CON_AEN will always
> enabled to use constant alpha and then use the ignore_pixel_alpha bit
> to do the alpha blending for XRGB8888 format.
> Note that ignore pixel alpha bit is not supported if the SoC is not
> supported the blend_modes.
> So it will break the original setting of XRGB8888 format for the
> blend_modes unsupported SoCs, such as MT8173.
> 
> To fix the downgrade issue, enable alpha blending only when a valid
> blend_mode or has_alpha is set.
> 
> Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


