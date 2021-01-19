Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874C2FBB99
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 16:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728E06E415;
	Tue, 19 Jan 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E75F6E413;
 Tue, 19 Jan 2021 15:50:47 +0000 (UTC)
IronPort-SDR: uQnNiE7panLhHPnFBZRVSPfLUJyannUcf7pAScFxBdSsikuq7oBkyzK5F0KxmhMr57h3gFXM1i
 111NC0AEanvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="263756446"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="263756446"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 07:50:47 -0800
IronPort-SDR: QcFo4LTPse8p65jCI8icg2cawYnEk2WuYQDw7YoWRjgZBd2Vxl0ZkS2skRF+nxz19/qEY1j5X1
 hbUSo2wp7itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="383982855"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 19 Jan 2021 07:50:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Jan 2021 17:50:42 +0200
Date: Tue, 19 Jan 2021 17:50:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format modifiers
 for cursor planes
Message-ID: <YAb/0urUmEg5kd3C@intel.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119015415.2511028-1-lyude@redhat.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 08:54:12PM -0500, Lyude Paul wrote:
> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.

There are a couple of old modifier/format sanity tests here:
https://patchwork.freedesktop.org/series/46876/

Couple of things missing that now came to my mind:
- test setplane/etc. rejects unsupported formats/modifiers even if
  addfb allowed them, exactly for the case where only a subset of
  planes support something
- validate the IN_FORMATS blob harder, eg. make sure each modifier
  listed there supports at least one format. IIRC this was busted on
  a few drivers last year, dunno if they got fixed or not. Hmm,
  actually since this is now using the pre-parsed stuff I guess we
  should just stick an assert into igt_fill_plane_format_mod() where
  the blob gets parsed

> =

> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/n=
vdisp")
> Cc: James Jones <jajones@nvidia.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
> index ce451242f79e..271de3a63f21 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -702,6 +702,11 @@ nv50_wndw_init(struct nv50_wndw *wndw)
>  	nvif_notify_get(&wndw->notify);
>  }
>  =

> +static const u64 nv50_cursor_format_modifiers[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
>  int
>  nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
>  	       enum drm_plane_type type, const char *name, int index,
> @@ -713,6 +718,7 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, str=
uct drm_device *dev,
>  	struct nvif_mmu *mmu =3D &drm->client.mmu;
>  	struct nv50_disp *disp =3D nv50_disp(dev);
>  	struct nv50_wndw *wndw;
> +	const u64 *format_modifiers;
>  	int nformat;
>  	int ret;
>  =

> @@ -728,10 +734,13 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, s=
truct drm_device *dev,
>  =

>  	for (nformat =3D 0; format[nformat]; nformat++);
>  =

> -	ret =3D drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw,
> -				       format, nformat,
> -				       nouveau_display(dev)->format_modifiers,
> -				       type, "%s-%d", name, index);
> +	if (type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		format_modifiers =3D nv50_cursor_format_modifiers;
> +	else
> +		format_modifiers =3D nouveau_display(dev)->format_modifiers;
> +
> +	ret =3D drm_universal_plane_init(dev, &wndw->plane, heads, &nv50_wndw, =
format, nformat,
> +				       format_modifiers, type, "%s-%d", name, index);
>  	if (ret) {
>  		kfree(*pwndw);
>  		*pwndw =3D NULL;
> -- =

> 2.29.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
