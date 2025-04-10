Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA04A84500
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2810E9C4;
	Thu, 10 Apr 2025 13:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CHIrHXPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2D10E9C4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744292254;
 bh=8fbIlJVnhK8RsBM3PS14Qusu49bcxi2X3XaABa1477A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CHIrHXPc0N0fh1kYfJmCpBO8Qcgk/pQAnQAfzsQTKa/jc32ugQidoiF7Nl+nmHRxC
 0Ng+6Wb01l1KBF2P08bQoNrXd/9xCjqvgI5usgwV0PtfiVURMHWOMtOMNNg8JxDigL
 wC2jUmgY5nEhxGMtIZzvGDwpmgKn/f+v9tQ+huvhSbezlTDDH4o36Y/nk6FWr0MxJA
 FsUij43qSAc1YnTNS20tnwpxRZ4tYgu9YjFvzgC/Pd1XNsY3yEA4fxFIeDnh1AxWkr
 W05oA005TtIUBwmlH078jsjvHvBfImpSgJYObbx0PpuJh661QRRqUGLsgeJdump2LH
 eeDP76yk2DtAg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 250C517E017D;
 Thu, 10 Apr 2025 15:37:34 +0200 (CEST)
Date: Thu, 10 Apr 2025 15:37:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple
 and extensible
Message-ID: <20250410153729.1fb0444c@collabora.com>
In-Reply-To: <a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-6-karunika.choo@arm.com>
 <20250321090254.667a86cb@collabora.com>
 <a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 10 Apr 2025 14:20:59 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 21/03/2025 08:02, Boris Brezillon wrote:
> > On Thu, 20 Mar 2025 11:17:37 +0000
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >  =20
> >> This patch replaces the previous panthor_model structure with a simple
> >> switch case based on the product_id, which is in the format of:
> >>         ((arch_major << 24) | product_major)
> >>
> >> This not only simplifies the comparison, but also allows extending the
> >> function to accommodate naming differences based on GPU features.
> >>
> >> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
> >>  drivers/gpu/drm/panthor/panthor_regs.h |  1 +
> >>  2 files changed, 18 insertions(+), 46 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/pa=
nthor/panthor_hw.c
> >> index 4cc4b0d5382c..12183c04cd21 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> >> @@ -5,40 +5,6 @@
> >>  #include "panthor_hw.h"
> >>  #include "panthor_regs.h"
> >> =20
> >> -/**
> >> - * struct panthor_model - GPU model description
> >> - */
> >> -struct panthor_model {
> >> -	/** @name: Model name. */
> >> -	const char *name;
> >> -
> >> -	/** @arch_major: Major version number of architecture. */
> >> -	u8 arch_major;
> >> -
> >> -	/** @product_major: Major version number of product. */
> >> -	u8 product_major;
> >> -};
> >> -
> >> -/**
> >> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely id=
entified
> >> - * by a combination of the major architecture version and the major p=
roduct
> >> - * version.
> >> - * @_name: Name for the GPU model.
> >> - * @_arch_major: Architecture major.
> >> - * @_product_major: Product major.
> >> - */
> >> -#define GPU_MODEL(_name, _arch_major, _product_major) \
> >> -{\
> >> -	.name =3D __stringify(_name),				\
> >> -	.arch_major =3D _arch_major,				\
> >> -	.product_major =3D _product_major,			\
> >> -}
> >> -
> >> -static const struct panthor_model gpu_models[] =3D {
> >> -	GPU_MODEL(g610, 10, 7),
> >> -	{},
> >> -};
> >> -
> >>  static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
> >>  {
> >>  	unsigned int i;
> >> @@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor=
_device *ptdev)
> >>  	ptdev->gpu_info.l2_present =3D gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> >>  }
> >> =20
> >> +static char *get_gpu_model_name(struct panthor_device *ptdev)
> >> +{
> >> +	const u32 gpu_id =3D ptdev->gpu_info.gpu_id;
> >> +	const u32 product_id =3D GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
> >> +						GPU_PROD_MAJOR(gpu_id));
> >> +
> >> +	switch (product_id) {
> >> +	case GPU_PROD_ID_MAKE(10, 7):
> >> +		return "Mali-G610";
> >> +	} =20
> >=20
> > I a big fan of these ever growing switch statements with nested
> > conditionals. Could we instead add an optional ::get_variant() callback
> > in panthor_model and have the following formatting:
> >=20
> > 	"Mali-%s%s%s", model->name,
> > 		       model->get_variant ? "-" : "",
> > 		       model->get_variant ? model->get_variant() : ""
> > =20
>=20
> While that=E2=80=99s certainly an option, I wonder if it=E2=80=99s better=
 to avoid
> additional string formatting when it=E2=80=99s not strictly necessary. The
> switch cases provide a straightforward GPU name without needing to
> handle conditional "-" separators or similar.
>=20
> Also, with the current approach, if a GPU is misconfigured with an
> incorrect product_major for its core count, the switch=E2=80=99s fallthro=
ugh
> helps ensure the correct name is still returned. A model->get_variant()
> callback wouldn=E2=80=99t give us that same flexibility to adjust the nam=
e based
> on such mismatches.

Fair enough. I guess we can live with this sort of switch statement for
the name selection. Hopefully the variants are rare enough that it
doesn't go too wild.
