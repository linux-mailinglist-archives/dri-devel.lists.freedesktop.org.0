Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FAAB0BC2A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 07:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3D010E394;
	Mon, 21 Jul 2025 05:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AJfJwQ7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E9F10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753077424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3rzazQ4BjXHZvVDYlz6PavKZkH7wTCMuLfY3C5kJTk=;
 b=AJfJwQ7H3H1zcz6coYQYQB8gjNGtCIl/ZtH+EQCXnZjzYBIFHWYBq+4K8JOWFUh0vWJMwd
 0IzBoueDOA9QEHvUK6Ye/r47KEcI+kGU2U+VweckcLP/rWHAeYn+GwFSojM3M2hhv+OXAF
 yzg1O8hQNbxnfQvwlQIkNfzfpD1EavA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-YXR-nNcxNzi63kE71jfGwg-1; Mon, 21 Jul 2025 01:57:00 -0400
X-MC-Unique: YXR-nNcxNzi63kE71jfGwg-1
X-Mimecast-MFC-AGG-ID: YXR-nNcxNzi63kE71jfGwg_1753077420
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2363bb41664so31999715ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 22:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753077420; x=1753682220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3rzazQ4BjXHZvVDYlz6PavKZkH7wTCMuLfY3C5kJTk=;
 b=rgDrwK9o39zJSMn0jPIJUP94O1gTggPOhCQs5Vr5GadDVPvMCCGgFhxoQg9hy+EJgh
 l9FhobK6hGdXixPrDHy7/E49fb18nhxF0erbDVNqEly7CjikLefsBQFN7TTx9n4EcAvP
 ZRpufkkHf8ZsrwqM74CcApD6Pjgd86GB9CbUnLAGoqZfVjk1Ug6oMsEny75ed6DNJhUL
 zENbrTjRS1lWAhiihkrpzbiZb0u/GmDot9pW7efEY6N9aRkLhe0gItsAywEFUJf4ZWru
 d1xOL1RgOe1NdeDTGPukRQDZMJbQmQYY1196HCZqm7fAMzjW49oU+6dkK236V5WaYKCR
 wS6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH5A+ZEsxGHk+DdiIHFvz1UewSpkpuNGBHjjrf/MJdMTsyCFs2ElXRlBikgR9FKslZfv/fN6Esfyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwJczNrhOXvs1yRY2ryC7zpKb2vyiFftFnhF4OniYOn5H1bxqr
 c2Ms7ckxR1FwkO9xqwFSXrQTdRPbcvMSEEsYjXXJ8j/6Fm9wtkibHyP818sJnIqsfMUOgU0fGIe
 E6Lp1YlL8xHbxJviAUC8GaVAKcH5W2zKdLb95YYQgd2xJ5uJgLYLssBmhAXOdIISVfdeI1eeh4J
 0LqxWopIhlW93iKmu0DgeO9V4ZjOe3MJvngKpmw+0YvzWt
X-Gm-Gg: ASbGncu8A6q0HDZUYkB2wIJnwY0kacn5IAD//WmDnRobDURkz2PtNFo5RplIzG5hYfp
 OoEHXYFnbUlN0DVz4OstTjJV/mXIXlKeAwW1CCetVPKXdNl84acR1XdZLsqF2pazozmAGrKmR7G
 h67GxcyMyWh8hm89abJ0Y=
X-Received: by 2002:a17:903:244b:b0:234:5ea1:6041 with SMTP id
 d9443c01a7336-23e38f493dcmr194191255ad.10.1753077419882; 
 Sun, 20 Jul 2025 22:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG30/IUvMvXE4T8kwdI6mXQJm628Dh8t0N1cwgCJIczEB7l9/FzCUuDq7Sd8SWP/dcn+bNUrtoCZBtkW3tkvE=
X-Received: by 2002:a17:903:244b:b0:234:5ea1:6041 with SMTP id
 d9443c01a7336-23e38f493dcmr194190925ad.10.1753077419507; Sun, 20 Jul 2025
 22:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-14-airlied@gmail.com>
 <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
In-Reply-To: <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Mon, 21 Jul 2025 15:56:48 +1000
X-Gm-Features: Ac12FXxBRUtewqShIudpiVAD2K3FTCF0W2oO-DbYH3MAKSeUnM2igg0xj9npego
Message-ID: <CAMwc25qP-42wMX4UYhZWiYfvf_1dBVNL9TU9i_Wq7uZPqjQL5Q@mail.gmail.com>
Subject: Re: [PATCH 13/18] ttm/pool: enable memcg tracking and shrinker. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8LRncc1rF1Y118rpwOChBZaJHb483ukPiMkH4b6RLjs_1753077420
X-Mimecast-Originator: redhat.com
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

On Tue, Jul 15, 2025 at 5:34=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 14.07.25 07:18, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This enables all the backend code to use the list lru in memcg mode,
> > and set the shrinker to be memcg aware.
> >
> > It adds the loop case for when pooled pages end up being reparented
> > to a higher memcg group, that newer memcg can search for them there
> > and take them back.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > ---
> > v2: just use the proper stats.
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 126 ++++++++++++++++++++++++++-------
> >  1 file changed, 102 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index a4f4e27c6a1f..1e6da2cc1f06 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -142,7 +142,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
> >  }
> >
> >  /* Allocate pages of size 1 << order with the given gfp_flags */
> > -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t g=
fp_flags,
> > +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> > +                                     struct obj_cgroup *objcg,
> > +                                     gfp_t gfp_flags,
> >                                       unsigned int order)
> >  {
> >       unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
> > @@ -162,7 +164,10 @@ static struct page *ttm_pool_alloc_page(struct ttm=
_pool *pool, gfp_t gfp_flags,
> >               p =3D alloc_pages_node(pool->nid, gfp_flags, order);
> >               if (p) {
> >                       p->private =3D order;
> > -                     mod_node_page_state(NODE_DATA(page_to_nid(p)), NR=
_GPU_ACTIVE, (1 << order));
> > +                     if (!mem_cgroup_charge_gpu_page(objcg, p, order, =
gfp_flags, false)) {
>
> Thinking more about it that is way to late. At this point we can't fail t=
he allocation any more.
>

I've tested it at least works, but there is a bit of a problem with
it, because if we fail a 10 order allocation, it tries to fallback
down the order hierarchy, when there is no point since it can't
account the maximum size.

> Otherwise we either completely break suspend or don't account system allo=
cations to the correctly any more after resume.

When you say suspend here, do you mean for VRAM allocations, normal
system RAM allocations which are accounted here shouldn't have any
effect on suspend/resume since they stay where they are. Currently it
also doesn't try account for evictions at all.

>
> What we need is to reserve the memory on BO allocation and commit it when=
 the TT backend is populated.

I'm not sure what reserve vs commit is here, mem cgroup is really just
reserve until you can reserve no more, it's just a single
charge/uncharge stage. If we try and charge and we are over the limit,
bad things will happen, either fail allocation or reclaim for the
cgroup.

Regards,
Dave.

