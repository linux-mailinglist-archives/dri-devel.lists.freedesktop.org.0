Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF654400942
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 04:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55926E8EE;
	Sat,  4 Sep 2021 02:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26856E8EE
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 02:13:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u14so1544196ejf.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 19:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Yxd3tLdwA6axcDY2mcJ1N4bmyKI/tSiwpamDgl6Gsc=;
 b=EBm3Mrc/KHMZzBUaktxLe3RwEFcfcqbQXJoOhiNiRA0R5Ftc5cBYA20B5uGudCdyOE
 MMllLDqbdQ1KoH68wR2TNLupwk6jw+2sENeTJilRhQlRgIWKGJMb1ofj6nPnvWrAzypV
 htVAAR9Lb2aCod2V/wac4AUCwrh6ZiP2ehumiiaiMLl58zIOgFLhgKWyiXv7GEXiK4Gi
 H1qa/pywLXm6hPa6DL8M3agUYaEyEnlEwvpIua6QaxuKBd2K8uq9vuHTx1Io0FYoDcS2
 SsRRQF043fbg5oj8BaC4i15UPLni8mq8a5A2zg6rKChe0aJ/X5Y5Gui+/VYl7nE23Oin
 Wi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Yxd3tLdwA6axcDY2mcJ1N4bmyKI/tSiwpamDgl6Gsc=;
 b=C4orcpvfm/oSZbFTDfOetOSZMBj677Y4VVw2jF8qSEkj7abIS313T+D8lP93jl+K0v
 dRSFNRka/vJZKqFfS3wyH32kqndo5lUiZz5sRIrvLpEfI2Epop8bXRnY5SMc8NHSw5z8
 F68DrIrz540VVkNJnJ0e4n/Domtw09FFf4pWmA2VQnXnaIu/lRJEZXP5NVk7MJ/hAyI4
 5FgJchXMKGNbYcLeuKp3IfRC2kNnYj+PgyBcuuNTYn4V1JMsrf4pb0VG596EY3+9TLih
 PgFoeMvs/IhoCyMi1aew69s31qo4KxAkI8nm64CVl+va6K1zpNORiEY1gLros3r3C2EH
 Zzng==
X-Gm-Message-State: AOAM533BsYZivLQURS6XeNWkHV5n7gqohlwO0YLprEsUc1CccXNRMZJ2
 PbOdq+BgCMJ7Z92MYQZjqiQtBUeHRcSIpWIe9tc=
X-Google-Smtp-Source: ABdhPJz0X1b/YbEKKNLhcxMoCb87/9e/3f184cZJ+kqFRfrYc6dzaThaCuwn/x3Ad+qCblXYaajtCxLMzXHzs0wYopg=
X-Received: by 2002:a17:906:ce24:: with SMTP id
 sd4mr1981555ejb.329.1630721589217; 
 Fri, 03 Sep 2021 19:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210902061048.1703559-1-mudongliangabcd@gmail.com>
 <YTIpXrJmJTasAGJU@kroah.com>
In-Reply-To: <YTIpXrJmJTasAGJU@kroah.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sat, 4 Sep 2021 10:12:43 +0800
Message-ID: <CAD-N9QU4KBs=XwjPpqSM1T3i9r0Fsd+s64O6gbD0Cf5KFFf-ZQ@mail.gmail.com>
Subject: Re: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 George Kennedy <george.kennedy@oracle.com>, 
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>, Sasha Levin <sashal@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 3, 2021 at 9:55 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 02, 2021 at 02:10:48PM +0800, Dongliang Mu wrote:
> > [ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]
> >
> > A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> > or yres setting in struct fb_var_screeninfo will result in a
> > KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> > the margins are being cleared. The margins are cleared in
> > chunks and if the xres setting or yres setting is a value of
> > zero upto the chunk size, the failure will occur.
> >
> > Add a margin check to validate xres and yres settings.
> >
> > Note that, this patch needs special handling to backport it to linux
> > kernel 4.19, 4.14, 4.9, 4.4.
>
> Looks like this is already in the 4.4.283, 4.9.282, 4.14.246, and
> 4.19.206 kernel releases.  Can you check them to verify that it matches
> your backport as well?

Yes, I have seen them in these releases and they are fine to me.

>
> thanks,
>
> greg k-h
