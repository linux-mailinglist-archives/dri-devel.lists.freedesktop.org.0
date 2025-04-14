Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FECA87984
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE1B10E4BA;
	Mon, 14 Apr 2025 07:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f5UWmerM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69F10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744617331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VyGy8TpTRsYSW6wLWDE/VjeSgPcgxN9oD2qpQCJJZhc=;
 b=f5UWmerMEIUR5oAuPwULPcZpcOUcVI9VBdR6IjoM83FK5uOQ9307ai9ntCbY9Ge5lCNyeb
 a0Dpb+t4f7kinFasljQjIod4jDmaJgYOeXovYyPr0xWjsjI/QuOTEW+rIpflKcPuN6VBug
 qb/PmvwN596A8S3Mxzw7KzeEWRKqLpw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-dnC96JMaMdqK_xyblnZjyg-1; Mon, 14 Apr 2025 03:55:29 -0400
X-MC-Unique: dnC96JMaMdqK_xyblnZjyg-1
X-Mimecast-MFC-AGG-ID: dnC96JMaMdqK_xyblnZjyg_1744617328
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3912d5f6689so2232585f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744617328; x=1745222128;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VyGy8TpTRsYSW6wLWDE/VjeSgPcgxN9oD2qpQCJJZhc=;
 b=Ww98NV4SxOYaGrCaxZYHCiB/UsvYBYdRa8wiIkaThm7UuDR41T6y07q1VM7qaoAgpu
 Nr4kPRklu6vpVnyCxeB2P7z6qmaZbE51VU3obN9GuqnOy/j+h0fiV3tDgzFmm6Icrh/O
 6h6hjGXXC6TGHETA8YaIHAbbQpYpYwFlQphgzuHuw0YvhV0ofjqMHBWNfUUFtWAZCq8Y
 RmuKv25E5xQDkRO658yefjgopiPzmot1LxhvPMqTYNhUbo1MAQLPKl6eLTHN8b8+GF6/
 1Zz/xGqqbnfjoif+vhRjt3rEg8rer0LYBiBknb2xlekaIt7JzntzQBBYToeD0z4vG2Bm
 OpZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqDpyhIqHKp1V5OQLh8/INR0p/Pzg72eWi/mkWy8LDF4sbRXLRFBPIzKtq0x4xAtLsFXCXcCgusDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytNtqL2yf3oEsP+CxY2HkF3zCFWfN18KLp8M7JDrNnf4KHygsZ
 UbEu8fEJppcZCLIFMqnLx+/sjLehPFue8fCQLHmOgqBlTLYRieT0IFlpBlygV80Huxk+KgIiHTG
 3Xnhtzg1TRvEt9sHsRp/eIvQSFL2rJl+9QWOiYwZ84dpoaewCpTN3gNlC+B4O7ZF9fw0QMv4iov
 Eu
X-Gm-Gg: ASbGncs8P5aDhUZNpGfczgem4IGkJkvvcI+EzdGa27yPMIG3sO8epIedB479nlGTxWt
 wfEeiYHDySisIPPWW8xOm//3TGAMKZ54BHwFiZhTt+EiJkAzXyW0QFV9ma58T6NvxOCNYDezAE/
 TnVtJN2gya8XpkAVznzA4rYgh2SfjosjlgFlVIIgJDKtRsvLpToa7F0ozq/ystdy2dCFS7CsJ+z
 BNRyoKSWdz8PFd1RwobpmA6/VUyumHPjocMqc2s3FsEmkEtzpnzC2/qeDIoubDXShV4JT/i6uun
 CzHyh6r8lYADD6rF4ksmN3UmmlDP8pjEovO1buLunTB4
X-Received: by 2002:a05:6000:2586:b0:39c:e28:5f0d with SMTP id
 ffacd0b85a97d-39ea52171d4mr8935028f8f.25.1744617327890; 
 Mon, 14 Apr 2025 00:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETQUkn0hF6FLm9NcXpYwCxUXih2R9GqT9ocdhEggOG/wqrLcDmZ7Cdgh4Umo12Ue468Vucbw==
X-Received: by 2002:a05:6000:2586:b0:39c:e28:5f0d with SMTP id
 ffacd0b85a97d-39ea52171d4mr8935008f8f.25.1744617327462; 
 Mon, 14 Apr 2025 00:55:27 -0700 (PDT)
Received: from localhost ([2a01:cb1d:968a:da00:a3a9:3006:4689:68f6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cdfdsm10378556f8f.61.2025.04.14.00.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 00:55:26 -0700 (PDT)
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
In-Reply-To: <Z_oOkb2Lx3HNhnSK@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
 <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
 <Z_oOkb2Lx3HNhnSK@gmail.com>
Date: Mon, 14 Apr 2025 09:55:25 +0200
Message-ID: <87v7r76utu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qxHUX7xQJYJPe8eWKqfazP50zTg9R_wyFILE154HBs0_1744617328
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

Hello Marcus,

[...]

>> >
>> > A comment for v4:
>> >
>> > I think I will go for a property in the device tree. I've implemented
>> > board entries as above, but I'm not satisfied for two reasons:
>> >
>> > 1. All other properties like display size and resolution are already
>> >    specified in the device tree. If I add entries for specific boards,
>> >    these properties will be somehow redundant and not as generic.
>> >
>> > 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
>> >    product.
>> 
>> Sure, that makes sense to me.
>> 
>> Can I ask if you could still add reasonable default values that could be set
>> in the device ID .data fields ?
>> 
>> As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
>> just drop that and use your driver, since AFAICT the expected display data
>> RAM format is exactly the same than when using monochrome for the ST7571.
>> 
>> But due the ST7567 only supporting R1, it would be silly to always have to
>> define a property in the DT node given that does not support other format.
>
> Sure!
> I've looked at the ST7567 datasheet and it seems indeed to be a very similar.
> Both in pixel format and registers are the same.
>

Thanks for confirming, that was my understanding too.

> I think specify a init-function (as those will differ) and constraints will
> be enough to handle both chips.
>
> I will prepare .data with something like this
>
> struct st7571_panel_constraints {
> 	u32 min_nlines;
> 	u32 max_nlines;
> 	u32 min_ncols;
> 	u32 max_ncols;
> 	bool support_grayscale;
> };
>
> struct st7571_panel_data {
> 	int (*init)(struct st7571_device *st7571);
> 	struct st7571_panel_constraints constraints;
> };
>
> struct st7571_panel_data st7571_data = {
> 	.init = st7571_lcd_init,
> 	.constraints = {
> 		.min_nlines = 1,
> 		.max_nlines = 128,
> 		.min_ncols = 128,
> 		.max_ncols = 128,
> 		.support_grayscale = true,
> 	},
> };
>
> static const struct of_device_id st7571_of_match[] = {
> 	{ .compatible = "sitronix,st7571", .data = &st7571_data },
> 	{},
> };
>

That's great! Exactly what I had in mind.

>
> I can add an entry for the ST7567 when everything is in place.
> The chip does not support the I2C interface, so it has to wait until

Yes, but there are designs with carrier boards that support I2C. For
example, I have  [1] and [2]. The former comes with an I2C interface
and uses the ST7567S IC variant, while the latter comes with a 4-wire
SPI interface and uses a ST7567P IC variant.

But don't worry about it. Since I've these displays and your driver now
allows for different IC families after adding the mentioned indirection
layer, it should be very trivial for me to add support for these on top.

> I've split up the driver though, which will be right after this series.
>

Nice, thanks again.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

