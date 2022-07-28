Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDC583756
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 05:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4B710EA3D;
	Thu, 28 Jul 2022 03:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED44D10E35B;
 Thu, 28 Jul 2022 03:09:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e15so622439edj.2;
 Wed, 27 Jul 2022 20:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ti0wW/usciuhpu5sGSvLGuGCnWTORuFIHrWb8yL3l/0=;
 b=B47EDs0aGYQsAl5ACnyu26TOZdBm3CIgzbVNi4KBQsidpYEu7PzWPP22rnNNR/mHO8
 rXSyPdF6xcsxXQj8lJfaBAVIhm2168Afjp/iwiwhENnWmHJtBLdLml9V7YQFCV74Q60+
 ULjuNIibU+Iuq+wiMk8Iw8fJpkKnsVthA7py0eXygsnNLTV2878YdfGK1SbRrhqPUzPf
 rUTgK8ZZc7Vs1DQCuAU+D+SFUNYk7x4YDJK6UITDKKvnHZrTzpgJIm3p6Lr9T5ONGg07
 PMQ8q4C5Muwpg/KLtUjUpW+X/smTA+HlHbEfwdcInWqaBUMdKexngxgw//JiUDYjDFQJ
 Ck8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ti0wW/usciuhpu5sGSvLGuGCnWTORuFIHrWb8yL3l/0=;
 b=wAKSnKkSjYTWB3J3y9vp/7N4IZtBR4f8hF6RVwzncVOyf9JxbHxNj6fxu4YG+jAzhF
 LZqTNhQzf+jSATsdxa2aLVae8Y3JATSpMg0XLvTMcWar+tTBQIClzAq3fENuIYWwgi4j
 n+uLQ5atY0FRFt/quMqsDAe8BJ2Ryp4aks9SBs2yhKU9XGBWRq1ALTNdIqg+vv/sMRha
 3XH+iiMBNKDA2cF+upMofZ2uO8AIF4N1CvCD6MayteOJwgaj2El5ETO26uC6ehBt2HbS
 h415OIQon+OCIgJntJ8Erc7H4Uel+tIhK1Wts6/SFmOHpQpovJttD62fkXgHi7VVyeiI
 ushA==
X-Gm-Message-State: AJIora/bzG2v/sZzXM7+Ox0aVpvMx1H4DAYnpcTIWTnOs+R/vFYxP0rq
 bvVZZG/5BWAGU+6a8oKxiyRgI5eUUBzb0CEYbjE=
X-Google-Smtp-Source: AGRyM1uuFE44/FrrfiMMDPAM8JO4o40vx2JvBk2vB/14gfvxOt3/ObaFBnMzrwrZJ+gLvLbGKHaHaRJ6xDMrd8bmLew=
X-Received: by 2002:a05:6402:290c:b0:43c:93b1:f542 with SMTP id
 ee12-20020a056402290c00b0043c93b1f542mr7904939edb.131.1658977769090; Wed, 27
 Jul 2022 20:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220707080241.20060-1-xinhui.pan@amd.com>
 <97924e60-f0fd-0a71-0a34-0606c5a83cab@amd.com>
In-Reply-To: <97924e60-f0fd-0a71-0a34-0606c5a83cab@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Jul 2022 23:09:17 -0400
Message-ID: <CADnq5_PVuJnA0hpxcRNcyX1sBf8q7635Y3ajEVOOVQRvQVzWGg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix one use-after-free of fence
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
Cc: daniel.vetter@ffwll.ch, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Did this ever land?  I don't see it in drm-misc.

Alex

On Thu, Jul 7, 2022 at 4:05 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.07.22 um 10:02 schrieb xinhui pan:
> > Need get the new fence when we replace the old one.
> >
> > Fixes: 047a1b877ed48 ("dma-buf & drm/amdgpu: remove dma_resv workaround=
")
> > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>
> Good catch, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Going to push that in a minute.
>
> Christian.
>
> > ---
> >   drivers/dma-buf/dma-resv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 0cce6e4ec946..205acb2c744d 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -343,7 +343,7 @@ void dma_resv_replace_fences(struct dma_resv *obj, =
uint64_t context,
> >               if (old->context !=3D context)
> >                       continue;
> >
> > -             dma_resv_list_set(list, i, replacement, usage);
> > +             dma_resv_list_set(list, i, dma_fence_get(replacement), us=
age);
> >               dma_fence_put(old);
> >       }
> >   }
>
