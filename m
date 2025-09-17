Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF19B80929
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681410E577;
	Wed, 17 Sep 2025 15:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="B1Lgtxo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FEF10E577;
 Wed, 17 Sep 2025 15:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758123079; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UuWe0R862mYBDNK4zKUo6G/vNL3Ap8kkqwL+8/eehzbjH5nlQlSikO+WrTeETPx+tuHPZ3itRgmUO+ORw0jPZwYii/A47YeYMdoxkUA9JznlHt8wFNmF6ofRjBWhickwZj1yJtFX4GOhPTPVZEgsiKQ8QvSJAJO+a/NewAizNsE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758123079;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=jIqoacxs9ki9nTZ6Q1FeaTJMMaiRjGlrrARraBiu5+o=; 
 b=No6BQtVkwYJzcMISTa0+oFjwB7bXlW2vwpkCJbpmRqbui6/YsKHPnfasxzOU1F0wY2gXCXnZJV2pxwIf2JRY748Cqic4E0rAIaSNxSFs1mesWboj7z1KdcoIY+HuFmHLG4kIIXFklSwfc3tt//M23n7Ewdqr2o1N9hZ6AvyyEO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758123079; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=jIqoacxs9ki9nTZ6Q1FeaTJMMaiRjGlrrARraBiu5+o=;
 b=B1Lgtxo2BKhTT6TH2o9kBYMhpLgVGLhTV9b9f/8dtmlaTeOJyUsBrReafgoAtZJl
 sNT8o0LPhffT53MkuudLBGEWy8IoAkLqi6JbH6bUU83Gpkn2d5cWng/2qufmAydV2rP
 zRNB9aTIuSguDuyJU/XC92MDuqULg7j3/MUVc6CE=
Received: by mx.zohomail.com with SMTPS id 1758123076994704.9119805128295;
 Wed, 17 Sep 2025 08:31:16 -0700 (PDT)
Message-ID: <6a9ce6f7db556a7b2a3ea60a4765075a4f0073cb.camel@collabora.com>
Subject: Re: [PATCH V11 13/47] drm/colorop: Add destroy functions for color
 pipeline
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Alex Hung <alex.hung@amd.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, 	contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, 	shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, 
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, 	uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, 	quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, 	sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com,  Daniel Stone
 <daniels@collabora.com>
Date: Wed, 17 Sep 2025 11:31:14 -0400
In-Reply-To: <73c5ddcf-885c-4c90-9393-6ee6e2fdd984@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-14-alex.hung@amd.com>
 <59910838-4ae7-42f1-9226-3845b3a4ab52@bootlin.com>
 <73c5ddcf-885c-4c90-9393-6ee6e2fdd984@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <6a9ce6f7db556a7b2a3ea60a4765075a4f0073cb.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Tue, 2025-09-16 at 20:01 -0600, Alex Hung wrote:
