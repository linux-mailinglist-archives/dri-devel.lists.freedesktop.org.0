Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246A37B601
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A964C6E045;
	Wed, 12 May 2021 06:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 591 seconds by postgrey-1.36 at gabe;
 Tue, 11 May 2021 13:23:16 UTC
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794F26E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 13:23:16 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 81A38440033;
 Tue, 11 May 2021 16:13:13 +0300 (IDT)
References: <20210511113200.5439-1-thunder.leizhen@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_cec_probe()
In-reply-to: <20210511113200.5439-1-thunder.leizhen@huawei.com>
Date: Tue, 11 May 2021 16:13:18 +0300
Message-ID: <87r1idwh01.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 12 May 2021 06:23:39 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhen Lei,

On Tue, May 11 2021, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_cec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7eff..fd593ff99bfd447 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -197,7 +197,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>  	cec->regs = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(cec->regs)) {
>  		ret = PTR_ERR(cec->regs);
> -		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
>  		return ret;

You can just return PTR_ERR() directly. No need to set 'ret'.

baruch

>  	}


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
