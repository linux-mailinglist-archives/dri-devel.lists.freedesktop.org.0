Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CB55FD5E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC710E4B6;
	Thu, 13 Oct 2022 08:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724110E4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:04:14 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C7C16600371;
 Thu, 13 Oct 2022 09:04:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1665648252;
 bh=25+d+lS9LpCgKrZZzeawH6MfibiSiTO8j22wJ0cLF6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fgaUyPNTI3PfFltOYEWs+sk9OVHW15ESqD/X4JbTjYBBsXy6JGxKq4O19yvojtkFI
 qFilDW+I9BUlofzfAOy3KaxvdKtpVh4Ne/c4yRz/2F/P+1yv27umBmIyYRzBX+DPDM
 SumyNvrG336hNUddNvCPxQPt3rXHsx45Dsq2Hs8sun6m6cI7pRpE6BoIeHqA7fPzYd
 lL4gQYOy0n26lxEcDErUsfvpWpONvGkWjab3JuTUQveeI7kiIy81GMRhN8jmOijge9
 oDK7oqTEhkdv0YYIRn+y/Nhywyr6YkKsT50HntK9O1JYP5Bbd2SQkIb3lwi/wqFS5n
 +S1HnieHcUXVA==
Message-ID: <0559d2a5-1b8c-67c5-0174-cd069d33218e@collabora.com>
Date: Thu, 13 Oct 2022 10:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org
References: <20221012191226.1646315-1-greenjustin@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221012191226.1646315-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/10/22 21:12, Justin Green ha scritto:
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 90 +++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 37 +++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h |  8 +++
>   3 files changed, 131 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 002b0f6cae1a..3f89b5f5064f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c

..snip..

> @@ -335,9 +396,10 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   		addr += pending->pitch - 1;
>   	}
>   
> +	mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);

I'm sorry for not noticing that in the previous review - there's only one
more issue here: I'm not sure that *all* of the MediaTek chips have the
AFBC bits in OVL_DATAPATH_CON... this may be clashing with something else
in the layout of (very?) old chips.

The solution is simple here. Please, guard this call with:

	if (ovl->data->supports_afbc)
		mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);

...after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo
