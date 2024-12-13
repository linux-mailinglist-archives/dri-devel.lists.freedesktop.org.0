Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF19F05A1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 08:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB8710EF11;
	Fri, 13 Dec 2024 07:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773810EF11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:43:15 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Y8hCP6s0pz9str;
 Fri, 13 Dec 2024 08:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqXrq8Q9y3uF; Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8hCP640Pz9stm;
 Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF4F98B773;
 Fri, 13 Dec 2024 08:43:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EOoiRkgTR9wb; Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50B3C8B763;
 Fri, 13 Dec 2024 08:43:13 +0100 (CET)
Message-ID: <722e77ed-6f7d-400b-a988-9cbc7e1adcc2@csgroup.eu>
Date: Fri, 13 Dec 2024 08:43:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on
 DMA and TTM
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-3-tzimmermann@suse.de>
 <d41785b1-7246-46fa-a2e8-881a04e8da35@cs-soprasteria.com>
Content-Language: fr-FR
In-Reply-To: <d41785b1-7246-46fa-a2e8-881a04e8da35@cs-soprasteria.com>
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



Le 13/12/2024 à 08:40, Christophe Leroy a écrit :
> 
> 
> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>> Select FB_CORE if GEM's DMA and TTM implementations support fbdev
>> emulation. Fixes linker errors about missing symbols from the fbdev
>> subsystem.
>>
>> Also see [1] for a related SHMEM fix.
>>
>> Fixes: dadd28d4142f ("drm/client: Add client-lib module")
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Link: https://patchwork.freedesktop.org/series/141411/ # 1
>> ---
>>   drivers/gpu/drm/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Build fails which pmac32_defconfig :
> 
>    LD      .tmp_vmlinux1
> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in function 
> `pmu_backlight_init':
> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
> `backlight_device_register'
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] Error 2
> 
> 

Sorry that failure is from patch 1.


