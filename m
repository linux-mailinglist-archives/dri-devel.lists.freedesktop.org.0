Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF39413F76
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 04:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F826EA10;
	Wed, 22 Sep 2021 02:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2136EA10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 02:30:01 +0000 (UTC)
Subject: Re: [PATCH v3] mdacon: fix redefinition of 'scr_memsetw'
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1632277798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSuSnPieUDaOVO6CRq2eMJxdMYKzQp0LFeT47UvdBaA=;
 b=bHOv9kgYfeLnP/9rouj9kS6ktFMQL8roXXTHoqAVWT8PlGlga2p4uA2PV796StdYlsPOR7
 D39DF/4vYaox2QojALbrTzzmrnAC2aO5c4rSZamixdfSpx6eRfLcLhhtNbhDVg1ap1eoV/
 WkQNE0CxswZ8qv34f5nkyPsXNTTDoNk=
To: dri-devel@lists.freedesktop.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20210915011354.2669416-1-liu.yun@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <73758b4e-50ba-05d1-aa30-1384ee6d1421@linux.dev>
Date: Wed, 22 Sep 2021 10:29:52 +0800
MIME-Version: 1.0
In-Reply-To: <20210915011354.2669416-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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

ping, would anyone take this patch?

ÔÚ 2021/9/15 ÉÏÎç9:13, Jackie Liu Ð´µÀ:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> CONFIG_VGA_CONSOLE=n and CONFIG_MDA_CONSOLE=n will cause vt_buffer.h not
> include <asm/vga.h>.
> 
> But if we set CONFIG_MDA_CONSOLE=m, mdacon.c include <linux/vt_buffer.h>
> is in front of include <asm/vga.h>. VT_BUF_HAVE_MEMSETW is not defined,
> so vt_buffer.h will define a scr_memsetw, after that, vga.h also define
> a scr_memsetw, so the repeated definition of scr_memsetw appears, builds
> error.
> 
> We only need to make vt_buffer.h also contain vga.h when
> CONFIG_MDA_CONSOLE=m. This problem can be fixed.
> 
> BTW, mdacon.c no need to include vga.h forcibly, let vt_buffer.h do it.
> 
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Fixes: ac036f9570a2 ("vga: optimise console scrolling")
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>   drivers/video/console/mdacon.c | 1 -
>   include/linux/vt_buffer.h      | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/console/mdacon.c b/drivers/video/console/mdacon.c
> index ef29b321967f..5898d01bc492 100644
> --- a/drivers/video/console/mdacon.c
> +++ b/drivers/video/console/mdacon.c
> @@ -42,7 +42,6 @@
>   #include <linux/init.h>
>   
>   #include <asm/io.h>
> -#include <asm/vga.h>
>   
>   static DEFINE_SPINLOCK(mda_lock);
>   
> diff --git a/include/linux/vt_buffer.h b/include/linux/vt_buffer.h
> index 848db1b1569f..3a79cc27a33b 100644
> --- a/include/linux/vt_buffer.h
> +++ b/include/linux/vt_buffer.h
> @@ -16,7 +16,7 @@
>   
>   #include <linux/string.h>
>   
> -#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_MDA_CONSOLE)
> +#if defined(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
>   #include <asm/vga.h>
>   #endif
>   
> 
