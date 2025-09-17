Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20049B803B0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F3410E887;
	Wed, 17 Sep 2025 14:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="G0Jh+q/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F181D10E87F;
 Wed, 17 Sep 2025 14:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758120476; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kExb06QfGO5wGi4tn95OHJVEbc779HG2jWFpn5MAUrF+Ht+Z93XO6ITrezk1pS42PqckAZ8w3O54JkERSYq1cb9RmJ/W9714Z2IyCTPfhj+n39QAhvIJsa+LIEHFjaBHAwlA00Dmm72mMGooUrPX+Rrm8wff0jCHHm9JH5+PnbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758120476;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eF1Nte+KoyVaFu3UgvgV2Z8Dq7qzOgXxpPaBwAQaie8=; 
 b=Wm31mSLaNHA5JL/bYzEu3hQrZdYX/LDe3YFbd7SAWe7q1m9doALg8QaI3Yeo82EARNgulOCjeWRJvWJcxe21UWJ1e64uRr7w7eOnVmHgSUGTZoguofyE4YUgFqBuitobPD7DRboJBNd0cfJcx8DgrXo2dftxZKk64aes/gjRb0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758120476; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=eF1Nte+KoyVaFu3UgvgV2Z8Dq7qzOgXxpPaBwAQaie8=;
 b=G0Jh+q/Xe8890RFMMGqplZFoUjijmEp27SkVrR0Sk+OmH4/sWp8fecuP3AQhqePq
 hv73AZJ3wT3DqRUUiEMd/IdFfWv/hkE6yNsfHjtIQzPN/IlprKcdtj72V8D6DeI361p
 /D0RZyziaMZH50ZTncXen/nYjdPJWKgzTEipUj4Q=
Received: by mx.zohomail.com with SMTPS id 1758120474604133.2092327581646;
 Wed, 17 Sep 2025 07:47:54 -0700 (PDT)
Message-ID: <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>
Subject: Re: [PATCH V11 14/47] drm/vkms: Add enumerated 1D curve colorop
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Simon Ser	 <contact@emersion.fr>,
 harry.wentland@amd.com
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, 	jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, 	agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, 	xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, 	uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, 
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com, 
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com,  Daniel Stone <daniels@collabora.com>
Date: Wed, 17 Sep 2025 10:47:51 -0400
In-Reply-To: <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-15-alex.hung@amd.com>
 <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
 <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Tue, 2025-09-16 at 19:54 -0600, Alex Hung wrote:
