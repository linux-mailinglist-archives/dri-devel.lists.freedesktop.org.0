Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A1C705346
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 18:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D177810E065;
	Tue, 16 May 2023 16:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D0F10E065;
 Tue, 16 May 2023 16:11:26 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-54fb3ef9c53so2932464eaf.3; 
 Tue, 16 May 2023 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684253485; x=1686845485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaBNU8MoQeniJsGNNOBBa/mrT/HUCmYPBQz0uJsYTKk=;
 b=lRRoV+0YuzxOkiOFqqCvVHdlLGS4oyyAKLLXMB9376khWuRNYCM7JA4g3M8veQV0R8
 zAXhSU94bNifjBQ3b2JioSPp0MEvtpnaf0C6JzFeGop8bTw6BkzMGW54Ak0Y58V23Buy
 6NE9354L2b8t2DmGMQQVzGzzue4Lznnh8p8BHTMZcOU14QhaYJVX6A2tA57JWajhKUo5
 F5lqZGBaxCv6Z7e5XovCl2etN3iU9LRL2jSG+GeSTaxGARw5XhCX8Zve1WEz16KpDQu7
 2HC3FsYP2F8zY1MToRgU+oKv+p31IzTDPykGwpK72s3lRLITcL9FnIfNn+nnyD/mPf49
 prPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684253485; x=1686845485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaBNU8MoQeniJsGNNOBBa/mrT/HUCmYPBQz0uJsYTKk=;
 b=XpZDQCabMkzHGYgQjbs2s8aptooJW31lP/HzxyRrbx6SNNCLHjwwD5poXqhbowaQZp
 jQF5Ox/eKlbUMJPJxhHt6Rvxkl5dw6baqIL741d/rLGnmRAQj1GUyfdMkDtstXvco8qG
 Hsn9/YooUSJm8DQOtiaXszZUG2qgMWbob0RVm5oZMayvcFntVVWEFIeiluLxc3zr5bIb
 u9CRObz6sWv9Rm+OHnzmwcK8yec6GAwARcXVXX9MEQPuolDyThNUYUHneqE92cTk4CS7
 qmAIsA86n5Prye5TBfCKMTLaPx2b4Nrm0RQ2fqQeZL354mGFrSaqOre1gzrgMMGtahS+
 8YSA==
X-Gm-Message-State: AC+VfDxYN1zJmzm7N28fOG3IqVLG/aj+WSlfK8SGhOOn1PMYtf/Alr+L
 +5mRzci9y/BB4E1MQWGrF7/mJLUiUI1aVCY+4FQ=
X-Google-Smtp-Source: ACHHUZ4nvADM2PqszlRkzOK5G/Xhpqv1ZOXy6ubNOt5o8TJ6PwaF/S7EmxC/jQbfFjcqOx3/3fDOlHEVLN2h+uxmtFE=
X-Received: by 2002:a4a:9297:0:b0:54f:4498:115c with SMTP id
 i23-20020a4a9297000000b0054f4498115cmr11490762ooh.9.1684253485199; Tue, 16
 May 2023 09:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230309123700.528641-1-jani.nikula@intel.com>
 <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com> <87bkl29jk0.fsf@intel.com>
 <875y8sitv5.fsf@intel.com>
In-Reply-To: <875y8sitv5.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 May 2023 12:11:14 -0400
Message-ID: <CADnq5_NL-Ouh5-NRaoRknPDRTq2NDKWcHKxDEXfmkuqgWL54kw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
To: Jani Nikula <jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 4:05=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Thu, 09 Mar 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wr=
ote:
> >> Am 09.03.23 um 13:37 schrieb Jani Nikula:
> >>> Make the struct ttm_device_funcs pointers const so the data can be pl=
aced in rodata.
> >>>
> >>> Cc: Christian Koenig <christian.koenig@amd.com>
> >>> Cc: Huang Rui <ray.huang@amd.com>
> >>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> Good idea, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com=
>
> >
> > Thanks!
> >
> >> Should I push it to drm-misc-next or do you need it on some other bran=
ch?
> >
> > Go ahead, I'm not urgently depending on it.
>
> Christian, I guess this fell between the cracks? Can I just push it to
> drm-misc-next?

Go ahead.  Christian is out of the office this week.

Alex

>
> BR,
> Jani.
>
>
> >
> > BR,
> > Jani.
> >
> >>
> >> Christian.
> >>
> >>> ---
> >>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
> >>>   include/drm/ttm/ttm_device.h     | 4 ++--
> >>>   2 files changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/t=
tm_device.c
> >>> index ae2f19dc9f81..a71bb1362de4 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >>> @@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
> >>>    * Returns:
> >>>    * !0: Failure.
> >>>    */
> >>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs=
 *funcs,
> >>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device=
_funcs *funcs,
> >>>                 struct device *dev, struct address_space *mapping,
> >>>                 struct drm_vma_offset_manager *vma_manager,
> >>>                 bool use_dma_alloc, bool use_dma32)
> >>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_devic=
e.h
> >>> index 56e82ba2d046..c22f30535c84 100644
> >>> --- a/include/drm/ttm/ttm_device.h
> >>> +++ b/include/drm/ttm/ttm_device.h
> >>> @@ -223,7 +223,7 @@ struct ttm_device {
> >>>      * @funcs: Function table for the device.
> >>>      * Constant after bo device init
> >>>      */
> >>> -   struct ttm_device_funcs *funcs;
> >>> +   const struct ttm_device_funcs *funcs;
> >>>
> >>>     /**
> >>>      * @sysman: Resource manager for the system domain.
> >>> @@ -287,7 +287,7 @@ static inline void ttm_set_driver_manager(struct =
ttm_device *bdev, int type,
> >>>     bdev->man_drv[type] =3D manager;
> >>>   }
> >>>
> >>> -int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs=
 *funcs,
> >>> +int ttm_device_init(struct ttm_device *bdev, const struct ttm_device=
_funcs *funcs,
> >>>                 struct device *dev, struct address_space *mapping,
> >>>                 struct drm_vma_offset_manager *vma_manager,
> >>>                 bool use_dma_alloc, bool use_dma32);
> >>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
