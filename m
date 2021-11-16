Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F260F45349A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EA56EA36;
	Tue, 16 Nov 2021 14:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF1A6EA6F;
 Tue, 16 Nov 2021 14:48:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319918353"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="319918353"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:48:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="506460562"
Received: from jprocter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:48:51 -0800
Date: Tue, 16 Nov 2021 09:48:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tilak Tangudu <tilak.tangudu@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Disable D3Cold in s2idle and
 runtime pm
Message-ID: <YZPE0RAanOjyWCmK@intel.com>
References: <20211115154054.3220476-1-tilak.tangudu@intel.com>
 <YZKzBI6znwQwWBpI@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZKzBI6znwQwWBpI@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 02:20:36PM -0500, Rodrigo Vivi wrote:
> On Mon, Nov 15, 2021 at 09:10:54PM +0530, Tilak Tangudu wrote:
> > s2idle and runtime pm puts the pci gfx device in D3Hot, ACPI runtime
> > monitors the pci tree,if it sees complete tree as D3Hot,it transitions
> > the device to D3Cold.But i915 do not have D3Cold support in S2idle or in
> > runtime pm. so disabling D3cold in above flows and its FIXME.
> > 
> > Added pci D3Cold enable/disable in s2idle and runtime suspend/resume
> > flows.
> > 
> > Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>
> 
> Just for the clear record, I always preferred the unconditional disallow
> of d3cold, but it looks some internal experiments for s3/s4 failed with that
> and this approach here was the safest one, so let's move with this and
> prevent the d3cold for now and then allow the runtime_pm autosuspend
> enabled by default everywhere.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed, thanks for the patch.

> 
> > ---
> >  drivers/gpu/drm/i915/i915_drv.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> > index 46bf3315f616..af6868f12ef0 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.c
> > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > @@ -1194,6 +1194,14 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
> >  		goto out;
> >  	}
> >  
> > +	/*
> > +	 * FIXME: Temporary hammer to avoid freezing the machine on our DGFX
> > +	 * This should be totally removed when we handle the pci states properly
> > +	 * on runtime PM and on s2idle cases.
> > +	 */
> > +	if (suspend_to_idle(dev_priv))
> > +		pci_d3cold_disable(pdev);
> > +
> >  	pci_disable_device(pdev);
> >  	/*
> >  	 * During hibernation on some platforms the BIOS may try to access
> > @@ -1357,6 +1365,8 @@ static int i915_drm_resume_early(struct drm_device *dev)
> >  
> >  	pci_set_master(pdev);
> >  
> > +	pci_d3cold_enable(pdev);
> > +
> >  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> >  
> >  	ret = vlv_resume_prepare(dev_priv, false);
> > @@ -1533,6 +1543,7 @@ static int intel_runtime_suspend(struct device *kdev)
> >  {
> >  	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
> >  	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
> > +	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> >  	int ret;
> >  
> >  	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
> > @@ -1578,6 +1589,12 @@ static int intel_runtime_suspend(struct device *kdev)
> >  		drm_err(&dev_priv->drm,
> >  			"Unclaimed access detected prior to suspending\n");
> >  
> > +	/*
> > +	 * FIXME: Temporary hammer to avoid freezing the machine on our DGFX
> > +	 * This should be totally removed when we handle the pci states properly
> > +	 * on runtime PM and on s2idle cases.
> > +	 */
> > +	pci_d3cold_disable(pdev);
> >  	rpm->suspended = true;
> >  
> >  	/*
> > @@ -1616,6 +1633,7 @@ static int intel_runtime_resume(struct device *kdev)
> >  {
> >  	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
> >  	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
> > +	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> >  	int ret;
> >  
> >  	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
> > @@ -1628,6 +1646,7 @@ static int intel_runtime_resume(struct device *kdev)
> >  
> >  	intel_opregion_notify_adapter(dev_priv, PCI_D0);
> >  	rpm->suspended = false;
> > +	pci_d3cold_enable(pdev);
> >  	if (intel_uncore_unclaimed_mmio(&dev_priv->uncore))
> >  		drm_dbg(&dev_priv->drm,
> >  			"Unclaimed access during suspend, bios?\n");
> > -- 
> > 2.25.1
> > 
