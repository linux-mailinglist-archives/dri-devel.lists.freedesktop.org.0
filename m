Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8376A4CA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 01:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BBF10E09E;
	Mon, 31 Jul 2023 23:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE910E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=0VwbE9w1enjcPt7/IUT5th5f1ZIeAHMgI/cQbU9ZQ2A=; b=W1MEZXbMSYUAoRpiX2J1gLUs6J
 QNI3LZBl83MsiVfSkFwwVlVnz2w0CjvDmoqTdQ8gv+SYMSY2r0HtouhhUB5uUd+LbZmAPgaiaUlmS
 qdipmFFr0Fl+4bPXWd4UhqXWIVGZCOf3ciB+VlGAJfo5GzvNp3rD3yDx66pCe1iWS42hN31arU9sa
 IiveAdR1+sND6wubHmrrJpaPk4dF3Dr3DfIv01LVVDOX/64l05bpRsU+oOai73TB5NyG9wjVzoLyD
 Z2lRPFbkS7szaMiGpw9aktwsF7+uOWMEn0cLp1cv6Jb49B1tHCwiPsSAfrVHqSNiea89JcJ+8JHFI
 ZoPiTwJw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qQcDK-00HZ0e-1R; Mon, 31 Jul 2023 23:22:10 +0000
Message-ID: <fb977502-ec9b-c847-6b9c-049bd226f4b1@infradead.org>
Date: Mon, 31 Jul 2023 16:22:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev/ps3fb: Build without kernel device
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 sam@ravnborg.org, javierm@redhat.com, bagasdotme@gmail.com,
 rd.dunlab@gmail.com, regressions@leemhuis.info, sfr@canb.auug.org.au
References: <20230731175535.11345-1-tzimmermann@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230731175535.11345-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/31/23 10:55, Thomas Zimmermann wrote:
> Use fb_info() to print status message at the end of the probe function,
> which avoids decoding the devices. fb_info() works with or without an
> fbdev kernel device. Fixes the following error:
> 
> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>       |                                        ^~
> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                                     ^~~~~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>       |         ^~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>       |                                                             ^~
> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                                     ^~~~~~~~~~~
> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>       |         ^~~~~~~~
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/ccc63065-2976-88ef-1211-731330bf2866@infradead.org/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 701d2054fa31 ("fbdev: Make support for userspace interfaces configurable")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/video/fbdev/ps3fb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
> index 5aedc30c5f7e..64d291d6b153 100644
> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -1168,9 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
>  
>  	ps3_system_bus_set_drvdata(dev, info);
>  
> -	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
> -		 dev_driver_string(info->dev), dev_name(info->dev),
> -		 info->fix.smem_len >> 10);
> +	fb_info(info, "using %u KiB of video memory\n", info->fix.smem_len >> 10);
>  
>  	task = kthread_run(ps3fbd, info, DEVICE_NAME);
>  	if (IS_ERR(task)) {

-- 
~Randy
