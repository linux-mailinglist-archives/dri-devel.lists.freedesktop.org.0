Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E656BA55
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B93B10FBF3;
	Fri,  8 Jul 2022 13:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896010FA2E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657285798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVPiBMOBBSXkPqruxKFJK+BcZztxHLHpW2iVwBrwzko=;
 b=TbRW+cu0WoTda7KVBiBp4410VW2ePqGwjLr8FjL7/xZqEvopKZEOrKWtGLRE5v3rTn7FW8
 nmT1eSqpaiIEedt9HCZ1uLv+dmOfofbodXtt8r0g04+orXQMPgNqL6A32Ukb90CPD+zOds
 ksanZBG1H+EoBtC+Oe0YBtEuHLCmJg0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-uibd7ov5NhC3aUDOY3J20A-1; Fri, 08 Jul 2022 09:09:57 -0400
X-MC-Unique: uibd7ov5NhC3aUDOY3J20A-1
Received: by mail-wm1-f72.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso971137wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 06:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OVPiBMOBBSXkPqruxKFJK+BcZztxHLHpW2iVwBrwzko=;
 b=NbLFi70vvxqMog5kGGqxA+wguA2OOIZ3f4SPeyLNesX0UKslgQmdwdHN98gqc1wlHm
 HxiDB0Y27sxC3giu9HXOrv68KDvjKWx/Y7vz0/Vl/EppMrUWTmLz/gvgB4ChppJ8DNUS
 sEKgci483B8nabX9gvPpzsDf2TcmaBStcLOjq+Tf9Pyyd/j5mKy7t6tAdEcpe/scvXTA
 a3J0N9vUXF7sY9jG1a7jbAGpErXSfRglyc5NuqBmeXVLqkopr24GsPsI6QnPi9AK50Xr
 71rBtxRzFvk00MK/bf8bL/ie28BBPKyqUI/xvvC8W33xGyyoPkuoxXMfIAYdPKpippP8
 evmg==
X-Gm-Message-State: AJIora9rnUxbxm92cMKoI5Hc+VK7mLFDUSfinOFv2zaPCtmNa8tuitDf
 gKc/A4GWhvTkq/nz1fM6vlKA8D4jb3mokJcNmhWow5CKm8IwPaCGd3R5o/HuXdh3rqRvfSf7jls
 g2hJr/6bX0dGNXtQ8nW5jaa/DvHBg
X-Received: by 2002:adf:f345:0:b0:21d:6a26:6d8f with SMTP id
 e5-20020adff345000000b0021d6a266d8fmr3451706wrp.538.1657285796009; 
 Fri, 08 Jul 2022 06:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2AkhDh8jVofFJeW+pVfKMxA/4qF0VmyXq6YR/ruIAcicMbW6v2Dejdz7JIXrgYmL0cSbUkA==
X-Received: by 2002:adf:f345:0:b0:21d:6a26:6d8f with SMTP id
 e5-20020adff345000000b0021d6a266d8fmr3451691wrp.538.1657285795802; 
 Fri, 08 Jul 2022 06:09:55 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b0039c4f53c4fdsm2618097wmq.45.2022.07.08.06.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 06:09:55 -0700 (PDT)
Message-ID: <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
Date: Fri, 8 Jul 2022 15:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Move the device-creation from vga16fb to sysfb code. Move the few
> extra videomode checks into vga16fb's probe function.
> 
> The vga16fb driver requires a screen_info for type VIDEO_TYPE_VGAC
> or VIDEO_TYPE_EGAC. Such code is nowhere present in the kernel, except
> for some MIPS systems. It's not clear if the vga16fb driver actually
> works in practice.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/sysfb.c      |  4 +++
>  drivers/video/fbdev/vga16fb.c | 59 +++++++++++++++++------------------
>  2 files changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 1f276f108cc9..3fd3563d962b 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -94,6 +94,10 @@ static __init int sysfb_init(void)
>  		name = "efi-framebuffer";
>  	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
>  		name = "vesa-framebuffer";
> +	else if (si->orig_video_isVGA == VIDEO_TYPE_VGAC)
> +		name = "vga-framebuffer";
> +	else if (si->orig_video_isVGA == VIDEO_TYPE_EGAC)
> +

I wonder if we really need to do this distinction or could just have a single
platform device for both VIDEO_TYPE_VGAC and VIDEO_TYPE_EGAC. After all, the
same fbdev driver is bound against both platform devices.

[...]

>  static int vga16fb_probe(struct platform_device *dev)
>  {
> +	struct screen_info *si;
>  	struct fb_info *info;
>  	struct vga16fb_par *par;
>  	int i;
>  	int ret = 0;
>  
> +	si = dev_get_platdata(&dev->dev);
> +	if (!si)
> +		return -ENODEV;
> +
> +	ret = check_mode_supported(si);
> +	if (ret)
> +		return ret;
> +

What do you see as the advantage of moving the check to the driver's probe?

Because after this change the platform driver will be registered but for no
reason, since can't even probe if orig_video_isVGA is neither VGAC nor EGAC.

[...]

> +static const struct platform_device_id vga16fb_driver_id_table[] = {
> +	{"ega-framebuffer", 0},
> +	{"vga-framebuffer", 0},
> +	{ }
> +};
> +

The fact that the two entries don't have a platform data is an indication for
me that we could just consolidate in a single "vga16-framebuffer" or smt. I
know that this won't be consistent with efi, vesa, etc but I don't think is
that important and also quite likely we will get rid of this driver and the
platform device registration soon. Since as you said, it's unclear that is
even used.

>  static struct platform_driver vga16fb_driver = {
>  	.probe = vga16fb_probe,
>  	.remove = vga16fb_remove,
>  	.driver = {
> -		.name = "vga16fb",
> +		.name = "vga-framebuffer",
>  	},

Maybe "vga16-framebuffer" instead? Since for example VESA is also VGA AFAIK.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

