Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2AB43B07
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322310E240;
	Thu,  4 Sep 2025 12:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DesOhI2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AA610E240
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:07:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso3307355e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756987622; x=1757592422; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PLld95qjRcnXUupD3eIzFa+wkQsC9TBTtZNr9c2tK1s=;
 b=DesOhI2bBs5Ez52auRDaCYHhyZmv3ifZoYqKMkGRt6ELTaPqcQgi/HTl20IsStSmiw
 3p1GooZ2rVQ/m7kvkiqy54V0pBOlsU5HaCj4o8xWLyg0gtL0VlZEadNaY81ibAlcEsl7
 y3oZnrhRqkrwp9CADZeRSVyvYO+R5kYx7Nd9+Pe3DFOB7CEB4vTposNGTnog7TCRTaBa
 g8LcY/pJfuuV4qKV8aI6QMixFNZKA5OFbZo2PuES/bBXOtuaJ4GwYrziDpdIH1IyaBFd
 b0D/3M6944dDhzMhYJmwG9snDelJQDKzs7en3WkYRcLIYzSiRoSw9hK3II1zAdnJIWnW
 8LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756987622; x=1757592422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLld95qjRcnXUupD3eIzFa+wkQsC9TBTtZNr9c2tK1s=;
 b=GRtCTyCjXtGwsPv9mcS1op/btsV1y3PoU6TYmyp4c/sGW4kUYjzrsJQCBtvY3nn0ZI
 DhbA7YG1rDWjnTYbJzJz60xfTHb/T7KLUzWoNfp94pWxFwc/WFVN+n20cRu32ZX67RFs
 PZ0G9umlEjFBfXAnvRsiQjXm22rtuI8gznPNk3d/zaCqK0btfsk9aOTnigxOW/Get37S
 5NMV58SFfepuf7d2X+56cHramVX0JNqNDVP+6rJ73rjDeu15RkC/zybGV39mUd8YsPbm
 +sVHyG6m8rFH9034XoVxjTzkk0K4CeC1qt4i2fmIOisQ96kycLygt+iVcyerFmpCr/7E
 MtjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXymSvi3hLe+lzNakE+5GIuLQPZiAtICQewdMrZNC+pozM0862txkXOpFPFIE1jngS4hnhxyTfQA1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzID1OkRnbiEW2GEsomNVuRnMwC1/ikoNdnB2s8EKjQNOkLkFm2
 fNtZiAeLKvDVm2Az69bOav0XFdRI1R5GrC2DPHJ3/1iGGgYnpP1pXl80
X-Gm-Gg: ASbGncvUxfXZ7TFRic+YttoJxsgBOmd4lWr04asDiU9nbwqMvsIRI2ClkBZOu+53Lcp
 htmD9sKrgFnee4L6H2Ib2oJVVA59Oob9L0+PFYJNO4gyi8+Hf/nEH2ZgnKvoNg99dxTfT8oT8hn
 Gy/7xKrUh1obJrSe7RydtK1y24b2oBk3PW+qOX2J8rMSmPw2GXIfGKdTgho+yDgqZwyamtrZ+qy
 os2Nph/nFGwMFUKDi8+xhIjG+OqZJwzlVPjJ62p54DOCaTBNzVckaF0xRsrGvxZ4lBzyo5+8sRd
 K42wC6bOdQsKJlF9zeEPWdxPXl/btYj9Fu0oX4yvVn9yYRsbi0CelLjJz09ZGra6CG1JE6apLGo
 ZdGXs1Co6cOxWlVpPvPaZUaXCi5AEcFSOEEYuRBrUsYuspMIKqBp598qLlEmf2bwuqZcl74OxWI
 iycHJX5zCB
