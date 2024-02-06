Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746B84BF37
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 22:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD820112E6F;
	Tue,  6 Feb 2024 21:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="GIx4+Uz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BECB112E6F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 21:30:37 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc6d5206e96so5641798276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 13:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1707255037; x=1707859837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgLavxpwNtu5smSwfEj3WRmvZ9lABfAdy09TFLdGD/A=;
 b=GIx4+Uz14lYNpVwq1SQjYutcrtfL/K8QBYqlnJQTxm0ZqdrJ2jstE9pNxRraHh0KNE
 7TLaOFPLZYiCnf+GrXbI/yMgS8sMQjEQyfWRYLE/hD5/TgCxjaStd6VIi/Va3MQBzY8R
 OrjZKPCBFrnqjuH12JtCXwAt+Xu9kTj1qOJ/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707255037; x=1707859837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgLavxpwNtu5smSwfEj3WRmvZ9lABfAdy09TFLdGD/A=;
 b=oqtQlkPgOD8mBRkvCXXdjxcuAQETh86M2VtqRfYNe37vBsn8RdfKmFE6u50crhQK9N
 fspUcXXo1ymJKp2T05RSeIDlpIyf65F1OopvqFVz/5zxq/N357StX7I0xtaSrx00/eaT
 OtEJ6yfZQgnxz40m2Y4DbvmkM1Jcb29c8WSBx/Qw1IulHzvIdSvVhP+TE2q3IMlaq3Pe
 StCsR0SZrCQhrcYc9/BaTqRDqdxXbf+6WZPLVF5w4TVs9Apzs5ljZrvW7N06ao2ZomNA
 1+hAQXQg6mT4nfHr2hAj+7atDcN516jKQfMKb8tH4kO+k7/G6VONOjDSYZRH83m/VqiJ
 +mMQ==
X-Gm-Message-State: AOJu0YwqRFQd0M/117msnwrwA7i6OZj4feffJIGI9udak/A1rpsgvmrI
 anmgQe7TXfPD4QscY+t+SA/vS9YAly6WPEt2gCv61nKRaJ9hzguFi2CthaXK8UZDR3JhcywIed2
 ipPB6L8j5pkQp1CTxY498bYMKXmbuj7YR5WL7
X-Google-Smtp-Source: AGHT+IGxD5lv09x8mPW9z8MP5dL2xz++FIcRESVMOMjei3efQ754ed5MFjFq499UQYDwkmy1GOJabHeZbzV9AzOz2eA=
X-Received: by 2002:a25:2f0e:0:b0:dc6:cb87:2ddc with SMTP id
 v14-20020a252f0e000000b00dc6cb872ddcmr2712516ybv.10.1707255035887; Tue, 06
 Feb 2024 13:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <20240201051343.9936-1-ian.forbes@broadcom.com>
 <CABQX2QPru=0O2nWinQEC-GrpvDpvNkECDKQT_CDJGhqnf_mGpw@mail.gmail.com>
In-Reply-To: <CABQX2QPru=0O2nWinQEC-GrpvDpvNkECDKQT_CDJGhqnf_mGpw@mail.gmail.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Tue, 6 Feb 2024 15:30:26 -0600
Message-ID: <CAO6MGtiHQXzX73jOxW_uSh0UB6FGZ4KoaLgKr-HfEmDwdZ83Ow@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com
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

So the issue is that SVGA_3D_CMD_DX_PRED_COPY_REGION between 2
surfaces that are the size of the mode fails. Technically for this to
work the filter will have to be 1/2 of graphics mem. I was just lucky
that the next mode in the list was already less than 1/2. 3/4 is not
actually going to work. Also this only happens on X/Gnome and seems
more like an issue with the compositor. Wayland/Gnome displays the
desktop but it's unusable and glitches even with the 1/2 limit. I
don't think wayland even abides by the mode limits as I see it trying
to create surfaces larger than the mode. It might be using texture
limits instead.

