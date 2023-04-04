Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A972F6D63F8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8164E10E693;
	Tue,  4 Apr 2023 13:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE8710E693
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:53:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id h25so42476315lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0E7K/KPGW5vigO6BCdiN8xBhVE7+xyqKMmORIVUDwHk=;
 b=S3IEcoDtev9rfDOlnakRoew0OlPH+1WYkG19yAceaiy9Y2XzSHWXJXsnsHvDz5Hiu3
 Km9H4xddfAYpsUy/bhp/odlTnbKhQmGDzCG/Bj2UbL1mZR98Cp6oQaiGLhjiXpEXb7u5
 XfpSObd81GUrRt02gxuZ9CDQmCjOvHDt67hAvE3cr6fOwpKbHpyv/560aazDr9SSD3qZ
 OYkKPlnaMunpZx+A45rycOw3NL0E4BWxVxOdscysol2SEZYO1JecN7vibJrYmfFL5Gx4
 37w35qKWzZFli+zbN3eeawmfboK5vEA8QihrYy6OrBSeFnJ3Hyx9jw+A1xZkr6O4dGyJ
 UidA==
X-Gm-Message-State: AAQBX9eFHJP4pYkFG+ArdmGVU1Tje71zIMZ9hC6PDFCGWqGndN++Kf1f
 Q5Sjiy4vgR+Mdp0fSHSxPDhUy37IYBDpAR2W
X-Google-Smtp-Source: AKy350YXA8ssTuusksYfyxrQ3b+bU47DENdLdVsdTaWjQbOp29Nt7bq1KnDL0f9gynmdnwrb5F5c4A==
X-Received: by 2002:a05:6512:21ac:b0:4ea:f632:17 with SMTP id
 c12-20020a05651221ac00b004eaf6320017mr713479lft.51.1680616405121; 
 Tue, 04 Apr 2023 06:53:25 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 g14-20020ac2538e000000b004db44dfd888sm2330578lfh.30.2023.04.04.06.53.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:53:23 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id by14so14748968ljb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:53:22 -0700 (PDT)
X-Received: by 2002:a2e:2e0d:0:b0:2a1:d819:f0ae with SMTP id
 u13-20020a2e2e0d000000b002a1d819f0aemr1075019lju.9.1680616402168; Tue, 04 Apr
 2023 06:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 15:53:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
Message-ID: <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

CC vkmsdrm maintainer

Thanks for your patch!

On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
> There's a few reasons the kernel should not spam dmesg on bad
> userspace ioctl input:
> - at warning level it results in CI false positives
> - it allows userspace to drown dmesg output, potentially hiding real
>   issues.
>
> None of the other generic EINVAL checks report in the
> FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
>
> I guess the intent of the patch which introduced this warning was that
> the drivers ->fb_check_var routine should fail in that case. Reality
> is that there's too many fbdev drivers and not enough people
> maintaining them by far, and so over the past few years we've simply
> handled all these validation gaps by tighning the checks in the core,
> because that's realistically really all that will ever happen.
>
> Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de530cd3bb00=
8888bf06cefc

    WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual screen
size (0x0 vs. 64x768)

This is a bug in the vkmsdrmfb driver and/or DRM helpers.

The message was added to make sure the individual drivers are fixed.
Perhaps it should be changed to BUG() instead, so dmesg output
cannot be drown?

> Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")
> Cc: Helge Deller <deller@gmx.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: stable@vger.kernel.org # v5.4+
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_var_scr=
eeninfo *var)
>         /* verify that virtual resolution >=3D physical resolution */
>         if (var->xres_virtual < var->xres ||
>             var->yres_virtual < var->yres) {
> -               pr_warn("WARNING: fbcon: Driver '%s' missed to adjust vir=
tual screen size (%ux%u vs. %ux%u)\n",
> -                       info->fix.id,
> -                       var->xres_virtual, var->yres_virtual,
> -                       var->xres, var->yres);
>                 return -EINVAL;
>         }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
