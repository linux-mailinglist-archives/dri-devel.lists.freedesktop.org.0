Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D85A3E43E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 19:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409E10E9D0;
	Thu, 20 Feb 2025 18:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FU6skx2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96F110E9C9;
 Thu, 20 Feb 2025 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740077493; x=1771613493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z39+IBN2Bjzu5vOO/ZIVE50F5KbWO8HR67wvJ5j1Q0E=;
 b=FU6skx2oYJNi/JLefodj5dHFnSb8Q7ActqZBNpt9Arvwt+eOFkmw59tv
 GK5vDFqO2AXk9JitA/YVy5j/BYsTNr+BWqb35MO3G2Rcf8eAWS88A85WG
 KTCAtklADmnJj2mOYwcSDiKrVCfyO2da0S/OezmL3IQiKUNnQ6pfWtcGW
 NKF4XnFEuO/D35GV98goKyJIvvotUksm+jzOb2yeazRW/Jk4GUA3WreYd
 k4sezZvtOigEVq0PxYr0yAxiuAPAcOZ+CF16eK1teJmU3ptxNkxqxm9pb
 HbqT2iQRzleVxXapPWd/ebp1s2rzhnkIYhqIMcxzs7CKvWgJWxmKruA4v w==;
X-CSE-ConnectionGUID: 9j/3jt84RU6qgMq40tnR1A==
X-CSE-MsgGUID: XRaAODb6TPueRHuIxEGriw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40885969"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40885969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 10:51:32 -0800
X-CSE-ConnectionGUID: dMwjxWe3T46uoBRBcVZ9Lg==
X-CSE-MsgGUID: QsSY5ZW2R1an6yMtAt7xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120365586"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.219])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 10:51:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Thu, 20 Feb 2025 19:51:25 +0100
Message-ID: <9458751.rMLUfLXkoz@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <D7XEKPZV5YCX.2TK15CAYHMZD@intel.com>
References: <20250219183807.713776-2-janusz.krzysztofik@linux.intel.com>
 <D7XEKPZV5YCX.2TK15CAYHMZD@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Sebastian,

On Thursday, 20 February 2025 17:10:57 CET Sebastian Brzezinka wrote:
> Hi Janusz
>=20
> On Wed Feb 19, 2025 at 6:37 PM UTC, Janusz Krzysztofik wrote:
> > Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> > drm_dev_register() fails"), we return immediately from
> > i915_driver_register() if drm_dev_register() fails, skipping remaining
> > registration steps.  However, the _unregister() counterpart called at
> > device remove knows nothing about that skip and executes reverts of all
> > those steps.  As a consequence, a number of kernel warnings that taint =
the
> > kernel are triggered:
> >
> > <3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register dr=
iver for
> > userspace access!
> > ...
> > <4> [525.831069] ------------[ cut here ]------------
> > <4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->in=
it_wakere
> > f)
> > <4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/disp=
lay/intel
> > _display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
> > ...
> > <4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted:=
 G     U
