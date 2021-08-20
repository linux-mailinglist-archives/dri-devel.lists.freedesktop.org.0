Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B083F34AB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 21:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F8B6EB0D;
	Fri, 20 Aug 2021 19:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577696EB0D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 19:33:28 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 r17-20020a0568302371b0290504f3f418fbso16238894oth.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vpEpEAnRO5OhbDhkoFuR51uK3vu5AmUud1jH9OOxpC4=;
 b=GdDYWfb10COlYODDXcc0zylWkXc2rxMun8JAXaoC/ZrxQjCl2w+3RaF9krZBDUudon
 NWHT1EP3L6XT4ApBhRzsNvjs2FJLEUg3Hep98S2hqZGTVlEWPyKdahlV2gFJBRILjyRZ
 +forMwtXQIq08jbAsbIQx+KENLPuElcgrxWn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vpEpEAnRO5OhbDhkoFuR51uK3vu5AmUud1jH9OOxpC4=;
 b=TumEnB5i7DInvpjniEPBtmy9JJwdmlvldHgw8lT0FjSLPAFA9bs+9Agves3QxuOK4W
 bydEsN1QZGavzanmWux7d+IU1hH5v+mBf770SMt1/JQVJ38er/+tNRzWalEFMVIr+fb6
 T8X+IngWMmTG5pFMavOCw4X6GoqRWNJJKsUdMjdbMze5czCXBmvLbKsUg09Eb2akba7m
 4Gmo+QgL0sdX8OvFKN57Ttd0faE5nLf8hXQ5rldKc/BKosTOhR7+lynq4rH390C373Oa
 XFYn2AI2jiImqauXSCvuuBXaxmQbUPHvU07QMaDUlKJBIk/7W2MDrartnB6YKe1SXBW+
 VSlg==
X-Gm-Message-State: AOAM5313Uj1IBPS2ZhEVY5KdNDpde7MZeN98YihFcKoh6m2CFgxfbYPo
 cKKwTeGDAWE3UfwPgFw1Qypu4IVDXv+jKJwYzV42zw==
X-Google-Smtp-Source: ABdhPJxrwulEjRlwLSovn0Rx4m5+J2jGaVIAi94Nt/8kUQLzom6zkQ6NxRZ6Vd4KvrH/lkIt6Ef06XBgfLgVRzw432w=
X-Received: by 2002:a9d:65da:: with SMTP id z26mr17825398oth.303.1629488007383; 
 Fri, 20 Aug 2021 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000047b52b05c9ff8d0b@google.com>
 <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
In-Reply-To: <dc7ca5ae-afc1-f840-8dfc-3f2361cd4360@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 20 Aug 2021 21:33:16 +0200
Message-ID: <CAKMK7uEP_PNr1uDV_FeH2-Q9oGGsr3ux2rpkXHrJpPG=hOaf=Q@mail.gmail.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>, 
 Dave Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linaro-mm-sig-owner@lists.linaro.org, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 20, 2021 at 9:23 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
> Hi
>
> Am 20.08.21 um 17:45 schrieb syzbot:
> > syzbot has bisected this issue to:
>
> Good bot!
>
> >
> > commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Fri Oct 9 23:21:56 2020 +0000
> >
> >      drm/vkms: fbdev emulation support
>
> Here's a guess.
>
> GEM SHMEM + fbdev emulation requires that
> (drm_mode_config.prefer_shadow_fbdev =3D true). Otherwise, deferred I/O
> and SHMEM conflict over the use of page flags IIRC.

But we should only set up defio if fb->dirty is set, which vkms
doesn't do. So there's something else going on? So there must be
something else funny going on here I think ... No idea what's going on
really.
-Daniel

>  From a quick grep, vkms doesn't set prefer_shadow_fbdev and an alarming
> amount of SHMEM-based drivers don't do either.
>
> Best regards
> Thomas
>
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11c31d55=
300000
> > start commit:   614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.k=
ern..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D13c31d55=
300000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D15c31d55300=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D96f06022032=
50753
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D91525b2bd4b5d=
ff71619
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D122bce0e3=
00000
> >
> > Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com
> > Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
