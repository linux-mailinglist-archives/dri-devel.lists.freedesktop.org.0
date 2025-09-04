Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E2B43AF2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06610EA22;
	Thu,  4 Sep 2025 12:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhPTJlzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DD310E240
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:04:11 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso6469425e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756987450; x=1757592250; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CYiE/pA9YF+I4gC3nqqr/NiV56Cz+ejODJOLdKJjvLU=;
 b=GhPTJlzvtAMCU0Xf72l1TaQBAZzREvYKMwJj0cdkvYnig0ry4IOEiAO7WkJlOmgAcD
 MuCOR1I2a4cwa31fg3Xvn/VBctUJyD7YvXN/FcZeQ/oFTM6EsYXSPG4u9KknqJU0oTeI
 LkEAXowh9j7uGGKLH3sKYxEiv1dxthQUEn83BbUTxe2N+j1Tf6KWos4AEla3Iw+aSFRT
 fy0fl/QL+R4ordywI5ULbfGstNONMloGAqnIscN2tfE7e2J8XazTfpz0SQLxTXo7ddg2
 29Rx5Vtujntv9nAsI/ufrK+zuH2XSrrmPeNih6DD8kWLe+aqLx475OTRT3ENHT4o7cKS
 M3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756987450; x=1757592250;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYiE/pA9YF+I4gC3nqqr/NiV56Cz+ejODJOLdKJjvLU=;
 b=qG7vWds0ZJV/u96l4rv3B/0bniRId8sxc5xJlzZ5assW3Ty0KX91fiOtd7XN1jTe1f
 XEn/SX3djcBu7vTowCt/zYtmUg+tA776rMSfTQWJspmbIKRSX5ihRMGGuBd79NuJc5xN
 wP3ncf9OQYykP9J6Fz7wBSpSsvQfM+PXOHfyGijd9mFFECZAkOiCz2FMAGhOT/xAkjxg
 jyhZldxAnpcl64LDvP/ZD/2ymQ3zV9fP/f7R5V8FRLn6IItI8QLEIdzw7I9hE8nRmX8F
 wFodcOB2O2Xx/gYCI5ruFoUcCO38fHQPqh7EKHLlNgcQsPy6QNwwUVWAKCNxTRmuD8bZ
 VQ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiAR8vRsPIsRcJ5b6k4UTyf/feDw2k+iKCjYx7xMWMfoF5Hirw3ajZ6nlbw4htteFriw+Tt46jRwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxZCP0OiTxtHMsuTmRqkAYOShTjqrS++wq7gwMRshRsqb/2uKG
 2rsSpqGTIDUQZ2vYuY1CUXBdTyM2NfRCzPkxbCZFz3Cj0k+PwBO+jcOG
X-Gm-Gg: ASbGncux9XsngmL7lZNfTqsHLFARVcnIFLJ+Sb/vA+zjavQOI7UT3i03LZlX81v7lHc
 DUbme3K/WawbV81YrQQGiDbyutWNj8faotCgYkcFtXz1ZpNQWqzHiAKqlCr/ljwIqVXVGgvAfBn
 hOP/zmJnXPCgLTUanVY8boqTlC62U2Hlu0jBedDTObHwgrmMjX38zilKXFN2XkUFcd6akxOOpuW
 hJyNrGOGNM8cQkOCHOpPqMa1+cr2n9krJeSa5H8jAzkzZxDUiINCiKOF92ql1GtZmsV24P6EUQ4
 /xRSPUAjOhgGUbuec1d96s0YpSR6Tp0Dsw5Wzc+ZImQrdq5XwIVjZh/GJkVOvz2FymfARNjZtaC
 +XeYy9tjP82tPbUL2kvUy4BihiWI+WTcpBY/t+d8sB8L1RLhn9Z4Ha1J/rI7FShCB73Mm2fbEJ+
 zdTIiUvlQjKOqOtUgQhREK8CEcxoBbWA==
X-Google-Smtp-Source: AGHT+IGVHgAQ3rYyWGpANjjI/b4lpqEcMAsgs+SEt1MbrHmOvH15O1otXHYn+//vwM4FBU00m/l7Ow==
X-Received: by 2002:a05:600c:1c95:b0:45b:8abf:4583 with SMTP id
 5b1f17b1804b1-45b8abf46edmr100558005e9.19.1756987449310; 
 Thu, 04 Sep 2025 05:04:09 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb5693921sm79929805e9.0.2025.09.04.05.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 05:04:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:04:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Message-ID: <sb76bsg5d45r5qgq4zy3svbh42ydkk4vrh6a7vh73eibvqbfjd@3r4exdhogde6>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
 <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
 <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n7xt7eiet7j4nzny"
