Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3356BA7F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66813113AA4;
	Fri,  8 Jul 2022 13:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719DF113AA2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657286220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taWGRykRcCXffB4wtdvVAvKsI7Nlq7FpgHnPYTf/ge4=;
 b=E/7MEP0CbOh995/qS/q1sEST3WuZr7MFdr/2/miHt2x4xh7lDLEZzU37kaBptkVRMnRwh1
 O9SPT87zWuTgr9WFzV8MO8CIfsY9pK5d0boTAfYKJLKFAuq6QblN2XKcc/w3oSBdo6UqkJ
 HymjCkvkKLInKDiUdPp0iivsDDKli3U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-C4BRx3NhNzqjbO1sBr2QEg-1; Fri, 08 Jul 2022 09:16:59 -0400
X-MC-Unique: C4BRx3NhNzqjbO1sBr2QEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so983525wms.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 06:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=taWGRykRcCXffB4wtdvVAvKsI7Nlq7FpgHnPYTf/ge4=;
 b=7Fv3Ytyi1M3m61Y15gTzYmHv4j5zf1yJSN9VVxpylIK2Sj1hcKStjR3Cdjp7G/EgSs
 vwSRvE8G5urXrT7BvefHlv8gmo1+mlaR+UROSx08f5aIprRJUbUz7TirWYkprds+0bPm
 QxnwGDAYBF/wstTxwVYcFK+1HOs6oXXa6vPV1nv+orjDz20OE14zM57n+NlWb/6dcg9/
 oLhq0vXPQRjLIaZUcNwvcgG8hyzFnH/j/fNUEGU3tZnTlksUMWOf+NIKnzEgcC1c0h2J
 90cgbYPw/3QJumOnbF3qs1y1a8SGgl85XV5nff+AC7t0X9TDxo67RnOjgtp8p7CrzZKE
 ljig==
X-Gm-Message-State: AJIora/ZwCReFdpGuceTupjSfc0/OAdsP4AeiGpfAXQQtwsXeIvNPaBV
 5Yww6GPgL5dn7fHtfIAjBjRSFO4jv0b+4sVsO/7RKmh/E4PYHVisFT6fCgoXoU91brnEIoEnsNb
 0Q03a3uLihVEs4QZDgAwcPANGs5vq
X-Received: by 2002:a05:600c:22d3:b0:3a2:d8e2:8f15 with SMTP id
 19-20020a05600c22d300b003a2d8e28f15mr3947719wmg.177.1657286217988; 
 Fri, 08 Jul 2022 06:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uaoPGchnKEAsNWt5YtjhCVNIm3fZ6cMPpN4DNnBgujYqJtYRT2Th3du9stdFVi0zaNnRMlBg==
X-Received: by 2002:a05:600c:22d3:b0:3a2:d8e2:8f15 with SMTP id
 19-20020a05600c22d300b003a2d8e28f15mr3947696wmg.177.1657286217740; 
 Fri, 08 Jul 2022 06:16:57 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p8-20020a056000018800b0021d7f032022sm6638044wrx.17.2022.07.08.06.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 06:16:57 -0700 (PDT)
Message-ID: <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
Date: Fri, 8 Jul 2022 15:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-4-tzimmermann@suse.de>
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

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Move vgag16fb's option parsing into the driver's probe function and
> generate the rest of the module's init/exit functions from macros.
> Keep the options code, although there are no options defined.
>

Ah, I see now why you wanted to move the check to the probe function. If
is to allow this cleanup then discard that comment from previous patch
and I'm OK with the move.

Maybe you could comment in patch 02/11 commit message that the check is
moved to the probe handler to allow this cleanup as a follow-up patch ?

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/vga16fb.c | 35 ++++++++++-------------------------
>  1 file changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index f7c1bb018843..e7767ed50c5b 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1321,12 +1321,21 @@ static int __init vga16fb_setup(char *options)
>  
>  static int vga16fb_probe(struct platform_device *dev)
>  {
> +#ifndef MODULE
> +	char *option = NULL;
> +#endif
>  	struct screen_info *si;
>  	struct fb_info *info;
>  	struct vga16fb_par *par;
>  	int i;
>  	int ret = 0;
>  
> +#ifndef MODULE
> +	if (fb_get_options("vga16fb", &option))
> +		return -ENODEV;
> +	vga16fb_setup(option);
> +#endif
> +

I would just drop these ifdefery and have the option unconditionally.
It seems that's what most fbdev drivers do AFAICT.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

