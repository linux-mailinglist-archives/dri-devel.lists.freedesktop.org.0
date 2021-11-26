Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DC45EB40
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CD66E94C;
	Fri, 26 Nov 2021 10:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655F89BF6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:23:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3C2961F46711
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637922183; bh=tC0SyAbEYha2W5DuJX/94Auu6fwRk+YS3BdMTsOqCdQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UxZ/ODblNQq6rPMmMzGLyqXXC0AE0V/nQ+htGUUpwUEQH0D779nSlUlFsHQNi307j
 juPEvS65RPTmfd/UjwP/UH8YE8coYc2sIJxyqdvF8pIjNOCHzKrkxn0jCmZ0WAFP+e
 e7UwH6W89PnouveUvnuxq1Tf/qdVrWOmAuxVbR/j3nroA1nkkERAE8fvQZKoxygEVk
 SVhFI2B9T2F4rGPmrgf7dj7j0bcplou6T7frX3lZjBvzriKau62r6WhbtLoFVct5vZ
 Wb9bNsUUWpigBdW2bqk6rMKPiCthm6xxEUH4rrYvi6SrfNChFgKfA4B3FpGsdSmgee
 VO72zcFnUhEEQ==
Subject: Re: [PATCH v6 5/7] drm/mediatek: dpi: Add dpintf support
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-6-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d7e5e360-0a0e-344e-0c96-8209403aad88@collabora.com>
Date: Fri, 26 Nov 2021 11:23:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110130623.20553-6-granquet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


Hello Guillaume, Markus



Strictly speaking about functionality, the entire series is totally fine,

however, I cannot give you a R-b on patches 6 and 7, since this code should

*really* make use of phy_get(), like suggested by Vinod.



In any case, for this patch:



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

