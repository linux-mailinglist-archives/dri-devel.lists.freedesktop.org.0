Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C11C7CBDFA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2665610E02C;
	Tue, 17 Oct 2023 08:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8D410E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697532191; x=1729068191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wOkdAOYEucFot2QYmXiXt3m0NKnBzI7UoJqkisZhHMQ=;
 b=C5gZm7pmDSuAQ6HSLw0NW5NidTzDz1iskrMbPKUXHK0lPncJTA3E480x
 eTFRhvYmzApTj/GTlDqo8FB1tDjc8htb/UywihoAxB5L4t4/OI8QA7pBo
 NaLvTGMMxzBGR8vnZLd3MNvvxPP5YYwKiXRuk00xT5IDQrZ45RVruX14E
 Jnr+UijjHOOPI37ZpRlzloVVjKXwE+0SjtbiPbfybCGY+QMoFnRJaxLU8
 iC8fJw+IroKxJy1SoaFcX9u3fIJ+mYw+v3ESxk8qwF+jzbC0t7gJBihq0
 xdV4VBgC+QghFCAlTq8FqIbp34+gnSk3nQcMe9Z9Xs4HIgRK3GM1tdnes g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4335548"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="4335548"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872470749"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="872470749"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:43:09 -0700
Date: Tue, 17 Oct 2023 10:43:07 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/ivpu: Don't enter d0i3 during FLR
Message-ID: <20231017084307.GA525429@linux.intel.com>
References: <20231003064213.1527327-1-stanislaw.gruszka@linux.intel.com>
 <32e14a51-6c0a-efae-1601-07aa6e9537a2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e14a51-6c0a-efae-1601-07aa6e9537a2@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 06, 2023 at 09:25:29AM -0600, Jeffrey Hugo wrote:
> On 10/3/2023 12:42 AM, Stanislaw Gruszka wrote:
> > From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > 
> > Fix a bug on some platforms where FLR causes complete system
> > hang when CPU is low power states (C8 or above).
> 
> Why does FLR cause a complete system hang?

This HW bug is still under debug and it is not yet root caused.

> Why does avoiding d0i3 fix the
> issue?  Feels like there could be a lot more detail here.

We only know that we should avoid entering D0i3.

I will change the log this way:

Avoid HW bug on some platforms where we enter D0i3 state
and CPU is in low power states (C8 or above).

Regards
Stanislaw

> > Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_drv.c     | 11 ++++++++---
> >   drivers/accel/ivpu/ivpu_drv.h     |  1 +
> >   drivers/accel/ivpu/ivpu_hw.h      |  8 ++++++++
> >   drivers/accel/ivpu/ivpu_hw_37xx.c |  1 +
> >   drivers/accel/ivpu/ivpu_hw_40xx.c |  1 +
> >   drivers/accel/ivpu/ivpu_pm.c      |  3 ++-
> >   6 files changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index 3f4efa07ce7c..1eb232e903e8 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -367,14 +367,19 @@ int ivpu_boot(struct ivpu_device *vdev)
> >   	return 0;
> >   }
> > -int ivpu_shutdown(struct ivpu_device *vdev)
> > +void ivpu_prepare_for_reset(struct ivpu_device *vdev)
> >   {
> > -	int ret;
> > -
> >   	ivpu_hw_irq_disable(vdev);
> >   	disable_irq(vdev->irq);
> >   	ivpu_ipc_disable(vdev);
> >   	ivpu_mmu_disable(vdev);
> > +}
> > +
> > +int ivpu_shutdown(struct ivpu_device *vdev)
> > +{
> > +	int ret;
> > +
> > +	ivpu_prepare_for_reset(vdev);
> >   	ret = ivpu_hw_power_down(vdev);
> >   	if (ret)
> > diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> > index 98380c1db9fa..a3b45032e6cf 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.h
> > +++ b/drivers/accel/ivpu/ivpu_drv.h
> > @@ -158,6 +158,7 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link);
> >   int ivpu_boot(struct ivpu_device *vdev);
> >   int ivpu_shutdown(struct ivpu_device *vdev);
> > +void ivpu_prepare_for_reset(struct ivpu_device *vdev);
> >   static inline u8 ivpu_revision(struct ivpu_device *vdev)
> >   {
> > diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
> > index ab341237bcf9..1079e06255ba 100644
> > --- a/drivers/accel/ivpu/ivpu_hw.h
> > +++ b/drivers/accel/ivpu/ivpu_hw.h
> > @@ -13,6 +13,7 @@ struct ivpu_hw_ops {
> >   	int (*power_up)(struct ivpu_device *vdev);
> >   	int (*boot_fw)(struct ivpu_device *vdev);
> >   	int (*power_down)(struct ivpu_device *vdev);
> > +	int (*reset)(struct ivpu_device *vdev);
> >   	bool (*is_idle)(struct ivpu_device *vdev);
> >   	void (*wdt_disable)(struct ivpu_device *vdev);
> >   	void (*diagnose_failure)(struct ivpu_device *vdev);
> > @@ -91,6 +92,13 @@ static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
> >   	return vdev->hw->ops->power_down(vdev);
> >   };
> > +static inline int ivpu_hw_reset(struct ivpu_device *vdev)
> > +{
> > +	ivpu_dbg(vdev, PM, "HW reset\n");
> > +
> > +	return vdev->hw->ops->reset(vdev);
> > +};
> > +
> >   static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
> >   {
> >   	vdev->hw->ops->wdt_disable(vdev);
> > diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> > index edd4d860f135..1e842739e937 100644
> > --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> > +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> > @@ -1036,6 +1036,7 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
> >   	.power_up = ivpu_hw_37xx_power_up,
> >   	.is_idle = ivpu_hw_37xx_is_idle,
> >   	.power_down = ivpu_hw_37xx_power_down,
> > +	.reset = ivpu_hw_37xx_reset,
> >   	.boot_fw = ivpu_hw_37xx_boot_fw,
> >   	.wdt_disable = ivpu_hw_37xx_wdt_disable,
> >   	.diagnose_failure = ivpu_hw_37xx_diagnose_failure,
> > diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
> > index a48cd36f9931..d7b8ec0410af 100644
> > --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
> > +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
> > @@ -1186,6 +1186,7 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
> >   	.power_up = ivpu_hw_40xx_power_up,
> >   	.is_idle = ivpu_hw_40xx_is_idle,
> >   	.power_down = ivpu_hw_40xx_power_down,
> > +	.reset = ivpu_hw_40xx_reset,
> >   	.boot_fw = ivpu_hw_40xx_boot_fw,
> >   	.wdt_disable = ivpu_hw_40xx_wdt_disable,
> >   	.diagnose_failure = ivpu_hw_40xx_diagnose_failure,
> > diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> > index 28a0d1111e12..da46f95b008a 100644
> > --- a/drivers/accel/ivpu/ivpu_pm.c
> > +++ b/drivers/accel/ivpu/ivpu_pm.c
> > @@ -261,7 +261,8 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
> >   	ivpu_dbg(vdev, PM, "Pre-reset..\n");
> >   	atomic_inc(&vdev->pm->reset_counter);
> >   	atomic_set(&vdev->pm->in_reset, 1);
> > -	ivpu_shutdown(vdev);
> > +	ivpu_prepare_for_reset(vdev);
> > +	ivpu_hw_reset(vdev);
> >   	ivpu_pm_prepare_cold_boot(vdev);
> >   	ivpu_jobs_abort_all(vdev);
> >   	ivpu_dbg(vdev, PM, "Pre-reset done.\n");
> 
