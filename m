Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF64322CF0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB736E9CE;
	Tue, 23 Feb 2021 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A06E9CC;
 Tue, 23 Feb 2021 14:56:32 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q77so17382690iod.2;
 Tue, 23 Feb 2021 06:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jlV7um2EY+vl+2ZBJzHoUyA7guYZm1/i3OsQfILG6rY=;
 b=dlF+REj3ZIBmQtvGGVnjbBX/snu0ukfp8KzTc+F0tG5a1vsA0uVCPT0cy0P4KwzTre
 RVeG398Mcc3Er5KQS3FCG+OpctlSSbFN3tW22U1s/bSpsiyxnexLqnEeK3qg0RCiXFDy
 K3px8GAz6hrCPDUk4Vk64EkVlc14FQQiy2Fe6CxKIRI2f+FasRZK4cuUejnR9uI8HKFN
 lh4+quZ3Im/NDO7sHZlhGR0mIKZg0YzSstR7XSbKNfgzQHRMYTbVX7bxpw05TNOdOsoN
 afClhUgKnlaltcCvgaSNGqXY/KDHt4Y5/8sqlS5ZQ8/2hmL3gLqXvL6/2EC+6iaE7BHF
 j4Eg==
X-Gm-Message-State: AOAM53146ueckQWx4xY268FvadGecH8FFbxrv244+sO85MZyeGEw2vYw
 t3IaZjXIXtPp3bbFMSF8o5UFVxWCeh5ybmzezZ4=
X-Google-Smtp-Source: ABdhPJzRZwXRb1la0GMwx+ZhoDIz+aEfwGxnH+TD2zlplxcjV1p+0QmI6jsxIrIxkFQXPlk3s9buU4XAusngiI4vY4k=
X-Received: by 2002:a05:6602:24cb:: with SMTP id
 h11mr20201100ioe.79.1614092192347; 
 Tue, 23 Feb 2021 06:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
In-Reply-To: <YDUN+Re/alMVL0Zn@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 23 Feb 2021 09:56:21 -0500
Message-ID: <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 9:26 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Lyude Paul, Tue, Jan 19, 2021 02:54:13 +0100:
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index c6367035970e..5f4f09a601d4 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
> >       else
> >               nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
> >
> > +     if (disp->disp->object.oclass >= GK104_DISP) {
> > +             dev->mode_config.cursor_width = 256;
> > +             dev->mode_config.cursor_height = 256;
> > +     } else {
> > +             dev->mode_config.cursor_width = 64;
> > +             dev->mode_config.cursor_height = 64;
> > +     }
> > +
> >       /* create crtc objects to represent the hw heads */
> >       if (disp->disp->object.oclass >= GV100_DISP)
> >               crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
>
> This change broke X cursor in my setup, and reverting the commit restores it.
>
> Dell Precision M4800, issue ~2014 with GK106GLM [Quadro K2100M] (rev a1).
> libdrm 2.4.91-1 (Debian 10.8 stable).
> There are no errors or warnings in Xorg logs nor in the kernel log.

Hi Alex,

Could you confirm which ddx is driving the nvidia hw? You can find
this out by running "xrandr --listproviders", or also in the xorg log.

Thanks,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
