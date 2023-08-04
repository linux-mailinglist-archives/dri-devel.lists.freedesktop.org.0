Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA97976FB7C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F302110E6B6;
	Fri,  4 Aug 2023 07:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0620610E245
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:55:30 +0000 (UTC)
Received: from [172.20.10.2] (unknown [109.166.131.29])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D642E66071B9;
 Fri,  4 Aug 2023 08:55:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691135728;
 bh=7r9GShoKmneDSmX53QgcnbJVa5KPZiLE0eJ/AjUQWvY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cbn7oSahDKki5y/OmUcpKp1jjzOPgQjLRBIMBYtWUBhNzAoQNrEbfAe/ryEDD2Jw+
 UXMrqXfCnRqixCkB+NRgSHiLoWpeCaWW/7Czx/dTgFIYPFdbc/dCs+fOg33O4tqvWY
 P2fckGcjMJAEpb7Qpu2CVAY2/G9/c+zJspITRV+EvZrsYFhZzBFGjWERkCHyHXfRQ6
 Ku4wHjtMJHvkWbyuTNNSLtGxUSbsvMSy3B8RcwjaRpRBx3wcYcuZYkXpzfK8E3+PzN
 h4u9HbgqI5TN+l2oxA6ymCSvR2Rq8kjCkJpAQxb42d4i88mJeJOPBJ2wTrSOggpBDZ
 YarRuShh65W8A==
Message-ID: <d986cba3-5feb-079c-dd07-e4a2c2cbf2b1@collabora.com>
Date: Fri, 4 Aug 2023 10:55:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v3] media: mediatek: vcodec: fix AV1 decoding on MT8188
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xiaoyong,

On 8/3/23 14:10, Xiaoyong Lu wrote:
> Fix AV1 decoding failure when the iova is 36bit.
> 
> Before this fix, the decoder was accessing incorrect addresses with 36bit
> iova tile buffer, leading to iommu faults.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> ---
> Changes from v2:
> 
> - refine commit subject and message
> 
> Changes from v1:
> 
> - prefer '|' rather than '+'
> - prefer '&' rather than shift operation
> - add comments for address operations
> 
> v1:
> - VDEC HW can access tile buffer and decode normally.
> - Test ok by mt8195 32bit and mt8188 36bit iova.
> 
> ---
>   .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> index 404a1a23fd402..e9f2393f6a883 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> @@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>   	u32 allow_update_cdf = 0;
>   	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
>   	int tile_info_base;
> -	u32 tile_buf_pa;
> +	u64 tile_buf_pa;
>   	u32 *tile_info_buf = instance->tile.va;
> -	u32 pa = (u32)bs->dma_addr;
> +	u64 pa = (u64)bs->dma_addr;

If it this is a dma address, can't we use dma_addr_t ? isn't it more 
generic? Or maybe you have a specific reason not to ?

>   
>   	if (uh->disable_cdf_update == 0)
>   		allow_update_cdf = 1;
> @@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>   		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
>   		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
>   
> -		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
> -		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
> +		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits position
> +		 * and clear original for hw requirement.
> +		 */
> +		tile_info_buf[tile_info_base + 1] = (tile_buf_pa & 0xFFFFFFF0ull) |
> +			((tile_buf_pa & 0xF00000000ull) >> 32);
> +		tile_info_buf[tile_info_base + 2] = (tile_buf_pa & 0xFull) << 3;

Would it be better to use GENMASK if you plan to mask out some of the 
bits in the tile_buf_pa ?


>   
>   		sb_boundary_x_m1 =
>   			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 1) &

Greetings,
Eugen
