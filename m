Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35AAA04C0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1F10E0AB;
	Tue, 29 Apr 2025 07:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LWzgT7jq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B875F10E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745912555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2WJLuJixmXGVbFFRQCzfbjiksJv5N+boviU3Y/WZ0Eg=;
 b=LWzgT7jqa6lGKDPxgMIcp/qs0LapAA6gNrH+cKHabc5C6vgqoOtk183HqT3tmvMKPJq7v4
 oRDb4aRaKtuc3wPC65Z3W4crf7XUEIbxjmoi3PFJy0rOYL4c+huMaQ63oOWDZ9SKV9RUVx
 4q+9fieCeVi245a6nRh9eKnNCAgIKVw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-8jvO-aQkOWi7s5w_HNwUcA-1; Tue, 29 Apr 2025 03:42:34 -0400
X-MC-Unique: 8jvO-aQkOWi7s5w_HNwUcA-1
X-Mimecast-MFC-AGG-ID: 8jvO-aQkOWi7s5w_HNwUcA_1745912553
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d007b2c79so34519795e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 00:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745912553; x=1746517353;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2WJLuJixmXGVbFFRQCzfbjiksJv5N+boviU3Y/WZ0Eg=;
 b=OE1AX+1qk0aNornPb71ge5GLRIUaDoAspGtcXam+Tg+eXq1cELqAvQwtQn/5h5aDv6
 y7pr7x0qInnCYApGqaa9WaLzq3kjFUstCiT9suEjLgIjYm74gci9/pvjnz8urf6mlY7r
 creuJuAV1Y4lWxNQ2PnDq8qHuVlkEZyOCA19aNyyOxHaeU1B+fW0QpsEnhj5polnJh5I
 AMheeNeeF7j0BZdHFiSc48fZooL61aZi/9zQSK6cfTM7Ktk41E+ImAZWNRmXdyh57vDs
 twIZIgN+QrKj5Dkbnk/UUxmjlUKSl+6fns2/kWW3+bKphI4JCj73pG6ubUaS2rmVTF4E
 1T4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3wLGAljHGP5hB0acjcfDn/tNmBJ3DOfsUWa/h5biBzM4Cv4rQ5m7vQc5fxLq65hn7trigfE3fbT4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycI9v1Sm44fWMQoWXovC4OQrZJcRXX8RXi2psygyhKKRu7VtPE
 U49ydO+ALFZ9RU09D3eVULdz8gB8oHD8xNL0kk2fY7n5wB7lKho9PSgd8h/CQUmLCN9bG+W5Olp
 DAzKgufzJCGtkAIHjtW82IG5bcnN7d/4dTMIAeLaODkRjJYYq1TTySsmCPp4RJtt00A==
X-Gm-Gg: ASbGncsa2XIzYD7RGDdzUXHAIwIpqVlk5JqVkaX6sz+u1lGy3Nfx5d0o0WnpxdnwHq7
 RggihfdG3TzQaY6IUrRiBPBmdiG9GNIDcmWltizma+Mtz8Oc1XIeF4oavvyLXFIDinFxLygQZ8A
 /KyCfZXJJzqfUlzjVw+Xd94ask8vJUMDwRFF/bvW+zDR6XZn6qjapPpCBir6kmBsNzX/EpJp7HE
 oG1sZjMozmng6F9CmLG1mF81JwM+er+bzhrx46CdwxAPmjTE6sXCzpBzE6QouG5qtI+My50VSHC
 OtDGadHh9lEb95rffT9ppOJyypBXEBbBrDGnb5vtqgicFBT4kclrnwAydgroi0l1gnC6hg==
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-441ad3c708dmr15682115e9.15.1745912553166; 
 Tue, 29 Apr 2025 00:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrbaa16eT2YfJ2I3RUri8LVtJfxyLH1l9EZ6S6qHzSHeygChD6UMBwtMMJT+K8rzP90d6d3Q==
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-441ad3c708dmr15681895e9.15.1745912552856; 
 Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ad112sm179026395e9.24.2025.04.29.00.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
 <aBBukAqH3SKV9_Gl@gmail.com>
 <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
Date: Tue, 29 Apr 2025 09:42:30 +0200
Message-ID: <87zffzza55.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eOAGMwx8UM5MAinVJUrCF4IkTORRnGZc0XgoNanGTVg_1745912553
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Marcus,
>
> On Tue, 29 Apr 2025 at 08:15, Marcus Folkesson
> <marcus.folkesson@gmail.com> wrote:
>> On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
>>
>> [...]
>>
>> > > +                       /*
>> > > +                        * As the display supports grayscale, all pixels must be written as two bits
>> > > +                        * even if the format is monochrome.
>> > > +                        *
>> > > +                        * The bit values maps to the following grayscale:
>> > > +                        * 0 0 = White
>> > > +                        * 0 1 = Light gray
>> > > +                        * 1 0 = Dark gray
>> > > +                        * 1 1 = Black
>> >
>> > That is not R2, but D2?
>> > include/uapi/drm/drm_fourcc.h:
>> >
>> >     /* 2 bpp Red (direct relationship between channel value and brightness) */
>> >     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
>> > /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>> >
>> >     /* 2 bpp Darkness (inverse relationship between channel value and
>> > brightness) */
>> >     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
>> > /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>> >
>> > So the driver actually supports D1 and D2, and XRGB8888 should be
>> > inverted while converting to monochrome (and grayscale, which is not
>> > yet implemented).
>>
>> The display supports "reverse" grayscale, so the mapping becomes
>> 1 1 = White
>> 1 0 = Light gray
>> 0 1 = Dark gray
>> 0 0 = Black
>> instead.
>>
>> So I will probably add support for D1 and D2 formats and invert the
>> pixels for the R1, R2 and XRGB8888 formats.
>>
>> Could that work or are there any side effects that I should be aware of?
>
> That should work fine.

Agree.

> Note that you do not have to support R1 and R2, as they are non-native.
> AFAIK XRGB8888 is the only format all drivers must support.
>
> Gr{oetje,eeting}s,
>

That's correct. The driver should only support D1 and D2 as native formats
and (emulated) XRGB8888 for compatibility with existing user-space. No need
to support R1 and R2 since the controller does not support these formats.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

