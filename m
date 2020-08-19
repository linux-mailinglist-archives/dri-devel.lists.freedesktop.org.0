Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B1424AFF5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0AA6E8FF;
	Thu, 20 Aug 2020 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A1C6E3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=x24NZppAJHfqPN2MSE73qp+mE0/F0S4tWb1V3F3E2Oo=; b=iFEjSocDW2e6AhNyXzVcaqizOt
 AwwHtAHkBArxJ3KcpJKPUq+1ZMG/CNfRERQkH7X5EL7MOF+336LapTIzaw2FIUw0C1NPZczjHersZ
 KOuWP/g9uFkVlvEn+vbKdDbhb5/VU4Nylh3v71EIB/WBhvcpDOU8Q1hwDUONZ5t5TM5HIkc7HCbIt
 RauuOUaMG/xArIv3HMhy/shMqLZ8D8ldRjcXyo1iY4QYEkAas3sJ8eSK2gykh9xRPsqVq26uA1Y3g
 GnCiLLY2/Cpl9KYxhzjlb0jAluvfcFI73Wq8jdmMBBSFI2962cYNfk+6HBxWi+TBWoN9CTBkKEChI
 p3C+okag==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QU9-0001XB-6B; Wed, 19 Aug 2020 15:58:45 +0000
Subject: Re: [PATCH v4 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-3-chunkuang.hu@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
Date: Wed, 19 Aug 2020 08:58:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819154421.7013-3-chunkuang.hu@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/19/20 8:44 AM, Chun-Kuang Hu wrote:
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index aa74aac3cbcc..ca3cd871a350 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -24,6 +24,13 @@ config DRM_MEDIATEK_HDMI
>  	tristate "DRM HDMI Support for Mediatek SoCs"
>  	depends on DRM_MEDIATEK
>  	select SND_SOC_HDMI_CODEC if SND_SOC
> -	select GENERIC_PHY
> +	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config PHY_MTK_HDMI
> +    tristate "MediaTek HDMI-PHY Driver"
> +    depends on ARCH_MEDIATEK && OF
> +    select GENERIC_PHY
> +    help
> +          Enable this to support HDMI-PHY

Please fix all of these newly added lines.

from Documentation/process/coding-style.rst:

Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
