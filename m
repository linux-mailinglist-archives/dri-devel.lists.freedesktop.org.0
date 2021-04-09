Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59B35956C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 08:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA8B6E45D;
	Fri,  9 Apr 2021 06:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Fri, 09 Apr 2021 01:39:07 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1F236E431
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 01:39:07 +0000 (UTC)
X-UUID: f9ec6726a810486ca8487a393e0a7ffe-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QlQV/IjGGqn8yZBn7TzzTKt2J3XWX4ZDL0hPjNElmPk=; 
 b=XO4qE+DO9QylqmUgxDWhuDixTsvO9ot0/QhlwC20bPZrypM/ZZcXOsSitQgMDjZQCPdbkFSI3HHtKbOV6FTlHRRpM4QGRGIYMPsyltZyUWoYo42MT4uCq66rfxS041mZW5AZAJcZJIsL/xL3cK2qBZiWuUtTT9QI5XvqiBOWpIA=;
X-UUID: f9ec6726a810486ca8487a393e0a7ffe-20210409
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 531900260; Fri, 09 Apr 2021 09:34:03 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Apr 2021 09:34:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 09:34:00 +0800
Message-ID: <1617932040.12105.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2 -next] phy: phy-mtk-hdmi: Remove redundant dev_err
 call in mtk_hdmi_phy_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: He Ying <heying24@huawei.com>
Date: Fri, 9 Apr 2021 09:34:00 +0800
In-Reply-To: <20210408115530.15673-1-heying24@huawei.com>
References: <20210408115530.15673-1-heying24@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB4F945084C6864C1700CE1A8C0D5AD93A629F8E0CEFB464A6F6F98223C2952B2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 09 Apr 2021 06:26:04 +0000
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, linux-phy@lists.infradead.org,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-04-08 at 07:55 -0400, He Ying wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
> v2:
> - Use 'return PTR_ERR()' instead of 'ret = PTR_ERR();return ret;'.
> 
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index 8313bd517e4c..8ad8f717ef43 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -119,9 +119,7 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	hdmi_phy->regs = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(hdmi_phy->regs)) {
> -		ret = PTR_ERR(hdmi_phy->regs);
> -		dev_err(dev, "Failed to get memory resource: %d\n", ret);
> -		return ret;
> +		return PTR_ERR(hdmi_phy->regs);
>  	}
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot
>  
>  	ref_clk = devm_clk_get(dev, "pll_ref");

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