X-Google-Smtp-Source: AGHT+IG59eYhocU/Hh7asCkInZg6kFlAG3r0FLBdaakyF5gvjtdvhWnDUh6z/r89PFN/6r5wlaCujQ==
X-Received: by 2002:adf:a406:0:b0:3e1:7964:2c17 with SMTP id
 ffacd0b85a97d-3e17964361cmr922214f8f.62.1756987622170; 
 Thu, 04 Sep 2025 05:07:02 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3df4fd372c1sm5436504f8f.29.2025.09.04.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 05:07:00 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:06:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Frank van der Linden <fvdl@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Message-ID: <zmsn3bdqj2eclrm3xehnp27u57orqiq74ki2qn6aahpiamp4sn@wgalbnbpzmr4>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <v7zrmrhvemyymq6qamz6wbgzr4cijfe4n76ivwyadmltadlot7@3csy442wfasf>
 <CAPTztWZJqzbR7Y6jE6NM1qQOumYz-ckzSfGDfUcsgMVU7SBb0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dxmjpjrjb5ukagg6"
Content-Disposition: inline
In-Reply-To: <CAPTztWZJqzbR7Y6jE6NM1qQOumYz-ckzSfGDfUcsgMVU7SBb0Q@mail.gmail.com>
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


--dxmjpjrjb5ukagg6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 09:41:18AM -0700, Frank van der Linden wrote:
> On Wed, Sep 3, 2025 at 9:05=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 10:27:01AM -0700, Frank van der Linden wrote:
> > > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > There is no technical reason why there should be a limited number o=
f CMA
> > > > regions, so extract some code into helpers and use them to create e=
xtra
> > > > functions (cma_create() and cma_free()) that allow creating and fre=
eing,
> > > > respectively, CMA regions dynamically at runtime.
> > > >
> > > > Note that these dynamically created CMA areas are treated specially=
 and
> > > > do not contribute to the number of total CMA pages so that this cou=
nt
> > > > still only applies to the fixed number of CMA areas.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  include/linux/cma.h | 16 ++++++++
> > > >  mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-------=
----
> > > >  2 files changed, 83 insertions(+), 22 deletions(-)
> > [...]
> > > I agree that supporting dynamic CMA areas would be good. However, by
> > > doing it like this, these CMA areas are invisible to the rest of the
> > > system. E.g. cma_for_each_area() does not know about them. It seems a
> > > bit inconsistent that there will now be some areas that are globally
> > > known, and some that are not.
> >
> > That was kind of the point of this experiment. When I started on this I
> > ran into the case where I was running out of predefined CMA areas and as
> > I went looking for ways on how to fix this, I realized that there's not
> > much reason to keep a global list of these areas. And even less reason
> > to limit the number of CMA areas to this predefined list. Very little
> > code outside of the core CMA code even uses this.
> >
> > There's one instance of cma_for_each_area() that I don't grok. There's
> > another early MMU fixup for CMA areas in 32-bit ARM that. Other than
> > that there's a few places where the total CMA page count is shown for
> > informational purposes and I don't know how useful that really is
> > because totalcma_pages doesn't really track how many pages are used for
> > CMA, but pages that could potentially be used for CMA.
> >
> > And that's about it.
> >
> > It seems like there are cases where we might really need to globally
> > know about some of these areas, specifically ones that are allocated
> > very early during boot and then used for very specific purposes.
> >
> > However, it seems to me like CMA is more universally useful than just
> > for these cases and I don't see the usefulness of tracking these more
> > generic uses.
> >
> > > I am being somewhat selfish here, as I have some WIP code that needs
> > > the global list :-) But I think the inconsistency is a more general
> > > point than just what I want (and the s390 code does use
> > > cma_for_each_area()). Maybe you could keep maintaining a global
> > > structure containing all areas?
> >
> > If it's really useful to be able to access all CMA areas, then we could
> > easily just add them all to a global linked list upon activation (we may
> > still want/need to keep the predefined list around for all those early
> > allocation cases). That way we'd get the best of both worlds.
> >
> > > What do you think are the chances of running out of the global count
> > > of areas?
> >
> > Well, I did run out of CMA areas during the early VPR testing because I
> > was initially testing with 16 areas and a different allocation scheme
> > that turned out to cause too many resizes in common cases.
> >
> > However, given that the default is 8 on normal systems (20 on NUMA) and
> > is configurable, it means that even with restricting this to 4 for VPR
> > doesn't always guarantee that all 4 are available. Again, yes, we could
> > keep bumping that number, but why not turn this into something a bit
> > more robust where nobody has to know or care about how many there are?
> >
> > > Also, you say that "these are treated specially and do not contribute
> > > to the number of total CMA pages". But, if I'm reading this right, you
> > > do call cma_activate_area(), which will do
> > > init_cma_reserved_pageblock() for each pageblock in it. Which adjusts
> > > the CMA counters for the zone they are in. But your change does not
> > > adjust totalcma_pages for dynamically created areas. That seems
> > > inconsistent, too.
> >
> > I was referring to just totalcma_pages that isn't impacted by these
> > dynamically allocated regions. This is, again, because I don't see why
> > that information would be useful. It's a fairly easy change to update
> > that value, so if people prefer that, I can add that.
> >
> > I don't see an immediate connection between totalcma_pages and
> > init_cma_reserved_pageblock(). I thought the latter was primarily useful
> > for making sure that the CMA pages can be migrated, which is still
> > critical for this use-case.
>=20
> My comment was about statistics, they would be inconsistent after your
> change. E.g. currently, totalcma_pages is equal to the sum of CMA
> pages in each zone. But that would no longer be true, and applications
> / administrators looking at those statistics might see the
> inconsistency (between meminfo and vmstat) and wonder what's going on.
> It seems best to keep those numbers in sync.
>=20
> In general, I think it's fine to support dynamic allocation, and I
> agree with your arguments that it doesn't seem right to set the number
> of CMA areas via a config option. I would just like there to be a
> canonical way to find all CMA areas.

