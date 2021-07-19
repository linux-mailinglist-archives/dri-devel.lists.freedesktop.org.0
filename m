Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0233CEB92
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 22:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D089EA9;
	Mon, 19 Jul 2021 20:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8A89EA9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=/Va7aGBo6zBlj5l5FvHAL96Jxg2PHZuQ/EZJgrQ6pXY=; b=uIllQ1oDecOK6YrHSA/xXpXAoa
 dih8CbN+tqUG3wjtT2oCviI53z39WfQLun7bH3S4ooLvohHCRHh3+pXKaYQXZvqQAhhS7PMEbkz3I
 itfHGwOnblx3sLdxdsdl7+eeixxVLvIT7iImpTGK9BGHTxUUM00dN6C2+ruCRvSJbXwF4BJnMWD+f
 pLqCAuHot4f0VhJNoVcB9P6Fnrar88g5dMSXPdKCyESEuuBEpTFZRx3f5FyX1exaRWuXUGmOJNvGP
 KM6sjHfiNZIHW2eAaIp9rDQtu8hi2Yspq374sk/EBPgYq67XpTuf3HPl4fF3VMPj8ZFttVLTxFBs2
 meQtNccg==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5ZUO-00BDRo-88; Mon, 19 Jul 2021 20:03:44 +0000
Subject: Re: [PATCH] fbdev: simplefb: limit its use to DRM_SIMPLEDRM=n
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20210719023327.17039-1-rdunlap@infradead.org>
 <CAMuHMdUtTzgnP4GR5phFcVnFVCrU1J87sner-XN6Koc_eZ7Zhg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5a667be9-d2cb-d8fd-d321-b35e673b237e@infradead.org>
Date: Mon, 19 Jul 2021 13:03:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUtTzgnP4GR5phFcVnFVCrU1J87sner-XN6Koc_eZ7Zhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kernel test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/21 1:06 AM, Geert Uytterhoeven wrote:
> Hi Randy,
> 
> On Mon, Jul 19, 2021 at 4:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> When DRM_SIMPLEDRM=m, all of FB_CFB_{FILLRECT,COPYAREA,IMAGEBLIT} are =m,
> 
> Why does that happen?
> FB_SIMPLE does select FB_CFB_*, so all of the latter should be builtin?
> Do I need my morning coffee? I'm about to fetch it...

Hi Geert,

I have no idea why this happens. It feels like a kconfig bug to me.

>> causing undefined references in fbdev/simplefb.o.
>>
>> By restricting FB_SIMPLEFB to be set only when DRM_SIMPLEDRM is not set,
>> the FB_CFB_* symbols are =y and the build completes without these
>> undefined references.
>>
>> IOW, really "disable simplefb if simpledrm has been selected".
> 
> That does make sense, regardless of my question above ;-)
> 
>> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
>> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
>> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'
>>
>> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
>> --- linux-next-20210716.orig/drivers/video/fbdev/Kconfig
>> +++ linux-next-20210716/drivers/video/fbdev/Kconfig
>> @@ -2192,7 +2192,7 @@ config FB_HYPERV
>>
>>  config FB_SIMPLE
>>         bool "Simple framebuffer support"
>> -       depends on (FB = y) && !DRM_SIMPLEDRM
>> +       depends on (FB = y) && DRM_SIMPLEDRM=n
>>         select FB_CFB_FILLRECT
>>         select FB_CFB_COPYAREA
>>         select FB_CFB_IMAGEBLIT
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
~Randy

