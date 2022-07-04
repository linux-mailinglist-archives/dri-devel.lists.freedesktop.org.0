Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44537565BB5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6998010E7D1;
	Mon,  4 Jul 2022 16:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334F210E042
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 01:09:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B27361305
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 01:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC37C385A5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 01:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656896961;
 bh=v6j2M4h1PSyY+HmtUZ+/mX78WN3sXFyYN3NO6IVsfp0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GU7g/Vo5Va6XQ4BH9yoGQ9LZx3aQkbpmzMUVnFf3O4cy5xe7067a7ObgXRjzApbnZ
 B5wYPi22M3UwkFbtIl+icn0e+jd7Zu/IMg1dVqxqmr7K9ayKuHZVPHZ37nFCkjxkMN
 cFMxCNWBFO6iMqjRGf2zIVoIM/nRvml611/F6JlhQ1EhPlUy/OEycjqJys/DRVz4Xg
 2dKCygPlrwd7EYxrTxDFlEgZVu04BcwsmdlFoOpkSiJ6U6tLbu8LiF/WhwGS8mxFj6
 3HBtd9sDNdzHLVNvpZJoZRaJG08M/xPv9YxqyaVndS4CVxAJA1XQxP3Qj5QAF6D5MF
 5pv8nDCtmnTuw==
Received: by mail-vk1-f175.google.com with SMTP id r1so3768175vke.8
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 18:09:21 -0700 (PDT)
X-Gm-Message-State: AJIora9zdlSzX4NIlwZdi6MLQ4qjyo87VgtNpgsLFX5S4M5LE8EpjwNC
 hRwIKQX4BJufPFpltiKzePM3f4p/vBanp1/oYzE=
X-Google-Smtp-Source: AGRyM1sbZKL0/DFVG8jjTu00yFSBJXjnXuc8xn3EXzyVluKcTu2Ky6GPf7m8kWNMS5hNY79VLP3oHv9rgLQbKfRxnRk=
X-Received: by 2002:ac5:cd3b:0:b0:373:f3b0:3164 with SMTP id
 a27-20020ac5cd3b000000b00373f3b03164mr1396vkm.12.1656896960749; Sun, 03 Jul
 2022 18:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220702090416.1217209-1-chenhuacai@loongson.cn>
 <ecbfdc21-c9a7-1453-dd86-da8180585179@redhat.com>
In-Reply-To: <ecbfdc21-c9a7-1453-dd86-da8180585179@redhat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 4 Jul 2022 09:09:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4t13Lac0ZAS3hjZtwBKevevv=s+6hzOwpj_tBW9DzSkg@mail.gmail.com>
Message-ID: <CAAhV-H4t13Lac0ZAS3hjZtwBKevevv=s+6hzOwpj_tBW9DzSkg@mail.gmail.com>
Subject: Re: [PATCH V2] drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Javier,

On Sat, Jul 2, 2022 at 7:05 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Huacai,
>
> Thanks a lot for your patch.
>
> On 7/2/22 11:04, Huacai Chen wrote:
> > Consider a configuration like this:
> > 1, efifb (or simpledrm) is built-in;
> > 2, a native display driver (such as radeon) is also built-in.
> >
> > As Javier said, this is not a common configuration (the native display
> > driver is usually built as a module), but it can happen and cause some
> > trouble.
> >
> > In this case, since efifb, radeon and sysfb are all in device_initcall()
> > level, the order in practise is like this:
> >
> > efifb registered at first, but no "efi-framebuffer" device yet. radeon
> > registered later, and /dev/fb0 created. sysfb_init() comes at last, it
> > registers "efi-framebuffer" and then causes an error message "efifb: a
> > framebuffer is already registered". Make sysfb_init() to be subsys_
> > initcall_sync() can avoid this. And Javier Martinez Canillas is trying
> > to make a more general solution [1].
> >
> > However, this patch still makes sense because it can make the screen
> > display as early as possible (We cannot move to subsys_initcall, since
> > sysfb_init() should be executed after PCI enumeration).
> >
> > [1] https://lore.kernel.org/all/20220607182338.344270-1-javierm@redhat.com/
> >
>
> Note that this series already landed, so you might want to refer the
> relevant commit sha-1 instead, i.e:
>
> commit 873eb3b11860 ("fbdev: Disable sysfb device registration when
> removing conflicting FBs").
OK, I'll update the commit message again and send V3.

Huacai
>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> > V2: Update commit messages.
> >
> >  drivers/firmware/sysfb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> > index 2bfbb05f7d89..aecf91517e54 100644
> > --- a/drivers/firmware/sysfb.c
> > +++ b/drivers/firmware/sysfb.c
> > @@ -80,4 +80,4 @@ static __init int sysfb_init(void)
> >  }
> >
> >  /* must execute after PCI subsystem for EFI quirks */
> > -device_initcall(sysfb_init);
> > +subsys_initcall_sync(sysfb_init);
>
> I agree with the change and makes sense to me.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>
