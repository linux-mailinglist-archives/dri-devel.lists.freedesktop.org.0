Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51B80EDBB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A1010E5D1;
	Tue, 12 Dec 2023 13:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1110E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702387638;
 bh=bORQa449volAyT+EMZHJvP/KuwY9i8DhbUIZ63euxMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jzPgk9VpkKV0fyriB7dHtcuDiQiXIp7w4XYDgCGGGdxIGa7V17zVpEAa4vvK8LokN
 Y9T/mwQTVlchSTjlJfz7UOd/WS3ssJXCBtdb/f1L3UdXittnqS8CkK46Eyz3j41CUu
 O91taj9MdqhHul2r9rH5mM+QFkIRuQKINyKbAEbMU0+GcRGZSKOUgxk8M0cYr1ywfF
 T2oy8yfo3K/fqI2UlVo8WfoX+ZFteWofeBFAvnCvnLB8lrzUUa2SY/M6IiFWex+80F
 xQri1CebiCNRwW0FqRYBDujV4oT4BmHcmNaJ6CwBnfr2c1CURfiUDJkyTI4h8uevTA
 tRMMaqDCZnEBQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4CD513781461;
 Tue, 12 Dec 2023 13:27:17 +0000 (UTC)
Message-ID: <315011be-59c6-42b1-be9b-cd2eaf6debd9@collabora.com>
Date: Tue, 12 Dec 2023 14:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/17] drm/mediatek: Turn off the layers with zero
 width or height
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-12-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-12-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> We found that IGT (Intel GPU Tool) will try to commit layers with
> zero width or height and lead to undefined behaviors in hardware.
> Disable the layers in such situations.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

This commit needs a Fixes tag. Please add the relevant one.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
>   drivers/gpu/drm/mediatek/mtk_ethdr.c            | 7 ++++++-
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 10d23e76acaa..8789442c039f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -156,7 +156,7 @@ void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
>   	merge = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MERGE0 + idx];
>   	ethdr = ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0];
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
>   		mtk_merge_stop_cmdq(merge, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_l, cmdq_pkt);
>   		mtk_mdp_rdma_stop(rdma_r, cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> index 73c9e3da56a7..e95331c06815 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -163,7 +163,12 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
>   	if (idx >= 4)
>   		return;
>   
> -	if (!pending->enable) {
> +	if (!pending->enable || !pending->width || !pending->height) {
> +		/*
> +		 * instead of disabling layer with MIX_SRC_CON directly
> +		 * set the size to 0 to avoid screen shift due to mixer
> +		 * mode switch (hardware behavior)
> +		 */
>   		mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs, MIX_L_SRC_SIZE(idx));
>   		return;
>   	}

