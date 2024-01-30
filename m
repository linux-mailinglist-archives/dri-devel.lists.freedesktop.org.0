Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F336842153
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7D510EB3F;
	Tue, 30 Jan 2024 10:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAF610EB3F;
 Tue, 30 Jan 2024 10:32:32 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlPq-00000001Y1m-1cUr; Tue, 30 Jan 2024 12:32:30 +0200
Message-ID: <f44943cf03cc3c5ead1db44400a76322b835175e.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:32:29 +0200
In-Reply-To: <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 09/10] drm/xe: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Prefer the device specific debug printer.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c          | 2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
>  drivers/gpu/drm/xe/xe_reg_sr.c      | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0f2258dc4a00..16481f9b3125 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -327,7 +327,7 @@ static void dump_pat_on_error(struct xe_gt *gt)
>  	char prefix[32];
> =20
>  	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
> -	p =3D drm_debug_printer(prefix);
> +	p =3D drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
> =20
>  	xe_pat_dump(gt, &p);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_=
gt_topology.c
> index a8d7f272c30a..5dc62fe1be49 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -84,7 +84,7 @@ void
>  xe_gt_topology_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> -	struct drm_printer p =3D drm_debug_printer("GT topology");
> +	struct drm_printer p;
>  	int num_geometry_regs, num_compute_regs;
> =20
>  	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
> @@ -107,6 +107,8 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> =20
> +	p =3D drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology")=
;
> +

I'm not sure there was a specific reason to move the initialization out
of the declaration, but it's probably a bit cleaner and more aligned
with other places...


>  	xe_gt_topology_dump(gt, &p);
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_s=
r.c
> index 87adefb56024..440ac572f6e5 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -231,7 +231,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *h=
we)
>  	if (err)
>  		goto err_force_wake;
> =20
> -	p =3D drm_debug_printer(KBUILD_MODNAME);
> +	p =3D drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
>  			xe_gt_err(gt,


Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
