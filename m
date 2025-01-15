Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB47A121DE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929F010E4F0;
	Wed, 15 Jan 2025 11:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D2AfcCtL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FED10E4F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736938887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QjzHDq2aERn0VakRka9qUVAea6K8S7N+dOI19uQGdAU=;
 b=D2AfcCtLHyNqbcsX4qvO0Y/bLw1swPEouM+vo3WowbXOdAf/CMnI3auzHs8ix/cKq1WHyj
 N01OnY0FmJZWeSZ8TlAYqpkKU7LGsysbWGFrCO7XQVDsDAUrSElY2yS7OxgR/V2h1MX9y6
 1rF9zn/8cDZOiITpxl3u2X5wZ9L6U50=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-4Ju3_FutOZSa7Fmm47eZfg-1; Wed, 15 Jan 2025 06:01:26 -0500
X-MC-Unique: 4Ju3_FutOZSa7Fmm47eZfg-1
X-Mimecast-MFC-AGG-ID: 4Ju3_FutOZSa7Fmm47eZfg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43624b08181so3605245e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 03:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736938885; x=1737543685;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QjzHDq2aERn0VakRka9qUVAea6K8S7N+dOI19uQGdAU=;
 b=WDUuo1L9X8cpwI2bVBeOpUIORz+07Ynn/G+hDoWe/tRadp6EP9BX/n0wSOM0xf330O
 43CektqFGvyc/vk58oeJwEFMUyIToV6kUBu+8/i1Wx+3RcknLW4TJC2Okzz3G24OOSXN
 qapwsSaCdtfwEmw6eJ26iQbKDOskStAP2+yvh5PvNkXdw3wo8foZgA7S59wLqD+Ctlgm
 3X7+yKp0se/jkVYqoQ1jtcSl5c+lErwSt9/Wqcm1tDZ2bGA+Mo0FZ2Wc9aWapxB/uxBV
 RR+TtK3HqJuirjKYsENbDL/vpc1rooTLVJIbJMBVo6Ajm1QbHW58Sx8NdSZVVx3gNXif
 jvfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY/An9TZwxayMtBjZbCQp31VvtoyB95ydp2u/2Z+E6hx/uOb+3BVLJ2gURd+WjnHEl9rSacaLHfDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0w33lDsGSofIOTe8I8jh8Hb+0hXZ47kKpBvOhtjVNBVIm8qIQ
 Qv3p4ghjQLOkczolyFMW0gDnEtTLiPOBWWPLzbEp8AQAF/lMCX7/AFtvpzrjZ/pzlS8i1Ne1P1R
 tKiHi9b/Zi+tMHrRHPoxESbRJD6bxQ1P6Ir7hCENDRCbWPerb01bFgu6JZUP52XLHbQ==
X-Gm-Gg: ASbGncseBQhF+KZ1IjeINpZCQ2UE9cDNbgGpGkGBd3dYPs7ZY8Wg/Zn1bqw6bEjJrDy
 VSfr3GbYm+tErt+kd/ffnL1b5DG8nFoxRegfzqLN3WzVoZfLPEBHDbfUZuM3F7FvV8veC14gmKW
 wYxlAjL2e1nAn3YififPJ3/BIy1GNVhwDaFa/sydsRgjcGF7Wkj37kfsMIVU021DA3iLyJV0pGI
 VoSRxTnEjbsYbpQtAT6wjOazIxtRrnaH2v5xukEm1vCyajuCOw7osD46IRI7WjJqG3DEGOSA4jw
 6HhzLspSSb7DRBzb91YHraoN+skcDWNWhUGh8r8=
X-Received: by 2002:a05:600c:3481:b0:436:fdac:26eb with SMTP id
 5b1f17b1804b1-437c6afdb21mr21000735e9.7.1736938885109; 
 Wed, 15 Jan 2025 03:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH75wZZHjjhCZJ6RruxMhop3f1GE1K2yA06f8GB0EnTjILDJNkGgRn1t2VWah6QKH9lU2Oa2A==
