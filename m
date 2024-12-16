Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32809F2EE7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B838110E599;
	Mon, 16 Dec 2024 11:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z9xq+i5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B9D10E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734347490;
 bh=9FtWM9F33hvv9T4AE+nNxA94QLDsh/3495wx1tvpwyI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Z9xq+i5xhImHLW55YgRgyEM7IxDe+HmaSOrf0Zsc0OGHHFQUa0zpFwMALNHsBpZvx
 fW3WVEjFFWkfTxL4yAF0SBxbn+Bv9U6GjmnTtRACleNMQFr+7yrKBZI1M2uvfvroap
 KlhtHqNj4Mjar6nNVz2TGvz/MT7HEuqOiHXj/3Zqg9ho4Pqwr3/G3C2CyyNJle4Hgn
 YhpxTsAddiSSs3Zc5WklrygwBJUEf2i4dAIlfWbGcXOnAMqIJhdNZ4hXh10YKH96PD
 QovxEt34OTdZqKkMRsrM/xtqCC97tt4FMHjsHRvi8BunwIbL/HjFN/rEDWQ+KA+aQy
 C/Ao+3IuatAzQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3BF817E3634;
 Mon, 16 Dec 2024 12:11:29 +0100 (CET)
Message-ID: <adb6356b-19ea-4350-a691-3487d42c9fe2@collabora.com>
Date: Mon, 16 Dec 2024 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if AFBC
 is supported
To: Daniel Golle <daniel@makrotopia.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Justin Green <greenjustin@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <8c001c8e70d93d64d3ee6bf7dc5078d2783d4e32.1734300345.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8c001c8e70d93d64d3ee6bf7dc5078d2783d4e32.1734300345.git.daniel@makrotopia.org>
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

Il 15/12/24 23:09, Daniel Golle ha scritto:
> Touching DISP_REG_OVL_PITCH_MSB leads to video overlay on MT2701, MT7623N
> and probably other older SoCs being broken.
> 
> Only touching it on hardware which actually supports AFBC like it was
> before commit c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek
> DRM driver") fixes it.
> 
> Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index f731d4fbe8b6..321b40a387cd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -545,7 +545,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
>   		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
>   				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
> -	} else {
> +	} else if (ovl->data->supports_afbc) {
>   		mtk_ddp_write_relaxed(cmdq_pkt,
>   				      overlay_pitch.split_pitch.msb,
>   				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));

At this point you should just move the block over a new function....

if (ovl->data->supports_afbc)
	mtk_ovl_afbc_layer_config(ovl, cmdq_pkt, idx, is_afbc);

static void mtk_ovl_afbc_layer_config( .... )
{
	if (is_afbc) {
		.....
	} else {
		.....
	}
}

Cheers,
Angelo