> >             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
> > ...
> > <4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
> > ...
> > <4> [525.831483] Call Trace:
> > <4> [525.831484]  <TASK>
> > ...
> > <4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
> > <4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
> > <4> [525.832099]  pci_device_remove+0x3e/0xb0
> > <4> [525.832103]  device_remove+0x40/0x80
> > <4> [525.832107]  device_release_driver_internal+0x215/0x280
> > ...
> > <4> [525.947666] ------------[ cut here ]------------
> > <4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initializ=
ed, yet kobject_put() is being called.
> > <4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject=
_put+0xe4/0x200
> > ...
> > <4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
> > ...
> > <4> [525.947909] Call Trace:
> > <4> [525.947911]  <TASK>
> > ...
> > <4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
> > <4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
> > <4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
> > <4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]
> > ...
> > <4> [526.441186] ------------[ cut here ]------------
> > <4> [526.441191] kernfs: can not remove 'error', no directory
> > <4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kern=
fs_remove_by_name_ns+0xbc/0xc0
> > ...
> > <4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
> > ...
> > <4> [526.441578] Call Trace:
> > <4> [526.441581]  <TASK>
> > ...
> > <4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
> > <4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
> > <4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
> > <4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
> > <4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
> > ...
> > <4> [526.685700] ------------[ cut here ]------------
> > <4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=3D1 wakeloc=
ks=3D1 on cle
> > anup
> > <4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/inte=
l_runtime
> > _pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
> > ...
> > <4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i=
915]
> > ...
> > <4> [526.686294] Call Trace:
> > <4> [526.686296]  <TASK>
> > ...
> > <4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
> > <4> [526.687243]  drm_dev_put.part.0+0x47/0x90
> > <4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
> > <4> [526.687255]  devm_action_release+0x12/0x30
> > <4> [526.687261]  release_nodes+0x3a/0x120
> > <4> [526.687268]  devres_release_all+0x97/0xe0
> > <4> [526.687277]  device_unbind_cleanup+0x12/0x80
> > <4> [526.687282]  device_release_driver_internal+0x23a/0x280
> > ...
> >
> > Introduce a flag that indicates device registration status, raise it on
> > device registration success.  When that flag is found not set while
> > unregistering the driver, jump over reverts of registration steps omitt=
ed
> > on device registration failure.
> >
> > To make it possible, move i915_pmu_unregister(), a counterpart of
> > i915_pmu_unregister() that is called unconditionally before registering
> > the device, down so it is not skipped in any case.  Also, move
> > intel_pxp_fini(), that apparently needs to be called on driver remove
> > whether the device was registered successfully or not, down right below
> > the jump target (though it doesn't look like a step that belongs to dri=
ver
> > unregistration, but that's beyond the scope of this patch).
> >
> > v2: Check in _unregister whether the drm_dev_register has succeeded and
> >     skip some of the _unregister() steps. (Andi)
> >
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_driver.c | 13 ++++++++++---
> >  drivers/gpu/drm/i915/i915_drv.h    |  2 ++
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/=
i915_driver.c
> > index 91a7748f44926..d3b30c3690bbe 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -639,6 +639,8 @@ static void i915_driver_register(struct drm_i915_pr=
ivate *dev_priv)
> >  		return;
> >  	}
> > =20
> > +	dev_priv->registered =3D true;
> > +
> >  	i915_debugfs_register(dev_priv);
> >  	i915_setup_sysfs(dev_priv);
> > =20
> > @@ -673,6 +675,9 @@ static void i915_driver_unregister(struct drm_i915_=
private *dev_priv)
> >  	struct intel_gt *gt;
> >  	unsigned int i;
> > =20
> > +	if (!dev_priv->registered)
> > +		goto not_registered;
> > +
> >  	i915_switcheroo_unregister(dev_priv);
> > =20
> >  	intel_unregister_dsm_handler();
> > @@ -682,17 +687,19 @@ static void i915_driver_unregister(struct drm_i91=
5_private *dev_priv)
> > =20
> >  	intel_display_driver_unregister(display);
> > =20
> > -	intel_pxp_fini(dev_priv);
> > -
> >  	for_each_gt(gt, dev_priv, i)
> >  		intel_gt_driver_unregister(gt);
> > =20
> >  	i915_hwmon_unregister(dev_priv);
> > =20
> >  	i915_perf_unregister(dev_priv);
> > -	i915_pmu_unregister(dev_priv);
> > =20
> >  	i915_teardown_sysfs(dev_priv);
> > +
> > +not_registered:
> > +	intel_pxp_fini(dev_priv);
> > +	i915_pmu_unregister(dev_priv);
> > +
> >  	drm_dev_unplug(&dev_priv->drm);
> > =20
> >  	i915_gem_driver_unregister(dev_priv);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> > index ffc346379cc2c..27a23b1eb9de0 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -347,6 +347,8 @@ struct drm_i915_private {
> >  	/* The TTM device structure. */
> >  	struct ttm_device bdev;
> > =20
> > +	bool registered;
> Isn't `struct=C2=B7drm_device` already has a registered field that could
> be used, instead of introducing new variable. It's set in
> `int=C2=B7drm_dev_register(struct=C2=B7drm_device=C2=B7*dev,=C2=B7unsigne=
d=C2=B7long=C2=B7flags)`

I'm aware of that field, but I think that would be an abuse because it is=20
described as "Internally used by drm_dev_register() and=20
drm_connector_register()".  IOW, that field shouldn't be considered a=20
stable component of DRM API, with well defined semantics, I believe.

I'm not sure what exactly Jani had on mind when rejecting my addition of a=
=20
field to struct drm_i915_private, but maybe I'll try to move it up alongsid=
e=20
do_release field in hope that reject was related to the note on not adding=
=20
stuff to the tail of the structure considered a "dri1/ums dungeon".

But anyway, CI results show that the approach of skipping all unregister st=
eps=20
that correspond to steps skipped on unsuccessful register attempt needs muc=
h=20
more work.  For me it looks like at least some of the functions called from=
=20
i915_driver_unregister(), the purpose of which, I think, should be limited =
to=20
tearing down external interfaces, also do other things, then simply skippin=
g=20
or even reordering them introduces new issues.  I think my initial approach=
 of=20
skipping selectively those steps or their sub-steps that actually trigger t=
he=20
kernel warnings, rejected before by Andi, was more cost-effective.

Thanks,
Janusz

>=20
>=20




