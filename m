Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBEB00655
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0583E10E8F5;
	Thu, 10 Jul 2025 15:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kreqCLEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4710E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 15:21:05 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id
 6a1803df08f44-70478ba562aso25034746d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752160865; x=1752765665;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xKpf3SbAmWkt5VJofJn48qdY/118qeqD5HjzAhisH5k=;
 b=kreqCLExuD1uiJ0UPKhHSR1a/N33/w7HrBsVa9e9PRW+896HoLuwWU1m45iOVlFP9h
 Bs5FeWzyeKI/bFUI+MhZdqEc7Fc0OVldL2bvMdnXFI+hlaI1a8qV3yu3FNRXF+Own9UW
 YVYAfysV6fa1JErsgkR8xH3LDk0aTdALx9ZVinFq2jU1Uu/CvCSKFPkUDyp6xs8uNXds
 Bi1oUGb8ubfacDQwdmv8MqBMqJfDd6kwedEs0mh2erbUlS5JCDuCeusI1WYSTnSNiO56
 c3mdrjztM6u24NH5AMLXkUvUUjf4ROvwSdLn7n7KsJb60tOl3QqZjG/8kILlMzF8+4JC
 nNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752160865; x=1752765665;
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKpf3SbAmWkt5VJofJn48qdY/118qeqD5HjzAhisH5k=;
 b=oQ4fcGj9DOmJ4lp/KghuIFjUtmc7Bj/UXVQG3wM21/sQAhsuI4T1qQQHrV45C9Ull+
 sxurKdYC3JZeNY5cfFvtwjkhUkaEfRGWdlKLX90XX/a1GNRsOONEn7p3z02n5TPglsZ9
 WXFJwbJ9haKb2drtEZipdTn57Jw5SENvIgDMw+839paQW+asEzuVh1r5rdlT2sfHIPXa
 rQ6e0SdwoNbSGH9Zzse4n6++OUYDwbnNdnjsEAovupluKbzzklBaUxRs+tbfHx9Oybfd
 D7BWTMYtQ9bnvylzPmSDLLrfd2VyvJ+CKRIwq3EuP1RKiMpPvQamDP7lX1SNUI7dWNHl
 UHRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKk882h5mmQJees4RTOfvMIqbyCJvAkNe2wJG4Xvh1YBiZnctoqea/S6Lnduy31VZp8wVE4rD6xwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnxXP3O8NED2K1bMgP8DrYi0kOIBAl2hNes9GqoBzFFm1kfAKR
 swUDB+IpAj4oTzmzM8dNejEItZ8Z6P0WmcSFxFGuA+nTuSf4CWd93s78SzTgSjbkP/s=
X-Gm-Gg: ASbGncsfpcfmlsVcEM9wteyBYFMc5EP9iJMhBndtpz/CeVCQG0V2MSpjwD+WEd3VV5z
 Mx8e12eOkyUDS590NKtiX7ULVV2mw5fUgC55efTYO7+B512VJNk7xS/URmH261PgE2i8h/BiBJH
 8VU4Ow3EEPc1B+6M22G5he9l9EkFDRThSnzWx5q8lZY03dNM10rjSuEk0E1CjzygueRxPsuRA2q
 mTjYoPQWdMuKcb5938A+rXgxSOld8yu7oAIb/Bo7V5L5zwgHRCDGKWbgMXGSnKehsYVXk0z2yFi
 jSE4sVwz9583l0Jx26ASHiZVp3Mj47Wlk4FE36TepOSApOG5Gp4/4nRS3uDCMElTjEs=
X-Google-Smtp-Source: AGHT+IH0uA7EbnPkACvyJEVJCpbYJKsf0sky4Js9sJlbaC40zioZfAIyIXsCJGWIghdll3hzxEsL/w==
X-Received: by 2002:a05:6214:4e14:b0:6fa:a5c9:2ee7 with SMTP id
 6a1803df08f44-70495a1fe12mr51088666d6.8.1752160864846; 
 Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7049799e407sm9536186d6.23.2025.07.10.08.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:21:04 -0700 (PDT)
Message-ID: <78c981eb7fafe864bea60c662ba5b474fbd44669.camel@ndufresne.ca>
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey	 <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier"	 <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy	
 <robin.murphy@arm.com>, Andrew Davis <afd@ti.com>, Jared Kangas	
 <jkangas@redhat.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Date: Thu, 10 Jul 2025 11:21:02 -0400
In-Reply-To: <20250709-spotted-ancient-oriole-c8bcd1@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>
 <20250709-spotted-ancient-oriole-c8bcd1@houat>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0srW01EuwsYGDYpmIBS/"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
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


--=-0srW01EuwsYGDYpmIBS/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 09 juillet 2025 =C3=A0 15:38 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > Will there be a generic way to find out which driver/device this carveo=
ut
> > belongs to ? In V4L2, only complex cameras have userspace drivers,
> > everything
> > else is generic code.
>=20
> I believe it's a separate discussion, but the current stance is that the
> heap name is enough to identify in a platform-specific way where you
> allocate from. I've worked on documenting what a good name is so
> userspace can pick it up more easily here:
>=20
> https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174cd=
bf@kernel.org
>=20
> But it's not really what you expected

=46rom a dma-heap API, the naming rules seems necessary, but suggesting gener=
ic
code to use "grep" style of search to match a heap is extremely fragile. Th=
e
documentation you propose is (intentionally?) vague. For me, the naming is =
more
like giving proper names to your function calls do devs can make sense out =
of
it.

Stepping back a little, we already opened the door for in-driver use of hea=
ps.
So perhaps the way forward is to have V4L2 drivers utilize heaps from insid=
e the
kernel. Once driver are fully ported, additional APIs could be added so tha=
t
userspace can read which heap(s) is going to be used for the active
configuration, and which other heaps are known usable (enumerate them). The=
re is
no need to add properties in that context, since these will derives from th=
e
driver configuration you picked. If you told you driver you doing secure me=
mory
playback, the driver will filter-out what can't be used.

Examples out there often express simplified view of the problem. Your ECC v=
ideo
playback case is a good one. Let's say you have performance issue in both
decoder and display due to ECC. You may think that you just allocate from a=
 non-
ECC heap, import these into the decoder, and once filled, import these into=
 the
display driver and you won.

But in reality, your display buffer might not be the reference buffers, and=
 most
of the memory bandwidth in a modern decoder goes into reading reference fra=
mes
and the attached metadata (the later which may or may not be in the same
allocation block).

Even once the reference frames get exposed to userspace (which is a long te=
rm
goal), there will still be couple of buffers that just simply don't fit and=
 must
be kept hidden inside the driver.

My general conclusion is that once these heap exists, and that we guarantee
platform specific unique names, we should probably build on top. Both users=
pace
and driver become consumers of the heap. And for the case where the platfor=
m-
specific knowledge lives inside the kernel, then heaps are selected by the
kernel. Also, very little per-driver duplication will be needed, since 90% =
of
the V4L2 driver share the allocator implementation.

Does that makes any sense to anyone ?

Nicolas


--=-0srW01EuwsYGDYpmIBS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG/aXgAKCRDZQZRRKWBy
9DlHAP9fTMIloahiN5XMBZnBB4aGkZUXdygAalNGlj6RFJZc3AD/RAhlPPmyBaVt
ZDKBRjZVW40OnGDxhAYZePpjsIkSPw4=
=uaX4
-----END PGP SIGNATURE-----

--=-0srW01EuwsYGDYpmIBS/--
