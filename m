Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5A4FA23C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 06:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB98C10F524;
	Sat,  9 Apr 2022 04:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EDA10F524
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=NXQ8V17v41NQ0r5E6pvLVL9nZI50xNgYdbhdLzXEGCg=; b=c5mT9HZTuY88NfQ9ihB8oVcX4C
 9FCjKVm52Gp6Sq1p0Tkh/nT3nrBYzm6XGIA/8cbK9sblJpmqvgiFpoUZgS9oWo6u+HiwC83CEZdb1
 m84WKPcStpDe2ZCOxVF8LO7m/3D2PKWhgLeGJx3IlB3PdkCsou1LZjZcs8ArBTxCjZE+7qIO3Lrhm
 +8i9IhI9Kp7YbKBwL1sq48IQVyP+m2U4zwo2C7QyqjHYOsZ+bJ9XalLGpx3SHOouDZfd6u0iaZXt1
 nXDn4agtCEU5vccdnJb3+E3jVFnvpz2TI56+8GohHl5zvJiq6ppTZpcsSlhWAzVnKWI5xJC5mLStz
 x0sFqCwg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd2T6-003D5y-Q6; Sat, 09 Apr 2022 04:13:02 +0000
Message-ID: <0c679837-379a-c3be-9fe5-865b675410de@infradead.org>
Date: Fri, 8 Apr 2022 21:12:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/gma500: depend on framebuffer
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220409034418.3182706-1-james.hilliard1@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220409034418.3182706-1-james.hilliard1@gmail.com>
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



On 4/8/22 20:44, James Hilliard wrote:
> This appears to be needed for video output to function correctly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - use depends instead of select

Thanks.

> ---
>  drivers/gpu/drm/gma500/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 0cff20265f97..8ea87bfa95f5 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -2,6 +2,8 @@
>  config DRM_GMA500
>  	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
>  	depends on DRM && PCI && X86 && MMU
> +	depends on FB
> +	depends on FB_EFI || !EFI

I'm OK with the second line of the first patch:

+	select FB_EFI if EFI

It's just that a single driver shouldn't enable an entire subsystem (like FB)
on its own. But once FB is set (depends on in this patch), selecting
FB_EFI would be OK IMO.

>  	select DRM_KMS_HELPER
>  	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
>  	select ACPI_VIDEO if ACPI

-- 
~Randy
