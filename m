Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210D6A45E24
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 13:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3A210E1D4;
	Wed, 26 Feb 2025 12:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hqZhxe6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5982710E8DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740571532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZONKr8gjSUHK5a82Fy5e7G5ZxvpLwOBguDakYGue1KI=;
 b=hqZhxe6K1tc/zcl+p2r7eKvQzXGpI7eGym6vrwLf9iRsE9aipWAsgJSeaAhARfFJjxT4PB
 vhYpia1qSDZi5ES/kbu7T5wxYKOFAxTMofBrxVVSbImsHNpVvJzUl7Quoqd9DX6bdZgYN5
 CeDE1eSs+MAB4w7Wrr96s+HLzocMimo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-hwrJGKfYNYaFQW9JjyjTDw-1; Wed, 26 Feb 2025 07:05:29 -0500
X-MC-Unique: hwrJGKfYNYaFQW9JjyjTDw-1
X-Mimecast-MFC-AGG-ID: hwrJGKfYNYaFQW9JjyjTDw_1740571528
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4393b6763a3so28624455e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 04:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740571528; x=1741176328;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZONKr8gjSUHK5a82Fy5e7G5ZxvpLwOBguDakYGue1KI=;
 b=U7DGF9IfZjrs1tmPpgKM6ooz04q/qN9cr+tsKI2FEZ77gTnTrGo7xM7OujERz6uY1S
 Qvh6T2t6Xv887VSj9ldgjssrVCMbFT5S+D+GP8x/AaeL2PNaT9MwxaNLUz7K6zXTtwUO
 J7St47t21LkYH6BtO1M9qP9ZJboGNLoOBTCBqi9z4bNHx1pngOZLxPMqLbM9d63EEDCl
 ASylSk6T9r76Is+DJwU1Cvk7/ynlNM+qVogcFeFwmXKe7TiHesJp4Hr7j10m/HqAPScQ
 /054siqR6LvFFjjL3oF1WJOxcGdfkB1m4mxlg0ESe6DJwdOJ6sCCApuK1Xc3bD2FtX99
 QW3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUjmjPgVQIeSk5YLp6wAhsheq8/sAnHgC/1T1+dSLVruH2N5xLZbKG0ZrQOD+65ez6UTm7hmkQNsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyszv23f+xZSNxbVgGyx0yDsfmAfPsZHZlui4Dxtk7/B0NRFNkA
 d9hA15lUYA2YH3/6pfAVcRLUSCQLzFsUfZbxuO6fSf+3kXqSehxGq2D0+PtD3XsW2rjJYTNWd10
 3YH3tqe5s0D8ejIZrtulGQz4WzV4RsKIzkmnXqeH3yzJjh9o/ldKxSwMl5Volv6i6dA==
X-Gm-Gg: ASbGncso2wmE47KIBRKW0ZuVe5tIsSw+QoKTqXlrAT0lkiMKgN/ODSyLvpzwT2K1Z55
 AqFmwxM59S1A9K66++D+9Q36j1XzRgCEDuYkfX5kzvvZZTs5EMva+5xNyxBlzKIuMYTqgggH8no
 KfpFR0GnSn40DFvyqL7s/20Pqkm+p9lDKT2zurwZ1VQpEGu0YPYr2EHeyb9VYMrbdZ8YdmVyF5c
 Ja7tgk/4LiauSSirNO2n4fdb/W+08OyhbVaYMvitv7T/ydjjJPrMHmM2UXabp0Uvya4aCAQd7CA
 6Zko4Xl1pvyki9LUnW0qDUqLaRq4Whk1c3XCWsKx+5n2DTIYC9Q3E1QQv75Ej7YyeIB2ZNwn5g=
 =
X-Received: by 2002:a05:600c:458e:b0:439:91dd:cfa3 with SMTP id
 5b1f17b1804b1-439ae221d72mr172909775e9.29.1740571528147; 
 Wed, 26 Feb 2025 04:05:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrm0qM7DRHfCVZy3zVClFVQEZc0d79QmfHyW/xrSQhIhkvownRWDY6I4pd1YTGG105oIX1w==
X-Received: by 2002:a05:600c:458e:b0:439:91dd:cfa3 with SMTP id
 5b1f17b1804b1-439ae221d72mr172909435e9.29.1740571527760; 
 Wed, 26 Feb 2025 04:05:27 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm19373245e9.39.2025.02.26.04.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:05:26 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
In-Reply-To: <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
 <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
 <29ecc7c4-2887-4989-a1d3-aa76b44c0387@suse.de>
 <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
Date: Wed, 26 Feb 2025 13:05:23 +0100
Message-ID: <87mse8zzb0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QHexSMJyLAiYK19siL8LHhv_M6dKNo5vUG6f6JeparM_1740571528
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

"Arnd Bergmann" <arnd@arndb.de> writes:

Hello Arnd,

> On Wed, Feb 26, 2025, at 09:16, Thomas Zimmermann wrote:
>> Am 26.02.25 um 08:55 schrieb Arnd Bergmann:
>> Here's another general question. vgacon and fbcon only seem usable with 
>> CONFIG_VT=y. Wouldn't it make sense to have them depend on CONFIG_VT=y? 
>> dummycon could then be implemented as part of the vt code, maybe even 
>> become a vt-internal thing. The console code is complex, so I'm probably 
>> missing something here?
>
> I think in theory one may have a system use fbcon purely to get the
> boot logo, but not actually support VT.  I had also assumed there might
> be a way to use fbcon as the console (i.e. printk) but not register
> the tty, but it looks like the console code still requires vt.
>
> After I looked at the vt and conswitchp code some more, I wonder
> if we could go the other way and instead of integrating it more
> make the conswitchp logic optional: most of the complexity here
> deals with switching between text console and fbcon dynamically,
> but having any text console support is getting very rare (vga
> on alpha/mips/x86-32, newport on mips-ip22, sti on parisc).
>
> If we do this, the conswitchp code could be merged with dummycon

This sounds like a much better approach indeed.

> in drivers/video/console, with the simpler alternative just
> calling into fbcon functions. I'm not sure if we can already drop
> vgacon from normal x86-64 distro configs, i.e. if there are cases
> that are not already covered by any of efi-earlycon, efifb,
> vga16fb, vesafb/uvesafb or a PCI DRM driver.
>

I believe vgacon is still useful for x86 with legacy BIOS, because
vesafb (and simpledrm) only works if the user defines a mode using
the vga= kernel cmdline parameter.

>     Arnd
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

