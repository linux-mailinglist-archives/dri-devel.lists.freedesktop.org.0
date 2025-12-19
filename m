Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432DCD0A91
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310E10EDA3;
	Fri, 19 Dec 2025 15:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H9VKfjuJ";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mu3cFEED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3454C10EDA3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766159943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
 b=H9VKfjuJT7xTqp8ZjSQBSxnRbYYyNIpsYsirggZx97RwCWpFgAsz9gvMcHiejxuWyZAOTe
 gG1DXGygvOgOhSG4UAMWZHvk4+b7HMXgzxdg6D7/UGMsFNjS6Q1V4Gwa2cQB4XgpTUpzNH
 WFFDs2XPLx/uP4JwtaPcoQOx0oacLKs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-DGzRxhJ5P3OIQz9Or3klOg-1; Fri, 19 Dec 2025 10:59:01 -0500
X-MC-Unique: DGzRxhJ5P3OIQz9Or3klOg-1
X-Mimecast-MFC-AGG-ID: DGzRxhJ5P3OIQz9Or3klOg_1766159940
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47918084ac1so15402985e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1766159940; x=1766764740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
 b=Mu3cFEED4y1hbtonVvYmWL/KozJ3pdlK9TWwqf3vQu1Ib7+3DoTucfyu5eZW0EqzDA
 pQyO0TUJPAyBF+yVIu93fGywWaCPAfhcHSS87NWIn5RDpD6TJvRoIH31TaZsJy4zng42
 TE4cpuohri6AroiVwfJLDddcctHncZFEhn2GxJUe63e2yBzFF9/nFqxJmc+0MEhdiZMI
 DPtRIn/Je3iCM/d24S7uoKqKkzTPWPMNVO7EA5uqkRrOa/UH2MA4YSQ+78VrPelPmZpG
 iuRTCyVCDfahHGcK/4Rrl01T7POueY+p4aqIbekk8JKBx6MECR2Jr1Pa26fkFdjKGxOG
 OOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766159940; x=1766764740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NuVKMRCOXiL/q8JSNbJx7Vrep0Xak1sDKET9rwhN+f4=;
 b=U8RVesWroiyTw4Ag7PXExP1PWNoWP+dW1qC0+CqRydf+tRDxmuT6/b4lLdiUhVKY5S
 sg2D8Qrnhm60ReeeXdWOSEDIDkcOje1zpy7n+sr+Dfx3Dbb8rzVRwbHQsfC0EqEWnuFh
 yV+nNsNR1uPR3APpwGC19zgFBfG8H5UOOw9pdk3nm/GPRCz3akWcU4ddPjmFjxoLQDaw
 W1oRR8ApvbaL3ET7aJkXmgh/7hfkD3plXLw1d9cVtgKC33rJQh7RQuG4ot3J0eCXk/9u
 kBFOc4N40eDXB+oOxLsQOpXSarV2aOQ23mtqpKbxgbO6Pl6Dioh/wrcM/LsWwKMJTCYB
 WKVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS1H5IzqbeO8QbLAf+iozcseFd8GnkI2SMk7G/FTeNxjVYkxlFNAP5K7qCZ/9uW/uAFCAoT+wnato=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw5Z3QB3V5L/BpAN+iaHAsodHiGCkOQ4kEH274HJRDZQUFn8D0
 AtHneMA9dwJMB4s5nf6Nykkf52WRgc/b9IB2zBL2adr/pWDtB+p+U4FEx5T+N2qBTdwxMzl/SK7
 M5y5a/dGwAFIPJfll/IY1DDU2FHR28GLYeKPNd4iz2XSSAC/Pm4byWj9FB1g82YxqhWfPrg==
