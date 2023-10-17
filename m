Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD87CBFD7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 11:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0D310E2B3;
	Tue, 17 Oct 2023 09:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEE210E2B3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 09:48:03 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 01DCD66072C1;
 Tue, 17 Oct 2023 10:48:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697536082;
 bh=zm94jx7YZtaVKlcERgXxBphdF5yGXsd/A0Fvmcj8+3Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JnbVjhfam8ag2lMmYL9z5UQJY6ILzE5PDc8fGi+zbhQlJmYKOL3oWmpa0cRix16Pj
 G1jsUUpafvlh+nWy/3FvpT3tyJ+vCRuuu2hNysRB5HR4NoGG/CNTkV5UP+GHEM1zoO
 tm4iTQvYNkjIi3TxmDtnlbwmNA9YZd96mJJ85ELBvfxntsf55F7N/Nz6zovDi7MhAe
 ixSt8gY8eMmtDe83XS2o9l/dmW3aUmdf1PTKOdXvHlXz92h7aU9wt/o0MhfxMYdKFy
 U7O6r3FoF0njaPNvx99l3bexMcYAEKtjqSbF9OrMzgARru7gS4YfSt+9TSEcT7MU7q
 YdC13KKrQGmkg==
Message-ID: <91932706-c42c-4c10-96bd-c8a91b7d82f0@collabora.com>
Date: Tue, 17 Oct 2023 11:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-16-shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> By registering component related functions to the pointers,
> we can easily manage them within a for-loop and simplify the
> logic of clock control significantly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 111 +++++++-----------
>   1 file changed, 44 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 60e5dfe9ef0d..fffef2a4f919 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -53,6 +53,7 @@ struct ovl_adaptor_comp_match {
>   	enum mtk_ovl_adaptor_comp_type type;
>   	enum mtk_ddp_comp_id comp_id;
>   	int alias_id;
> +	const struct mtk_ddp_comp_funcs *funcs;
>   };
>   
>   struct mtk_disp_ovl_adaptor {
> @@ -67,20 +68,35 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>   	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>   };
>   
> +static const struct mtk_ddp_comp_funcs _ethdr = {

Sorry I just noticed that; can you please remove the leading "_" from all
of those?

_ethdr -> ethdr or mtk_ethdr
_merge -> merge or mtk_merge
_rdma  -> rdma  or mtk_rdma

Thanks,
Angelo