X-Received: by 2002:a05:600c:3481:b0:436:fdac:26eb with SMTP id
 5b1f17b1804b1-437c6afdb21mr21000475e9.7.1736938884739; 
 Wed, 15 Jan 2025 03:01:24 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ab449sm19106655e9.10.2025.01.15.03.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 03:01:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/ssd130x: Fix reset timing for ssd132x
In-Reply-To: <Z4eQhOcQs6X0O75e-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-2-jkeeping@inmusicbrands.com>
 <87y0zdvxy2.fsf@minerva.mail-host-address-is-not-set>
 <Z4eQhOcQs6X0O75e-jkeeping@inmusicbrands.com>
Date: Wed, 15 Jan 2025 12:01:22 +0100
Message-ID: <87jzawwdbx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BfgiJsFoh3C91XySN2ISQ4rV798zx-Q8j8uAOKnX8_c_1736938885
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

> Hi Javier,
>
> Thanks for the review.
>
> On Tue, Jan 14, 2025 at 11:21:25PM +0100, Javier Martinez Canillas wrote:
>> John Keeping <jkeeping@inmusicbrands.com> writes:
>> Thanks for your patches!
>> 
>> > The ssd132x family of chips require the result pulse to be at least
>> > 100us in length.  Increase the reset time to meet this requirement.
>> >
>> 
>> That's not what the datasheet says AFAIU. It says the following in the
>> "8.9 Power ON and OFF sequence" section.
>> 
>> Power ON sequence:
>> 
>> 1. Power ON VDD.
>> 2. After VDD become stable, set RES# pin LOW (logic LOW) for at least
>>    3us (t1) and then HIGH (logic HIGH).
>> 3. After set RES# pin LOW (logic LOW), wait for at least 3us (t2).
>>    Then Power ON VCC.
>> 4. After VCC become stable, send command AFh for display ON. SEG/COM
>>    will be ON after 100ms (tAF).

>
> The version of the datasheet I have for SD1322 says:
>
> Power ON sequence:
>
> 1. Power ON VCI, VDDIO.
> 2. After VCI, V DDIO become stable, set wait time at least 1ms (t 0) for
>    internal V DD become stable. Then set RES# pin LOW (logic low) for at
>    least 100us (t1) (4) and then HIGH (logic high).
> 3. After set RES# pin LOW (logic low), wait for at least 100us (t2).
>    Then Power ON V CC.(1)

Oh, that's interesting... I was looking at the datasheet for SSD1327 (the
only SSD132x OLED I have). Maybe we could parameterize the delay values
and be new members to the struct ssd130x_deviceinfo ?

> 4. After VCC become stable, send command AFh for display ON. SEG/COM
>    will be ON after 200ms (t AF).
>
> And on the hardware I have 4us seems to be too short.
>

Yeah, it says 100us in your datasheet while it says 3us in the one I've
for the SSD1327.

> However, having tested it again today it seems to be fine with the 4us
> delay so I suspect this was a misleading change in the midst of other
> debugging.
>

Got it.

> I will drop this patch from v2.
>

Ok.

>> > Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
>> > ---
>> >  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> > index b777690fd6607..2622172228361 100644
>> > --- a/drivers/gpu/drm/solomon/ssd130x.c
>> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> > @@ -363,7 +363,7 @@ static void ssd130x_reset(struct ssd130x_device *ssd130x)
>> >  
>> >  	/* Reset the screen */
>> >  	gpiod_set_value_cansleep(ssd130x->reset, 1);
>> > -	udelay(4);
>> > +	usleep_range(100, 1000);
>> >  	gpiod_set_value_cansleep(ssd130x->reset, 0);
>> >  	udelay(4);
>> 
>> That's why I think that the udelay(4) are correct here, since that will
>> make for the delay to be bigger than 3 usecs.
>> 
>> Now, is true that the mentioned 100ms (tAF) after sending an AFh command
>> might not happen. Since I see there's no delay after sending a display ON
>> command in ssd130x_encoder_atomic_enable():
>
> I don't think this matters.  It is a delay before the user sees the
> image, but that is not relevant to the timing of any commands
>

Oh right, it's only about the time that the SEG/COM are ON indeed.

>
> Regards,
> John
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

