Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C439AB5066A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 21:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BE610E7CD;
	Tue,  9 Sep 2025 19:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="inGxeO/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F223510E7CD;
 Tue,  9 Sep 2025 19:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757446283; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=f1EewJUnZ9XmqgixY7GoY5dHEBTTWj0M4NIV/Jp5wm3dN8yrJI6RPV9Y4CAgzuZuEsAwXWt/oHBsD5vAuiqxt072R8NvNqwR+NQn7euFAOFKBDB95f3m8OzySs/EdBGCHIkRBpFvOmsGciuTIV1Z9iDApsL9AU6G1IfOrzdXJjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757446283;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/9F66lDKavUG/pPbkbXlUrCZiKcpxmpQ3hYwz5E3cyk=; 
 b=NrlzTzWw8dDemCOyCv3wGxWxW9oBqG+yxq7f7RbPBRwywlG0sZV/QGdWTP7R4mtw0ITKNc7xgL2n6Di1HRvAXc9u6GuBKbeLe9/yv7CSZx8vLG4l+ylX4C4AHlLW5oAtUaGgg/HM9oFqhS2/3mnaS9N4UPz4V/qGaWf+po3RZ/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757446283; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=/9F66lDKavUG/pPbkbXlUrCZiKcpxmpQ3hYwz5E3cyk=;
 b=inGxeO/E0CyFIAFkTLvT/vjZW+EcldBkGYwQkkye5MjDQjmhgg8kCSodCf0xhExv
 K0XoYMurniVCP0cMT1gAsIOeB0VyIRIkQyunr5zt5ReP2+5JpOMwEsFLKDqzHrA/B5j
 IkiLE6aVoyUCo98GRnZcjYYZ5o6qVWu76jvwwxKc=
Received: by mx.zohomail.com with SMTPS id 1757446281636631.7660879913486;
 Tue, 9 Sep 2025 12:31:21 -0700 (PDT)
