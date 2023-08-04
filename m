Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F147705DA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0466310E731;
	Fri,  4 Aug 2023 16:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6547C10E731
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:23:44 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RHWHM5dTWz9s85;
 Fri,  4 Aug 2023 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691166224; bh=yj/NtQVL/5pckzchWFeTqV07FxZmKDUAGX0wWU89jLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NCgilNop9Fmhkvxn+SaUlEf4IcPR969tQfY/NxPfTpeYlhU9re0W85W8tGz0jZdBz
 QWCH8rX/oGS8W6bfV1m0hOByACYsFJ85AIZHvZ4pdlm1EwGhWOFfUz5aiXit/TsM3g
 vV6KmQSM2IQOdLFDBWpcg5Fd4KZibHxKKlLCq8k0=
X-Riseup-User-ID: CCB0F5F6610A68CF3473715B13107F061FAE88A70EC307CB023BB524DE7FFE5C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RHWHH44MmzFpb1;
 Fri,  4 Aug 2023 16:23:39 +0000 (UTC)
Message-ID: <7950bcea-0f15-da2e-e4f7-4bfa474a420f@riseup.net>
Date: Fri, 4 Aug 2023 13:23:36 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm: Drop select FRAMEBUFFER_CONSOLE for
 DRM_FBDEV_EMULATION
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230804125156.1387542-1-javierm@redhat.com>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20230804125156.1387542-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/23 09:51, Javier Martinez Canillas wrote:
> The commit c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev
> emulation is enabled") changed DRM_FBDEV_EMULATION from 'depends on FB'
> to an effective 'select FB_CORE', so any config that previously had DRM=y
> and FB=n now has FB_CORE=y and FRAMEBUFFER_CONSOLE=y.
> 
> This leads to unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
> as reported by Arthur Grillo, e.g:
> 
> WARNING: unmet direct dependencies detected for FRAMEBUFFER_CONSOLE
>   Depends on [n]: VT [=n] && FB_CORE [=y] && !UML [=y]
>   Selected by [y]:
>   - DRM_FBDEV_EMULATION [=y] && HAS_IOMEM [=y] && DRM [=y] && !EXPERT [=n]
> 
> Arnd Bergmann suggests to drop the select FRAMEBUFFER_CONSOLE for the
> DRM_FBDEV_EMULATION Kconfig symbol, since a possible use case could
> be to enable DRM fbdev emulation but without a framebuffer console.
> 
> Fixes: c242f48433e7 ("drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled")
> Reported-by: Arthur Grillo <arthurgrillo@riseup.net>
> Closes: https://lore.kernel.org/dri-devel/20230726220325.278976-1-arthurgrillo@riseup.net
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Greate patch! I was about to send the same one XD.

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
>  drivers/gpu/drm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b51c6a141dfa..2a44b9419d4d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -135,7 +135,6 @@ config DRM_DEBUG_MODESET_LOCK
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM
> -	select FRAMEBUFFER_CONSOLE if !EXPERT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	default y
>  	help
