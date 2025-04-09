Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55494A82776
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05D410E8D0;
	Wed,  9 Apr 2025 14:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cb+IjZw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6316310E8D0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744208154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrpHertxVntQ/qY4h1MpBQE3souh5hv0fw5zEOUNKB8=;
 b=Cb+IjZw9H/wWUqII7A/FuLpNCS4CFP7rVg0qeqwhv2dNkZKWisRsTEaovXjBReFR1l7jL2
 kzeSsamk8H9GcF6dyIYXwz2VlQIrLIeKHscQTjXZ77oQodFP+yLg6oslI2fOPBoyIFwC6E
 zBKJRdXfeXEs2UQGQbDxNp5HrOs4dl4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-CPc3y6aAMRSpxPZCrC7JyQ-1; Wed, 09 Apr 2025 10:15:51 -0400
X-MC-Unique: CPc3y6aAMRSpxPZCrC7JyQ-1
X-Mimecast-MFC-AGG-ID: CPc3y6aAMRSpxPZCrC7JyQ_1744208150
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceeaf1524so4814425e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744208150; x=1744812950;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jrpHertxVntQ/qY4h1MpBQE3souh5hv0fw5zEOUNKB8=;
 b=cyQNQRLwKw72z2wx6N66aq6Nv4c0GkJ89JBhstYWwQN8WlNtcE3eBqH3/NhoHjLRci
 CdheRgJ4/dlYVfpdLPnzaUZZN+Bed3KvdS3+us0EpMKsBIQTznBRP7frGIM/wSH3zD9S
 HagEkpXzn0Q7wLgbLp/y6EmWmIHpwqL9Z1s4YZJinZhpdhjounpI3o1eSoh/XwK1m8aZ
 YHZQMJBF6s5QZZog8hxBJAAbFko/ZhmfRUb8BSvzZZtyH5AzLCAXLpeav865Ii2KWfG2
 ixZhHs1aLcK2V6Df4hMFLFOJ8onLv+tG3ERtoma5pxsFHPu0TuuoLGIYlOFdIrHd6jMH
 Ipkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8EThVXAwtg8lOYIq+mKHMsdM6eQPlUXfOWiV3dNShj9y3GwztLu/4DFa0GNhONGnbqHEvniEnlpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFNkDmPvghS57BU/kXupi2Etp1yNqgDQXNLpiQGOQSgijdirIB
 N+CsTPKD8Z8sC5RPWJYx1Ct+ECb+cnVjWVlJbMP6XOldcC/00jfCQ7TsNKAvgGN28DDhlSP4/7r
 IyOuJG7LZQ7LDk2XZPehNWD/ulsEMuJsZVgBJJcQiLZHxmYxuTigmVSq5PHkVqSclYQ==
X-Gm-Gg: ASbGnct3RMnJ+6FgT+cDoQnldSdQlm0Y7UlrbnIngIJ02AvyVC/SZNRW+pLKbJtH6D5
 hJvVEPuqaJpxdYCMve63iR8iM3jtbJfhr2CjM1uNI1a+6wxOHmHHjg1jIPUdLn94BlW2kyEOFYq
 RLwQLS/7ivMfHJQAGY9WNyf43qPI++6Bt4KZ2i9g5+xlCxZ2mZnbCyBH3EkB1HB7fxNBo28F6aL
 sThgn/YhqAmhLN1Me3H6gXtP1W54C/sA1QMu5UmuTW5q606v1denGhISBIb2TCFZFG3kIO2tRIF
 0Mk4K/kRC0LJy56EB0IALGBhYHG6q42eIMKcF1pCvNn6AUjgzj/fGffcMzwQLQhbzDv+/w==
X-Received: by 2002:a05:600c:ac7:b0:43b:baf7:76e4 with SMTP id
 5b1f17b1804b1-43f0e543857mr66192715e9.1.1744208149909; 
 Wed, 09 Apr 2025 07:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvVp9zrTsV/xYMueZnWj5314rLrL6fBlzCWZ3OqwS70BlFzwTLlcjaEvPa/AvvbpIehmI9Tg==
X-Received: by 2002:a05:600c:ac7:b0:43b:baf7:76e4 with SMTP id
 5b1f17b1804b1-43f0e543857mr66192425e9.1.1744208149596; 
 Wed, 09 Apr 2025 07:15:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fca5sm22156435e9.32.2025.04.09.07.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:15:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <Z_Z1UOan6Qu5d3VM@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_Z1UOan6Qu5d3VM@gmail.com>
Date: Wed, 09 Apr 2025 16:15:47 +0200
Message-ID: <87zfgpe7zg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i6KBgonA_S-nm_td3uEzwiOXtG2W47W0BiDMtqeQrwc_1744208150
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Hello Javier,
>
> On Wed, Apr 09, 2025 at 11:43:54AM +0200, Javier Martinez Canillas wrote:

[...]

>> 
>> Likely you will need to define more stuff to be specific for each entry, maybe
>> you will need different primary plane update handlers too. Similar to how I had  
>> to do it the ssd130x driver to support all the Solomon OLED controller families:
>> 
>> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/solomon/ssd130x.c#L1439
>
> Thanks, that sounds like a good idea.
>
> I've now experimenting with XRGB8888, and, well, it works. I guess.
> The thresholds levels in the all conversion steps for  XRGB8888 -> 8 bit grayscale -> monochrome
> makes my penguin look a bit boring.
>
> But I guess that is expected.
>

Yeah, the XRGB8888 version is a boring indeed comparing with the C1 one...

The drm_fb_xrgb8888_to_mono() helper is very naive and just uses a very
naive midpoint thresholding to choose if the pixel should be 1 or 0. So
there is a lot of information lost there unfortunately.

But that's what I did for ssd130x, to at least have a working driver. Then
support for R1 (for ssd130x family) and R4 (for the ssd132x family) could
be added as follow-ups. I never did it but Geert has some patches for this.

> Please compare
> https://www.marcusfolkesson.se/xrgb8888.png
> and
> https://www.marcusfolkesson.se/c1.png
>

Nice pictures!

>> -- 
>> Best regards,
>> 
>> Javier Martinez Canillas
>> Core Platforms
>> Red Hat
>> 
>
> Best regards,
> Marcus Folkesson

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

