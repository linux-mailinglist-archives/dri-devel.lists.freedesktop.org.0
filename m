Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D57252A4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 06:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EAC10E41D;
	Wed,  7 Jun 2023 04:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F69810E41C;
 Wed,  7 Jun 2023 04:04:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-977cc662f62so551458666b.3; 
 Tue, 06 Jun 2023 21:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686110664; x=1688702664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzNnbIFGDmDkhEhmpSYKhx8HoFZP0+6TO7nVNkdhbGs=;
 b=DGorRqZwWzsyURJ0vJmgdsljto3aQ/liBDe0M0+XeQ32e0jF+iKKwSFavNF+/GzWdR
 AqPMHsti2uaQFhWvFJp/3A7DHw6zKW/wGqda1QLNqeWLYl131cQvA24YMiw6wFii3+ml
 TLqPDbOh8kbHRg4NiSxicWvTFt9h04PKEObAWNdK6Idh3stld0f/+u10FWXqvBrKUFxq
 LZCsTvtBypiyvL8BydDnRpYHZhar/uRCoeYA0j6bM6akxGIOPbBs3Jj9m9MJkUD44NqK
 /DBbL3tqDFNBskTR3mIPNJIFveEY9bdg7SlO0yL5teUJzaYI5p7FKHPDJ4AwiducYbDB
 NBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686110664; x=1688702664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzNnbIFGDmDkhEhmpSYKhx8HoFZP0+6TO7nVNkdhbGs=;
 b=Mqc6AzJ5K1RyDad1989DO88ZCvGxKkHna4ikEN5gWSIrVDvBTJP0SwjLrCmI4r0456
 h95gdUeMDcEPKXxhFHu5bh1+y4V9R2AaOVIIQBDiWB3Ivfc9tDVdK/9JbaGvo74xyq2X
 29veLa4VMKkpEzS7sbYxbkRfLxkmzVZ3ZbzzWfBopHEAYTGUd8bXO3YeWdT8x/OjtRUO
 2anST6jzab49RD+yBCySJllZ+iZ2t3l59cTmGMQnL3FGYX6GQ8fXDBFnLdGelyj82eQG
 wDFkRYHWUahyxf0Wpxbk82HUVD8+FE9+VR1x25nhFTBvpI/mwaCQkHtpe+B0ZtTy0+y4
 r5QA==
X-Gm-Message-State: AC+VfDzZQGJK09KnchYMHTtLxVMcSJLLyvdx4R7JGNdWEvf2yU3IaVJN
 02gsb1CXdlWogZM+P0O02/ydVVSUxxM1lSx4bRA=
X-Google-Smtp-Source: ACHHUZ6vreWIAaAgYHAXyFB8O1/sWMUX0O4JyRiZhdjKlVN+Bek4KcIjWsZYPa/DZNjrmvOt8kqk2o4kzBpGSlSKK2c=
X-Received: by 2002:a17:907:7e9e:b0:974:52e6:93cb with SMTP id
 qb30-20020a1709077e9e00b0097452e693cbmr5459688ejc.50.1686110664054; Tue, 06
 Jun 2023 21:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230606143247.433018-1-nunes.erico@gmail.com>
 <CA+E=qVcv4CrGki1cTYb53p5Ys0AgF=qfrK7XYB7X0gvu9knD-g@mail.gmail.com>
In-Reply-To: <CA+E=qVcv4CrGki1cTYb53p5Ys0AgF=qfrK7XYB7X0gvu9knD-g@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 7 Jun 2023 12:04:12 +0800
Message-ID: <CAKGbVbs2uwap-EuQkn00+rZqOB+Fohd9FmazMs051Yn+VSjmmA@mail.gmail.com>
Subject: Re: [Lima] [PATCH] drm/lima: fix sched context destroy
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 christian.koenig@amd.com, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Qiang Yu <yuq825@gmail.com>

Applied to drm-misc-fixes.

On Wed, Jun 7, 2023 at 9:18=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> On Tue, Jun 6, 2023 at 7:33=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
> >
> > The drm sched entity must be flushed before finishing, to account for
> > jobs potentially still in flight at that time.
> > Lima did not do this flush until now, so switch the destroy call to the
> > drm_sched_entity_destroy() wrapper which will take care of that.
> >
> > This fixes a regression on lima which started since the rework in
> > commit 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini=
")
> > where some specific types of applications may hang indefinitely.
> >
> > Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini=
")
> > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>
> Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
> > ---
> >  drivers/gpu/drm/lima/lima_sched.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/l=
ima_sched.c
> > index ff003403fbbc..ffd91a5ee299 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -165,7 +165,7 @@ int lima_sched_context_init(struct lima_sched_pipe =
*pipe,
> >  void lima_sched_context_fini(struct lima_sched_pipe *pipe,
> >                              struct lima_sched_context *context)
> >  {
> > -       drm_sched_entity_fini(&context->base);
> > +       drm_sched_entity_destroy(&context->base);
> >  }
> >
> >  struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task=
 *task)
> > --
> > 2.40.1
> >
