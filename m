Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863547BC797
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 14:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB94510E042;
	Sat,  7 Oct 2023 12:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720C410E042
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aJZ1wERx8t06/X65STMSBu3JiTPzRYIDvUyKyEYDM9M=; b=Hci/GG9CxXdpoU9be5u8SQf2xk
 EoRXK1UpYcHUETd6VuuEnyZwy0EDs3FNuLWSMJrpAdlRF6BOOGYxBEj1yJFwdDoJHhTY2CClPVR4z
 qrWX0aPaY3AZOt+HOk+ijZ++wvVIKG+Q4TaBajGVKal0WC2C5XybVMoPZbZHZ7UD6cEGPTr68d5fY
 aloBLpytQ40zSdXIBUwmuhGTZQm8dlf4y451oGtOKpclzcVJMSPyCNkbXloPFC3++4R4WSw3vsNHW
 6rRVxZW21G7iDRWfN1e81Il+EfiBFw4+rmFULDh58SBTJK/QESizjK5th+mKHyKAVUqn/dmDe6+6i
 Ra5bJPbQ==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=40012)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qp6ZZ-0034jm-Oc;
 Sat, 07 Oct 2023 14:38:21 +0200
Message-ID: <7eee2ca0-d2d4-4bfe-b253-fe6147aec173@tronnes.org>
Date: Sat, 7 Oct 2023 14:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231003142508.190246-3-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/3/23 16:22, Jocelyn Falempe wrote:
> This module displays a user friendly message when a kernel panic
> occurs. It currently doesn't contain any debug information,
> but that can be added later.
> 
> v2
>  * Use get_scanout_buffer() instead of the drm client API.
>   (Thomas Zimmermann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
> 
> v3
>  * Rework the drawing functions, to write the pixels line by line and
>  to use the drm conversion helper to support other formats.
>  (Thomas Zimmermann)
> 
> v4
>  * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>  * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>  * Add foreground/background color config option
>  * Fix the bottom lines not painted if the framebuffer height
>    is not a multiple of the font height.
>  * Automatically register the device to drm_panic, if the function
>    get_scanout_buffer exists. (Thomas Zimmermann)
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig     |  22 ++
>  drivers/gpu/drm/Makefile    |   1 +
>  drivers/gpu/drm/drm_drv.c   |   8 +
>  drivers/gpu/drm/drm_panic.c | 413 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_drv.h       |  14 ++
>  include/drm/drm_panic.h     |  41 ++++
>  6 files changed, 499 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 

> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> new file mode 100644

> +static void draw_panic_device(struct drm_device *dev, const char *msg)
> +{
> +	struct drm_scanout_buffer sb;
> +
> +	if (dev->driver->get_scanout_buffer(dev, &sb))
> +		return;
> +	if (!drm_panic_line_buf)
> +		return;
> +

Unless something has changed since 2019 we need to make sure fbcon
hasn't already printed the panic to avoid jumbled output. See [1] for
more info.

Noralf.

[1]
https://lore.kernel.org/dri-devel/20190312095320.GX2665@phenom.ffwll.local/

> +	/* to avoid buffer overflow on drm_panic_line_buf */
> +	if (sb.width > DRM_PANIC_MAX_WIDTH)
> +		sb.width = DRM_PANIC_MAX_WIDTH;
> +
> +	draw_panic_static(&sb, msg);
> +}