Message-ID: <eab7182d8b25d87c11f2541db910c6ea3d9434e9.camel@collabora.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, 	marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, 	chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, kernel@collabora.com, 	daniels@collabora.com,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Date: Tue, 09 Sep 2025 15:31:17 -0400
In-Reply-To: <4d63e90a-794f-4108-9219-19b0c0dab267@bootlin.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <4d63e90a-794f-4108-9219-19b0c0dab267@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <eab7182d8b25d87c11f2541db910c6ea3d9434e9.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Fri, 2025-09-05 at 19:55 +0200, Louis Chauvet wrote:
>=20
>=20
> Le 22/08/2025 =C3=A0 20:36, N=C3=ADcolas F. R. A. Prado a =C3=A9crit=C2=
=A0:
> > Introduce support for a post-blend color pipeline API analogous to
> > the
> > pre-blend color pipeline API. While the pre-blend color pipeline
> > was
> > configured through a COLOR_PIPELINE property attached to a
> > drm_plane,
> > the post-blend color pipeline is configured through a
> > COLOR_PIPELINE
> > property on the drm_crtc.
> >=20
> > Since colorops can now be attached to either a drm_plane or a
> > drm_crtc,
> > rework the helpers to account for both cases.
> >=20
> > Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE,
> > to
> > enable support for post-blend color pipelines, and prevent the now
> > legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties
> > from
> > being exposed.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =C2=A0 drivers/gpu/drm/drm_atomic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 32 ++++++--
> > =C2=A0 drivers/gpu/drm/drm_atomic_uapi.c=C2=A0=C2=A0 |=C2=A0 50 +++++++=
+++++-
> > =C2=A0 drivers/gpu/drm/drm_colorop.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 144
> > +++++++++++++++++++++++++++++-------
> > =C2=A0 drivers/gpu/drm/drm_connector.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/drm_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 77 +++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/drm_crtc_internal.h |=C2=A0=C2=A0 6 ++
> > =C2=A0 drivers/gpu/drm/drm_ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++
> > =C2=A0 drivers/gpu/drm/drm_mode_object.c=C2=A0=C2=A0 |=C2=A0 20 +++++
> > =C2=A0 drivers/gpu/drm/drm_plane.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 36 ++-------
> > =C2=A0 include/drm/drm_atomic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 +++++
> > =C2=A0 include/drm/drm_atomic_uapi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +++-
> > =C2=A0 include/drm/drm_crtc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++++
> > =C2=A0 include/drm/drm_file.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++
> > =C2=A0 include/uapi/drm/drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++++
> > =C2=A0 15 files changed, 383 insertions(+), 70 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c
> > index
> > 3ab32fe7fe1cbf9057c3763d979638dce013d82b..558d389d59d9a44d3cd1048ed
> > 365848f62b4d62d 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -472,6 +472,8 @@ static void drm_atomic_crtc_print_state(struct
> > drm_printer *p,
> > =C2=A0=C2=A0	drm_printf(p, "\tplane_mask=3D%x\n", state->plane_mask);
> > =C2=A0=C2=A0	drm_printf(p, "\tconnector_mask=3D%x\n", state-
> > >connector_mask);
> > =C2=A0=C2=A0	drm_printf(p, "\tencoder_mask=3D%x\n", state->encoder_mask=
);
> > +	drm_printf(p, "\tcolor-pipeline=3D%d\n",
> > +		=C2=A0=C2=A0 state->color_pipeline ? state->color_pipeline-
> > >base.id : 0);
>=20
> This could be in a separate patch / suggested to the initial series.

Right, I'll make sure to split the changes in this commit further for
v2.

>=20
> > =C2=A0=C2=A0	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n",
> > DRM_MODE_ARG(&state->mode));
> > =C2=A0=20
> > =C2=A0=C2=A0	if (crtc->funcs->atomic_print_state)
> > @@ -617,9 +619,15 @@ drm_atomic_get_colorop_state(struct
> > drm_atomic_state *state,
> > =C2=A0=C2=A0	if (colorop_state)
> > =C2=A0=C2=A0		return colorop_state;
> > =C2=A0=20
> > -	ret =3D drm_modeset_lock(&colorop->plane->mutex, state-
> > >acquire_ctx);
> > -	if (ret)
> > -		return ERR_PTR(ret);
> > +	if (colorop->plane) {
> > +		ret =3D drm_modeset_lock(&colorop->plane->mutex,
> > state->acquire_ctx);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +	} else {
> > +		ret =3D drm_modeset_lock(&colorop->crtc->mutex,
> > state->acquire_ctx);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +	}
>=20
> Two suggestions here:
>=20
> Maybe you can create `colorop_modeset_lock/unlock` helpers to avoid
> code=20
> repetition.
>=20
> Can you also change it to
>=20
> 	if (colorop->plane)
> 		...
> 	else if (colorop->crtc)
> 		...
> 	else
> 		drm_err("Dangling colorop, it must be attached to a
> plane or a CRTC")
> 		return ERR_PTR
>=20
> ?
>=20
> This way it will avoid issues if someone add support to attach
> colorop=20
> to other drm parts and forgot to update locking in some places.

Yes, both suggestions sound good, I'll apply them for v2.

> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index
> > 27cc159c1d275c7a7fe057840ef792f30a582bb7..1191b142ebaa5478376308f16
> > 9f9ce8591580d9d 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -921,6 +921,22 @@ struct drm_get_cap {
> > =C2=A0=C2=A0 */
> > =C2=A0 #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> > =C2=A0=20
> > +/**
> > + * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
> > + *
> > + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> > + * property on a &drm_crtc, as well as drm_colorop properties.
> > + *
> > + * Setting of these crtc properties will be rejected when this
> > client
> > + * cap is set:
>=20
> I don't know enough the uAPI of DRM, but if I understand your patch=20
> correctly, it will not reject GAMMA_LUT/DEGAMMA_LUT/CTM, only unlist=20
> them from the get_properties syscall. Did I overlooked something?

You're right. This was originally based on v10 of the pre-blend series
(https://lore.kernel.org/dri-devel/20250617041746.2884343-12-alex.hung@amd.=
com/
), which did in fact return an error when the properties were set with
the cap enabled, but v11
(https://lore.kernel.org/all/20250815035047.3319284-12-alex.hung@amd.com/
) switched to just unlisting the properties, so I also updated the code
here accordingly for this RFC, but forgot to update this text, and
apparently so did the original series.

From the discussion in another thread
(https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v=
1-0-a9446d4aca82@collabora.com/T/#m1e8ba77ef54453b26ae70e1f1699ed17afec91e3
) we might make these properties read-only, and in which case we'll
have to make them listed but error when set again, so I'll wait for
that discussion to be resolved before updating this and forwarding that
feedback to the pre-blend series. But thanks for pointing out the
inconsistency anyway.

>=20
> > + * - GAMMA_LUT
> > + * - DEGAMMA_LUT
> > + * - CTM
> > + *
> > + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> > + */
> > +#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
> > +
> > =C2=A0 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
> > =C2=A0 struct drm_set_client_cap {
> > =C2=A0=C2=A0	__u64 capability;
> >=20

--=20
Thanks,

N=C3=ADcolas
