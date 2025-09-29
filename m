Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFDBA9EA7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 18:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131610E462;
	Mon, 29 Sep 2025 16:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="FVF4tF84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68E10E462;
 Mon, 29 Sep 2025 16:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759161649; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lO4XkvatoUXQvbjF88NEo4GQV304NUsNzGnfLfpAGQJACgtdT6ns9sqamBDeq5T3rrLNKdsMf5rTsiniDa3tJWa/86fe0pQYx0iN0L5IDHhkJqeNA7IlkLDk/UNDQjKhz5/8rGOPQljktYtoDkNRPLtpPwyO4kdAEK/YNnxGO5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759161649;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tBhdtn4WywjV8YX0pSLDWDcNcDkRLFjP5hlSSBzqSms=; 
 b=lVLGTmETVkCIP0WKjmObmfrsZtGUq1ZYWjIVjC8VqJrB4aS4A5ggVHhmXiQIREqehiPffKh/8rJAxzL+50geybX9h7y5p84pJK2E31LxkhYaVa87FqJQhD8htU20NLiJWF+HYRbmrJE1EAF17YQXRe/JLlubBSh4bRbsimFGL68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759161648; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=tBhdtn4WywjV8YX0pSLDWDcNcDkRLFjP5hlSSBzqSms=;
 b=FVF4tF848aJT71bWiRy++xWwA9rP30861XDd6VJanlPKxOzcEwMkNT5gxumr/gid
 RGj1Z4ASg6BM+hhQSEj2Bbs32NY8JjgpZsmiJRz05Gpee1bJzyqwggVI8cMSCLp2Era
 LWQsvLIkjLNilz17UTXRFEFBYPa2wjDsDxtsIY4M=
Received: by mx.zohomail.com with SMTPS id 1759161645995986.0060307420077;
 Mon, 29 Sep 2025 09:00:45 -0700 (PDT)
Message-ID: <7307e84f9e4b0a8c67b82f7234f90bf83f201037.camel@collabora.com>
Subject: Re: [PATCH RFC v2 05/20] drm: Introduce
 DRM_CAP_POST_BLEND_COLOR_PIPELINE
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Louis Chauvet	
 <louis.chauvet@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Haneen Mohammed	
 <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, 	contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, 	shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, 
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com, 
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com, 
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com, 
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, 	kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  Simona Vetter
 <simona.vetter@ffwll.ch>
Date: Mon, 29 Sep 2025 12:00:40 -0400
In-Reply-To: <52cce852-f4fb-4692-9318-1602fe878644@amd.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-5-ac4471b44758@collabora.com>
 <ff53599d-fd7f-4791-a3e1-3269386c6b3e@bootlin.com>
 <52cce852-f4fb-4692-9318-1602fe878644@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <7307e84f9e4b0a8c67b82f7234f90bf83f201037.camel@collabora.com>+zmo_0_nfraprado@collabora.com
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

On Mon, 2025-09-29 at 05:40 -0400, Harry Wentland wrote:
>=20
>=20
> On 2025-09-19 08:42, Louis Chauvet wrote:
> >=20
> >=20
> > Le 18/09/2025 =C3=A0 02:43, N=C3=ADcolas F. R. A. Prado a =C3=A9crit=C2=
=A0:
> > > Add a new cap that drivers can set to signal they support post-
> > > blend
> > > color pipelines.
> > >=20
> > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >=20
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >=20
> > > ---
> > > =C2=A0 drivers/gpu/drm/drm_ioctl.c | 3 +++
> > > =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 =
++++++
> > > =C2=A0 include/uapi/drm/drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++++=
+
> > > =C2=A0 3 files changed, 15 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c
> > > b/drivers/gpu/drm/drm_ioctl.c
> > > index=20
> > > ff193155129e7e863888d8958458978566b144f8..01592d10e3465ddceddef94
> > > bc417f98d3ec12087 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev,
> > > void=20
> > > *data, struct drm_file *file_
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->value =3D=
 drm_core_check_feature(dev, DRIVER_ATOMIC)
> > > &&
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.async_page_flip;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case DRM_CAP_POST_BLEND_COLOR_PIPELINE:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->value =3D drm_core_c=
heck_feature(dev,=20
> > > DRIVER_POST_BLEND_COLOR_PIPELINE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index=20
> > > 42fc085f986dee9261f8b08c4fc7d93b8d6d9769..6b0f4904e69766232283d43
> > > 0c2540d30afef850f 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -122,6 +122,12 @@ enum drm_driver_feature {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the cursor planes to work corr=
ectly).
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRIVER_CURSOR_HOTSPOT=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(9),
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRIVER_POST_BLEND_COLOR_PIPELINE:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Driver supports post-blend color pipeline=
.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 DRIVER_POST_BLEND_COLOR_PIPELINE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(10),
>=20
> Is this to let userspace know that the driver supports a
> post-blending color pipeline? Why couldn't userspace simply
> check whether crtc objects have "Color Pipeline" properties?

It is, and yes userspace could figure it out that way, though since the
property is only exposed after the client cap is set, it requires a
more involved setup: set the client cap, check for the property, if not
present unset the client cap.

With the driver cap introduced here, setting the client cap would fail
in the first place if the driver cap is not set, so in this case
userspace just tries to set the client cap, if it succeeds it knows it
can use color pipelines, if it fails it knows to use the legacy color
properties.

--=20
Thanks,

N=C3=ADcolas

>=20
> Harry
>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMPORTANT: Below are all the legacy=
 flags, add new ones=20
> > > above. */
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index=20
> > > 27cc159c1d275c7a7fe057840ef792f30a582bb7..c6c53e57958e951204154ce
> > > 41a69696a6876f0e8 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -812,6 +812,12 @@ struct drm_gem_change_handle {
> > > =C2=A0=C2=A0 * commits.
> > > =C2=A0=C2=A0 */
> > > =C2=A0 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP=C2=A0=C2=A0=C2=A0 0x15
> > > +/**
> > > + * DRM_CAP_POST_BLEND_COLOR_PIPELINE
> > > + *
> > > + * If set to 1, the driver supports post-blend color pipelines.
> > > + */
> > > +#define DRM_CAP_POST_BLEND_COLOR_PIPELINE=C2=A0=C2=A0=C2=A0 0x16
> > > =C2=A0 /* DRM_IOCTL_GET_CAP ioctl argument type */
> > > =C2=A0 struct drm_get_cap {
> > >=20
> >=20
