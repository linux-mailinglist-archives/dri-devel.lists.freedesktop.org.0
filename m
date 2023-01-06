Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447986603C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0F10E875;
	Fri,  6 Jan 2023 15:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91810E875
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 15:54:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F0036185C;
 Fri,  6 Jan 2023 15:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0429C433D2;
 Fri,  6 Jan 2023 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673020446;
 bh=7cB3UhToZf19WjldWyLHUYEnxMRKMO5WZVXBb1fRwRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j6p/ExogshxrCRekX6bJ3dnNQu8ehUl5v4Oq9PpfZ4QtduzTqmG+cCqr6f1z+7UOc
 HIbzWhBKwV2Vv5Fqz61ALO8qm6TGYpMMFx3AdlRn6oep788mro5a5/YpgDOlp3WBqR
 ZlRl1pMSZN6GczeFPeG/F3cVklimuLNMX4dSEYSAW5S5zUplTySkHUTypjgDUPtezu
 yfBoqAyEq3EUebZSRPlsI8bo2Bgg/850woK49aNhmPzliUmF+NoRmwr/HWMaRrCo5O
 yKEJkaEPke71vnT4AvI9NX/0aD607X5yEkLbPJUrEo1ROPZ6N8wg4UZYlkVClYMSIQ
 ZhGwLTrSSDeBg==
Date: Fri, 6 Jan 2023 09:54:11 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] fbdev: Replace 0-length array with flexible array
Message-ID: <Y7hEIySgveQCEMUP@work>
References: <20230105192034.never.249-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105192034.never.249-kees@kernel.org>
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
Cc: Helge Deller <deller@gmx.de>, linux-hardening@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 11:20:38AM -0800, Kees Cook wrote:
> Zero-length arrays are deprecated[1]. Replace struct aperture's "ranges"
> 0-length array with a flexible array. (How is the size of this array
> verified?) Detected with GCC 13, using -fstrict-flex-arrays=3:
> 
> samples/vfio-mdev/mdpy-fb.c: In function 'mdpy_fb_probe':
> samples/vfio-mdev/mdpy-fb.c:169:32: warning: array subscript 0 is outside array bounds of 'struct aperture[0]' [-Warray-bounds=]
>   169 |         info->apertures->ranges[0].base = info->fix.smem_start;
>       |         ~~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from samples/vfio-mdev/mdpy-fb.c:21:
> include/linux/fb.h:510:19: note: while referencing 'ranges'
>   510 |                 } ranges[0];
>       |                   ^~~~~~
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Cc: Helge Deller <deller@gmx.de>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>  include/linux/fb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 96b96323e9cb..bf59d6a3590f 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -507,7 +507,7 @@ struct fb_info {
>  		struct aperture {
>  			resource_size_t base;
>  			resource_size_t size;
> -		} ranges[0];
> +		} ranges[];
>  	} *apertures;
>  
>  	bool skip_vt_switch; /* no VT switch on suspend/resume required */
> -- 
> 2.34.1
> 
