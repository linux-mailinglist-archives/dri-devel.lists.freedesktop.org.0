Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC295729626
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66D10E675;
	Fri,  9 Jun 2023 09:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1255510E677
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686304791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
 b=FH98xzgKJkRpFTu9S6g/KfdVu34q3ULBGJp6xPF76XLgnQCBTFsxxT6X4Qd3y5oIcdA5/F
 8Cf5WAqhCrakEWQnxOoLf7zq6HqBlK8gTqyjmfvF4hz+ey3/E1vP9+dGBoS4PAtT/4EHjR
 1riIk88dyhLQjZ0Hhcjrab59cJLnGCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-00Jv5T5BPUCXTmLUvOKBqA-1; Fri, 09 Jun 2023 05:59:43 -0400
X-MC-Unique: 00Jv5T5BPUCXTmLUvOKBqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30ae9958ff6so679778f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686304782; x=1688896782;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ro28qLwMycjBPd4B2CfnKUVLQYPM9zhy62Il4fiHOKA=;
 b=awXSJO2AxZm3v2YXds1vzxThoJgW0NO72iPU+HoYH7hr+WOebj/egodekcyW4mK/Br
 +lmZX7sG+eznF2PTG5usctOIB9EbofCWqL017x2/FbtSlz5ajyKwS/a5gyHT5UqguXF1
 Valoo7FACddIQ+rNIB/re+bzbGjCto9wrc3MZorR+/reiqO6N/PYD2hgIZSB4onpUfyD
 RuMHi3JJVI57liWRaTs0Ghalya+8zuNxBj6q7q4UF5naXg5Z2R5aUFenxs/3fS3zMz10
 AbZkpyQ8m9+FJ+0ZCfhsljLRroBqTXmD6JZNVFqjzcWDAY9QDr8ArxiFmRglDLMI58m8
 sEwQ==
X-Gm-Message-State: AC+VfDz3bJizMWcD7Syd1NtIDLUFQgyhIsMokI8qkWwQjoykghb9wqFK
 H3FMgGig0d0FX6BMIzfS4S4GZCJqXb6ARwJA7B2PU2nlSMUrayYsufcvRV2UkkLMaBzqmWx8rhx
 y3VBimHgOKlKNGqPyCZq8jryhoVat
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id
 bf1-20020a0560001cc100b0030d981da049mr475565wrb.4.1686304782623; 
 Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mbChq3eZ0n/KPDmx58FVgNTALqSeH3ETuPMsy/BuQZAfQWRgbheMcufPP8W0/LTSPFhyPxg==
X-Received: by 2002:a05:6000:1cc1:b0:30d:981d:a049 with SMTP id
 bf1-20020a0560001cc100b0030d981da049mr475549wrb.4.1686304782266; 
 Fri, 09 Jun 2023 02:59:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020a5d6dd1000000b003095bd71159sm4029755wrz.7.2023.06.09.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 02:59:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
Date: Fri, 09 Jun 2023 11:59:41 +0200
Message-ID: <87h6rh552q.fsf@minerva.mail-host-address-is-not-set>
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>

[...]
 
>>> I'd also question the argument that there's even fbdev userspace out
>>> there. It was never popular in it's heyday and definitely hasn't
>>> improved since then. Even the 3 people who still ask for fbdev support
>> 
>> There's X.org, DirectFB, SDL, ...
>
> None of these examples has a dependency on fbdev. They can freely switch 
> backends and have moved to DRM. Anything program utilizing these 
> examples has no dependency on fbdev either.
>
> When I say "userspace" in this context, it's the one old program that 
> supports nothing but fbdev. TBH I'm having problems to come up with 
> examples.
>

I personally have two real world examples that can give to you :)

1) I've a IoT device at home that has a bunch of sensors (temperatury,
   humidity, etc) and a SSD1306 display panel to report that. It just
   has small fbdev program to print that info. I could probably port
   to KMS but didn't feel like it. Found a fbdev program that I could
   modify and got the job done.

2) I built a portable retro console for my kids, that uses a ST7735R
   LCD panel. The software I use is https://www.retroarch.com/ which
   uses fbdev by default (I believe that supports a KMS mode but out
   of the box it works with fbdev and that's better tested by them.
   
So even when I'm not interested and don't want to enable any of the
fbdev drivers, I want to use the ssd130x and st7735r DRM drivers and
the DRM fbdev emulation layer.

In other words, there's real use cases for supporting fbdev programs
with DRM drivers. Now, I agree with this patch-set and probably will
disable the user-space fbdev interface in Fedora, but on my embedded
projects I will probably keep it enabled.

That's why I think that we should support the following combinations:

* fbdev drivers + DRM fbdev emulation + fbdev user-space
* only DRM drivers without fbdev emulation nor fbdev user-space (your series)
* only DRM fbdev emulation + fbdev user-space enabled (FB_CORE)

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

