Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E008402F5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569110F6CF;
	Mon, 29 Jan 2024 10:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827F112848
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706524879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuw+sd9oKGlN++0B7Qqn1bE1N0OC+tp2A8+Ru07eNUc=;
 b=F6CT3C81fkefWw7bCOuYJKVXqSvptFyHkbaqTP8NIRiWwG7vzwoGjvO9L2cR07rlXPvYuW
 ultZpR37Ri42CsrcWqftRPCA1pvenedUTGVjpYadzN1PlZvjfLs3NusphFaoKWG7QhaL+f
 GXJl0LSsF+hiv4B2kwfVfcO8AaPxqI0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-h2L4Mzr7N_qlZUJPZ8mD7Q-1; Mon, 29 Jan 2024 05:41:18 -0500
X-MC-Unique: h2L4Mzr7N_qlZUJPZ8mD7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-339250f6515so1067801f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 02:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706524877; x=1707129677;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuw+sd9oKGlN++0B7Qqn1bE1N0OC+tp2A8+Ru07eNUc=;
 b=tKXZgq1urMKCo0S9nMxer0s/mDORy/FNiRFjlJW9DLdixX2uPglSkY37+v1ILNjbK+
 uRoRSJn0CY9S0/qb78AU43kvVC1ELzYAoCRFvpP5k6jFf8Avuq/iHtupY/zNCUPX0LyO
 4fnUIqwnZtmWQkTTzmNoYOP4Nfxyp0bBTu8ehTpBUoemwaBzACwsa5fR0bWBHb535A8Q
 IWM3x+mGX8dqz8NSqmbPkNM0CTgYPxTFIr5K1mmS/Tr+jE/D/YI7gxIbFx5zfZwHngtw
 YN6+v5c1nv78FWGXH4lDqFfKr5gRqqTqtZgIBpK8j9yqKUQPQLQysxTYe4+uDtz1ErB+
 N9MQ==
X-Gm-Message-State: AOJu0YyuYDb21ZOHUob9KZsGlOcRVdF9hlaEH2LyeNzDkfJx42/Bgy9V
 TKhKbl6BNo4ji8pDaGzgWmi7n+7ciqCCgXDW4beXyHDjFZoPIdxgbwpKJAUq4+PMNdswwgKRYu3
 rOGjPemhQnIWGoRCYvhrX2w0l/1HWIgi49X+ti8GW16EvlTvUxB0Hr2bS53OVKgEsGw==
X-Received: by 2002:a5d:4043:0:b0:33a:f51a:f7ba with SMTP id
 w3-20020a5d4043000000b0033af51af7bamr164606wrp.49.1706524877145; 
 Mon, 29 Jan 2024 02:41:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExzbLj3XPsh+SexBvN/jdpZc68WXbSDGdGg/7k0PlqDJOHKiXCIIn37mrTX2pYX3WvTiYVww==
X-Received: by 2002:a5d:4043:0:b0:33a:f51a:f7ba with SMTP id
 w3-20020a5d4043000000b0033af51af7bamr164595wrp.49.1706524876814; 
 Mon, 29 Jan 2024 02:41:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020adff38d000000b003392cdeb3a2sm7737125wro.103.2024.01.29.02.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 02:41:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 1/8] video: Add helpers for decoding screen_info
In-Reply-To: <20240117125527.23324-2-tzimmermann@suse.de>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-2-tzimmermann@suse.de>
Date: Mon, 29 Jan 2024 11:41:15 +0100
Message-ID: <87wmrsv2us.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> The plain values as stored in struct screen_info need to be decoded
> before being used. Add helpers that decode the type of video output
> and the framebuffer I/O aperture.
>
> Old or non-x86 systems may not set the type of video directly, but
> only indicate the presence by storing 0x01 in orig_video_isVGA. The
> decoding logic in screen_info_video_type() takes this into account.

I always disliked how the orig_video_isVGA variable lost its meaning.

> It then follows similar code in vgacon's vgacon_startup() to detect
> the video type from the given values.
>
> A call to screen_info_resources() returns all known resources of the
> given screen_info. The resources' values have been taken from existing
> code in vgacon and vga16fb. These drivers can later be converted to
> use the new interfaces.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Thanks for doing this! It's quite useful to have these helpers, since as
you mention the screen_info data decoding is complex and the variables
used to store the video type and modes are confusing / misleading.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I just have a few comments below:

> +static inline bool __screen_info_has_ega_gfx(unsigned int mode)
> +{
> +	switch (mode) {
> +	case 0x0d:	/* 320x200-4 */
> +	case 0x0e:	/* 640x200-4 */
> +	case 0x0f:	/* 640x350-1 */
> +	case 0x10:	/* 640x350-4 */

I wonder if makes sense to define some constant macros for these modes? I
know that check_mode_supported() in drivers/video/fbdev/vga16fb.c also use
magic numbers but I believe that it could ease readability.

> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static inline bool __screen_info_has_vga_gfx(unsigned int mode)
> +{
> +	switch (mode) {
> +	case 0x10:	/* 640x480-1 */
> +	case 0x12:	/* 640x480-4 */
> +	case 0x13:	/* 320-200-8 */
> +	case 0x6a:	/* 800x600-4 (VESA) */
> +		return true;

And same for these.

It can be a follow-up patch though.

[...]

> +int screen_info_resources(const struct screen_info *si, struct resource *r, size_t num)
> +{
> +	struct resource *pos = r;
> +	unsigned int type = screen_info_video_type(si);
> +	u64 base, size;
> +
> +	switch (type) {
> +	case VIDEO_TYPE_MDA:
> +		if (num > 0)
> +			resource_init_io_named(pos++, 0x3b0, 12, "mda");

I see that drivers/video/fbdev/i740_reg.h has a #define MDA_BASE
0x3B0. Maybe move to a header in include/video along with the other
constants mentioned above ?

> +		if (num > 1)
> +			resource_init_io_named(pos++, 0x3bf, 0x01, "mda");
> +		if (num > 2)
> +			resource_init_mem_named(pos++, 0xb0000, 0x2000, "mda");

Same for these start addresses. I see that are also used by mdacon_startup()
in drivers/video/console/mdacon.c, so some constants defined somewhere might
be useful for that console driver too.

The comment also applies to all the other start addresses, since I see
that those are used by other drivers (i810, vgacon, etc).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

