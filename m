Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C383EAEEC2B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 03:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4810E24F;
	Tue,  1 Jul 2025 01:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Veswfly0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F410E24F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 01:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751334105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vu6I95bDv9BCilBsi7upo1YPF5wPTnjVgc/AYiYqQVs=;
 b=Veswfly0eAZOcTkmKUUh6PMfWy2j5NjRXgMz1desPxo8ePATKBsMXTmc+ynxGiTxaxrUr7
 TilZ0If8UUw6ICt460JpKCeOU4fNKWYySos37pQixWm3pcFVg4OWUi1O/rVMIsaFSCUxmL
 8EnDoeSXcKKgvbFkP6ygypM377GU4QQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-3zKbfRSqMqiO1l3iNaSnJg-1; Mon, 30 Jun 2025 21:41:44 -0400
X-MC-Unique: 3zKbfRSqMqiO1l3iNaSnJg-1
X-Mimecast-MFC-AGG-ID: 3zKbfRSqMqiO1l3iNaSnJg_1751334103
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2356ce66d7cso35249435ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 18:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751334103; x=1751938903;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vu6I95bDv9BCilBsi7upo1YPF5wPTnjVgc/AYiYqQVs=;
 b=c2i1Qu4tzNOIWNE+iOlh9bC4NF4LRhaCx8jxNoKFjEUm/FcRF8500lh3bPn501w8IA
 KHDD9iLRLXWo/2e1zEbC4I0/xi1UcT3JOS8J2hFMgkHLun3wHzDTJdKixqQgkmIrMF8D
 hTA2Qh2d+q7ZtXv3CWeZxNw+SyC71yxL9AgX4dm/cmVQgD4KXLEnEGOVH2aAcAPjqGxs
 Ild0+9d4dwHC9S8VIJL3BdzusM2GGROVFDTzlR96rsbCs6O2O/xZ7n6V/p6ENJfHWqw4
 4+kw17IGfU95r8jl594pVDss5CvHw/Hr/RzzsZWjCqnKt0eDxmQg1U/UGmccAnyOdlrf
 WyKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQkbTLyjD6/97m4/E4fRB7Vssnk4JmNuoe9IAXRvfl/5Z73NGZMpa+GicfNv7ixijcty+2Ykl7Cq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYrg5nwIwewZ2+ROSpCRrosZuJZ3Xu5QorXWAs62y8/6VzGZe2
 qh8Mc25pN1ivLLmT+5vsgtUvdC08twvHmUEAbeMZ6kNITeV0Cy6ax9/Ru8prZaxHfosq6QRjEuS
 MPnaKh19Pw27HegRMiEBDg6Ee7s5hONJFKzbd0H86dZUfUSAKJKqxC7Hi1qUK6VVDKGZe1fMTQf
 hYplhXqUTWxWlHXlZci3cSRmKviM5+1DMEHiOqM03Por6Z
X-Gm-Gg: ASbGncu7LOowEnsAWOgO4qu5juilE/jP1Ac7CVM7MhWWkEMrZe3IJZPosGtTybNjZCa
 Q7yQtgaCmIWWrfYjnYNGOjBKpntnEVu3pidFgOaRxkgJdEKuCGr2Vpwx7U2hJjgD/EE3J28fSfE
 FeMA==
X-Received: by 2002:a17:902:f64f:b0:223:619e:71da with SMTP id
 d9443c01a7336-23ac4880725mr231075655ad.49.1751334103077; 
 Mon, 30 Jun 2025 18:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpiYoYmCF3g4/jZkavSu3oI/vXqiEC6JONrXqQDvn2Z3VSdMjSQ0/GNzktPRuoIB3Qc7785LONR9oI41koPY=
X-Received: by 2002:a17:902:f64f:b0:223:619e:71da with SMTP id
 d9443c01a7336-23ac4880725mr231075265ad.49.1751334102731; Mon, 30 Jun 2025
 18:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-3-airlied@gmail.com>
 <ca2606e3-ec5a-4fcb-b252-bb00a531c0dd@amd.com>
In-Reply-To: <ca2606e3-ec5a-4fcb-b252-bb00a531c0dd@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 11:41:31 +1000
X-Gm-Features: Ac12FXwDIE0DgaWq_oO1vTg-VN1NqguDBh-Sgj4-otBxOsOamP_bUScH2BnLAss
Message-ID: <CAMwc25pPBzND+oToN2UARSqULunTGWZaDzs9mVRCju-rY6G0ag@mail.gmail.com>
Subject: Re: [PATCH 02/17] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>, Matthew Brost <matthew.brost@intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YghKHW-kWfx2jZuPChbPGsECnrWqxLnawAKsQOrkBC8_1751334103
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

On Mon, Jun 30, 2025 at 8:04=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 30.06.25 06:49, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This uses the newly introduced per-node gpu tracking stats,
> > to track GPU memory allocated via TTM and reclaimable memory in
> > the TTM page pools.
> >
> > These stats will be useful later for system information and
> > later when mem cgroups are integrated.
> >
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: linux-mm@kvack.org
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > ---
> > v2: add reclaim parameters and adjust the right counters.
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 34 ++++++++++++++++++++++++++++------
> >  1 file changed, 28 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index baf27c70a419..11a5777b4a85 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -131,6 +131,16 @@ static struct list_head shrinker_list;
> >  static struct shrinker *mm_shrinker;
> >  static DECLARE_RWSEM(pool_shrink_rwsem);
> >
> > +/* helper to get a current valid node id from a pool */
> > +static int ttm_pool_nid(struct ttm_pool *pool) {
> > +     int nid =3D NUMA_NO_NODE;
> > +     if (pool)
> > +             nid =3D pool->nid;
> > +     if (nid =3D=3D NUMA_NO_NODE)
> > +             nid =3D numa_node_id();
>
> That isn't correct.
>
> The NUMA node in the pool is just a hint where to allocate from, but the =
memory can come from somewhere else as well.
>
> You need to look at the allocated page to figure out to which NUMA node t=
hat belongs.

Indeed, I've killed this from here, using page_to_nid is correct.

This helper is needed later to figure out what nid to ask the list_lru
for pages from, but I've move it forward into that patch locally.

Dave.

