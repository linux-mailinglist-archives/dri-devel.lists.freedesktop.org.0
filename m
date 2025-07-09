Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B8AFE9B1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E58510E7E5;
	Wed,  9 Jul 2025 13:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Bk10fUJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5C10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:10:06 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id
 6a1803df08f44-6facf4d8ea8so45624536d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1752066605; x=1752671405;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZAGKhcIUqrN7+rHf/oU7IFgaAgelruhHD2QUrT9iidM=;
 b=Bk10fUJH2QZPYi+vf65ClifDEnTQCqN9F1eASOjfYYq+2bwZ7XR4SISWlbudNWR+o+
 5Q94sYeNE9ZJZMzPhM9sAqDS7Ds851XuAldfzuRsJnqVbeNHvXuw1Ev2KP4eHvIiIKrg
 Z11z2/5OWRTUs06/+uzpSIPvlF3jW5OYAjTyY71TGOGM5z7ST9wYga8k6558uFYGlAKP
 fv20HrvX8Bcnp5ou0FfQCsTqhzYgu2whoMNSpEPfR4qJh8WXLklHSI7RLw/54gR3xxAX
 DRUbfB6Ljrxw33jxeWYe97bMlDvVnaNcv9NWLKHCY7E0wyy/Fh5hleiAbcbLdYXJjDUA
 pR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752066605; x=1752671405;
 h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
 :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAGKhcIUqrN7+rHf/oU7IFgaAgelruhHD2QUrT9iidM=;
 b=I4T6oRDM8vuEfVs1vjQtj9leMvi/fYBpctFqHf+BcO5DPnQ3v3S/6+2SsGgaTVIVMz
 MBXMmNxdc7purJiyXGQkehffrrvB3ienGE+kPrm/p6kLpe1Apbg3YfU7Lafx3ZHa3gXF
 vQX8vjT/wsEY8WpQAt7+zYQG2CHkpXID9KuUGtE8hiOEBjwLEP5lzgPm1tyXr3o/un9p
 thDQMwGMyCIPg5fVwwO+XOi48ZlDzXQwMLCSB9u+34IN4iCBP8Sb5L4Ql6HoKPncRPUW
 oaGdBRhya4qSBlesV2SKK2MtrWjC9ijakAyDnqNeEOXjBw/HKkpJs90gxGuqno9H2OQ/
 xTkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAvYj1XFcRYzyBEYq0O1vTPd1ExkjjXKtFWAEaXZaidPH8uS62orZrKVBh++KagOnqntzkp3cV+NY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVSTIKk65bpT7Uzq+45iSZxqingjpqDV0pQE5LlX10OuW4s0TB
 9mr0jm0wp9mbUZFxyWOnSYwATPAaizA3clSU9/uO4ZRE73+Px9hSSP+YzSrUbzzmJbc=
X-Gm-Gg: ASbGncvh6sbpTLcvqKTabZYJnD+IeJXlSKLm91Liw1Vg6dSlUD9SqX2D7iNMXWsfcIr
 ofDCY4upldRpNjB5AKK+7Ovq7Uq+eqKPLeu1LbUYnU50dVpBWeOfQJ/SmbNVcnCxJYtF+bO5ogr
 0N4xMS/tMFPXrB95QWhcbGmnEfyaF2I60yp4LT1MVCQ2DFGOJboNX4kRcaMqmhZWYF+G68O51yp
 lLh7PrMfkbzqcQYrok+RAMGf+m9ak7f5W59GAn2jhDwxQqR9J55HLdxAfHwcVhK3/xA3r0CXTQv
 19XW08inQxuk9auom9CLw5qcx3jyuCcarsOBjSh9nxwUXIZal0uU4UlkiF7E4atx+J8=
X-Google-Smtp-Source: AGHT+IGIuCHqZKNodo56olakSu8x5uw0f2xLhJJZfSNQfbpUkgQ6IrbD1NkWCR45DMziT4jJFNtuYg==
X-Received: by 2002:a05:6214:590a:b0:702:d9d7:b6e2 with SMTP id
 6a1803df08f44-7048b9b4b63mr37884916d6.34.1752066604935; 
 Wed, 09 Jul 2025 06:10:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::5ac? ([2606:6d00:17:b699::5ac])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702c4ccd601sm91309236d6.27.2025.07.09.06.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:10:04 -0700 (PDT)
Message-ID: <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy	 <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, Mattijs
 Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev
Date: Wed, 09 Jul 2025 09:10:02 -0400
In-Reply-To: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
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
 protocol="application/pgp-signature"; boundary="=-FlPJGplGJlZTiMNIPwxV"
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


