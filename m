Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157FB160872
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 04:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07436E433;
	Mon, 17 Feb 2020 03:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35136E3DF;
 Mon, 17 Feb 2020 03:06:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so16771805wmi.5;
 Sun, 16 Feb 2020 19:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cx8bYfsqZHEBN+LcrqEn91kHMUPX248+/kSe0EtzOjI=;
 b=ruwYXZteNffd+ZcnR8MnG6XKuHjOgL3w4AuJMJEoEFkjuSRH0t2BcQ8JHOmh0hX6qF
 G2n5wDARowKxOfJ42ZT1x2+IkdCe2CG18H0qEF9iAa4MPDApqdUYbtQO6S3rdakzjfZt
 sK0puqA0Zg/N62ywd9xmVgHgqTJUDI8rC8Nx0kq6VIlcWNtMqUnX0tFgNgzSlBDHZoyu
 sO+rpdNkalcNOWzZV6vy3VKKttAcfFhJRQtR8KMbyQhSu8ckJ2AuxsKIuOHCEozDO20e
 NQUZwa0RP7Y8/dV9o9yn/nV2Y0l3X4LZTMC/o+U4GGHlGl+Ny+hHPSG863AbslxCi6ly
 o8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cx8bYfsqZHEBN+LcrqEn91kHMUPX248+/kSe0EtzOjI=;
 b=PSGc9UUcu24VlzsPUVS7+OQfC4bU6NYiJCDjAGMLd4YYFBWPQv8nNsTphqHs4kwQCc
 JtF1JdppbpweXT2K+/Tr+rN4k/CzocYNXGe/EkWNBvHGOt6CfYfY0ZnhgO7s6T/1A+Yd
 4sE18nxj8JfmxO0EknDB84ODw5QV+ZtdyqqCRVEn3wCPB3RcXlv6vAeQPwvDCjY3Jx2c
 gQWmUB8PcheCPa5iFN/LZaJvY7zf/mfkdrblWAzdUOPfejsY6xsZWaA0xpNN/pFAD4HP
 H/LmWzb6IKIUfqghwncyswOTbQHTw47/n4RuPDUVoZ/CtGKdZl1iCAUVLeLgxuow8WWg
 sLjA==
X-Gm-Message-State: APjAAAVP+e0zJselh03axHWtwn2CcubVm9TKHb8kbapoR8uTx/hRsBU5
 VjUCm4Hb67pXX0C4JggoWT6pepWDj1nRdnKU+WA=
X-Google-Smtp-Source: APXvYqyAj/3k/mEe/d98HCwptA/CAFJaPIjw4KXgpMOHvjOEibSODQv5nvA+mZW6Hg2aGgIiorGJjDCtj1Zjxg7UPGw=
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr19043442wmi.21.1581908773251; 
 Sun, 16 Feb 2020 19:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20200215035026.3180698-1-anarsoul@gmail.com>
 <CAKGbVbvEDYJ19KVWXN0k-5niXLjmPYvxGJQ2-3GWTyYyFkH0Gw@mail.gmail.com>
In-Reply-To: <CAKGbVbvEDYJ19KVWXN0k-5niXLjmPYvxGJQ2-3GWTyYyFkH0Gw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 17 Feb 2020 11:06:02 +0800
Message-ID: <CAKGbVbvPPowjVixjyfBF=z=6y5GDEsV3d-2pzdRWK7pt3ewRew@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix recovering from PLBU out of memory
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

applied to drm-misc-next.

On Mon, Feb 17, 2020 at 9:20 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> Looks good for me, patch is:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Regards,
> Qiang
>
> On Sat, Feb 15, 2020 at 11:50 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> >
> > It looks like on PLBU_OUT_OF_MEM interrupt we need to resume from where we
> > stopped, i.e. new PLBU heap start is old end. Also update end address
> > in GP frame to grow heap on 2nd and subsequent out of memory interrupts.
> >
> > Fixes: 2081e8dcf1ee ("drm/lima: recover task by enlarging heap buffer")
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/gpu/drm/lima/lima_gp.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_gp.c b/drivers/gpu/drm/lima/lima_gp.c
> > index d1e7826c2d74..325604262def 100644
> > --- a/drivers/gpu/drm/lima/lima_gp.c
> > +++ b/drivers/gpu/drm/lima/lima_gp.c
> > @@ -224,8 +224,13 @@ static int lima_gp_task_recover(struct lima_sched_pipe *pipe)
> >         }
> >
> >         gp_write(LIMA_GP_INT_MASK, LIMA_GP_IRQ_MASK_USED);
> > +       /* Resume from where we stopped, i.e. new start is old end */
> > +       gp_write(LIMA_GP_PLBU_ALLOC_START_ADDR,
> > +                f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
> > +       f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2] =
> > +               f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size;
> >         gp_write(LIMA_GP_PLBU_ALLOC_END_ADDR,
> > -                f[LIMA_GP_PLBU_ALLOC_START_ADDR >> 2] + task->heap->heap_size);
> > +                f[LIMA_GP_PLBU_ALLOC_END_ADDR >> 2]);
> >         gp_write(LIMA_GP_CMD, LIMA_GP_CMD_UPDATE_PLBU_ALLOC);
> >         return 0;
> >  }
> > --
> > 2.25.0
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
