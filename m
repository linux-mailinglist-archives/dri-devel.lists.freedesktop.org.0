Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8CCCF5B5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D4A10EDA5;
	Fri, 19 Dec 2025 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XY0E51TM";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PEq5nfws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114ED10EDA5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766139951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
 b=XY0E51TM52om5sttWahtQqSsOzXtJz8LFQssXjIM79ZQVWEy93/QgiftO1peyhRx3ESioK
 PHZ/d8de3cEYX6Z9qju3PR1wGIIjVwu7g7jl5ZhYTOPa8FSWQGARo/lGCEMbigsUOis3VH
 BxIUgbW2dEtH3dDerpUyqvBxOtCvN0k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-Wvofnfc7NTK6yOnsCcu8qw-1; Fri, 19 Dec 2025 05:25:47 -0500
X-MC-Unique: Wvofnfc7NTK6yOnsCcu8qw-1
X-Mimecast-MFC-AGG-ID: Wvofnfc7NTK6yOnsCcu8qw_1766139946
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779b3749a8so11666895e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1766139946; x=1766744746; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
 b=PEq5nfwsLpVRAyuxjfM5lYPEhzYJLK5FbfZS8D32REjwAJVdNgeHZe+o1//yf4Dl+j
 mg+lzkkmnOzOBWnvsMoLsc8enZ8ikzjkhH4G4eAX70qKvapXbot0UaFSrztWEfQMieRm
 MyuhbM4J5Kj2mBAuBOZT2g8FqlTtddZb2QRSpzsQCVIodkaQyQHlP6S5m3myPwc1sL0e
 pF0bmWTOm+3OKQQBt1n2l5YjnMA7KAwnHa9zL0n1mkwsnB0+W7gHtRM7exxEQI2HNWh2
 60ZiwIWhIHltqb9YUCAQv/KMWr4xFSAEvw9OYk83NwIwWjKnyTL8sOoGlbMAhYToooZM
 nW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766139946; x=1766744746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjDiJjB7C2v1UtJ+RkaYpL+6MQ9Nkb3DziS0e1v2t2k=;
 b=iOcwsvdNciE0svx+moBe3XVNKWT6zOzKvq+O0DYiaDyzd13mPl3pkoSTEFZh1TQBeN
 LT5VmeLy4tBcneX5R/ZaUjg7hRkaGWfdzzvCRcl5klWHB/WC/0BTHjVbayBud0M1ntRI
 tTxIQx8IP9Bxz/FDOYuc3YkZ7cY/4pOutN9Yen6cir2QTc/b7H2NOX+Xxpj3KSEqyFoa
 xE3+iqAQXGguq+3jO5hxc9aHQCJhyiCvxtTUODGcvGZOaN2n1D+XCONkQ8RWyP0GZwNZ
 VS7CD9McHiWQDFPJaUez7eJUghXxRrI+rY2WzYv4sKFnzGtPEVVIhr4/etvmn/tV4Dii
 /k9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdpKryrjxlnIZQduOi8DzZB+GHI9PkqQW2HKb3xLt+tmkzg+bwl87I9NIIzPwWjFlRl+yRELx8A2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjsgPxX8fIWAd0DStIV4u8EQN3RH3tZykuA6nGQoG6OT1GJfvg
 lLJiMQZXIzqhgTOk1z83NOFrR1spANHPiCDRDGQ1lTgHgT9ekqOoaiR++H2SZaG9rUa6xcSdIRX
 /OZUrJsVNCNL4odYmqAGy+F4RmZWl3+tf/+Qi1/IIYvB8dClpUPmN3h/Ms0m3ZnetmJvgkw==
X-Gm-Gg: AY/fxX4JwowE/Lltkil9aBS44sxCzhonxp92C/WXdXzKgrMVnuawLEl33cSr0M1yBBb
 uDk76g1GkCEgd45mKbXF7h1eNxUktwKdTSa0w2RxyrHL7zrCf5ci4kLzFv18yr5Blm18mmCBM3p
 DLj8pFN3qrke/BlbLov9g632ZT62tbmBC9DhJdjn/LYJD/P9+Q/9WMhzvJjI+eIKiKaqOSvR1VQ
 arv/+bYW5sQhToF3KjUdIwq4av8wqQ2YmiONpptGeL1O+SZJO47dRJ1+Fyal6iCPMn5QRuKeWRW
 c2/LtfGTwhq8cQudedc4Yb2ITwi0MrCZNCG4/LKJ7L8EwrbFL8XfyME9bHUeTg==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-47d1958958dmr21132325e9.28.1766139945702; 
 Fri, 19 Dec 2025 02:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFagDmA6mPBXBEAFzxJYNGFzP2GgCwlY1oy9ixI0iy9zInEz22wLjFWwqDhC49txteMc6NoXg==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id
 5b1f17b1804b1-47d1958958dmr21131995e9.28.1766139945121; 
 Fri, 19 Dec 2025 02:25:45 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4e91sm37190635e9.13.2025.12.19.02.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:25:44 -0800 (PST)
