Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B86F69F5
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0463510E095;
	Thu,  4 May 2023 11:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7195E10E095
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 11:31:28 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:55282.482502416
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 40663100283;
 Thu,  4 May 2023 19:31:24 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-6qwzn with ESMTP id
 70d89bba14af4bc3806cb9bbf0733f71 for tzimmermann@suse.de; 
 Thu, 04 May 2023 19:31:27 CST
X-Transaction-ID: 70d89bba14af4bc3806cb9bbf0733f71
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <58d2bd17-3b51-bd24-2f30-d849d3f72b0e@189.cn>
Date: Thu, 4 May 2023 19:31:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [v4,3/6] fbdev: Include <linux/io.h> in various drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
References: <20230504074539.8181-4-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230504074539.8181-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/5/4 15:45, Thomas Zimmermann wrote:
> The code uses writel() and similar I/O-memory helpers. Include
> the header file to get the declarations.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/video/fbdev/arcfb.c       | 1 +
>   drivers/video/fbdev/aty/atyfb.h   | 2 ++
>   drivers/video/fbdev/wmt_ge_rops.c | 2 ++
>   3 files changed, 5 insertions(+)
>
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index 45e64016db32..d631d53f42ad 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -41,6 +41,7 @@
>   #include <linux/vmalloc.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
> +#include <linux/io.h>
>   #include <linux/fb.h>
>   #include <linux/init.h>
>   #include <linux/arcfb.h>
> diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
> index 465f55beb97f..30da3e82ed3c 100644
> --- a/drivers/video/fbdev/aty/atyfb.h
> +++ b/drivers/video/fbdev/aty/atyfb.h
> @@ -3,8 +3,10 @@
>    *  ATI Frame Buffer Device Driver Core Definitions
>    */
>   
> +#include <linux/io.h>
>   #include <linux/spinlock.h>
>   #include <linux/wait.h>
> +
>       /*
>        *  Elements of the hardware specific atyfb_par structure
>        */
> diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
> index 42255d27a1db..99c7b0aea615 100644
> --- a/drivers/video/fbdev/wmt_ge_rops.c
> +++ b/drivers/video/fbdev/wmt_ge_rops.c
> @@ -9,7 +9,9 @@
>   
>   #include <linux/module.h>
>   #include <linux/fb.h>
> +#include <linux/io.h>
>   #include <linux/platform_device.h>
> +
>   #include "core/fb_draw.h"
>   #include "wmt_ge_rops.h"
>   
