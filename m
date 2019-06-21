Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F04E1CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 10:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14FD6E835;
	Fri, 21 Jun 2019 08:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432AC6E835
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 08:21:14 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 60E4A1C0006;
 Fri, 21 Jun 2019 08:21:07 +0000 (UTC)
Date: Fri, 21 Jun 2019 10:22:22 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
Message-ID: <20190621082222.4j3oghm7oevgt32n@uno.localdomain>
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-3-ezequiel@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190618213406.7667-3-ezequiel@collabora.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============0651840699=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0651840699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="idwq5rt32qaze3qf"
Content-Disposition: inline


--idwq5rt32qaze3qf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ezequiel,
   just a few minor comments. Thanks for this new iteration.

On Tue, Jun 18, 2019 at 06:34:05PM -0300, Ezequiel Garcia wrote:
> Add an optional CRTC gamma LUT support, and enable it on RK3288.
> This is currently enabled via a separate address resource,
> which needs to be specified in the devicetree.
>
> The address resource is required because on some SoCs, such as
> RK3288, the LUT address is after the MMU address, and the latter
> is supported by a different driver. This prevents the DRM driver
> from requesting an entire register space.
>
> The current implementation works for RGB 10-bit tables, as that
> is what seems to work on RK3288.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes from RFC:
> * Request (an optional) address resource for the LUT.
> * Drop support for RK3399, which doesn't seem to work
>   out of the box and needs more research.
> * Support pass-thru setting when GAMMA_LUT is NULL.
> * Add a check for the gamma size, as suggested by Ilia.
> * Move gamma setting to atomic_commit_tail, as pointed
>   out by Jacopo/Laurent, is the correct way.
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |   3 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 106 ++++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |   7 ++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c |   2 +
>  4 files changed, 118 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 1c69066b6894..bf9ad6240971 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -16,6 +16,7 @@
>  #include "rockchip_drm_fb.h"
>  #include "rockchip_drm_gem.h"
>  #include "rockchip_drm_psr.h"
> +#include "rockchip_drm_vop.h"
>
>  static int rockchip_drm_fb_dirty(struct drm_framebuffer *fb,
>  				 struct drm_file *file,
> @@ -128,6 +129,8 @@ rockchip_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
>
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>
> +	rockchip_drm_vop_gamma_set(old_state);
> +
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>
>  	drm_atomic_helper_commit_planes(dev, old_state,
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index 12ed5265a90b..5b6edbe2673f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -137,6 +137,7 @@ struct vop {
>
>  	uint32_t *regsbak;
>  	void __iomem *regs;
> +	void __iomem *lut_regs;
>
>  	/* physical map length of vop register */
>  	uint32_t len;
> @@ -1153,6 +1154,94 @@ static void vop_wait_for_irq_handler(struct vop *vop)
>  	synchronize_irq(vop->irq);
>  }
>
> +static bool vop_dsp_lut_is_enable(struct vop *vop)
> +{
> +	return vop_read_reg(vop, 0, &vop->data->common->dsp_lut_en);
> +}
> +
> +static void vop_crtc_write_gamma_lut(struct vop *vop, struct drm_crtc *crtc)
> +{
> +	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
> +	int i;

unsigned i

> +
> +	for (i = 0; i < crtc->gamma_size; i++) {
> +		u32 word;

here and below you could declare and initialize in one line. Matter of
tastes, up to you.

> +
> +		word = (drm_color_lut_extract(lut[i].red, 10) << 20) |
> +		       (drm_color_lut_extract(lut[i].green, 10) << 10) |
> +			drm_color_lut_extract(lut[i].blue, 10);
> +		writel(word, vop->lut_regs + i * 4);
> +	}
> +}
> +
> +static void vop_crtc_gamma_set(struct vop *vop, struct drm_crtc *crtc,
> +			       struct drm_crtc_state *old_state)
> +{
> +	int idle, ret, i;

idle and i could be unsigned

> +
> +	spin_lock(&vop->reg_lock);
> +	VOP_REG_SET(vop, common, dsp_lut_en, 0);
> +	vop_cfg_done(vop);
> +	spin_unlock(&vop->reg_lock);
> +
> +	ret = readx_poll_timeout(vop_dsp_lut_is_enable, vop,
> +			   idle, !idle, 5, 30 * 1000);
> +	if (ret)
> +		return;
> +
> +	spin_lock(&vop->reg_lock);
> +
> +	if (crtc->state->gamma_lut) {
> +		if (!old_state->gamma_lut || (crtc->state->gamma_lut->base.id !=
> +					      old_state->gamma_lut->base.id))
> +			vop_crtc_write_gamma_lut(vop, crtc);
> +	} else {

i could also be declared here...

> +		for (i = 0; i < crtc->gamma_size; i++) {
> +			u32 word;
> +
> +			word = (i << 20) | (i << 10) | i;
> +			writel(word, vop->lut_regs + i * 4);
> +		}

I might be confused, but are you here configuring a linear LUT table?
Isn't this equivalent to have it disabled?

> +	}
> +
> +	VOP_REG_SET(vop, common, dsp_lut_en, 1);
> +	vop_cfg_done(vop);
> +	spin_unlock(&vop->reg_lock);
> +}
> +
> +static int vop_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *crtc_state)
> +{
> +	struct vop *vop = to_vop(crtc);
> +
> +	if (vop->lut_regs && crtc_state->color_mgmt_changed &&
> +	    crtc_state->gamma_lut) {
> +		int len;
> +
> +		len = drm_color_lut_size(crtc_state->gamma_lut);
> +		if (len != crtc->gamma_size) {

Don't you accept LUT tables whose size is < that the maximum
crtc->gamma_size ?

> +			DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> +				      len, crtc->gamma_size);
> +			return -EINVAL;
> +		}
> +	}

Most (but not all) functions in this file have an empty line before the
return closing the function.

> +	return 0;
> +}
> +
> +void rockchip_drm_vop_gamma_set(struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_crtc *crtc;
> +	int i;

unsigned i ?

I'm glad you've been able to verify atomic_flush was not the right
place where to update the LUT tables, as my testing is limited to
run kms++ tests and I didn't notice any particular artifact. Thanks
for checking!


> +
> +	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
> +		struct vop *vop = to_vop(crtc);
> +
> +		if (vop->lut_regs && crtc->state->color_mgmt_changed)
> +			vop_crtc_gamma_set(vop, crtc, old_crtc_state);
> +	}
> +}
> +
>  static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>  				  struct drm_crtc_state *old_crtc_state)
>  {
> @@ -1205,6 +1294,7 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
>
>  static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
>  	.mode_fixup = vop_crtc_mode_fixup,
> +	.atomic_check = vop_crtc_atomic_check,
>  	.atomic_flush = vop_crtc_atomic_flush,
>  	.atomic_enable = vop_crtc_atomic_enable,
>  	.atomic_disable = vop_crtc_atomic_disable,
> @@ -1323,6 +1413,7 @@ static const struct drm_crtc_funcs vop_crtc_funcs = {
>  	.disable_vblank = vop_crtc_disable_vblank,
>  	.set_crc_source = vop_crtc_set_crc_source,
>  	.verify_crc_source = vop_crtc_verify_crc_source,
> +	.gamma_set = drm_atomic_helper_legacy_gamma_set,
>  };
>
>  static void vop_fb_unref_worker(struct drm_flip_work *work, void *val)
> @@ -1480,6 +1571,10 @@ static int vop_create_crtc(struct vop *vop)
>  		goto err_cleanup_planes;
>
>  	drm_crtc_helper_add(crtc, &vop_crtc_helper_funcs);
> +	if (vop_data->lut_size) {
> +		drm_mode_crtc_set_gamma_size(crtc, vop_data->lut_size);
> +		drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size);
> +	}
>
>  	/*
>  	 * Create drm_planes for overlay windows with possible_crtcs restricted
> @@ -1776,6 +1871,17 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
>  	if (IS_ERR(vop->regs))
>  		return PTR_ERR(vop->regs);
>
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lut");
> +	if (res) {
> +		if (!vop_data->lut_size) {
> +			DRM_DEV_ERROR(dev, "no gamma LUT size defined\n");
> +			return -EINVAL;
> +		}
> +		vop->lut_regs = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(vop->lut_regs))
> +			return PTR_ERR(vop->lut_regs);
> +	}
> +
>  	vop->regsbak = devm_kzalloc(dev, vop->len, GFP_KERNEL);
>  	if (!vop->regsbak)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index 2149a889c29d..bd1bcd5a14e9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -7,6 +7,8 @@
>  #ifndef _ROCKCHIP_DRM_VOP_H
>  #define _ROCKCHIP_DRM_VOP_H
>
> +#include <drm/drm_atomic.h>
> +
>  /*
>   * major: IP major version, used for IP structure
>   * minor: big feature change under same structure
> @@ -67,6 +69,7 @@ struct vop_common {
>  	struct vop_reg dither_down_mode;
>  	struct vop_reg dither_down_en;
>  	struct vop_reg dither_up;
> +	struct vop_reg dsp_lut_en;
>  	struct vop_reg gate_en;
>  	struct vop_reg mmu_en;
>  	struct vop_reg out_mode;
> @@ -170,6 +173,7 @@ struct vop_data {
>  	const struct vop_win_yuv2yuv_data *win_yuv2yuv;
>  	const struct vop_win_data *win;
>  	unsigned int win_size;
> +	unsigned int lut_size;
>
>  #define VOP_FEATURE_OUTPUT_RGB10	BIT(0)
>  #define VOP_FEATURE_INTERNAL_RGB	BIT(1)
> @@ -373,4 +377,7 @@ static inline int scl_vop_cal_lb_mode(int width, bool is_yuv)
>  }
>
>  extern const struct component_ops vop_component_ops;
> +
> +void rockchip_drm_vop_gamma_set(struct drm_atomic_state *state);
> +
>  #endif /* _ROCKCHIP_DRM_VOP_H */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index 7b9c74750f6d..30d49eff3670 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -593,6 +593,7 @@ static const struct vop_common rk3288_common = {
>  	.dither_down_en = VOP_REG(RK3288_DSP_CTRL1, 0x1, 2),
>  	.pre_dither_down = VOP_REG(RK3288_DSP_CTRL1, 0x1, 1),
>  	.dither_up = VOP_REG(RK3288_DSP_CTRL1, 0x1, 6),
> +	.dsp_lut_en = VOP_REG(RK3288_DSP_CTRL1, 0x1, 0),
>  	.data_blank = VOP_REG(RK3288_DSP_CTRL0, 0x1, 19),
>  	.dsp_blank = VOP_REG(RK3288_DSP_CTRL0, 0x3, 18),
>  	.out_mode = VOP_REG(RK3288_DSP_CTRL0, 0xf, 0),
> @@ -641,6 +642,7 @@ static const struct vop_data rk3288_vop = {
>  	.output = &rk3288_output,
>  	.win = rk3288_vop_win_data,
>  	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
> +	.lut_size = 1024,
>  };
>
>  static const int rk3368_vop_intrs[] = {
> --
> 2.20.1
>

--idwq5rt32qaze3qf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0Mk74ACgkQcjQGjxah
VjwF7xAArrs95MgtbrsJ7VWb0XwM5Mpw42oM+y34c7di9P06kR89XHy+Q/hXAx2z
UIa7Hv9rT+Uj4EMO9VWsNpaLSHYIbJwtx/L2z71yTyisev9qgUog3U/aUU8iHihp
gnrgZGj7Q+kIGEs0Sq0OL5q7l39znI1+/72fJT4GkecASAkgoX0WPZWnr/+fK+qQ
iOUFCdpK2w0V4PHpC3tux/9fw+NL7BoB6yT/jZeoNp06LKpuTyr/3up4lOPLiKpj
tYXmrD891EjZUAiOqb3vsLD26UOoPuYmKPXuAlK74cf/9RRkgys2cCoFI8MA/7Et
zv3Z0UaADiPSbAQmXmThdcIOqC97gmBCRVYHpga9sfkIdHPe4PAwsqHHb1GWtmv1
uFPqzSoXE41aPGP3vPwiKFtJ5q+QfmgOhsj65fx6YcC58j87n6ZAxKto84S29out
jAnxkzPNeK0WnjfcvE8FiunZmbC1NGYuoPK/IHdw++2Cra1x6/3p7FKlFR0kDB8/
4C+mlnHPayxdk85ZEEGby8FyVP9qB3gRtvmlABXMUEguprOOPxAvBJ7j/xVM+NWH
cAxlsEUF23NH8ypFH7hWCx+BDlaCIpgpDLjvriRdlQsKrbdf9vyCFqL5Rj8fVGuO
CYbd5FHEp0nDFjfMEfbzlttYOGVcdKGxbnZ4ndzjsge2dQJq3cw=
=9VG0
-----END PGP SIGNATURE-----

--idwq5rt32qaze3qf--

--===============0651840699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0651840699==--