Date: Fri, 19 Dec 2025 11:25:43 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
 Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
Message-ID: <20251219-large-daffy-monkey-74665d@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5d5u624ftgk7q5qf"
Content-Disposition: inline
In-Reply-To: <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
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


--5d5u624ftgk7q5qf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Mon, Dec 15, 2025 at 03:53:22PM +0100, Christian K=C3=B6nig wrote:
> On 12/15/25 14:59, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> >> On 12/15/25 11:51, Maxime Ripard wrote:
> >>> Hi TJ,
> >>>
> >>> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >>>> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redh=
at.com> wrote:
> >>>>>
> >>>>> The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> >>>>> allocator. However, these allocations are not accounted for in memc=
g,
> >>>>> allowing processes to escape limits that may be configured.
> >>>>>
> >>>>> Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> >>>>
> >>>> We had a discussion just last night in the MM track at LPC about how
> >>>> shared memory accounted in memcg is pretty broken. Without a way to
> >>>> identify (and possibly transfer) ownership of a shared buffer, this
> >>>> makes the accounting of shared memory, and zombie memcg problems
> >>>> worse. :\
> >>>
> >>> Are there notes or a report from that discussion anywhere?
> >>>
> >>> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> >>> the moment and that's definitely broken. Any application can bypass i=
ts
> >>> cgroups limits trivially, and that's a pretty big hole in the system.
> >>
> >> Well, that is just the tip of the iceberg.
> >>
> >> Pretty much all driver interfaces doesn't account to memcg at the
> >> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> >> V4L2.
> >=20
> > Yes, I know, and step 1 of the plan we discussed earlier this year is to
> > fix the heaps.
> >=20
> >>> The shared ownership is indeed broken, but it's not more or less brok=
en
> >>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>
> >>> So we really improve the common case, but only make the "advanced"
> >>> slightly more broken than it already is.
> >>>
> >>> Would you disagree?
> >>
> >> I strongly disagree. As far as I can see there is a huge chance we
> >> break existing use cases with that.
> >=20
> > Which ones? And what about the ones that are already broken?
>=20
> Well everybody that expects that driver resources are *not* accounted to =
memcg.

Which is a thing only because these buffers have never been accounted
for in the first place. So I guess the conclusion is that we shouldn't
even try to do memory accounting, because someone somewhere might not
expect that one of its application would take too much RAM in the
system?

> >> There has been some work on TTM by Dave but I still haven't found time
> >> to wrap my head around all possible side effects such a change can
> >> have.
> >>
> >> The fundamental problem is that neither memcg nor the classic resource
> >> tracking (e.g. the OOM killer) has a good understanding of shared
> >> resources.
> >=20
> > And yet heap allocations don't necessarily have to be shared. But they
> > all have to be allocated.
> >=20
> >> For example you can use memfd to basically kill any process in the
> >> system because the OOM killer can't identify the process which holds
> >> the reference to the memory in question. And that is a *MUCH* bigger
> >> problem than just inaccurate memcg accounting.
> >=20
> > When you frame it like that, sure. Also, you can use the system heap to
> > DoS any process in the system. I'm not saying that what you're concerned
> > about isn't an issue, but let's not brush off other people legitimate
> > issues as well.
>=20
> Completely agree, but we should prioritize.
>=20
> That driver allocated memory is not memcg accounted is actually uAPI,
> e.g. that is not something which can easily change.
>=20
> While fixing the OOM killer looks perfectly doable and will then most
> likely also show a better path how to fix the memcg accounting.

I don't necessarily disagree, but we don't necessarily have the same
priorities either. Your use-cases are probably quite different from
mine, and that's ok. But that's precisely why all these discussions
should be made on the ML when possible, or at least have some notes when
a discussion has happened at a conference or something.

So far, my whole experience with this topic, despite being the only one
(afaik) sending patches about this for the last 1.5y, is that everytime
some work on this is done the answer is "oh but you shouldn't have
worked on it because we completely changed our mind", and that's pretty
frustrating.

Maxime

--5d5u624ftgk7q5qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUoJwAKCRAnX84Zoj2+
dj4lAX0Yy0is1eVfn9GJZ8tPnOe91CbMkIdAor1dgBxh5RGL/e9IAXnnFFQzaX12
w2/x3FEBfA/Q0bKegplzRU4jhv1EueYV2Vj5bqPF2sIKW/Eff7kOIT0+y8L+DyLg
WOULpERarw==
=8moi
-----END PGP SIGNATURE-----

--5d5u624ftgk7q5qf--