>=20
>=20
> On 9/5/25 11:12, Louis Chauvet wrote:
> >=20
> >=20
> > Le 15/08/2025 =C3=A0 05:50, Alex Hung a =C3=A9crit=C2=A0:
> > > The functions are to clean up color pipeline when a device driver
> > > fails to create its color pipeline.
> > >=20
> > > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > > Reviewed-by: Simon Ser <contact@emersion.fr>
> > > Reviewed-by: Melissa Wen <mwen@igalia.com>
> > > ---
> > > v11:
> > > =C2=A0 - destroy function takes drm_device *dev instead of drm_plane
> > > *plane
> > > =C2=A0=C2=A0=C2=A0 (N=C3=ADcolas Prado)
> > >=20
> > > v9:
> > > =C2=A0 - Move from from latest commit to here, and=20
> > > drm_colorop_pipeline_destroy
> > > =C2=A0=C2=A0=C2=A0 is called in respective commits.
> > >=20
> > > =C2=A0 drivers/gpu/drm/drm_colorop.c | 35
> > > +++++++++++++++++++++++++++++++++++
> > > =C2=A0 include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > > =C2=A0 2 files changed, 37 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/=20
> > > drm_colorop.c
> > > index 7b3ecf7ddd11..6930d39c8ad3 100644
> > > --- a/drivers/gpu/drm/drm_colorop.c
> > > +++ b/drivers/gpu/drm/drm_colorop.c
> > > @@ -135,6 +135,41 @@ static int drm_plane_colorop_init(struct=20
> > > drm_device *dev, struct drm_colorop *co
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > =C2=A0 }
> > > +/**
> > > + * drm_colorop_cleanup - Cleanup a drm_colorop object in
> > > color_pipeline
> > > + *
> > > + * @colorop: The drm_colorop object to be cleaned
> > > + */
> > > +static void drm_colorop_cleanup(struct drm_colorop *colorop)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D colorop->dev;
> > > +=C2=A0=C2=A0=C2=A0 struct drm_mode_config *config =3D &dev->mode_con=
fig;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 list_del(&colorop->head);
> > > +=C2=A0=C2=A0=C2=A0 config->num_colorop--;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 kfree(colorop->state);
> > > +}
> > > +
> > > +/**
> > > + * drm_colorop_pipeline_destroy - Helper for color pipeline
> > > destruction
> > > + *
> > > + * @dev: - The drm_device containing the drm_planes with the=20
> > > color_pipelines
> > > + *
> > > + * Provides a default color pipeline destroy handler for
> > > drm_device.
> > > + */
> > > +void drm_colorop_pipeline_destroy(struct drm_device *dev)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct drm_mode_config *config =3D &dev->mode_con=
fig;
> > > +=C2=A0=C2=A0=C2=A0 struct drm_colorop *colorop, *next;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(colorop, next, &config-
> > > >colorop_list,=20
> > > head) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_colorop_cleanup(color=
op);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(colorop);
> >=20
> > This free here seems a bit strange. I don't see any requirement on
> > the=20
> > colorop pointer in the init function, so we can expect it to be
> > embedded=20
> > in a bigger structure, so this kfree may affect a non-allocated
> > pointer.
> >=20
> > I would expect one of:
> >=20
> > - a clear documentation in drm_plane_colorop_*_init documentation
> > that=20
> > explicitly says that you need to pass a kzalloc pointer =3D> very
> > error=20
> > prone, if the user don't read carefully the documentation it may
> > lead to=20
> > undefined behavior
> >=20
> > - that drm_plane_colorop_*_init will do the kzalloc itself (so we=20
> > garantee that the pointer is always a kzalloc pointer) =3D> it will
> > forbid=20
> > to embed colorop structure in bigger structure. I don't think this
> > is=20
> > the case today, but I don't know if this can become a limitation
> > for=20
> > other drivers.
>=20
> Yes it makes to have kzalloc and kfree done both in vkms/amdgpu or
> both=20
> in drm_*.
>=20
> Does the following change make sense to you?
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c
> b/drivers/gpu/drm/drm_colorop.c
> index 1551b86471ce..67aa443e53e7 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
>=20
> @@ -214,6 +216,13 @@ int drm_plane_colorop_curve_1d_init(struct=20
> drm_device *dev, struct drm_colorop *
> =C2=A0=C2=A0	struct drm_property *prop;
> =C2=A0=C2=A0	int ret;
>=20
> +	colorop =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!colorop) {
> +		drm_err(dev, "KMS: Failed to allocate colorop\n");
> +		ret =3D -ENOMEM;
> +		goto cleanup;
> +	}
> +
> =C2=A0=C2=A0	if (!supported_tfs) {
> =C2=A0=C2=A0		drm_err(dev,
> =C2=A0=C2=A0			"No supported TFs for new 1D curve colorop
> on [PLANE:%d:%s]\n",
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c=20
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 0191ac44dec0..f11dca61b5ce 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -24,12 +24,6 @@ static int vkms_initialize_color_pipeline(struct=20
> drm_plane *plane, struct drm_pr
> =C2=A0=C2=A0	memset(ops, 0, sizeof(ops));
>=20
> =C2=A0=C2=A0	/* 1st op: 1d curve */
> -	ops[i] =3D kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> -	if (!ops[i]) {
> -		drm_err(dev, "KMS: Failed to allocate colorop\n");
> -		ret =3D -ENOMEM;
> -		goto cleanup;
> -	}
>=20
> =C2=A0=C2=A0	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> supported_tfs,
> =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>=20
>=20

Well, as Louis mentions, this doesn't play well with embedding a
colorop into a larger struct, which is something I'm relying on to
track additional bits for post-blend colorops in the MediaTek driver in
[1].

I don't see an issue with the existing solution. From the function's
documentation: "Provides a default color pipeline destroy handler for
drm_device.", "default" is the key word here, each driver is currently
responsible for allocating every colorop and cleaning it up, and this
function is a helper for the common case where a drm_colorop is not
embedded into another struct. For the cases where it is, the driver
should create its own destroy() that properly frees the pointer for the
container struct, which is exactly what I'm doing in [1]. Perhaps we
should just add to the destroy() documentation that it frees the
pointer and so drivers embedding the struct should implement their own
helper.

On that train of thought, I think it would make sense to make
drm_colorop_cleanup() public [2] as part of this series so that those
drivers can reuse it.

[1]
https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1=
-0-a9446d4aca82@collabora.com/T/#ma6b44d451ed84c9c6b32d26e6192ad951612444d
[2]
https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1=
-0-a9446d4aca82@collabora.com/T/#m15e8f52a03d711a4d3ab9cecc7b9cafb2954c489

>=20
--=20
Thanks,

N=C3=ADcolas
