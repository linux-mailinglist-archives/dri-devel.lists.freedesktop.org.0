Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CD2D261F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F016E9B0;
	Tue,  8 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EBC16E8A7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 01:50:06 +0000 (UTC)
X-UUID: fdbb80fd9bda4663a4dd7c600d47bb8f-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dCzH311+U2RFvjPiv7C+GlVUPgKHpvOsRKaE8jAB0UM=; 
 b=dAks2qEQ9ToMg60OeCOyZKIZs2vHSPVaZtFyg63SUZxre5J+IYe0U1+QO+yv1ePO/vFjjqU/SyP7MLSZZaCooHp4ruB658gHV+xp9vdN4SCpMhIqYRxEan8hqQf+B6Fnp6IGd8zktk8cW25wiYpPb0JDnroWJRsQBsnmEJCFsXc=;
X-UUID: fdbb80fd9bda4663a4dd7c600d47bb8f-20201208
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 630910657; Tue, 08 Dec 2020 09:50:04 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 09:49:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 09:49:57 +0800
Message-ID: <1607392202.23328.1.camel@mhfsdcap03>
Subject: Re: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy
 on an error message
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Colin King <colin.king@canonical.com>
Date: Tue, 8 Dec 2020 09:50:02 +0800
In-Reply-To: <20201207150937.170435-1-colin.king@canonical.com>
References: <20201207150937.170435-1-colin.king@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-07 at 15:09 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is a null pointer check for hdmi_phy that implies it
> may be null, however a dev_err messages dereferences this potential null
> pointer.  Avoid a null pointer dereference by only emitting the dev_err
> message if hdmi_phy is non-null.  It is a moot point if the error message
> needs to be printed at all, but since this is a relatively new piece of
> code it may be useful to keep the message in for the moment in case there
> are unforseen errors that need to be reported.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index c5c61f5a9ea0..5184054783c7 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
>  	    hdmi_phy->conf->hdmi_phy_disable_tmds)
>  		return &mtk_hdmi_phy_dev_ops;
>  
> -	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> -		return NULL;
> +	if (hdmi_phy)
> +		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> +			return NULL;
indentation: one tab before return

Thanks

>  }
>  
>  static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
