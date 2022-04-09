Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FA4FA2B6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 06:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2466910E287;
	Sat,  9 Apr 2022 04:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A4C10E287
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 04:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7m6se8Bm0BswzM19uLzar7xl1IWq0GXFdlMrOUC/4DE=; b=jlL6sjTIeY3FL/DwtIUXx50Fi+
 sV/FThHT3f6v+4yQ0nUkotUEI4pXdMZYtbEXXs4wH6jZUynChtyZNiZkQ0Gw0b7hmWAKXJY1F46mB
 ALcp46FYpvxnwbhvyUFGMA1spY8uWE39a865cUEDS7931wiKTcd1e8R+BL+UQXBY46hlW1DXTg30E
 ZVZhAnpDYHY3tmpVHxDCz1Ee502Gfk1V/zqO3ZYCxztNhBNs8ab3yOgdU5K0owJISU0q89T4KSurU
 3KEUYlqfrol3rshsY7mTQAvtNFzj/RskOfxZCNlejXhUo4GFOmUSvCX84EkfUdOCHUUAbLLbwrkvq
 EjR8+WRQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd2nI-003DKS-1l; Sat, 09 Apr 2022 04:33:53 +0000
Message-ID: <4c2b304e-385e-8550-eefe-50d4da889048@infradead.org>
Date: Fri, 8 Apr 2022 21:33:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220409042321.3184493-1-james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 4/8/22 21:23, James Hilliard wrote:
> Select the efi framebuffer if efi is enabled.
> 
> This appears to be needed for video output to function correctly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Changes v2 -> v3:
>   - select EFI_FB instead of depending on it
> Changes v1 -> v2:
>   - use depends instead of select
> ---
>  drivers/gpu/drm/gma500/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 0cff20265f97..a422fa84d53b 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -2,11 +2,13 @@
>  config DRM_GMA500
>  	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>  	depends on DRM && PCI && X86 && MMU
> +	depends on FB
>  	select DRM_KMS_HELPER
>  	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
>  	select ACPI_VIDEO if ACPI
>  	select BACKLIGHT_CLASS_DEVICE if ACPI
>  	select INPUT if ACPI

That "select INPUT" is really bad -- but not your problem.
In the entire kernel tree there are only 3 drivers that select INPUT,
and they are all in drivers/gpu/drm/.

> +	select FB_EFI if EFI
>  	help
>  	  Say yes for an experimental 2D KMS framebuffer driver for the
>  	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and

thanks.
-- 
~Randy
