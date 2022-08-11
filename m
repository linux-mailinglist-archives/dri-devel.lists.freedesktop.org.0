Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A1B5905D0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 19:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2D4113C5B;
	Thu, 11 Aug 2022 17:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CC10E306
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 17:23:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u1so26434023lfq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=AnCsPAQ6S5XSMkIG5oYaEC4K5z7sA59ctKWoQkq2VZE=;
 b=eZ4X4GLue+7uCz/ZMdt6KiL0wwxwfOlsFXXUIvTDvfaqzjGGu/eHR4GY7K+304++VC
 cvM+FfLUCiVvwNMY2IcknNcGlbWHPZzwwhf0CSTt2Zlsjmr80frYREw7HI665gaa4nso
 StVqfgzuQ3R7LHR8IgXcTneqcFse/+utscQUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=AnCsPAQ6S5XSMkIG5oYaEC4K5z7sA59ctKWoQkq2VZE=;
 b=zPlregTX5NVJqZqxl3Uay0aBsOH8eXP49cd/zxr/i1R+xyT7JuGqswuGbElGre4Ekw
 03AWniWhFIJmL2i4sCMZHLbxyqcVooFd2m69aGuts08Vu5VIQQ/ZfeTNDnL4d3sS+V4+
 pIEaCSvnWWnZn5pHPuEnglJX9L1O75qpmkTZquDOYvpumxTAtsHDlab4Dbz/FfTg3lk1
 +7J3gTgLs6x3BzvDNyL8o6Rrty2w2SkLEDIRf1zyZ6ue2tiiQ5+XJ32nZH80nYoZ8LvV
 uFB4+ihyPWOZc/Z2nHjHVO0ca8gdMcuevz7rWT2Lmk6DeAHsbcxxbp0nceArvOkp80+j
 EfFw==
X-Gm-Message-State: ACgBeo3ktHsyiWV/v8AqRMegnBKB8iPkuYgASurUPxygNdAKX4+Szz4u
 DezUgwqn1doq7goqe1sKezwBEchOcegdkdsfM6Wi0g==
X-Google-Smtp-Source: AA6agR6j80HYYi81ZMQfJPQuzUD8MfI8mzNa8691kVB444Gkfl8LcmXfdDVbbCTwUTbWTYzkc1UipZP3SG0BBTeOxBQ=
X-Received: by 2002:a05:6512:e82:b0:48b:23f5:d153 with SMTP id
 bi2-20020a0565120e8200b0048b23f5d153mr95521lfb.291.1660238625050; Thu, 11 Aug
 2022 10:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
In-Reply-To: <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 11 Aug 2022 19:23:33 +0200
Message-ID: <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 at 09:53, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 25.07.22 um 17:13 schrieb Javier Martinez Canillas:
> > Hello Geert,
> >
> > On 7/21/22 16:46, Geert Uytterhoeven wrote:
> >> Hi Thomas,
> >>
> >> On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
> >>> Compute the framebuffer's scanline stride length if not given by
> >>> the simplefb data.
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/drivers/gpu/drm/tiny/simpledrm.c
> >>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> >>> @@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_=
create(struct drm_driver *drv,
> >>>                  drm_err(dev, "no simplefb configuration found\n");
> >>>                  return ERR_PTR(-ENODEV);
> >>>          }
> >>> +       if (!stride)
> >>> +               stride =3D format->cpp[0] * width;
> >>
> >> DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)
> >>
> >
> > I think you meant here:
> >
> > DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8) ?
>
> I guess, that's the right function. My original code is correct, but cpp
> is also deprecated.

You all mean drm_format_info_min_pitch().

I really don't want drivers to go grab any of the legacy format info
fields like bpp or depth. switch() statements on the fourcc code for
programming registers, or one of the real helper functions in
drm_fourcc.c (there might be some gaps), but not ever going through
legacy concepts. Anything else just leads to subtle bugs when new
formats get added and oops suddenly the assumptions don't hold.

Those should be strictly limited to legacy (i.e. not drm_fourcc aware)
interfaces. Heck I think even fbdev emulation should completely switch
over to drm_fourcc/drm_format_info, but alas that's a pile of work and
not much payoff.

I'm trying to volunteer Same to add a legacy_bpp tag to the above
helper and appropriately limit it, I think limiting to formats with
depth!=3D0 is probably the right thing. And then we should probably
remove a pile of the cargo-culted depth!=3D0 entries too.
-Daniel

>
> Best regards
> Thomas
>
> >
> > With that change,
> >
> > Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
