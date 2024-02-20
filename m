Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A085B7A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AAC10E1C4;
	Tue, 20 Feb 2024 09:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ARZ7NZLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCAC10E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Hgn9WqXu1AhhX6E5+lsbEBu8N0fTK8tYmqmiPGcClA=;
 b=ARZ7NZLWLjH7jyHqKAAa47bNF3PLxCHa2BNGOTlpt6NSBSF0v3ys6Xo0plG0XOmHUew3ng
 0VY/8SbJNo155dWlnXJhoqeTJYyJhbrsYxJs2P7NYwZRKqs+C4KEC7n+ms8ZLkCcHT7AmD
 ETdhCNObVVC+8ofRhnQWnsurcTQ7LdM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-ovKgnvj8Pi-OeZsrdQsNPA-1; Tue, 20 Feb 2024 04:35:56 -0500
X-MC-Unique: ovKgnvj8Pi-OeZsrdQsNPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-410422e8cd1so20881765e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421755; x=1709026555;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Hgn9WqXu1AhhX6E5+lsbEBu8N0fTK8tYmqmiPGcClA=;
 b=dNfx0kKRgV7hTCwYGienK45fvQjo3MHDJWC2xeK7BIiJ0sFbAtRclD2BWDl6UkXEni
 Z/LID57Q7b9HARf3VNxOi/Sy07ivMdD+qwbfJMy/7rZsLvaOv1d7F9q6NH5jxWXpodtU
 RpzbO3EKOab2ZqTsVPFvmAlScc/uvrl2KMyqVtsCg+sbxAKmIksjxw6Sn3lUnYOSqScf
 Y00Kttj0VR7OcFnFCBBDy/mcR9CbfNuntXbyJTubEoGHcpN3kJOGAbZpv7LAVH0ylRup
 SbQuWMO26vR0pD7e/Rx8weBBFdv9gKiyXXG6AtPeWegWMbtuFEScbG0ksYVC71TeKKMF
 Y1Ew==
X-Gm-Message-State: AOJu0Yw3HsJwS0lNTDMzRiDwtSmYYUoDgcv2h5Du5wUBbqN8X42D0efY
 rjYLis4Pz4HLfZMRqjFVXfzWe1Jq4Bgv1b/vvLMr1LCMhLsKZ5XkVHhsn3taW0N76zOtA8xkwlY
 DxqiGQ0D1dfuUwfUBZGZs0ocyeAHWFmYG1YKVDpdwXDH2kkaxpdipd4jZDkhOEDoeug==
X-Received: by 2002:a05:600c:310f:b0:412:68a1:1020 with SMTP id
 g15-20020a05600c310f00b0041268a11020mr3013467wmo.17.1708421755412; 
 Tue, 20 Feb 2024 01:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+JttJJiDku7kTZxlbPK/PYMKWsh61tt639P+Ab793uMc5bDoYOmRxrg62ZITenPVeeiMypg==
X-Received: by 2002:a05:600c:310f:b0:412:68a1:1020 with SMTP id
 g15-20020a05600c310f00b0041268a11020mr3013458wmo.17.1708421755137; 
 Tue, 20 Feb 2024 01:35:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c229500b0041228b2e179sm13843333wmf.39.2024.02.20.01.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:35:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 10/10] backlight: Add controls_device callback to struct
 backlight_ops
In-Reply-To: <20240212162645.5661-11-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-11-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:35:54 +0100
Message-ID: <87le7fiikl.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace check_fb with controls_device in struct backlight_ops. The
> new callback interface takes a Linux device instead of a framebuffer.
> Resolves one of the dependencies of backlight.h on fb.h.
>
> The few drivers that had custom implementations of check_fb can easily
> use the framebuffer's Linux device instead. Update them accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Personally, I don't like the "control_device" callback name that much. I
think that check_device or probe_device would be a better one and easier
to understand what it does.

But not strong opinion on that,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