Content-Disposition: inline
In-Reply-To: <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
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


--n7xt7eiet7j4nzny
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 11:48:38AM -0700, John Stultz wrote:
> On Wed, Sep 3, 2025 at 8:38=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> > > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Add a callback to struct dma_heap_ops that heap providers can imple=
ment
> > > > to show information about the state of the heap in debugfs. A top-l=
evel
> > > > directory named "dma_heap" is created in debugfs and individual fil=
es
> > > > will be named after the heaps.
> > > >
> > >
> > > I know its debugfs, but this feels a little loosey-goosey as an uAPI.
> >
> > Well, the whole point of debugfs is that it's not really an ABI. Nothing
> > should ever rely on the presence of these files.
> >
> > > Is there any expected format for the show function?
> > >
> > > What would other dmabuf heaps ideally export via this interface?
> >
> > I've thought about this a bit and I'm not sure it makes sense to
> > standardize on this. I think on one hand having a list of buffers
> > exported by the dma-buf heap is probably the lowest common denominator,
> > but then there might be a bunch of other things that are very heap-
> > specific that some heap might want to export.
> >
> > > Is there some consistent dma_heap-ish concept for it to justify it
> > > being under a dma_heap directory, and not just an independent debugfs
> > > file for the driver implementing the dmabuf heap?
> >
> > Well, I think just the fact that it's a dma-heap would qualify its
> > corresponding debugfs to be in a well-known location. We could of course
> > pick some arbitrary location, but that's just a recipe for chaos because
> > then everybody puts these whereever they want. There's really no
> > standard place for driver-specific debugfs files to go, so putting it
> > into some "subsystem"-specific directory seems like the better option.
>=20
> Ok, I guess I was thinking if the files are organizationally cohesive
> to be under the dma-heap directory, they ought to have some
> consistency between them.

As far as I can tell there's not even enough information in a dma-heap
to add any common debugfs snippets. As I mentioned earlier, a list of
buffers allocated from a dma-heap is about the only generic piece of
information that I can think of, but we don't track these buffers in a
generic way. None of the existing heaps do so either seem to be
interested in this either.

It's also not like it's very useful information most of the time, it's
mainly in this driver so that it can be inspected at runtime to see what
the allocation pattern looks like at various stages and maybe help tune
the division into chunks.

Thierry

--n7xt7eiet7j4nzny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5gDMACgkQ3SOs138+
s6Fs+g//UOYEclDiMQaLHjmLrIy415HNAOvJ45jAQXSXODXhEWUoeeT6VpX4alVY
nX8oVWTi6ne/gxdb5ecijq0xe98suaGyb0ExszrPDOsykvikNhAMO8+hGNgfvnU4
L/lvQqTxM8wGz/D1A7z3CyhBipu8GNIYxlF64O9ejq22NqDZGLykvHupw8SubU4G
LQRHuwu39Yb2Hj+r8IMiSXCjWPHtelnA4HXM7hnURUkRNIKkoSp5g9UQJIlw84Y3
U+4zSs9x9IOUr2l35QMwJEq1R168TIAj6gm1G1eSKxGDlIc5DgU4Ei4QTmki+Qhj
hvToHncu1BTaA5YvpgcFKmgCD1jFX93fx2to90mPpWMonySn4EyL0wAqwycfUuC7
D4mKmRF+Dj5RGmrRATN2yZ+2l+N2GgCzJ9EoNNacTl0fFy14FHVwiqn6OVlrIMVl
+olxYn2Ta8T9EMnKrQquQtoEbFJT1mfXUfAlHFDGJocYgKrO+o1zpFzZtEGd92sZ
hpSs5qlYH7hLQaj7P2Pb29mfloQZ9XK3YSNcttTbnFU2dyEahlPvx/VJTCCQvNeY
g03SAA1priYhlLGKdaa19fDxICteA6dmc9Ba6ejSvKXLHejTFlLooK+hkSmufJIu
3DdzixdgWcOsgxrw2vvHlU0U5bPvKnfbiUJUL557Iwo9vw3KKHw=
=G6AW
-----END PGP SIGNATURE-----

--n7xt7eiet7j4nzny--
