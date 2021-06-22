Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C493B05CE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4D16E50B;
	Tue, 22 Jun 2021 13:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855706E508;
 Tue, 22 Jun 2021 13:27:19 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id r16so11257696oiw.3;
 Tue, 22 Jun 2021 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cO64HjfY7zNoK3o+z033NE4yyjdDHedNRwY8vXER4vQ=;
 b=tNvOXU+QX2QJs+WToJo0sEUkiFc6PcN1b7MhrMAA/TopNGEKVupLKWwx8wk+dcejFp
 sCDmU7+hsAjjXLgo7azCee8i93fql+u32UkdgABzzrffHkQp7ThqBysMk8HMZDO93DdA
 ILJO3l4N4qzgWdI1ARu602wbUU9EDTTuyvik/UUrkg6zBfFsC+BDyHbA9mNpU4a8zRq6
 EzqEFwcl5jcprjEspoxRxOTIE6nZMKf4qfTEdIMk3pHI9Df5fbmoR7poEv9Pl7yKJfT4
 b2BAmNt8yxFG/4ejE+VSXL4Fl1w5p1iQb4kOBGzkRJA3LmapUZyWw1alHME61NpC4izE
 AN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cO64HjfY7zNoK3o+z033NE4yyjdDHedNRwY8vXER4vQ=;
 b=HtOfP6ZNk+JzrGJVHRpaYbO1t+7kAjSueRJ5SGVLCZw5SiFN6Jb9qxbdmas7dhew89
 Y1qaFtY2hyR51Y9lYKAvVn0maoZO1fRFuwnf1ysearYqPEGKLNrubql9eASgzMhYMvPd
 4iuDL7Cn0qQOq5ghxueCqj4G0Octp24Mic27hoPeG4px5uiFJAkef44hGaLMN9uoU9/r
 ocRAuKRjG520/hyV1K1qEY8josGlCJy/AUjgHZXjVe+mh8M6NJ2bWBLyaCXlP3TyMk6s
 2UX6SElQonG0uMe+3CNqKpqwfgY5n0AThnUIGfilHwf2pi7krF+p0Nt9P2YZvKxfgnB7
 qsjw==
X-Gm-Message-State: AOAM533hIgOcs6rGwYo55v64JZiQ8rp6894duWkmrK09rqO1WD89Yosf
 sPukEH9gqLD4tz2ZmuaM6jYbU9aB9K1pm6ds7+o=
X-Google-Smtp-Source: ABdhPJxb0AIHYQQktiOBdlyyOtOiRLDUVeLRQEw+8NfaFVfVs9os58oUh51UPoA6rNP5GeVxmYdp3K9iwSRm9p/a/10=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr2895569oic.5.1624368438642; 
 Tue, 22 Jun 2021 06:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210614110517.1624-1-christian.koenig@amd.com>
 <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
In-Reply-To: <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Jun 2021 09:27:07 -0400
Message-ID: <CADnq5_NmVJbFzhf7swvkU-3xbMamTxgALcHdnCRNEaHZRR5BBA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix dma_address check for CPU/GPU sync
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux@zary.sk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 5:32 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Ping? Does anybody wants to give me an rb or acked-by?
>
> AGP is basically broken on nouveu without this.

Looks correct to me.
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> Christian.
>
> Am 14.06.21 um 13:05 schrieb Christian K=C3=B6nig:
> > AGP for example doesn't have a dma_address array.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index 3e09df0472ce..170aba99a110 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -546,7 +546,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
> >       struct ttm_tt *ttm_dma =3D (struct ttm_tt *)nvbo->bo.ttm;
> >       int i, j;
> >
> > -     if (!ttm_dma)
> > +     if (!ttm_dma || !ttm_dma->dma_address)
> >               return;
> >       if (!ttm_dma->pages) {
> >               NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
> > @@ -582,7 +582,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
> >       struct ttm_tt *ttm_dma =3D (struct ttm_tt *)nvbo->bo.ttm;
> >       int i, j;
> >
> > -     if (!ttm_dma)
> > +     if (!ttm_dma || !ttm_dma->dma_address)
> >               return;
> >       if (!ttm_dma->pages) {
> >               NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
>
