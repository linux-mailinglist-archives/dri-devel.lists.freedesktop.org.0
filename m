Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8EC99F62
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 21:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A486EA34;
	Thu, 22 Aug 2019 19:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE26EA34
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:08:04 +0000 (UTC)
Received: from uno.localdomain (unknown [87.18.63.98])
 (Authenticated sender: jacopo@jmondi.org)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C9B8E200003;
 Thu, 22 Aug 2019 19:07:57 +0000 (UTC)
Date: Thu, 22 Aug 2019 21:09:26 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 16/19] drm: rcar-du: kms: Collect CMM instances
Message-ID: <20190822190926.t2dm7nbaagnxgvns@uno.localdomain>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-17-jacopo+renesas@jmondi.org>
 <20190820175457.GJ10820@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190820175457.GJ10820@pendragon.ideasonboard.com>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: multipart/mixed; boundary="===============1754681933=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1754681933==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7zzvgsrbklkt3dp5"
Content-Disposition: inline


--7zzvgsrbklkt3dp5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Aug 20, 2019 at 08:54:57PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Sat, Jul 06, 2019 at 04:07:43PM +0200, Jacopo Mondi wrote:
> > Implement device tree parsing to collect the available CMM instances
> > described by the 'cmms' property. Associate CMMs with CRTCs and store a
> > mask of active CMMs in the DU group for later enablement.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  6 +++
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  3 ++
> >  drivers/gpu/drm/rcar-du/rcar_du_group.h |  2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 50 +++++++++++++++++++++++++
> >  5 files changed, 63 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index 2da46e3dc4ae..23f1d6cc1719 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -1194,6 +1194,12 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> >  	if (ret < 0)
> >  		return ret;
> >
> > +	/* CMM might be disabled for this CRTC. */
> > +	if (rcdu->cmms[swindex]) {
> > +		rcrtc->cmm = rcdu->cmms[swindex];
> > +		rgrp->cmms_mask |= BIT(hwindex % 2);
> > +	}
> > +
> >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> >
> >  	/* Start with vertical blanking interrupt reporting disabled. */
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > index 3b7fc668996f..5f2940c42225 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > @@ -39,6 +39,7 @@ struct rcar_du_vsp;
> >   * @vblank_wait: wait queue used to signal vertical blanking
> >   * @vblank_count: number of vertical blanking interrupts to wait for
> >   * @group: CRTC group this CRTC belongs to
> > + * @cmm: CMM associated with this CRTC
> >   * @vsp: VSP feeding video to this CRTC
> >   * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
> >   * @writeback: the writeback connector
> > @@ -64,6 +65,7 @@ struct rcar_du_crtc {
> >  	unsigned int vblank_count;
> >
> >  	struct rcar_du_group *group;
> > +	struct platform_device *cmm;
> >  	struct rcar_du_vsp *vsp;
> >  	unsigned int vsp_pipe;
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > index a00dccc447aa..300ec60ba31b 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > @@ -13,6 +13,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/wait.h>
> >
> > +#include "rcar_cmm.h"
> >  #include "rcar_du_crtc.h"
> >  #include "rcar_du_group.h"
> >  #include "rcar_du_vsp.h"
> > @@ -70,6 +71,7 @@ struct rcar_du_device_info {
> >
> >  #define RCAR_DU_MAX_CRTCS		4
> >  #define RCAR_DU_MAX_GROUPS		DIV_ROUND_UP(RCAR_DU_MAX_CRTCS, 2)
> > +#define RCAR_DU_MAX_CMMS		4
> >  #define RCAR_DU_MAX_VSPS		4
> >
> >  struct rcar_du_device {
> > @@ -86,6 +88,7 @@ struct rcar_du_device {
> >  	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
> >
> >  	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
> > +	struct platform_device *cmms[RCAR_DU_MAX_CMMS];
> >  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
> >
> >  	struct {
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> > index 87950c1f6a52..b0c1466593a3 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> > @@ -22,6 +22,7 @@ struct rcar_du_device;
> >   * @mmio_offset: registers offset in the device memory map
> >   * @index: group index
> >   * @channels_mask: bitmask of populated DU channels in this group
> > + * @cmms_mask: bitmask of enabled CMMs in this group
>
> enabled or available ?
>

I considered having a 'cmm' entry in DT as enabling it, but it is
actually just available.

> >   * @num_crtcs: number of CRTCs in this group (1 or 2)
> >   * @use_count: number of users of the group (rcar_du_group_(get|put))
> >   * @used_crtcs: number of CRTCs currently in use
> > @@ -37,6 +38,7 @@ struct rcar_du_group {
> >  	unsigned int index;
> >
> >  	unsigned int channels_mask;
> > +	unsigned int cmms_mask;
> >  	unsigned int num_crtcs;
> >  	unsigned int use_count;
> >  	unsigned int used_crtcs;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index f8f7fff34dff..b79cda2f5531 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -18,6 +18,7 @@
> >  #include <drm/drm_vblank.h>
> >
> >  #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/wait.h>
> >
> >  #include "rcar_du_crtc.h"
> > @@ -534,6 +535,51 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> >  	return ret;
> >  }
> >
> > +static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
> > +{
> > +	const struct device_node *np = rcdu->dev->of_node;
> > +	unsigned int i;
> > +	int cells;
> > +
> > +	cells = of_property_count_u32_elems(np, "cmms");
> > +	if (cells == -EINVAL)
> > +		return 0;
> > +
> > +	if (cells > RCAR_DU_MAX_CMMS || cells > rcdu->num_crtcs) {
>
> Should this be
>
> 	if (cells != rcdu->num_crtcs)
>
> or do we want to support cases where not all DU channels have a CMM in
> DT ?
>

That was my idea yes, but I'm not sure it makes sense, as ideally CMM
should be specified in DT for all SoC that provides it.

> > +		dev_err(rcdu->dev, "Invalid 'cmms' property format\n");
>
> How about "Invalid number of entries in 'cmms' property" ?
>

Ok

> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < cells; ++i) {
> > +		struct platform_device *pdev;
> > +		struct device_node *cmm;
> > +
> > +		cmm = of_parse_phandle(np, "cmms", i);
> > +		if (IS_ERR(cmm)) {
> > +			dev_err(rcdu->dev, "Failed to parse 'cmms' property\n");
> > +			return PTR_ERR(cmm);
> > +		}
> > +
> > +		pdev = of_find_device_by_node(cmm);
> > +		if (IS_ERR(pdev)) {
> > +			dev_err(rcdu->dev, "No device found for cmms[%u]\n", i);
>
> s/cmms[%u]/CMM%u/ ?
>
> > +			of_node_put(cmm);
> > +			return PTR_ERR(pdev);
> > +		}
> > +
> > +		if (!of_device_is_available(cmm)) {
>
> Should this come before the pdev check, as there will be no pdev in that
> case ?
>

No pdev if the device is not enabled in DT ? Anyway, yes, I could move
it up and save retrieving pdev in case the device is not available.

> > +			/* It's fine to have a phandle to a non-enabled CMM. */
> > +			of_node_put(cmm);
> > +			continue;
> > +		}
> > +
> > +		of_node_put(cmm);
> > +		rcdu->cmms[i] = pdev;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> >  {
> >  	static const unsigned int mmio_offsets[] = {
> > @@ -624,6 +670,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> >  			return ret;
> >  	}
> >
> > +	/* Initialize the Color Management Modules. */
> > +	if (rcar_du_cmm_init(rcdu))
> > +		return ret;
>
> 	ret = rcar_du_cmm_init(rcdu);
> 	if (ret < 0)
> 		return ret;
>

Ups, this was probably returning void in some earlier version and I
failed to assign it properly, thanks for spotting this!

Thanks
   j

> > +
> >  	/* Create the CRTCs. */
> >  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
> >  		struct rcar_du_group *rgrp;
>
> --
> Regards,
>
> Laurent Pinchart

--7zzvgsrbklkt3dp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1e6GYACgkQcjQGjxah
VjwpSRAAqbRBAhf5TvtYJGIhFWGdX/7+Fpew/lO+mMRddCMuHayg4x5mOUha1uEF
fa/r10CcLslXPMZZoiCRbY6V69p6jGu8vBk0MSTVrf0WfoFjb4I1kS1RGCSRXHcG
yC/7LklOldH+w0m0XGd5w0EhMnbz/1Dj74rIINKMkOUYoLF3BxbQ9WKZEQO6r4lj
pFNgFdRYS/soViJUUVEoirEdiU9cNLlHmREn0csxGCu5HErQHdO7/uFKQxtfkaZT
wQzBbyZ4eYSf9nenWVD6BbET6AD+rGetQCtQgr8T6sKtuMA/Hc0dJvxG3bfrkFPZ
/QOiXUzYFoSBPv1ETVeLFs0agMXl3Za9xtGmEvVbee+C3Fk0NRiF023lZOy8pdti
SCzQ2DgInFcTxMmV6S3NxysUS7Z5oaIPWN5mGNDWwmw0ZDdjfWtBXk3sWonPSYFF
L/aBWri6cxbi1rJ8iMzYZI6izIbQ+xvILN3hpGYVpHD/0lZJpFnkmxa9IC/HieII
HgTs+pd5ddp3lJpFBovYqV8vr+26uv/fEU65DiOsp5HlBYnDkw+tfA4W3OYp1Y2o
E41HQABh7QbvxS/+ZPjV+oNnMA4jVe3m/Jc+MVAso3UhLejVJ4uDmM5hH0thMSFx
8NzUEvDecuCHjJD6pXOEi2AT/Pr6yOrTomXeMam4p0P58pW+YCc=
=4RUV
-----END PGP SIGNATURE-----

--7zzvgsrbklkt3dp5--

--===============1754681933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1754681933==--
