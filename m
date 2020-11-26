Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF712C62A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 11:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582316EB7B;
	Fri, 27 Nov 2020 10:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F252E6E990
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=bqLeJ7tQgtWVqUanZNK/be2k3nwImihYsEZ6qm1//Jc=; b=bVomFdoZyMjCyp39m/+hI2Cwp+
 tB/4WCBZR50jHXKiCbmayUPoNDYFTz3eaYscv63cEpljzSt3bgj10aFLmLi9q/bV+6Lf8MCarhByy
 IqLCyoxLP4RjRInuZScNQ7WlWRaCJLoppv6mSYHkmuUGPmcGeBA3yUMdOsw44vHX7prAhVgmVc28m
 wTZBQzA4ZMerKTLED4JtJHpuXnhmFuoZTxTLwI7BuoyQrx5EgKb93P9H/24K4JirvjCpCVeSv1wh4
 3bXfigxXx+9TTJ7WRwvq1r8koyjXVmn06BUMv7X6Pdlx+UzrAO6U5yEZD+dtjZy8cVCntw0YdrBYy
 uZq6CsaQ==;
Received: from [2601:1c0:6280:3f0::cc1f]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKD7-0001TC-NC; Thu, 26 Nov 2020 16:33:34 +0000
Subject: Re: [PATCH] fbdev: aty: SPARC64 requires FB_ATY_CT
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20201126003957.19604-1-rdunlap@infradead.org>
 <CAMuHMdVpcLc9enskSBJobmHXy3GU5ULdt78ArAr522VXRmty5w@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d0f1daa5-8d3f-4eb9-ad00-29eb344016b7@infradead.org>
Date: Thu, 26 Nov 2020 08:33:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVpcLc9enskSBJobmHXy3GU5ULdt78ArAr522VXRmty5w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:11:27 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/26/20 12:29 AM, Geert Uytterhoeven wrote:
> Hi Randy,
> 
> On Thu, Nov 26, 2020 at 1:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> It looks like SPARC64 requires FB_ATY_CT to build without errors,
>> so adjust the Kconfig entry of FB_ATY_CT so that it is always 'y'
>> for SPARC64 && PCI by disabling the prompt for SPARC64 && PCI.
>>
>> As it currently is, FB_ATY_CT can be disabled, resulting in build
>> errors:
>>
>> ERROR: modpost: "aty_postdividers" [drivers/video/fbdev/aty/atyfb.ko] undefined!
>> ERROR: modpost: "aty_ld_pll_ct" [drivers/video/fbdev/aty/atyfb.ko] undefined!
>>
>> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks for your patch!
> 
>> --- linux-next-20201124.orig/drivers/video/fbdev/Kconfig
>> +++ linux-next-20201124/drivers/video/fbdev/Kconfig
>> @@ -1277,7 +1277,7 @@ config FB_ATY
>>           module will be called atyfb.
>>
>>  config FB_ATY_CT
>> -       bool "Mach64 CT/VT/GT/LT (incl. 3D RAGE) support"
>> +       bool "Mach64 CT/VT/GT/LT (incl. 3D RAGE) support" if !(SPARC64 && PCI)
>>         depends on PCI && FB_ATY
>>         default y if SPARC64 && PCI
>>         help
> 
> What about letting FB_ATY select FB_ATY_CT if SPARC64 && PCI, and
> dropping the "default y"-line, instead?

Sure, I'll try it that way and repost.

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