--=-FlPJGplGJlZTiMNIPwxV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le mercredi 09 juillet 2025 =C3=A0 14:44 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Here's another attempt at supporting user-space allocations from a
> specific carved-out reserved memory region.
>=20
> The initial problem we were discussing was that I'm currently working on
> a platform which has a memory layout with ECC enabled. However, enabling
> the ECC has a number of drawbacks on that platform: lower performance,
> increased memory usage, etc. So for things like framebuffers, the
> trade-off isn't great and thus there's a memory region with ECC disabled
> to allocate from for such use cases.
>=20
> After a suggestion from John, I chose to first start using heap
> allocations flags to allow for userspace to ask for a particular ECC
> setup. This is then backed by a new heap type that runs from reserved
> memory chunks flagged as such, and the existing DT properties to specify
> the ECC properties.
>=20
> After further discussion, it was considered that flags were not the
> right solution, and relying on the names of the heaps would be enough to
> let userspace know the kind of buffer it deals with.
>=20
> Thus, even though the uAPI part of it had been dropped in this second
> version, we still needed a driver to create heaps out of carved-out memor=
y
> regions. In addition to the original usecase, a similar driver can be
> found in BSPs from most vendors, so I believe it would be a useful
> addition to the kernel.
>=20
> Some extra discussion with Rob Herring [1] came to the conclusion that
> some specific compatible for this is not great either, and as such an
> new driver probably isn't called for either.
>=20
> Some other discussions we had with John [2] also dropped some hints that
> multiple CMA heaps might be a good idea, and some vendors seem to do
> that too.
>=20
> So here's another attempt that doesn't affect the device tree at all and
> will just create a heap for every CMA reserved memory region.

Does that means that if we carve-out memory for a co-processor operating sy=
stem,
that memory region is now available to userspace to allocate from ? Or is t=
here
a nuance to that ?

For other carveout, such as RK3588 HDMI receiver, that is clearly a win, gi=
ving
user the ability to allocate using externally supplied constraints rather t=
hen
having to convince the v4l2 driver to match these. While keeping the safety=
 that
this carveout will yield valid addresses for the IP.

Will there be a generic way to find out which driver/device this carveout
belongs to ? In V4L2, only complex cameras have userspace drivers, everythi=
ng
else is generic code.

Nicolas

>=20
> It also falls nicely into the current plan we have to support cgroups in
> DRM/KMS and v4l2, which is an additional benefit.
>=20
> Let me know what you think,
> Maxime
>=20
> 1: https://lore.kernel.org/all/20250707-cobalt-dingo-of-serenity-dbf92c@h=
ouat/
> 2:
> https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=3Dc71kzFFaWK-fF5rCdnr9P5h1s=
gPOWSGSw@mail.gmail.com/
>=20
> Let me know what you think,
> Maxime
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v6:
> - Drop the new driver and allocate a CMA heap for each region now
> - Dropped the binding
> - Rebased on 6.16-rc5
> - Link to v5:
> https://lore.kernel.org/r/20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@ker=
nel.org
>=20
> Changes in v5:
> - Rebased on 6.16-rc2
> - Switch from property to dedicated binding
> - Link to v4:
> https://lore.kernel.org/r/20250520-dma-buf-ecc-heap-v4-1-bd2e1f1bb42c@ker=
nel.org
>=20
> Changes in v4:
> - Rebased on 6.15-rc7
> - Map buffers only when map is actually called, not at allocation time
> - Deal with restricted-dma-pool and shared-dma-pool
> - Reword Kconfig options
> - Properly report dma_map_sgtable failures
> - Link to v3:
> https://lore.kernel.org/r/20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@ker=
nel.org
>=20
> Changes in v3:
> - Reworked global variable patch
> - Link to v2:
> https://lore.kernel.org/r/20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@ker=
nel.org
>=20
> Changes in v2:
> - Add vmap/vunmap operations
> - Drop ECC flags uapi
> - Rebase on top of 6.14
> - Link to v1:
> https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@ker=
nel.org
>=20
> ---
> Maxime Ripard (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma/contiguous: Add helper to test reserve=
d memory type
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-buf: heaps: cma: Create CMA heap for e=
ach CMA reserved region
>=20
> =C2=A0drivers/dma-buf/heaps/cma_heap.c | 52
> +++++++++++++++++++++++++++++++++++++++-
> =C2=A0include/linux/dma-map-ops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++=
++++++
> =C2=A0kernel/dma/contiguous.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 7 ++++++
> =C2=A03 files changed, 71 insertions(+), 1 deletion(-)
> ---
> base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
> change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e
> prerequisite-message-id: <20250610131231.1724627-1-jkangas@redhat.com>
> prerequisite-patch-id: bc44be5968feb187f2bc1b8074af7209462b18e7
> prerequisite-patch-id: f02a91b723e5ec01fbfedf3c3905218b43d432da
> prerequisite-patch-id: e944d0a3e22f2cdf4d3b3906e5603af934696deb
>=20
> Best regards,

--=-FlPJGplGJlZTiMNIPwxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaG5qKgAKCRDZQZRRKWBy
9I45AQCBj0TCMQPihz2UiP5Ogn12VhminFtzBanzF6NqFNH8KAEA5amWJFCjCvXh
CZHsD/GwiUBvhWKPUZTCeUOA8R12UAY=
=ljqG
-----END PGP SIGNATURE-----

--=-FlPJGplGJlZTiMNIPwxV--
