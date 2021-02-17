Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C699F31D5E3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 08:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578D189DC2;
	Wed, 17 Feb 2021 07:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD8A89DC2;
 Wed, 17 Feb 2021 07:52:38 +0000 (UTC)
IronPort-SDR: unOzQgIjI+OWgfjvVwUiSVN85dP6CZJHJ5n6Qlct2vrp2EBltaj6uYBJSzx/2AuoV/neypk4dV
 iuZxOjdFAK3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202343655"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202343655"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 23:52:38 -0800
IronPort-SDR: QamDVHfuHKpUWK5Ain2txL+Q+vOWtjCWIdgijbyTI99BJ+fql48HcPVwatT11/sPvPJEX+HWqJ
 vIzZ5t+1B0ew==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="493911989"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 23:52:36 -0800
Date: Wed, 17 Feb 2021 09:52:33 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gen9bc: Handle TGP PCH during
 suspend/resume
Message-ID: <20210217075233.GA443835@ideak-desk.fi.intel.com>
References: <20210212185053.1689716-1-lyude@redhat.com>
 <20210216180825.GA420119@ideak-desk.fi.intel.com>
 <de45c8434b35ba9c712edf615bea4f86131aaf1a.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de45c8434b35ba9c712edf615bea4f86131aaf1a.camel@redhat.com>
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
Reply-To: imre.deak@intel.com
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 09:36:01PM -0500, Lyude Paul wrote:
> On Tue, 2021-02-16 at 20:08 +0200, Imre Deak wrote:
> > Hi,
> > =

> > thanks for respinning this patchset, some comments below.
> > =

> > On Fri, Feb 12, 2021 at 01:50:53PM -0500, Lyude Paul wrote:
> > > From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > =

> > > For Legacy S3 suspend/resume GEN9 BC needs to enable and
> > > setup TGP PCH.
> > > =

> > > v2:
> > > * Move Wa_14010685332 into it's own function - vsyrjala
> > > * Add TODO comment about figuring out if we can move this workaround =
- imre
> > > =

> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@int=
el.com>
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > > =A0drivers/gpu/drm/i915/i915_irq.c | 53 ++++++++++++++++++++++-------=
----
> > > =A01 file changed, 36 insertions(+), 17 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/i915_irq.c
> > > b/drivers/gpu/drm/i915/i915_irq.c
> > > index 98145a7f28a4..7d912aa950ee 100644
> > > --- a/drivers/gpu/drm/i915/i915_irq.c
> > > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > > @@ -3040,6 +3040,19 @@ static void valleyview_irq_reset(struct
> > > drm_i915_private *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0spin_unlock_irq(&dev_priv->irq_lock);
> > > =A0}
> > > =A0
> > > +static void cnp_irq_post_reset(struct drm_i915_private *dev_priv)
> > =

> > Maybe a better name is cnp_display_clock_wa.
> > =

> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct intel_uncore *uncore =3D &dev_priv->unco=
re;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/*
> > > +=A0=A0=A0=A0=A0=A0=A0 * Wa_14010685332:cnp/cmp,tgp,adp
> > =

> > Bspec says this WA applies ICL onwards and it's not PCH specific, for
> > instance I haven't found the GEN9/CNP/CMP WA entries for it. Please also
> > add a 'clarify platforms where this applies' todo item.
> > =

> > > +=A0=A0=A0=A0=A0=A0=A0 * TODO: Figure out if this workaround can be a=
pplied in the s0ix
> > > suspend/resume handlers as
> > > +=A0=A0=A0=A0=A0=A0=A0 * on earlier platforms and whether the workaro=
und is also needed
> > > for runtime suspend/resume
> > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_=
RUN_REFCLK_DIS,
> > > SBCLK_RUN_REFCLK_DIS);
> > > +=A0=A0=A0=A0=A0=A0=A0intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_=
RUN_REFCLK_DIS, 0);
> > > +}
> > > +
> > > =A0static void gen8_irq_reset(struct drm_i915_private *dev_priv)
> > > =A0{
> > > =A0=A0=A0=A0=A0=A0=A0=A0struct intel_uncore *uncore =3D &dev_priv->un=
core;
> > > @@ -3061,8 +3074,14 @@ static void gen8_irq_reset(struct drm_i915_pri=
vate
> > > *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_RESET(uncore, GEN8_DE_MISC_);
> > > =A0=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_RESET(uncore, GEN8_PCU_);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0if (HAS_PCH_SPLIT(dev_priv))
> > > +=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> > =

> > It was mentioned already earlier, why is this check necessary and can't=
 we
> > just call ibx_irq_reset() for all PCHs?
> > =

> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_RESET(uncore, =
SDE);
> > > +=A0=A0=A0=A0=A0=A0=A0else if (HAS_PCH_SPLIT(dev_priv))
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ibx_irq_reset(dev_pri=
v);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) =3D=3D PCH_CNP ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (INTEL_PCH_TYPE(dev_priv) >=3D PCH_TG=
P && INTEL_PCH_TYPE(dev_priv)
> > > < PCH_DG1))
> > =

> > The check could be also moved to the helper.
> > =

> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0cnp_irq_post_reset(dev_=
priv);
> > > =A0}
> > > =A0
> > > =A0static void gen11_display_irq_reset(struct drm_i915_private *dev_p=
riv)
> > > @@ -3104,15 +3123,9 @@ static void gen11_display_irq_reset(struct
> > > drm_i915_private *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_RESET(uncore=
, SDE);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0/* Wa_14010685332:cnp/cmp,tgp,adp */
> > > =A0=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) =3D=3D PCH_CNP ||
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (INTEL_PCH_TYPE(dev_priv) >=3D PCH_TG=
P &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 INTEL_PCH_TYPE(dev_priv) < PCH_DG1=
)) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0intel_uncore_rmw(uncore=
, SOUTH_CHICKEN1,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 SBCLK_RUN_REFCLK_DIS,
> > > SBCLK_RUN_REFCLK_DIS);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0intel_uncore_rmw(uncore=
, SOUTH_CHICKEN1,
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 SBCLK_RUN_REFCLK_DIS, 0);
> > > -=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (INTEL_PCH_TYPE(dev_priv) >=3D PCH_TG=
P && INTEL_PCH_TYPE(dev_priv)
> > > < PCH_DG1))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0cnp_irq_post_reset(dev_=
priv);
> > > =A0}
> > > =A0
> > > =A0static void gen11_irq_reset(struct drm_i915_private *dev_priv)
> > > @@ -3474,6 +3487,9 @@ static void spt_hpd_irq_setup(struct drm_i915_p=
rivate
> > > *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0ibx_display_interrupt_update(dev_priv, hotplu=
g_irqs, enabled_irqs);
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0spt_hpd_detection_setup(dev_priv);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0icp_hpd_irq_setup(dev_p=
riv);
> > =

> > This doesn't look correct, icp_hpd_irq_setup() redoes the interrupt
> > setup done already earlier in this function and
> > spt_hpd_detection_setup() is probably also not correct on ICP+. Looks
> > like for ICP+ we need to call icp_hpd_irq_setup() instead of
> > spt_hpd_irq_setup(), but haven't checked in detail.
> =

> Could you please check :)? I don't work at Intel so you have far more acc=
ess to
> this information then I do.=A0
> =

> FWIW the code -looks- mostly equivalent to me (SHOTPLUG_CTL_DDI and
> SHOTPLUG_CTL_TC seem to be equivalent registers to what's set in
> spt_hpd_irq_setup()), but the icelake point codepath enables an additiona=
l port,
> and changes an additional register called SHPD_FILTER_CNT.

The register definitions for SHOTPLUG_CTL_DDI wrt. PCH_PORT_HOTPLUG and
SHOTPLUG_CTL_TC wrt. PCH_PORT_HOTPLUG2 are different even though their
addresses match.

> I'll update it to use this in the next patch, but please definitely
> confirm this. I would very much like to avoid potentially breaking
> unrelated ICP systems with this.
> =

> > =

> > > =A0}
> > > =A0
> > > =A0static u32 ilk_hotplug_enables(struct drm_i915_private *i915,
> > > @@ -3764,9 +3780,19 @@ static void gen8_de_irq_postinstall(struct
> > > drm_i915_private *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0}
> > > =A0
> > > +static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct intel_uncore *uncore =3D &dev_priv->unco=
re;
> > > +=A0=A0=A0=A0=A0=A0=A0u32 mask =3D SDE_GMBUS_ICP;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> > > +}
> > > +
> > > =A0static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
> > > =A0{
> > > -=A0=A0=A0=A0=A0=A0=A0if (HAS_PCH_SPLIT(dev_priv))
> > > +=A0=A0=A0=A0=A0=A0=A0if (INTEL_PCH_TYPE(dev_priv) >=3D PCH_ICP)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0icp_irq_postinstall(dev=
_priv);
> > > +=A0=A0=A0=A0=A0=A0=A0else if (HAS_PCH_SPLIT(dev_priv))
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ibx_irq_postinstall(d=
ev_priv);
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0gen8_gt_irq_postinstall(&dev_priv->gt);
> > > @@ -3775,13 +3801,6 @@ static void gen8_irq_postinstall(struct
> > > drm_i915_private *dev_priv)
> > > =A0=A0=A0=A0=A0=A0=A0=A0gen8_master_intr_enable(dev_priv->uncore.regs=
);
> > > =A0}
> > > =A0
> > > -static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
> > > -{
> > > -=A0=A0=A0=A0=A0=A0=A0struct intel_uncore *uncore =3D &dev_priv->unco=
re;
> > > -=A0=A0=A0=A0=A0=A0=A0u32 mask =3D SDE_GMBUS_ICP;
> > > -
> > > -=A0=A0=A0=A0=A0=A0=A0GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
> > > -}
> > > =A0
> > > =A0static void gen11_irq_postinstall(struct drm_i915_private *dev_pri=
v)
> > > =A0{
> > > -- =

> > > 2.29.2
> > > =

> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > =

> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
