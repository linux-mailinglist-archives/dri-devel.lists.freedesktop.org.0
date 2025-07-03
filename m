Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D5AF6859
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 04:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6034510E110;
	Thu,  3 Jul 2025 02:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iSMvU6Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2330610E110
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 02:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751511239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WjOSSzl9i5hwKcEFLqL2mkoftabsoi7XWLQ81Rdfaw=;
 b=iSMvU6Wxs1HFSLWTdeBW0ECmBHRs0VbrxEsgD4AhgJRVfRJgo0WmpPTgMV80alIEOEnwaZ
 KML8PjEOVKnoSrqzUTFnMw3gT2HmcZCnENgcAJSWLVc2fEI1jP2hzqcmMOhjsOHa6uI5Z1
 jcDqMOoIwxEgELzmLZ4e62wJK2o29rY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-0HCMpyaVNRGmBRrSpCNjMA-1; Wed, 02 Jul 2025 22:53:57 -0400
X-MC-Unique: 0HCMpyaVNRGmBRrSpCNjMA-1
X-Mimecast-MFC-AGG-ID: 0HCMpyaVNRGmBRrSpCNjMA_1751511236
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so7875979a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 19:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751511236; x=1752116036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WjOSSzl9i5hwKcEFLqL2mkoftabsoi7XWLQ81Rdfaw=;
 b=gqCwHCOvHT9bzxx8lCrcFdVn/i2vak+Cgh0z2YfrsIbwrtwbcNqD/MPogYBWVHowt7
 8jNMPzbVypWjLxM/nPmMOokLrm+pzfceetwspkwICAPfK9XVqbTcdQOMi04y5x6c5ZUS
 +CsU4/I2E0djkoYkCgATECIG9aOtKJRXcam3aymYz3nwaaz4+v5E0MDHnKqVMoUaI0Lu
 GEtS7WzT3CTq47jkT5uujo4B18X8+FW1/4U5I6P2Bi9WdBIcJYS+s9nThtxoE188f+Hv
 QFCc9paDGNA0F71SBoxUTUodfAcPykO18ska5bQz5dMN7hWAXKRHQg2OtR3HmrxnIAHV
 BrrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+R+CmYIue3oeQ20r415oIv47me+tiF53dDOfpsc5dj+suLY3lCGYnpr7wNec1KPBDj3uN/5XD38k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrxg7QDs2CCq6w8543MX8HH44HGwUJcSrM6ucKLz18kKsLmxs5
 g6Qy5EjH0lc7QWdbX0nX5tjSpKrzYNG4Z/FHPcRyuOeXlqM0Fl+NW98AqFFaLa7lHhEHo1/S2Bo
 /PK6Hb87eDVNO41vX9dOk3DR3swuHVTqMSLq3mZLv4gQXsPxxFY7gFr4tO8716F3l2djUWgN6pE
 VXZDCd3XXDYNgCPjZSH2WXx1YwAowWyQk5NUptHlcj4OAh
X-Gm-Gg: ASbGnctbCQy0MTaL+hR24NyZAdEfXzSEjSUDVTZYzDgOl1oXDzrpBU3MiESFBftgBuy
 2tyQAtcoH77GAhheynPQMEc6XpGnh2yXECMqjlkv1DULFFiYswgrvoVZGSwk9IFkhYYl+Mk386T
 +mbQ==
X-Received: by 2002:a17:90b:544f:b0:311:a314:c2ca with SMTP id
 98e67ed59e1d1-31a90b112eamr6468307a91.6.1751511236050; 
 Wed, 02 Jul 2025 19:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ0Xb9fVsUanKrj9SJ4vz5CwsHLm4J8mEWNpGvRrcL91HtgZSgYiDwJaegQOLaUORsw+a8ntTg9xrcftHWllI=
X-Received: by 2002:a17:90b:544f:b0:311:a314:c2ca with SMTP id
 98e67ed59e1d1-31a90b112eamr6468284a91.6.1751511235652; Wed, 02 Jul 2025
 19:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
In-Reply-To: <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
From: David Airlie <airlied@redhat.com>
Date: Thu, 3 Jul 2025 12:53:44 +1000
X-Gm-Features: Ac12FXzoyceVxp-9CmDA-WGGbRF72A_pItim0nylHqazTjwRzjAE3R0S457FDxU
Message-ID: <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cCbDbt9xx_u77fuzefMAKHUxfhnxexnxQ6FA2BcveU4_1751511236
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

On Thu, Jul 3, 2025 at 2:03=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.dev=
> wrote:
>
> On Mon, Jun 30, 2025 at 02:49:36PM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This adds support for adding a obj cgroup to a buffer object,
> > and passing in the placement flags to make sure it's accounted
> > properly.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
> >  4 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index e5e33a68d935..d250183bab03 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -198,6 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_o=
bject *gobj)
> >       struct amdgpu_bo *aobj =3D gem_to_amdgpu_bo(gobj);
> >
> >       amdgpu_hmm_unregister(aobj);
> > +     obj_cgroup_put(aobj->tbo.objcg);
> >       ttm_bo_put(&aobj->tbo);
> >  }
> >
> > @@ -225,6 +226,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *=
adev, unsigned long size,
> >       bp.domain =3D initial_domain;
> >       bp.bo_ptr_size =3D sizeof(struct amdgpu_bo);
> >       bp.xcp_id_plus1 =3D xcp_id_plus1;
> > +     bp.objcg =3D get_obj_cgroup_from_current();
>
> In what context this function is called? Is that the same for
> ttm_pool_alloc_page()? Is remote charging happening in
> ttm_pool_alloc_page()?
>

No, this function is called from userspace ioctl paths that allocate
GPU objects (GEM objects).

The objects are lazily allocated, so this might not trigger any pages
being bound to the object, until it is populated, either via mapping +
page faults or by being used in a GPU command submission, which is
when the ttm_pool_alloc_page happens.

Dave.

