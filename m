Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8EA113F7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 23:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3788E10E48A;
	Tue, 14 Jan 2025 22:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Esr7pNQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB39410E488
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 22:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736893290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9vJgeFoWfMpYZa2yqicc322CUq9ytQzvhdbBmt+4duA=;
 b=Esr7pNQVumNbrX8K/jK4dghRVPznKf1JfGFehnsbRFsHGG6Y3/ErYFR6JNA/HNPdDPHUR3
 B57WbNGCIMJgfKyGhu//hDd3oVD4FPg+QMBJUcGtmSqRFj47b7N7VPIBALUd9ePULqNSkE
 9xaSrWGrjsokStzkHUHLShFhuHFZ2Wc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-rGbb3ecPMyWLRMJldbCa3A-1; Tue, 14 Jan 2025 17:21:29 -0500
X-MC-Unique: rGbb3ecPMyWLRMJldbCa3A-1
X-Mimecast-MFC-AGG-ID: rGbb3ecPMyWLRMJldbCa3A
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361c040ba8so33786725e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736893288; x=1737498088;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9vJgeFoWfMpYZa2yqicc322CUq9ytQzvhdbBmt+4duA=;
 b=mLd1jnFZMc+aBTEZTWb/gWh/2GEGaIb778eKbIZtHrEmlWAA95vFHkbXEAlhkM/xsj
 uE9uNPMZXWwm0Fe+q9zvoBsLIssVviOmttWlgQC9Tz2E+XPW1RS4cPhIoqgd6GgdkgEK
 psIekKQxs++G8zEh72473/nzkQErmNgqMizdp5Ke6n/6leJu+48VQF/5x8nQNMirNKzf
 r6OfFVV2S/C/pCDlOPz6/G9BUe9pGArbpvYFEuxdjCo6B0aNBP0LkahRyAAurl0/GZno
 JRSIAHyYeN9QowDS71x2CSKlrz4Pqv9H9I+PC6MiyI1677D2CuorpPLNenQMeAREH9r6
 daVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy1s3s/Q7kt/haiM++fWbhnLCrbxgWb7pf+vb0mBjsLYCgKNToX96WVcnuPt8QOvfV9zAkkf9cOMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxik11r9dgXuIda+fEIv0sMaJQgRfo3BJ7g5yXtdUWDP1YoiQTX
 rhFBq05z0T+LWy0BNpYXvjupAffonNFARG5YLjdH8Tcs/uPVZkxtisG0w2jTJ3/wsXSElyxzcBS
 UZV2QZdMwve4MUW/k6e+AksiXNugTJ/6ZrZFGfoaIJ2+QN8Jb87+oH8KRpJcGJbWJgg==
X-Gm-Gg: ASbGncuKqGOUSEegHRbSQnkHaPkD8K+3w9l/YALpoKg9HlNqBURMK5YA0dNxndRCzV6
 X5IetiMayJBkq26LH6NjWgXJ9PIFvuRRsmi8CYO75vlozrIaIcj2eHZnmzAJ5kbEEonFHvzLwhY
 pBBis81oL8g7D9Uuyi6h7KlfrUL5ouPJdc8PHssuKio8G+MSCXkbZiODAqudRHtRP2uM4HKG9+K
 s0XeYg2+gHf1ifFpPb+piP3RPzsb1B+2Bh8Rt8ytywsZVqegMcfi35NjjMd0P+xo4TpiTmx9jKr
 N7euMv6cIdXSZdEphy8FFVX8+IzXq2eczQYslyc=
X-Received: by 2002:a05:600c:3ca0:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-436e266e818mr230026775e9.2.1736893288163; 
 Tue, 14 Jan 2025 14:21:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe0Wp/4RFeqjOjh2vP8LZJceetGO5GF0E+p5hagAtJC3YSRHAa5FSpFzR+YUCc581Hjt/+Ug==
X-Received: by 2002:a05:600c:3ca0:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-436e266e818mr230026645e9.2.1736893287809; 
 Tue, 14 Jan 2025 14:21:27 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ad59fsm1262245e9.16.2025.01.14.14.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 14:21:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/ssd130x: Fix reset timing for ssd132x
In-Reply-To: <20250113152752.3369731-2-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-2-jkeeping@inmusicbrands.com>
Date: Tue, 14 Jan 2025 23:21:25 +0100
Message-ID: <87y0zdvxy2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n_FMaRh0ykL3pKzebOnqRlQh-muAvDQab4Y2QTVlfCw_1736893288
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John Keeping <jkeeping@inmusicbrands.com> writes:

Hello John,

Thanks for your patches!

> The ssd132x family of chips require the result pulse to be at least
> 100us in length.  Increase the reset time to meet this requirement.
>

That's not what the datasheet says AFAIU. It says the following in the
"8.9 Power ON and OFF sequence" section.

Power ON sequence:

1. Power ON VDD.
2. After VDD become stable, set RES# pin LOW (logic LOW) for at least
   3us (t1) and then HIGH (logic HIGH).
3. After set RES# pin LOW (logic LOW), wait for at least 3us (t2).
   Then Power ON VCC.
4. After VCC become stable, send command AFh for display ON. SEG/COM
   will be ON after 100ms (tAF).

> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index b777690fd6607..2622172228361 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -363,7 +363,7 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
>  
>  	/* Reset the screen */
>  	gpiod_set_value_cansleep(ssd130x->reset, 1);
> -	udelay(4);
> +	usleep_range(100, 1000);
>  	gpiod_set_value_cansleep(ssd130x->reset, 0);
>  	udelay(4);

That's why I think that the udelay(4) are correct here, since that will
make for the delay to be bigger than 3 usecs.

Now, is true that the mentioned 100ms (tAF) after sending an AFh command
might not happen. Since I see there's no delay after sending a display ON
command in ssd130x_encoder_atomic_enable():

  static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
                                            struct drm_atomic_state *state)
  {
..
           ssd130x_write_cmd(ssd130x, 1, SSD13XX_DISPLAY_ON);

Maybe the solution is to add the here?

Also, according to the timers-howto doc [0], the usleep_range() helper
should only be used for small msecs (in the 1~20ms range) and msleep()
used for larger msecs.

[0]: https://www.kernel.org/doc/Documentation/timers/timers-howto.rst

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

