Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5FF6C4E9E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463910E982;
	Wed, 22 Mar 2023 14:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C2910E982
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679496925; x=1711032925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8Vl+b0xtSxhDo8ZgQoOw0bDkTnAfBFwBoq842ftUlBo=;
 b=CGhBrSang7zE5VIymvlpN7Z7Y4ph7O7fmpN2OIpci/jM8VjhZK8mpb7I
 VTLjJ+FCLWpzeau/7K8kM4KZCnj4MBTAerqAcX1qPLGDrXft9/UcaA6S0
 W2VupwiKtAWgl5TS5rhI3evy/FN1PQKRGvJesFvSh0sv2rH/yrpj8lsiB
 gSs+b6f0YP6ww8w/rOUIUekvECSebFj65EAXngNhoZ2boZHwHpj9rLnLD
 T6tbC0uvCLdd7uGFdI8FN/zRWqJMxmresxayT/uBBx61gMiwyC7FGLAwd
 xset5KpeTESj7to1Q2FkOAGhR38keYnunL+fQgLbkSQHHM7Of1Ohjm+wF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="318877929"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="318877929"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="805854017"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="805854017"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:55:22 -0700
Date: Wed, 22 Mar 2023 15:55:19 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 2/7] accel/ivpu: Cancel recovery work
Message-ID: <20230322145519.GA2130371@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-3-stanislaw.gruszka@linux.intel.com>
 <e08e5d48-3139-01e8-2c91-c439a42824d9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08e5d48-3139-01e8-2c91-c439a42824d9@quicinc.com>
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

On Wed, Mar 22, 2023 at 08:21:03AM -0600, Jeffrey Hugo wrote:
> On 3/22/2023 3:18 AM, Stanislaw Gruszka wrote:
> > Prevent running recovery_work after device is removed.
> > 
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_drv.c |  2 ++
> >   drivers/accel/ivpu/ivpu_pm.c  | 15 +++++++++++++--
> >   drivers/accel/ivpu/ivpu_pm.h  |  1 +
> >   3 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index ac06bbfca920..d9e311b40348 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -580,6 +580,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
> >   	ivpu_pm_disable(vdev);
> >   	ivpu_shutdown(vdev);
> >   	ivpu_job_done_thread_fini(vdev);
> > +	ivpu_pm_cancel_recovery(vdev);
> > +
> >   	ivpu_ipc_fini(vdev);
> >   	ivpu_fw_fini(vdev);
> >   	ivpu_mmu_global_context_fini(vdev);
> > diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> > index a880f1dd857e..df2e98cc0a56 100644
> > --- a/drivers/accel/ivpu/ivpu_pm.c
> > +++ b/drivers/accel/ivpu/ivpu_pm.c
> > @@ -98,11 +98,17 @@ static int ivpu_resume(struct ivpu_device *vdev)
> >   static void ivpu_pm_recovery_work(struct work_struct *work)
> >   {
> >   	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, recovery_work);
> > -	struct ivpu_device *vdev =  pm->vdev;
> > +	struct ivpu_device *vdev = pm->vdev;
> >   	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
> >   	int ret;
> > -	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
> > +retry:
> > +	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
> > +	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
> > +		cond_resched();
> > +		goto retry;
> > +	}
> > +
> >   	if (ret)
> >   		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
> 
> I'm unsure about this now.  Yes, you did fail to reset the VPU, but is it an
> error if the device is unplugged?  Feels like this message could be
> misleading in that corner case.

Yes, it's not elegant to print error message on unplug.
I'll change this to:

	if (ret && ret != -EAGAIN)
   		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);

Regards
Stanislaw

