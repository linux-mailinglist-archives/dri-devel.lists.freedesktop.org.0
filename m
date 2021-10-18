Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E6430D0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 02:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3E86E03D;
	Mon, 18 Oct 2021 00:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608596E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 00:18:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="228096939"
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="228096939"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 17:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,380,1624345200"; d="scan'208";a="549742449"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2021 17:18:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 17:18:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 17:18:50 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Sun, 17 Oct 2021 17:18:50 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC v1 3/6] drm: Add a capability flag to support additional
 flip completion signalling
Thread-Topic: [RFC v1 3/6] drm: Add a capability flag to support additional
 flip completion signalling
Thread-Index: AQHXqPngYzGjW3KPWU2kXibA0bMCf6vS428AgABN/0CAASSKAIADwnFA
Date: Mon, 18 Oct 2021 00:18:50 +0000
Message-ID: <b75575498f8c47759e19ecade2cad7cf@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
 <20210913233529.3194401-4-vivek.kasireddy@intel.com>
 <20211014124402.46f95ebc@eldfell>
 <6a78da70ffab4b35b0e78a1e6570cb59@intel.com>
 <20211015105014.0375d196@eldfell>
In-Reply-To: <20211015105014.0375d196@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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

Hi Pekka,

>=20
> Hi Vivek!
>=20
> > > On Mon, 13 Sep 2021 16:35:26 -0700
> > > Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
> > >
> > > > If a driver supports this capability, it means that there would be =
an
> > > > additional signalling mechanism for a page flip completion in addit=
ion
> > > > to out_fence or DRM_MODE_PAGE_FLIP_EVENT.
> > > >
> > > > This capability may only be relevant for Virtual KMS drivers and is=
 currently
> > > > used only by virtio-gpu. Also, it can provide a potential solution =
for:
> > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> > > >
> > > > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_ioctl.c   | 3 +++
> > > >  include/drm/drm_mode_config.h | 8 ++++++++
> > > >  include/uapi/drm/drm.h        | 1 +
> > > >  3 files changed, 12 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioct=
l.c
> > > > index 8b8744dcf691..8a420844f8bc 100644
> > > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > > @@ -302,6 +302,9 @@ static int drm_getcap(struct drm_device *dev, v=
oid *data,
> struct
> > > drm_file *file_
> > > >  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
> > > >  		req->value =3D 1;
> > > >  		break;
> > > > +	case DRM_CAP_RELEASE_FENCE:
> > > > +		req->value =3D dev->mode_config.release_fence;
> > > > +		break;
> > >
> > > Hi Vivek,
> > >
> > > is this actually necessary?
> > >
> > > I would think that userspace figures out the existence of the release
> > > fence capability by seeing that the KMS property "RELEASE_FENCE_PTR"
> > > either exists or not.
> > [Vivek] Yeah, that makes sense. However, in order for the userspace to =
not see
> > this property, we'd have to prevent drm core from exposing it; which me=
ans we
> > need to check dev->mode_config.release_fence before attaching the prope=
rty
> > to the crtc.
>=20
> Kernel implementation details, I don't bother with those personally. ;-)
>=20
> Sounds right.
>=20
> > >
> > > However, would we not need a client cap instead?
> > >
> > > If a KMS driver knows that userspace is aware of "RELEASE_FENCE_PTR"
> > > and will use it when necessary, then the KMS driver can send the
> > > pageflip completion without waiting for the host OS to signal the old
> > > buffer as free for re-use.
> > [Vivek] Right, the KMS driver can just look at whether the release_fenc=
e was
> > added by the userspace (in the atomic commit) to determine whether it n=
eeds
> > to wait for the old fb.
>=20
> You could do it that way, but is it a good idea? I'm not sure.
>=20
> > > If the KMS driver does not know that userspace can handle pageflip
> > > completing "too early", then it has no choice but to wait until the o=
ld
> > > buffer is really free before signalling pageflip completion.
> > >
> > > Wouldn't that make sense?
> > [Vivek] Yes; DRM_CAP_RELEASE_FENCE may not be necessary to
> > implement the behavior you suggest which makes sense.
> >
> > >
> > >
> > > Otherwise, this proposal sounds fine to me.
> > [Vivek] Did you get a chance to review the Weston MR:
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
> >
> > Could you please take a look?
>=20
> Unfortunately I cannot promise any timely feedback on that, I try to
> concentrate on CM&HDR. However, I'm not the only Weston reviewer, I
> hope.
[Kasireddy, Vivek] I was going to say it's a small patch to review but, ok =
np, I'll
ping Simon or Michel or Daniel.

Thanks,
Vivek
>=20
>=20
> Thanks,
> pq
>=20
> >
> > Thanks,
> > Vivek
> >
> > >
> > >
> > > Thanks,
> > > pq
> > >
> > >
> > > >  	default:
> > > >  		return -EINVAL;
> > > >  	}
> > > > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_c=
onfig.h
> > > > index 12b964540069..944bebf359d7 100644
> > > > --- a/include/drm/drm_mode_config.h
> > > > +++ b/include/drm/drm_mode_config.h
> > > > @@ -935,6 +935,14 @@ struct drm_mode_config {
> > > >  	 */
> > > >  	bool normalize_zpos;
> > > >
> > > > +	/**
> > > > +	 * @release_fence:
> > > > +	 *
> > > > +	 * If this option is set, it means there would be an additional s=
ignalling
> > > > +	 * mechanism for a page flip completion.
> > > > +	 */
> > > > +	bool release_fence;
> > > > +
> > > >  	/**
> > > >  	 * @modifiers_property: Plane property to list support modifier/f=
ormat
> > > >  	 * combination.
> > > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > > index 3b810b53ba8b..8b8985f65581 100644
> > > > --- a/include/uapi/drm/drm.h
> > > > +++ b/include/uapi/drm/drm.h
> > > > @@ -767,6 +767,7 @@ struct drm_gem_open {
> > > >   * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
> > > >   */
> > > >  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> > > > +#define DRM_CAP_RELEASE_FENCE		0x15
> > > >
> > > >  /* DRM_IOCTL_GET_CAP ioctl argument type */
> > > >  struct drm_get_cap {
> >

