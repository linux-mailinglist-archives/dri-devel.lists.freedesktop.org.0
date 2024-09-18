Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67C97BA9E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 12:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B0810E4D3;
	Wed, 18 Sep 2024 10:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g7h4R+JP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866E10E120
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726654521;
 bh=ngZrcRDlM5CWBR80rje1RK9nTLokmmBXmMbbHkuM5P0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g7h4R+JPJFvG4wo1gZY7K4fOAOoEr3AxH6k0hlsP107hvZuoX1yw40g28rTlRMLAN
 WrMwDCBsKpC6YBCS6pdHcSDj2039i+wY8tlhox3wumHROkpM2QIFLnJA6F3ubh6ofZ
 AOX/MIr13YAAHxA0O/LKMCr1HDR3K5wHnVuQcgVWe3exr60QqdcGuTl55e+I9wwg1I
 VK0e25qb0YzPKbNRZRxXsMKSx/IP2D1pvgCH3l8vW9AaTOIMT0Qdvo77Hkyu0kpY6M
 fwx9hxH0scgNWr+4weo+1aFK8+DLQ1sk+cdUpeFmy6wPeTKNvZ/90DvMDr31VZXm5y
 HyJgXpMIkZqpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B497917E10AE;
 Wed, 18 Sep 2024 12:15:20 +0200 (CEST)
Message-ID: <92a8d48f-e109-461b-bb6a-29da98a444ad@collabora.com>
Date: Wed, 18 Sep 2024 12:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/mediatek: ovl: Add fmt_convert function pointer to
 driver data
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240917164434.17794-1-jason-jh.lin@mediatek.com>
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

Il 17/09/24 18:44, Jason-JH.Lin ha scritto:
> OVL_CON_CLRFMT_MAN is a configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> 
> Therefore, the fmt_convert function pointer is added to the driver data
> and mtk_ovl_fmt_convert_with_blend is implemented for MT8192 and MT8195
> that support OVL_CON_CLRFMT_MAN, and mtk_ovl_fmt_convert is implemented
> for other SoCs that do not support it to solve the degradation problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Awesome.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


