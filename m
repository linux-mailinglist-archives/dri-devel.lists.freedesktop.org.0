Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71625F462
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715D6E2C8;
	Mon,  7 Sep 2020 07:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367CE6E2C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 07:56:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so13389663wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3k0z39QYWIe/UY6EeGOX5LkXyhspBlH5cO5WQ/J5ViE=;
 b=ahlN06GLnzA9rOV4Xi2uqvVT1PEbPo9vjwo5QkVmZdciublt9X3jqlpA+43hVvscoD
 dbSn4ZR1e1Hjyj7pWfskGgAUcc2oDXP8xZD9Sz1u4Nay5BBkQmEqn7RZhgO3sOR4CBem
 nRL2H6VesekZfv772O8OZba9JFQLCJIUIEMB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3k0z39QYWIe/UY6EeGOX5LkXyhspBlH5cO5WQ/J5ViE=;
 b=Dm3NyZ5U8NFC7A2a2wIoiWstPptztbKKvY6GuXnSkVl2CciZW9MKVpPRR9Bu5smaCb
 7++rWHKm6/6DsZcPlE2R8DJKvzXo8lpGkrbhB0AxIBloEJ7JVecg2w1fys5PmhP9QKr1
 wzRfw3dY2ev8gAGDOa96pKWAavUWgeUXPOvaAJ4HuztuVMm2nVTEmonlV6xpKyLVuwyS
 hAIoky0KlOHrth5QywBxskn23qucWSfFJvYfAjiB/7CoS+auJ+0EepdG72Y2Jcoap5g9
 UYyNE+tISDZC4ScbvJnu+tS/9bVvOfdw+03I/HCUKv33B/+xNQmA4Hv777ieBzJUniqY
 K73A==
X-Gm-Message-State: AOAM5330KGhFwiAm60HqCMU9YOZralUXzGt+yAeehV36xBToZj0uqrrT
 oeClPN4gegN97nN2fogen0f7/g==
X-Google-Smtp-Source: ABdhPJxFZJ8XJ1CLC+QmdlYHF7G9rGRpD842F2k869iPGYdjhpkwEkztDb5WNmJNAoIZyZlDHm95wg==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr1545774wmt.92.1599465361880; 
 Mon, 07 Sep 2020 00:56:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm26403992wru.65.2020.09.07.00.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:56:01 -0700 (PDT)
Date: Mon, 7 Sep 2020 09:55:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
Message-ID: <20200907075559.GN2352366@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bjorn@helgaas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management. 
> 
> The original goal of the patch series is to upgrade the power management
> framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> redundant. This was introduced in the commit
> 42ddb453a0cd ("radeon: Conditionally compile PM code").

I do wonder whether it wouldn't be better to just outright delete these,
we have the drm radeon driver for pretty much all the same hardware ...
-Daniel

> 
> ------------
> 
> Before 42ddb453a0cd:
> $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> 
> Based on output in terminal:
> 
> 547:#ifdef CONFIG_PM
>        |-- 959:#ifdef CONFIG_PPC_PMAC
>        |-- 972:#endif
>        |-- 1291:#ifdef CONFIG_PPC_OF
>        |-- 1301:#endif /* CONFIG_PPC_OF */
>        |-- 1943:#ifdef CONFIG_PPC_OF
>                    |-- 2206:#if 0 /* Not ready yet */
>                    |-- 2508:#endif /* 0 */
>        |-- 2510:#endif /* CONFIG_PPC_OF */
>        |-- 2648:#ifdef CONFIG_PPC_PMAC
>        |-- 2654:#endif /* CONFIG_PPC_PMAC */
>        |-- 2768:#ifdef CONFIG_PPC_PMAC
>        |-- 2774:#endif /* CONFIG_PPC_PMAC */
>        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
>        |-- 2801:#endif /* CONFIG_PPC_OF */
> 2803:#endif /* CONFIG_PM */
> 
> ------------
> 
> After 42ddb453a0cd:
> $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> 
> Based on output in terminal:
> 
> 547:#ifdef CONFIG_PM
>        |-- 959:#ifdef CONFIG_PPC_PMAC
>        |-- 972:#endif
>        |-- 1291:#ifdef CONFIG_PPC_OF
>        |-- 1301:#endif /* CONFIG_PPC_OF */
>        |-- 1430:#if defined(CONFIG_PM)
>                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
>                    |-- 1944:#endif
>                    |-- 1946:#ifdef CONFIG_PPC_OF
>                                |-- 1947:#ifdef CONFIG_PPC_PMAC
>                                |-- 2208:#endif
>                    |-- 2209:#endif
>                    |-- 2211:#if 0 /* Not ready yet */
>                    |-- 2513:#endif /* 0 */
>        |-- 2515:#endif /* CONFIG_PPC_OF */
>        |-- 2653:#ifdef CONFIG_PPC_PMAC
>        |-- 2659:#endif /* CONFIG_PPC_PMAC */
>        |-- 2773:#ifdef CONFIG_PPC_PMAC
>        |-- 2779:#endif /* CONFIG_PPC_PMAC */
>        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
>        |-- 2806:#endif /* CONFIG_PPC_OF */
> 2808:#endif /* CONFIG_PM */
> 
> ------------
> 
> This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
> 
> The patch-series fixes it along with PM upgrade.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> Vaibhav Gupta (2):
>   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
>   fbdev: radeonfb:use generic power management
> 
>  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
>  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
>  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
>  3 files changed, 35 insertions(+), 16 deletions(-)
> 
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
