Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B911E850382
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 09:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50FD112416;
	Sat, 10 Feb 2024 08:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R8hcqKPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740E112416
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707553525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XtNoNPhPYS5y1EwYz+Bl0Y1o61/cIUgu8DRvNvKo0a0=;
 b=R8hcqKPAhHhkXtJfbBk5ursD/cI8Kztijr8EcN3g2MyBZapHUDNrEiPJv8Kzhr3snDk13G
 558saxretFUYaVUjeCbo7ndPEOnjAzwtz8nhOXhw41AfaSYtGBzmXgQQgWXkAcCMdt9C25
 pUfUIzQXY1iJBng6FIxb81b6wgFgW9o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-lGRHK0ZjPGyLRvP5EZkCvA-1; Sat, 10 Feb 2024 03:25:23 -0500
X-MC-Unique: lGRHK0ZjPGyLRvP5EZkCvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33b6e35044cso129005f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 00:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707553522; x=1708158322;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtNoNPhPYS5y1EwYz+Bl0Y1o61/cIUgu8DRvNvKo0a0=;
 b=kx2brWTZYAa6nTx/1eTZk/IV4T0rcIm+R+37UHpS0TuYUjC5iWaNGcjS2ziC8UY9Pp
 8HRCs/Y5N91HNrv3KEdpdHJBS4u0//7c1Ft69o+bnK49jYdq0Pbdi2x5avpObw83TVYV
 s0jtB+s5Z0qS4q6+i8ymlDE0nkvdVh/alKb5WJi6xeinez4EhothLV4tlosMqosS1pB6
 DOliJ95i8ufqHe4b6WwzhM7M/6iy/8xrjoaRauTraqtMs92wuOmMi/ZrYgQof17D9P3c
 iXJGFNZyvqj5TDS8KzqvA3VE+4KnYbxFvwxtwv++GazlEQULXWLe/sD4XUCUOLLzHlEv
 tzRA==
X-Gm-Message-State: AOJu0YzJg0C3POjSf/P/C1CbPdLOTSlJpQHvnFXwJ/i3ejj/72hbaJ0L
 qtr7TVdcBIUDLzlOc9oaHM7QbHqX6m6lllJgUELe3CFJY3IK28pvuC5c67p3r/7CrtvwCa1HVZA
 6QV2cyg0p43eiUgqZQfhWzIQwnQtFjL+UkS16ElYwib9sXT/2VDP178ZEMynfWvy5hg==
X-Received: by 2002:adf:e950:0:b0:33b:586a:4c3e with SMTP id
 m16-20020adfe950000000b0033b586a4c3emr3455661wrn.1.1707553522722; 
 Sat, 10 Feb 2024 00:25:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ/IAYSjqmfgt/oW+M+ddPhNyZ7MQ4Pa8g7/5X9ZmBQ0TfhYi7HTRZXo571jhFWeQyinZEXA==
X-Received: by 2002:adf:e950:0:b0:33b:586a:4c3e with SMTP id
 m16-20020adfe950000000b0033b586a4c3emr3455649wrn.1.1707553522439; 
 Sat, 10 Feb 2024 00:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAf6lA5eNBQS0f4Fh4tq/bLVNx44ZDbEdh9Sofz1JYJ0wd9Rt85BZ3cGJirupBieMTpoTfWx0e5bfInujgybluyAMs1uwvO8Yg7jmS+NrPSzzKnextK3Jmd52h0UAqt1HDiVIZ6y83hrMqrOTm7DWUd2k7jSOJ53Q1snF6r1vA4QuExHSoFTzuciXiMQ1/hwA3qbRK4WiBgRsZk5S6wie0KbmAGJyv74BkjUE2Efm9uRt6iXWPGMOh7ZmOO00GL0g3oFdpCTBQ9RAUFT7MXzC28tGnbi5KGkwDBTvU2q+/rBTkjD8Ezdz7fb63GvhCXTpLi27r
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056000108c00b0033b40a3f92asm1247781wrw.25.2024.02.10.00.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 00:25:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Thomas Zimmermann <tzimmermann@suse.de>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Sam Ravnborg
 <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev/sh7760fb: allow modular build
In-Reply-To: <20240210053938.30558-1-rdunlap@infradead.org>
References: <20240210053938.30558-1-rdunlap@infradead.org>
Date: Sat, 10 Feb 2024 09:25:21 +0100
Message-ID: <87cyt4u3ny.fsf@minerva.mail-host-address-is-not-set>
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

Randy Dunlap <rdunlap@infradead.org> writes:

> There is no reason to prohibit sh7760fb from being built as a
> loadable module as suggested by Geert, so change the config symbol
> from bool to tristate to allow that and change the FB dependency as
> needed.
>
> Fixes: f75f71b2c418 ("fbdev/sh7760fb: Depend on FB=y")
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/video/fbdev/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

