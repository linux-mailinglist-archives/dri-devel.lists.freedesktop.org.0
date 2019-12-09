Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944D118264
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208FF89C27;
	Tue, 10 Dec 2019 08:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61306E36F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 09:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id D519528BA69
Subject: Re: [resend PATCH v6 05/12] media: mtk-mdp: Check return value of
 of_clk_get
To: matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
 mturquette@baylibre.com, sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-6-matthias.bgg@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <8d0b7ac3-abb5-2a05-32a6-648830632a74@collabora.com>
Date: Mon, 9 Dec 2019 10:50:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-6-matthias.bgg@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Check the return value of of_clk_get and print an error
> message if not EPROBE_DEFER.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 9afe8161a8c0..4e2fc1337b80 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -110,6 +110,12 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> +		if (IS_ERR(comp->clk[i])i) {

Oops                                    ^

> +			if (PTR_ERR(comp->clk[i] != -EPROBE_DEFER)

and missing closing )

> +					dev_err(dev, "Failed to get clock\n");

Like the previous patch I think that the clk core will print a message if the
clock is not found and you can just this redundand dev_err.

> +
> +			return PTR_ERR(comp->clk[i]);
> +		}
>  
>  		/* Only RDMA needs two clocks */
>  		if (comp->type != MTK_MDP_RDMA)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