>=20
>=20
> On 9/5/25 11:12, Louis Chauvet wrote:
> >=20
> >=20
> > Le 15/08/2025 =C3=A0 05:50, Alex Hung a =C3=A9crit=C2=A0:
> > > From: Harry Wentland <harry.wentland@amd.com>
> > >=20
> > > This patch introduces a VKMS color pipeline that includes two
> > > drm_colorops for named transfer functions. For now the only ones
> > > supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
> > > We will expand this in the future but I don't want to do so
> > > without accompanying IGT tests.
> > >=20
> > > We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
> > > sRGB Inverse EOTF, and a linear EOTF LUT. These have been
> > > generated with 256 entries each as IGT is currently testing
> > > only 8 bpc surfaces. We will likely need higher precision
> > > but I'm reluctant to make that change without clear indication
> > > that we need it. We'll revisit and, if necessary, regenerate
> > > the LUTs when we have IGT tests for higher precision buffers.
> > >=20
> > > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > > ---
> > > v11:
> > > =C2=A0 - Update drm_colorop_pipeline_destroy from plane to dev
> > > (N=C3=ADcolas Prado)
> > > =C2=A0 - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test
> > > robot)
> > >=20
> > > v9:
> > > =C2=A0 - Replace cleanup code by drm_colorop_pipeline_destroy (Simon
> > > Ser)
> > > =C2=A0 - Update function names by _plane_ (Chaitanya Kumar Borah)
> > >=20
> > > v8:
> > > =C2=A0 - Replace DRM_ERROR by drm_err (Louis Chauvet)
> > > =C2=A0 - Replace DRM_WARN_ONCE by drm_WARN_ONCE (Louis Chauvet)
> > > =C2=A0 - Fix conflicts with upstream VKMS (Louis Chauvet)
> > > =C2=A0 - Add comments for drm_color_lut linear_array (Louis Chauvet)
> > >=20
> > > v7:
> > > =C2=A0 - Fix checkpatch warnings (Louis Chauvet)
> > > =C2=A0=C2=A0 - Change kzalloc(sizeof(struct drm_colorop) ...) to=20
> > > kzalloc(sizeof(*ops[i]) ...)
> > > =C2=A0=C2=A0 - Remove if (ops[i]) before kfree(ops[i])
> > > =C2=A0=C2=A0 - Fix styles by adding and removing spaces (new lines, t=
abs
> > > and so on)
> > >=20
> > > v6:
> > > =C2=A0 - drop 'len' var (Louis Chauvet)
> > > =C2=A0 - cleanup if colorop alloc or init fails (Louis Chauvet)
> > > =C2=A0 - switch loop in pre_blend_transform (Louis Chauvet)
> > > =C2=A0 - drop extraneous if (colorop) inside while (colorop) (Louis
> > > Chauvet)
> > >=20
> > > v5:
> > > =C2=A0 - Squash with "Pull apply_colorop out of
> > > pre_blend_color_transform"
> > > =C2=A0=C2=A0=C2=A0 (Sebastian)
> > > =C2=A0 - Fix warnings
> > > =C2=A0 - Fix include
> > > =C2=A0 - Drop TODOs
> > >=20
> > > v4:
> > > =C2=A0 - Drop _tf_ from color_pipeline init function
> > > =C2=A0 - Pass supported TFs into colorop init
> > > =C2=A0 - Create bypass pipeline in DRM helper (Pekka)
> > >=20
> > > v2:
> > > =C2=A0 - Add commit description
> > > =C2=A0 - Fix sRGB EOTF LUT definition
> > > =C2=A0 - Add linear and sRGB inverse EOTF LUTs
> > >=20
> > > =C2=A0 drivers/gpu/drm/vkms/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_colorop.c=C2=A0 |=C2=A0 81 +++
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_composer.c |=C2=A0 51 +-
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 3 +
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_luts.c=C2=A0=C2=A0=C2=A0=C2=A0 | 811
> > > +++++++++++++++++++++++++++
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_luts.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 +
> > > =C2=A0 drivers/gpu/drm/vkms/vkms_plane.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> > > =C2=A0 7 files changed, 962 insertions(+), 2 deletions(-)
> > > =C2=A0 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
> > > =C2=A0 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
> > > =C2=A0 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
> > >=20
> > > diff --git a/drivers/gpu/drm/vkms/Makefile
> > > b/drivers/gpu/drm/vkms/=20
> > > Makefile
> > > index d657865e573f..0b8936674f69 100644
> > > --- a/drivers/gpu/drm/vkms/Makefile
> > > +++ b/drivers/gpu/drm/vkms/Makefile
> > > @@ -8,7 +8,9 @@ vkms-y :=3D \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vkms_composer.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vkms_writeback.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vkms_connector.o \
> > > -=C2=A0=C2=A0=C2=A0 vkms_config.o
> > > +=C2=A0=C2=A0=C2=A0 vkms_config.o \
> > > +=C2=A0=C2=A0=C2=A0 vkms_colorop.o \
> > > +=C2=A0=C2=A0=C2=A0 vkms_luts.o
> > > =C2=A0 obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
> > > =C2=A0 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) +=3D tests/
> > > diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
> > > b/drivers/gpu/drm/=20
> > > vkms/vkms_colorop.c
> > > new file mode 100644
> > > index 000000000000..f955ffb0ac84
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> > > @@ -0,0 +1,81 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +#include <linux/slab.h>
> > > +#include <drm/drm_colorop.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_property.h>
> > > +#include <drm/drm_plane.h>
> > > +
> > > +#include "vkms_drv.h"
> > > +
> > > +static const u64 supported_tfs =3D
> > > +=C2=A0=C2=A0=C2=A0 BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> > > +=C2=A0=C2=A0=C2=A0 BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
> > > +
> > > +#define MAX_COLOR_PIPELINE_OPS 2
> > > +
> > > +static int vkms_initialize_color_pipeline(struct drm_plane
> > > *plane,=20
> > > struct drm_prop_enum_list *list)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> > > +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D plane->dev;
> > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > +=C2=A0=C2=A0=C2=A0 int i =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 memset(ops, 0, sizeof(ops));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /* 1st op: 1d curve */
> > > +=C2=A0=C2=A0=C2=A0 ops[i] =3D kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> > > +=C2=A0=C2=A0=C2=A0 if (!ops[i]) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "KMS: Failed=
 to allocate colorop\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENOMEM;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto cleanup;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 ret =3D drm_plane_colorop_curve_1d_init(dev, ops[=
i], plane,=20
> > > supported_tfs);
> > > +=C2=A0=C2=A0=C2=A0 if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto cleanup;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 list->type =3D ops[i]->base.id;
> > > +=C2=A0=C2=A0=C2=A0 list->name =3D kasprintf(GFP_KERNEL, "Color Pipel=
ine %d",
> > > ops[i]-=20
> > > > base.id);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 i++;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /* 2nd op: 1d curve */
> > > +=C2=A0=C2=A0=C2=A0 ops[i] =3D kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> > > +=C2=A0=C2=A0=C2=A0 if (!ops[i]) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "KMS: Failed=
 to allocate colorop\n");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -ENOMEM;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto cleanup;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 ret =3D drm_plane_colorop_curve_1d_init(dev, ops[=
i], plane,=20
> > > supported_tfs);
> > > +=C2=A0=C2=A0=C2=A0 if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto cleanup;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 drm_colorop_set_next_property(ops[i - 1], ops[i])=
;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +
> > > +cleanup:
> > > +=C2=A0=C2=A0=C2=A0 drm_colorop_pipeline_destroy(dev);
> >=20
> > If it take a device, it means that it deletes everything, which is
> > not=20
> > what I would expect here: you are curently allocating a specific
> > plane=20
> > pipeline, and deleting all colorop for other planes because of one=20
> > failure is counterintuitive.
> > In this situation I would expect either:
> > - error propagation to vkms_create or vkms_output_init (it is
> > already=20
> > the case) and "device-wide" cleanup in
> > vkms_create/vkms_output_init;
> > - "local" cleanup (i.e only this specific pipeline)
>=20
> Hi Louis,
>=20
> Does it make sense to make drm_colorop_pipeline_destroy(drm_plane),
> i.e.=20
> in PATCH 13 as in previously V10?
>=20
> and then drm_colorop_pipeline_destroy should limit to the pipeline in
> a=20
> drm_plane and should do something like
>=20
> =C2=A0=C2=A0 drm_colorop_cleanup(colorop);
> =C2=A0=C2=A0 free(colorop)
> =C2=A0=C2=A0 drm_plane->colorop =3D NULL;
>=20
> We can have same behaviours accross device drivers like amdgpu too.
>=20
> Hi Simon and Nicolas,
>=20
> Do you have comments on above proposal?

Hi,

indeed that would make more sense to me.

--=20
Thanks,

N=C3=ADcolas