Okay, so judging by your and David's feedback, it sounds like I should
add a bit of code to track dynamically allocated areas within a global
list, along with the existing predefined regions and keep totalcma_pages
updated so that the global view is consistent.

I'll look into that. Thanks for the feedback.

Thierry

--dxmjpjrjb5ukagg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5gOIACgkQ3SOs138+
s6HoXw//XNrWJmAMVCgR+fCzlx0zoU4zdXoaxEp6EQWJKYjG//X6xi10kqOs2jVR
uu5knOytKBYAZxrbGlElM3YDTUvN62voCXi2dgvDZ53e0xVNnz+JbhGvA4FRpqU4
57ax3pJqEz4nWK7WnYrovlUSwMEPyzXb8KiRydUchOAr/QQfaCQKP1+HUgjsNsi0
0JgzT2LrmkZJvzpYS1gK7Kyb7hnGh620lWwILWeiB8Y9XvtuktdxcuTqvt3hp3TF
d8WHkQgF591iqMllbP1UFBd4zh852n3wuS/NutP4F2xH87BvkL+Az3uo4oAkqRW5
ihpe1fdjufRrSa8j4he62obtU3HQUFzXH+1nktOYrN+NGtqvRm6FJGjbg9MgAN+J
NeEn2yAIbCOT7Xhv/tAPSlB86nJVG3mmbWkfzVQhMdkeQrrTOkE7WHVH8YsDKF0x
fEnOR+NpJ5NAe74DupV116N6YvFBd7Za9uHVPW4Xue+vqShxRl0H3/mIpmZg0JHf
La8GRnYptVZoHP7YncT7rIFLmvBwf98uE+jUpHPrYbnrvBoXzECCg9higjZ/6faY
X+rx5NUc6BRVTVncIvdiKwTR/g/F/9fFBAlDx3ie4MEJgtL6yvEIuCyw58N3X/uu
UZmj3uvPk4sZILsIZO7+65qLprdN/o+T1UBAL8aWUo7bSNflcKw=
=jDv8
-----END PGP SIGNATURE-----

--dxmjpjrjb5ukagg6--
