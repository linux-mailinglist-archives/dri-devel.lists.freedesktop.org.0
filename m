Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9410B2416A2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB76E120;
	Tue, 11 Aug 2020 06:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8A889E15
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ST9uT/svvVM3VjFTpOnQ2kyruMHX89YknoXDFMfmz1Y=; b=qZT9QL55N+ijZXxNUmmIYQWYhb
 Lc0Q5kjGV5uOUCjTc7bCMc1r5n1sVNI8Oi2b7MjyvSM5oW/LNxCYuWqFt24HpwQ+8Bv5r2myUh+iO
 an1I6A9x+qWeG1wWg9BjpojyJfNsS1UIVoc7K23JNUruJVYaxe+ctqarlZIfbVzrAiUJdj4XUBLhW
 VWk54u+046uij8MID3XcTjDwZlfUP5L7MiopALQcI5P55o3ZlKqAJ0gZ3Exfmk18auTFGFmvW8JY3
 kSGXst3aYKKCvg/TPD5IMmcfZBIFb4EYwuakEVJp4vkgSs2rL3Ju523SMsIDCTJi3UP7WDUvRTdTj
 IyEDzyEQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k593z-0004Lv-91; Mon, 10 Aug 2020 14:46:11 +0000
Subject: Re: [PATCH v1 2/2] drm/bridge: add refactored it6505 driver
To: allen <allen.chen@ite.com.tw>
References: <1597054312-25538-1-git-send-email-allen.chen@ite.com.tw>
 <1597054312-25538-3-git-send-email-allen.chen@ite.com.tw>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dab6261e-708b-b832-17cb-833023383156@infradead.org>
Date: Mon, 10 Aug 2020 07:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597054312-25538-3-git-send-email-allen.chen@ite.com.tw>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>, Jitao Shi <jitao.shi@mediatek.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Yilun Lin <yllin@google.com>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/20 3:11 AM, allen wrote:
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c2..a9f49c7 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -48,6 +48,13 @@ config DRM_DISPLAY_CONNECTOR
>  	  on ARM-based platforms. Saying Y here when this driver is not needed
>  	  will not cause any issue.
>  
> +config DRM_ITE_IT6505
> +	tristate "ITE IT6505 DP bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  ITE IT6505 DP bridge chip driver.

Maybe it's just me, but I would appreciate it if somewhere in the
Kconfig entry here, it said DisplayPort instead of just DP.

> +
>  config DRM_LVDS_CODEC
>  	tristate "Transparent LVDS encoders and decoders support"
>  	depends on OF

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
