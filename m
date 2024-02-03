Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7E84847A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 09:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BD310EBA6;
	Sat,  3 Feb 2024 08:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="k0OfUKLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0D0010E7C5
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 08:08:54 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 1FEF220B2000; Sat,  3 Feb 2024 00:08:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1FEF220B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1706947730;
 bh=07vG+62V6dqAkeDJQ2J+ZqfY5Na7tXr+v+0St/Ckcu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k0OfUKLRSHYVPhHV1EpWNPpWC6i1WTJcXBa2tZvc8JfqeyLHc9hXmmyjLL/7PFfog
 jZJk6fA7GbUoUCKRkLzRxY4HXST8rtvY0yxHbkTq8Mp07BNna9WUOBpKl9iTna8PjU
 D71g3xP55ydTQQjUHFGqhRYznWbhCF8MUzZA39ac=
Date: Sat, 3 Feb 2024 00:08:50 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: mhklinux@outlook.com
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 drawat.floss@gmail.com, javierm@redhat.com, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Message-ID: <20240203080850.GA29113@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20240201060022.233666-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201060022.233666-1-mhklinux@outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Wed, Jan 31, 2024 at 10:00:22PM -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> A recent commit removing the use of screen_info introduced a logic
> error. The error causes hvfb_getmem() to always return -ENOMEM
> for Generation 2 VMs. As a result, the Hyper-V frame buffer
> device fails to initialize. The error was introduced by removing
> an "else if" clause, leaving Gen2 VMs to always take the -ENOMEM
> error path.
> 
> Fix the problem by removing the error path "else" clause. Gen 2
> VMs now always proceed through the MMIO memory allocation code,
> but with "base" and "size" defaulting to 0.
> 
> Fixes: 0aa0838c84da ("fbdev/hyperv_fb: Remove firmware framebuffers with aperture helpers")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index c26ee6fd73c9..8fdccf033b2d 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1010,8 +1010,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  			goto getmem_done;
>  		}
>  		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
> -	} else {
> -		goto err1;
>  	}
>  
>  	/*
> -- 
> 2.25.1
>
Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com> 
