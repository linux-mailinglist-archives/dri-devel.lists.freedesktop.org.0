Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED9727187
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A0010E55A;
	Wed,  7 Jun 2023 22:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1B10E55A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686176567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
 b=K9VAbmiHShuwfsyDQrJvd+WZHm1rDaFrCct+LFfVotFYKW8e5kujZTVjxIuq7hkvPNgEOx
 ZEsfpCix2dyS3LvdpesA1MARhlEB8q5erMjOYYKjLjpam2FOOzXbQ7puVqSkOcu43yigVP
 aIHoP91l4IdrkC1Mjo4A3ShqyziWkQ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-7y0cE4NJMIWudRkT3gH3fg-1; Wed, 07 Jun 2023 18:22:46 -0400
X-MC-Unique: 7y0cE4NJMIWudRkT3gH3fg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f7f77ac6b6so857765e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686176565; x=1688768565;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
 b=aQu3cuJ6+aQQFO7uPgeUDXBsQLVRnVVIhax7x+WmN9jjmbdXV10QQkxbEcLYsKdIie
 t+vgK2tinpL7Dfyf+MdzZkQ3diGxYxihvQyiYkhcKzBn1oXrTZDqKuJ8fra+kB30DVjz
 aAa6tIWZx+RT/DnHgQO23y9b2M63dFE7Pb8plmp3+MhsP19GJKCemfsLd66CV4+w7HxZ
 Pas0kd3kCnkctLwoFgO7QgnqLKMSqUYhM/TWMAS720KY5Ol7v5wnxlhib7Om5xd52dW7
 xyop9S7TnljnG8mzMNcIiLUQ5Tu9GYBJubHo1LzNwDuOVEf3Z3POccOT+21YN204fiLZ
 Tr/g==
X-Gm-Message-State: AC+VfDzZGyQ+Dd/92DLLgeqTXidWDcbWBgpInji0k019Eap10AcdWQpS
 1EowU/bUFiLC0Dn7wUvt+aHoYfb2W373oFzjgPmqNa2XOL2jJuYawfpH0EyozrsnSmWbftexmz6
 RRdSIwlE9SA3M5egwmnvoX87LS4fA
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id
 z17-20020a1c4c11000000b003f726f84cd0mr5570494wmf.16.1686176564941; 
 Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74+KkyeYoTNHdtFgdPjs/ko5gB/9QwThWFkjR0/oU0p3+M7MfNC36MRsPeTiM50kMg9GLwXA==
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id
 z17-20020a1c4c11000000b003f726f84cd0mr5570479wmf.16.1686176564616; 
 Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v6-20020a7bcb46000000b003f6028a4c85sm3342086wmj.16.2023.06.07.15.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
In-Reply-To: <20230605144812.15241-23-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
Date: Thu, 08 Jun 2023 00:22:43 +0200
Message-ID: <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect registered instances of fb_info by reading the reference
> counter from struct fb_info.read. Avoids looking at the dev field
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---
>  drivers/video/fbdev/smscufx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
> index 17cec62cc65d..adb2b1fe8383 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
>  	u8 *edid;
>  	int i, result = 0, tries = 3;
>  
> -	if (info->dev) /* only use mutex if info has been registered */
> +	if (refcount_read(&info->count)) /* only use mutex if info has been registered */

The struct fb_info .count refcount is protected by the registration_lock
mutex in register_framebuffer(). I think this operation isn't thread safe ?

But that was also the case for info->dev check, so I guess is OK and this
change is for an old fbdev driver anyways.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