X-Gm-Gg: AY/fxX7KRgwt1TY8x5OuGXapcWDy8BKe+C5a6Oc7y0IruU9noNAoYdtccDlXqVsy4xI
 nsK5pBDmg0nrVPoR+wn0si5fPI2bED9zhmBgN3yVQTAy33bBg6cDwS54BQpOxIZkPe4yB/XQd/w
 sy143VwFkKppplF+q+ynSkJQpq5bPe6PUX9e3CwjB2URxwp0MWgwF6aJa/hX/WFxRjxYPbsSbdp
 /jWz7x4bRFOuWVHKmYJr40NfIrlTcOwGjAx8AW7cmSsDT155XqDZNxv9Onukx5gbYRlI1BwVmnj
 3LI5OFJgrVn6AKZIOzKk8BDk+5QHSjj+3Hg5YNvB5mXZz+Z4EFfDNNCetjmwVw==
X-Received: by 2002:a05:600c:8710:b0:475:da13:2568 with SMTP id
 5b1f17b1804b1-47d19592102mr31215175e9.25.1766159940205; 
 Fri, 19 Dec 2025 07:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz4saKUE5xlJBqdu6Gk7rmDOjerDoiXpYwJNHDHvTSpuZXU0uy6ESaJF6LqfbEUnkQVRXGsw==
X-Received: by 2002:a05:600c:8710:b0:475:da13:2568 with SMTP id
 5b1f17b1804b1-47d19592102mr31214855e9.25.1766159939720; 
 Fri, 19 Dec 2025 07:58:59 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d192e88f5sm49165545e9.0.2025.12.19.07.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 07:58:59 -0800 (PST)
Date: Fri, 19 Dec 2025 16:58:58 +0100
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
Message-ID: <20251219-cuddly-platinum-cormorant-ae6d0e@houat>
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
 <20251219-large-daffy-monkey-74665d@houat>
 <5eda1755-865c-4bb0-a1a0-a4e6dac5388c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="62gvz4x3u7aurz3v"
Content-Disposition: inline
In-Reply-To: <5eda1755-865c-4bb0-a1a0-a4e6dac5388c@amd.com>
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


--62gvz4x3u7aurz3v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 02:50:50PM +0100, Christian K=F6nig wrote:
> On 12/19/25 11:25, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 03:53:22PM +0100, Christian K=F6nig wrote:
> >> On 12/15/25 14:59, Maxime Ripard wrote:
> ...
> >>>>> The shared ownership is indeed broken, but it's not more or less br=
oken
> >>>>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>>>
> >>>>> So we really improve the common case, but only make the "advanced"
> >>>>> slightly more broken than it already is.
> >>>>>
> >>>>> Would you disagree?
> >>>>
> >>>> I strongly disagree. As far as I can see there is a huge chance we
> >>>> break existing use cases with that.
> >>>
> >>> Which ones? And what about the ones that are already broken?
> >>
> >> Well everybody that expects that driver resources are *not* accounted =
to memcg.
> >=20
> > Which is a thing only because these buffers have never been accounted
> > for in the first place.
>=20
> Yeah, completely agree. By not accounting it for such a long time we
> ended up with people depending on this behavior.
>=20
> Not nice, but that's what it is.
>=20
> > So I guess the conclusion is that we shouldn't
> > even try to do memory accounting, because someone somewhere might not
> > expect that one of its application would take too much RAM in the
> > system?
>=20
> Well we do need some kind of solution to the problem. Either having
> some setting where you say "This memcg limit is inclusive/exclusive
> device driver allocated memory" or have a completely separate limit
> for device driver allocated memory.

A device driver memory specific limit sounds like a good idea because it
would make it easier to bridge the gap with dmem.

Happy holidays,
Maxime

--62gvz4x3u7aurz3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUV2PQAKCRAnX84Zoj2+
doBbAYCwC6GM+nDbVQ+qPSj3EG6TPcebfy5+uYyIL8SOICJl/3ohBlkB/AN0k0qs
+sZn+aYBewZWQxkmfc2iSOFLjm35fV4hD2oDDGu74kWLPPrJefPelEf0OooFJoux
CX9E84nf8Q==
=seo3
-----END PGP SIGNATURE-----

--62gvz4x3u7aurz3v--

