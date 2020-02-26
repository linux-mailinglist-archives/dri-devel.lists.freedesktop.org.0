Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA6171242
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153F6EC40;
	Thu, 27 Feb 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C876EBC8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+p7EsunDyckvjnn7uoUOj7IyahAxbevV9+nP47iItWU=; b=PsTVQeVK5MMB5wwRjEYrExEWaA
 1lEsqABgpcezNBGgPT1p7GOolDKy0OflU9a6BzxaKrNhGcfWVbAN6xuZ11bBOYm4Ne6KrWK2phYqy
 tT4mHwvThQUKuRisFlycbecA8yKIxpJenV5wWUXfKFgN6mzHck8Pb1obpiYTfjigldNarKpYQ6Y/q
 0Z4W9T7xOEW0hD8vIEH9Qc7ixTMkJ6lLXpXApqRCp/irhgXWyAxQmLO6De5lFOb6DHCgo/ueJqwNk
 eG303bUmPxpNS/6ZxLaujBeY10d2wFSRHssTX7ISCsPVyrFYm6Bw0M3HFYKFZfASOcJrwGS62J9Zj
 0cu+ombA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j73QB-00062V-Dw; Wed, 26 Feb 2020 20:36:43 +0000
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform driver
To: Ezequiel Garcia <ezequiel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
 airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
 ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
 <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
 <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <470ab4e2-ab10-19bd-aea4-9b081c9978a8@infradead.org>
Date: Wed, 26 Feb 2020 12:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/26/20 12:29 PM, Ezequiel Garcia wrote:
> On Wed, 2020-02-26 at 07:40 -0800, Randy Dunlap wrote:
>> On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
>>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>>> index 2114b563478c..dcd6481a14d0 100644
>>> --- a/drivers/soc/mediatek/Kconfig
>>> +++ b/drivers/soc/mediatek/Kconfig
>>> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>>>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>>>  	  driver.
>>>  
>>> +config MT8173_MMSYS
>>> +	bool "MediaTek MT8173 MMSYS Support"
>>
>> Hi,
>> Can this be tristate instead of bool?
>>
> 
> Wouldn't that conflict with
> the driver being a builtin_platform_driver,
> or am I just confusing things badly?

OK, it probably would conflict.

Thanks.

>> +	depends on COMMON_CLK_MT8173
>>> +	help
>>> +	  Say yes here to add support for the MediaTek MT8173 Multimedia
>>> +	  Subsystem (MMSYS).
>>> +
>>>  endmenu


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