On Fri, Feb 2, 2024 at 1:29=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> On Fri, Feb 2, 2024 at 11:58=E2=80=AFAM Ian Forbes <ian.forbes@broadcom.c=
om> wrote:
> >
> > SVGA requires surfaces to fit within graphics memory (max_mob_pages) wh=
ich
> > means that modes with a final buffer size that would exceed graphics me=
mory
> > must be pruned otherwise creation will fail.
>
> Sorry, I didn't notice this originally but that's not quite true. svga
> doesn't require all mob memory to stay within max_mob_pages (which is
> SVGA_REG_GBOBJECT_MEM_SIZE_KB). max_mob_pages is really max resident
> memory or suggested-guest-memory-for-best-performance. we can grow
> that memory (and we do). I think what's causing problems on systems
> with low memory is that cursor mobs and the fb's need to be both
> resident but can't. Now SVGA_REG_MAX_PRIMARY_MEM is the max memory in
> which our topology needs to fit in (which is max_primary_mem on
> vmwgfx) but afaict that's not the issue here and it's checked later in
> vmw_kms_validate_mode_vram
>
> > Additionally, device commands which use multiple graphics resources mus=
t
> > have all their resources fit within graphics memory for the duration of=
 the
> > command. Thus we need a small carve out of 1/4 of graphics memory to en=
sure
> > commands likes surface copies to the primary framebuffer for cursor
> > composition or damage clips can fit within graphics memory.
>
> Yes, we should probably rename max_mob_pages to max_resident_memory
> instead to make this obvious.
>
> > This fixes an issue where VMs with low graphics memory (< 64MiB) config=
ured
> > with high resolution mode boot to a black screen because surface creati=
on
> > fails.
>
> Does this work if you disable gbobjects? Without gbobject's we won't
> have screen targets and thus won't be offsetting by 1/4 so I wonder if
> 4mb vram with legacy display would work with 1280x800 resolution.
>
> Also, you want to add a "V2" section to your change to describe what
> changed in v2 vs v1 (and same for any subsequent change).
>
> >
> > Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> > ---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 22 ++++++++++++++--------
> >  1 file changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> > index cd4925346ed4..84e1b765cda3 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > @@ -2858,12 +2858,17 @@ enum drm_mode_status vmw_connector_mode_valid(s=
truct drm_connector *connector,
> >         struct vmw_private *dev_priv =3D vmw_priv(dev);
> >         u32 max_width =3D dev_priv->texture_max_width;
> >         u32 max_height =3D dev_priv->texture_max_height;
> > -       u32 assumed_cpp =3D 4;
> > -
> > -       if (dev_priv->assume_16bpp)
> > -               assumed_cpp =3D 2;
> > +       u32 assumed_cpp =3D dev_priv->assume_16bpp ? 2 : 4;
> > +       u32 pitch =3D mode->hdisplay * assumed_cpp;
> > +       u64 total =3D mode->vdisplay * pitch;
> > +       bool using_stdu =3D dev_priv->active_display_unit =3D=3D vmw_du=
_screen_target;
> > +       u64 max_mem_for_st =3D dev_priv->max_mob_pages * PAGE_SIZE * 3 =
/ 4;
> > +       /* ^^^ Max memory for the mode fb when using Screen Target / MO=
Bs.
> > +        * We need a carveout (1/4) to account for other gfx resources =
that are
> > +        * required in gfx mem for an fb update to complete with low gf=
x mem (<64MiB).
> > +        */
>
> Same wording issue as mentioned above and lets use normal comment
> style (i.e. comments attach to the code below). max_mem_for_st should
> probably be max_mem_for_mode or max_mem_for_mode_st.
>
> > -       if (dev_priv->active_display_unit =3D=3D vmw_du_screen_target) =
{
> > +       if (using_stdu) {
> >                 max_width  =3D min(dev_priv->stdu_max_width,  max_width=
);
> >                 max_height =3D min(dev_priv->stdu_max_height, max_heigh=
t);
> >         }
> > @@ -2874,9 +2879,10 @@ enum drm_mode_status vmw_connector_mode_valid(st=
ruct drm_connector *connector,
> >         if (max_height < mode->vdisplay)
> >                 return MODE_BAD_VVALUE;
> >
> > -       if (!vmw_kms_validate_mode_vram(dev_priv,
> > -                                       mode->hdisplay * assumed_cpp,
> > -                                       mode->vdisplay))
> > +       if (using_stdu && (total > max_mem_for_st || total > dev_priv->=
max_mob_size))
> > +               return MODE_MEM;
> > +
> > +       if (!vmw_kms_validate_mode_vram(dev_priv, pitch, mode->vdisplay=
))
> >                 return MODE_MEM;
>
> It might make sense to just reuse vmw_kms_validate_mode_vram , it does
> what we're claiming to do here and even though it's called
> vmw_kms_validate_mode_vram it does actually validate st primary
> memory.
>
> z
