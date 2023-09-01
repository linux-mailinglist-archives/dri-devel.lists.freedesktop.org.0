Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706E7900A3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FF610E80B;
	Fri,  1 Sep 2023 16:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D0A10E7F6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:17:13 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C161366072AF;
 Fri,  1 Sep 2023 17:17:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693585031;
 bh=GZNm9uK/LuvaLRH8Ea7cb9C+rcBADVhiASYD1HmWLvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OokT13Pp/H/iVSZTzVCIH3EJm1NXFjCFPKjLfQvFpvyqcuhphc5AMx+CPi6J78t/I
 xHJZQCMjzhHWMzG6T9y46WBPwBA5QXxx+FrRPByPFPpsvZppexZAVfNnPuTLwx8nbg
 XFgnUcRCVGV+i4A/Iqv2DO9LHHfwEHn03AvE9ERH6YciBNJNkRYSOq7+frmV6DNCkc
 NsvWyhP2QysyospUrnNVciuW4+YDsd4FcqhyijlMXA8xiF/muCDi5nxwini9ZOjUCK
 A4cb6/9OURdptII7hyHYJUIpcGndPW0/S6+7DQo3SOec0Iv4qQyIovBVe4sXKHfITS
 boKs7Qvlo4Zrg==
Date: Fri, 1 Sep 2023 12:17:05 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
Message-ID: <19cac03b-5c3a-43d0-9043-0bf003ce2722@notapiano>
References: <20230901095916.3599320-1-mwalle@kernel.org>
 <20230901095916.3599320-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901095916.3599320-2-mwalle@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 11:59:16AM +0200, Michael Walle wrote:
> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 1 and the third path will be 2.

ext will be 0 and third will be 1.

> 
> To fix that, dynamically calculate the IDs by the precence of the paths.

precence -> presence

> 
[..]
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
[..]
> @@ -526,21 +547,44 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>  						struct device *dev)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> -
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
> -				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len, private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> -					  private->data->third_len, private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +	const struct mtk_mmsys_driver_data *data;
> +	struct mtk_drm_private *priv_n;
> +	int i = 0, j;
> +
> +	for (j = 0; j < private->data->mmsys_dev_num; j++) {
> +		priv_n = private->all_drm_private[j];
> +		data = priv_n->data;
> +
> +		if (mtk_ddp_path_available(data->main_path, data->main_len,
> +					   priv_n->comp_node)) {
> +			if (mtk_drm_find_comp_in_ddp(dev, priv_n->data->main_path,
> +						     priv_n->data->main_len,
> +						     priv_n->ddp_comp))

My only nit is that you're sometimes using data, sometimes using priv_n->data.
Just use data everywhere.

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested on both mt8192-asurada-spherion and mt8195-cherry-tomato. Confirmed that
all configurations work on both machines: internal+external, only internal and
only external display.

(Like you mentioned, I also noticed that when only the external display is
enabled, it works during early boot, but then it stops working, and only after 
reconnecting it does it work again, but that's a separate issue)

Thanks,
Nícolas
