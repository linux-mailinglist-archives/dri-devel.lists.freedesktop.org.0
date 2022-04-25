Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5050E88C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 20:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EE610E11A;
	Mon, 25 Apr 2022 18:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C3610E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=sNaqatniZh4V6H6ZX5OWgsYZGW1sYR1cMaEyUB+FtkQ=; b=P/+AuIRgxQ/2VFn0tOHTW+qjvT
 pxSUuVMyR1pDCkrSgToqQrBFTlXC0k4kcEa9F/X+xU/HO8UrWftCj1mODupwPg0nwK6/UccKXP/97
 2D46VdTLVeToOxutjcW1N9g8Jj3OxHczu14ZU7+Pvj/jDg81tNPMjps0Jji4kasRFYdNKEGwm9jAH
 2N3zKECHqtpQAO7B9FO9ziXJt+qQBf3S7QmSbjsb7JkBzZS100Ff6vEdSbUwxaBSuWOPy6ngFhbul
 Ht9Njfy9REP/67rlvGXp5ft9bHEeZ8QTScGUf3ywIR4Rtn/jr8q5T4aRAUbhQh4wvSD4WhGcWdgfo
 JoIieuag==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj3jf-008bSd-61; Mon, 25 Apr 2022 18:46:59 +0000
Message-ID: <04ff7802-c87a-2ea2-156e-c437446bc072@infradead.org>
Date: Mon, 25 Apr 2022 11:46:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 04/11] drm/r128: Fix undefined behavior due to shift
 overflowing the constant
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-5-bp@alien8.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220405151517.29753-5-bp@alien8.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/5/22 08:15, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Fix:
> 
>   drivers/gpu/drm/r128/r128_cce.c: In function ‘r128_do_init_cce’:
>   drivers/gpu/drm/r128/r128_cce.c:417:2: error: case label does not reduce to an integer constant
>     case R128_PM4_64BM_64VCBM_64INDBM:
>     ^~~~
>   drivers/gpu/drm/r128/r128_cce.c:418:2: error: case label does not reduce to an integer constant
>     case R128_PM4_64PIO_64VCPIO_64INDPIO:
>     ^~~~
> 
> See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
> details as to why it triggers with older gccs only.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/r128/r128_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/r128/r128_drv.h
> index 2e1bc01aa5c9..970e192b0d51 100644
> --- a/drivers/gpu/drm/r128/r128_drv.h
> +++ b/drivers/gpu/drm/r128/r128_drv.h
> @@ -300,8 +300,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
>  #	define R128_PM4_64PIO_128INDBM		(5  << 28)
>  #	define R128_PM4_64BM_128INDBM		(6  << 28)
>  #	define R128_PM4_64PIO_64VCBM_64INDBM	(7  << 28)
> -#	define R128_PM4_64BM_64VCBM_64INDBM	(8  << 28)
> -#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15 << 28)
> +#	define R128_PM4_64BM_64VCBM_64INDBM	(8U  << 28)
> +#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15U << 28)
>  #	define R128_PM4_BUFFER_CNTL_NOUPDATE	(1  << 27)
>  
>  #define R128_PM4_BUFFER_WM_CNTL		0x0708

-- 
~Randy
