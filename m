Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAEF79C606
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 07:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE9E10E03A;
	Tue, 12 Sep 2023 05:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E690610E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 05:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694494830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KBYVlpWMITOsO8/eEhkKH02de2tgqvU0jkM3B7miSKo=;
 b=McunK4fa8wPfNLRTSyU/TQPmHQh1DdNgbtO8nhHSH8UYH1T+CK1hPjX6Bv+2RZ6+2G0LGk
 BPHSW2DROZkdhcFdco9mctmVwAm/HYR4dmULoIMZC0tU+elv6SCZW9hTKYYMXDjP6pZ/jf
 EETa4y0B1cQjqOE/8nJrtTYl7RhZZOY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-O2UR5dGEOk-JZDsxVXnV_g-1; Tue, 12 Sep 2023 01:00:29 -0400
X-MC-Unique: O2UR5dGEOk-JZDsxVXnV_g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31f3eaa5c5eso3430734f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 22:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694494828; x=1695099628;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KBYVlpWMITOsO8/eEhkKH02de2tgqvU0jkM3B7miSKo=;
 b=HKrvnPA34tnp7f0czx9NK0DLsfu2MumRSqmnB8Xrw1utEEYeQ7nMbQQfph5PTfTjt6
 sIz1KOsVYiHP8S3CrlGdoOREp4U74iyE94wg+32wDSpkKdfI955RmGo1pW6hmEo7GsED
 w2W8P5pPPIg7StnY97BhirhuevnesxW0eluvB1BSURWQLamWBtUT6MNrefXJmYdN/soh
 Vm9zw8ipGd0VaSyoUAVQO1XJ0rPTa8j4o/AD8WGMlB5YLPyglDvgo168sZcofxVUfVJO
 VX00EmiZGLLyq2emMePoeYJ7ge30+2Ze/jYG/F/masqaADeo4iPrMP1OQUbMmOgFQEJ9
 /8fA==
X-Gm-Message-State: AOJu0Yxpcekd45Yxbwd7qyfXEaGE45hBVb3T2UbBjJXo10srE9s1Y2+f
 cTa49/WWISATdMUeZIfZNMGRIagTwn3eluMHG4dz2sVp+CuXaJalWXawML32UORpTzS3Z1zCsy9
 bTXDYRdNXxxNrHq0gn7xrV/DzB6ay
X-Received: by 2002:adf:ee02:0:b0:314:ca7:f30b with SMTP id
 y2-20020adfee02000000b003140ca7f30bmr7820201wrn.54.1694494828507; 
 Mon, 11 Sep 2023 22:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUyYAM7TBdlujCiSnUR3HeMzMNBXcohDAKrKZsjMPscI7/naNL7SNtLI/kz3HDLp+0iUGfaw==
X-Received: by 2002:adf:ee02:0:b0:314:ca7:f30b with SMTP id
 y2-20020adfee02000000b003140ca7f30bmr7820186wrn.54.1694494828222; 
 Mon, 11 Sep 2023 22:00:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b00317ddccb0d1sm11778844wro.24.2023.09.11.22.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 22:00:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
In-Reply-To: <20230911205338.2385278-1-arnd@kernel.org>
References: <20230911205338.2385278-1-arnd@kernel.org>
Date: Tue, 12 Sep 2023 07:00:26 +0200
Message-ID: <87fs3k2dg5.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> As a result of the recent Kconfig reworks, the default settings for the
> framebuffer interfaces changed in unexpected ways:
>
> Configurations that leave CONFIG_FB disabled but use DRM now get
> DRM_FBDEV_EMULATION by default. This also turns on the deprecated /dev/fb
> device nodes for machines that don't actually want it.
>
> In turn, configurations that previously had DRM_FBDEV_EMULATION enabled
> now only get the /dev/fb front-end but not the more useful framebuffer
> console, which is not selected any more.
>
> We had previously decided that any combination of the three frontends
> (FB_DEVICE, FRAMEBUFFER_CONSOLE and LOGO) should be selectable, but the
> new default settings mean that a lot of defconfig files would have to
> get adapted.
>
> Change the defaults back to what they were in Linux 6.5:
>
>  - Leave DRM_FBDEV_EMULATION turned off unless CONFIG_FB
>    is enabled. Previously this was a hard dependency but now the two are
>    independent. However, configurations that enable CONFIG_FB probably
>    also want to keep the emulation for DRM, while those without FB
>    presumably did that intentionally in the past.
>
>  - Leave FB_DEVICE turned off for FB=n. Following the same
>    logic, the deprecated option should not automatically get enabled
>    here, most users that had FB turned off in the past do not want it,
>    even if they want the console
>
>  - Turn the FRAMEBUFFER_CONSOLE option on if
>    DRM_FBDEV_EMULATION is set to avoid having to change defconfig
>    files that relied on it being selected unconditionally in the past.
>    This also makes sense since both LOGO and FB_DEVICE are now disabled
>    by default for builds without CONFIG_FB, but DRM_FBDEV_EMULATION
>    would make no sense if all three are disabled.
>
> Fixes: a5ae331edb02b ("drm: Drop select FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION")
> Fixes: 701d2054fa317 ("fbdev: Make support for userspace interfaces configurable")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks for fixing this and sorry that I missed the defaults changed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

