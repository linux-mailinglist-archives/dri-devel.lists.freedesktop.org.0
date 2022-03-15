Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526234D9CD3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 15:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FDD10E421;
	Tue, 15 Mar 2022 14:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419AE10E354
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 14:01:38 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c7so15526824qka.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 07:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YGgF9LWm/bth2hHo7Fl5/pn1/+WNkNT5qOPZV+7l+iA=;
 b=pGLtMQLa5s2NURnpVJJGtOMWOe1EQhirCqBJsnaCqtwN+GPVaAbsyKItzaUU48DDmK
 jcCGVp00gYmkh3HgvC1A/WqeglCMHdqm0Ue6rWfLQdKzy6lvOTHTho48zhzxPS57G5En
 tMUl1m8I5dYGQqMz2CbPsmzDSNR1cKkn7K7aHXgh1btCpWoUMHrahCQlz63KrhKGmuTQ
 Y2jFVz1H6qp25Owzn6DfoKhnwj664onTt9bDS9Qz+aLe3FIxsTzAUyzbR0iU8fSMEW/l
 jdwSwKoP9rK7HVlaN+wH+F8hwB/BlxLKk9sr7f0tByTeweHFVyZHN34pvdsGzk4rCQvT
 1FSQ==
X-Gm-Message-State: AOAM532JKf1zXDm6hK7BiE2EWXzcAlSlQ0Fwlqso7PXzk83gVjYRa/Fl
 yNtRpMQmi6XMiqV1GFGoCTSeQgxJiHuSEQ==
X-Google-Smtp-Source: ABdhPJx4zrmsGGjdIIdLRneEes/GaXbyBuV55xWM1ZnxELizfG1jaW9UiJBXQ29rtlBI4L7JLkYj4A==
X-Received: by 2002:a37:a988:0:b0:67b:1302:6c38 with SMTP id
 s130-20020a37a988000000b0067b13026c38mr17618915qke.298.1647352896648; 
 Tue, 15 Mar 2022 07:01:36 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm9294346qkk.52.2022.03.15.07.01.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:01:35 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id h126so37487207ybc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 07:01:34 -0700 (PDT)
X-Received: by 2002:a25:4fc4:0:b0:633:25c8:7d9 with SMTP id
 d187-20020a254fc4000000b0063325c807d9mr11648807ybb.506.1647352894696; Tue, 15
 Mar 2022 07:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-5-geert@linux-m68k.org>
 <YjCZkkv//EhvxszH@smile.fi.intel.com>
In-Reply-To: <YjCZkkv//EhvxszH@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 15:01:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXisdGd2QWPEpi0sUMP3ZZr1S82=S9A=BSYmeYHySGemQ@mail.gmail.com>
Message-ID: <CAMuHMdXisdGd2QWPEpi0sUMP3ZZr1S82=S9A=BSYmeYHySGemQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm: ssd130x: Reduce temporary buffer sizes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, Mar 15, 2022 at 2:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 15, 2022 at 12:07:06PM +0100, Geert Uytterhoeven wrote:
> > ssd130x_clear_screen() allocates a temporary buffer sized to hold one
> > byte per pixel, while it only needs to hold one bit per pixel.
> >
> > ssd130x_fb_blit_rect() allocates a temporary buffer sized to hold one
> > byte per pixel for the whole frame buffer, while it only needs to hold
> > one bit per pixel for the part that is to be updated.
> > Pass dst_pitch to drm_fb_xrgb8888_to_mono_reversed(), as we have already
> > calculated it anyway.
>
> Can we use bitmap API? bitmap_zalloc() / etc ?

Why? There is no need to operate on an array of longs, only on an
array of bytes. Going to longs would expose us to endianness.
There's also no need to use any of the bitmap operations to modify the data.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
