Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3819F065F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7112110EF50;
	Fri, 13 Dec 2024 08:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB210EF50
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 08:33:18 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Y8jK90cVHz9str;
 Fri, 13 Dec 2024 09:33:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHy9DUB1OZLm; Fri, 13 Dec 2024 09:33:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8jK86wNMz9stk;
 Fri, 13 Dec 2024 09:33:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC30F8B773;
 Fri, 13 Dec 2024 09:33:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jaDamWOhRDNi; Fri, 13 Dec 2024 09:33:16 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6983A8B763;
 Fri, 13 Dec 2024 09:33:16 +0100 (CET)
Message-ID: <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
Date: Fri, 13 Dec 2024 09:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 13/12/2024 à 09:05, Thomas Zimmermann a écrit :
> Hi
> 
> 
> Am 13.12.24 um 08:44 schrieb Christophe Leroy:
>>
>>
>> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>> only controls backlight support within fbdev core code and data
>>> structures.
>>>
>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>> select it explicitly. Fixes warnings about recursive dependencies,
>>> such as
>>>
>>> error: recursive dependency detected!
>>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>>     symbol FB_DEVICE depends on FB_CORE
>>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>>
>>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>>> it is the correct approach in any case. For most drivers, backlight
>>> support is also configurable separately.
>>>
>>> v2:
>>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>>> - Fix fbdev driver-dependency corner case (Arnd)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/auxdisplay/Kconfig       |  2 +-
>>>   drivers/macintosh/Kconfig        |  1 +
>>>   drivers/staging/fbtft/Kconfig    |  1 +
>>>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>>>   drivers/video/fbdev/core/Kconfig |  3 +--
>>>   5 files changed, 17 insertions(+), 8 deletions(-)
>>
>> Build fails which pmac32_defconfig :
>>
>>   LD      .tmp_vmlinux1
>> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in function 
>> `pmu_backlight_init':
>> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
>> `backlight_device_register'
>> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
>> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] Error 2
> 
> The attached patch selects backlight support in the defconfigs that also 
> have PMAC_BACKLIGHT=y. Can you please apply it on top of the patchset 
> and report on the results?
> 

That works for the defconfig but it is still possible to change 
CONFIG_BACKLIGHT_CLASS_DEVICE manually.

If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
deselect it.
