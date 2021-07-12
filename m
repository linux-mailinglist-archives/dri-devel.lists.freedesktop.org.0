Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC93C5D6B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 15:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FE6899F2;
	Mon, 12 Jul 2021 13:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165D89C29
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:38:20 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id x192so29024801ybe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9iDz7N7jAiAmF7iXzoycGHM7j74isYO2j9m2ZwxhoPI=;
 b=UTuthniEHltDdrMRL+t/MamlP3YaeRy3Xo4QR4ssPbR5dnlilv8CGL5F5xvMxQ+ujg
 WR5bmTcxz6SCeoDLDNXMQyhAurTGw2AcnrXyi7+oRtAry3SAkwkWqQlZ8i43haj99NOo
 7T7kvMhHcVXdxPKAJx1D09sNac3xniFzngrEn0ZdjR5P7nuvD/CT3OYuHIYher27RgCZ
 zQU2hepQhHzhAmwXtNFvxhF4flDR+duKPA3waj4oTZ723Izd7F0L/GbCmcLibRcUAoqa
 5DMPJTuKGcxml/tgk1szXluKWfKGddOR5RG9ASpF/9u8xFI2niAH2GH/olcCyGlQN383
 QUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9iDz7N7jAiAmF7iXzoycGHM7j74isYO2j9m2ZwxhoPI=;
 b=tldBZo9Yvn2ZCcnvRRgo7iU3oFcK7IhsJosLGGCUiTd7rYRZwYZCVzRN2JM8hvb3Nj
 mbtW1M0Rr7LyBkVU3/zGFK3QwdT+0rALtiBuOmlAHy+gMNtYvHQHpqCxGSqj2YnUK3T7
 sSYNuSf5wuPZ7uSNmg5u8pWJVOZ03erEJwHq8/gdRC7UcGXJWhLLCcE6IcXKGk3Wgztt
 viwDLehixmtq0zJOe39jc/nyNllqSTQ7pR/skpa9Eavi1KK9nePUvToz6dTszgKPDRKI
 pX/jbaPbSbczJBlazC88xF6tkf4doYL0KebPGD86JOa1gq8oljPao0sf20LxIRT+/QUj
 mm/g==
X-Gm-Message-State: AOAM531i4kSF7FBQ3qA1wiGjK9srPsxxToeBN9xoFgxOKVlWz4RgUF4k
 Xv3GQiKlW1ynJqkgRjudhs6pqD0qVGMvBHC9Qxs94Q==
X-Google-Smtp-Source: ABdhPJzRd+7UKSz4M+r2BJm+sqsTw+svQPfb2QnXLbMDIJGvk/L67k45DUIQYU8PIpss4OijlZRPHYtUFnNyhmKXDWI=
X-Received: by 2002:a25:208b:: with SMTP id
 g133mr64175499ybg.211.1626097099839; 
 Mon, 12 Jul 2021 06:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210624174732.1754546-1-jason@jlekstrand.net>
 <2b69abeb-7c97-fe6a-384c-2e1f86529dba@amd.com>
 <CAOFGe961e4D+OdC8DQPk9aohpUqMmu34eant_LRfAzaAHQ_Ezw@mail.gmail.com>
 <dcf0cbf9-3a0d-2e5e-8e57-16616bb85a30@amd.com>
In-Reply-To: <dcf0cbf9-3a0d-2e5e-8e57-16616bb85a30@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Jul 2021 08:38:08 -0500
Message-ID: <CAOFGe953PSbkbpVKipynwQYPmk1df69ibSK2z_iRfLwcf9hUiQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/sync_file: Don't leak fences on merge failure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No worries.  Thanks for pushing!

On Mon, Jul 12, 2021 at 6:37 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Sorry for the vacation and sick leave induced delay.
>
> I've just pushed this to drm-misc-fixes.
>
> Thanks,
> Christian.
>
> Am 24.06.21 um 21:43 schrieb Jason Ekstrand:
> > I don't have drm-misc access.  Mind pushing?
> >
> > On Thu, Jun 24, 2021 at 12:59 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 24.06.21 um 19:47 schrieb Jason Ekstrand:
> >>> Each add_fence() call does a dma_fence_get() on the relevant fence.  =
In
> >>> the error path, we weren't calling dma_fence_put() so all those fence=
s
> >>> got leaked.  Also, in the krealloc_array failure case, we weren't
> >>> freeing the fences array.  Instead, ensure that i and fences are alwa=
ys
> >>> zero-initialized and dma_fence_put() all the fences and kfree(fences)=
 on
> >>> every error path.
> >>>
> >>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >>> Fixes: a02b9dc90d84 ("dma-buf/sync_file: refactor fence storage in st=
ruct sync_file")
> >>> Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>
> >>> ---
> >>>    drivers/dma-buf/sync_file.c | 13 +++++++------
> >>>    1 file changed, 7 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.=
c
> >>> index 20d9bddbb985b..394e6e1e96860 100644
> >>> --- a/drivers/dma-buf/sync_file.c
> >>> +++ b/drivers/dma-buf/sync_file.c
> >>> @@ -211,8 +211,8 @@ static struct sync_file *sync_file_merge(const ch=
ar *name, struct sync_file *a,
> >>>                                         struct sync_file *b)
> >>>    {
> >>>        struct sync_file *sync_file;
> >>> -     struct dma_fence **fences, **nfences, **a_fences, **b_fences;
> >>> -     int i, i_a, i_b, num_fences, a_num_fences, b_num_fences;
> >>> +     struct dma_fence **fences =3D NULL, **nfences, **a_fences, **b_=
fences;
> >>> +     int i =3D 0, i_a, i_b, num_fences, a_num_fences, b_num_fences;
> >>>
> >>>        sync_file =3D sync_file_alloc();
> >>>        if (!sync_file)
> >>> @@ -236,7 +236,7 @@ static struct sync_file *sync_file_merge(const ch=
ar *name, struct sync_file *a,
> >>>         * If a sync_file can only be created with sync_file_merge
> >>>         * and sync_file_create, this is a reasonable assumption.
> >>>         */
> >>> -     for (i =3D i_a =3D i_b =3D 0; i_a < a_num_fences && i_b < b_num=
_fences; ) {
> >>> +     for (i_a =3D i_b =3D 0; i_a < a_num_fences && i_b < b_num_fence=
s; ) {
> >>>                struct dma_fence *pt_a =3D a_fences[i_a];
> >>>                struct dma_fence *pt_b =3D b_fences[i_b];
> >>>
> >>> @@ -277,15 +277,16 @@ static struct sync_file *sync_file_merge(const =
char *name, struct sync_file *a,
> >>>                fences =3D nfences;
> >>>        }
> >>>
> >>> -     if (sync_file_set_fence(sync_file, fences, i) < 0) {
> >>> -             kfree(fences);
> >>> +     if (sync_file_set_fence(sync_file, fences, i) < 0)
> >>>                goto err;
> >>> -     }
> >>>
> >>>        strlcpy(sync_file->user_name, name, sizeof(sync_file->user_nam=
e));
> >>>        return sync_file;
> >>>
> >>>    err:
> >>> +     while (i)
> >>> +             dma_fence_put(fences[--i]);
> >>> +     kfree(fences);
> >>>        fput(sync_file->file);
> >>>        return NULL;
> >>>
>
