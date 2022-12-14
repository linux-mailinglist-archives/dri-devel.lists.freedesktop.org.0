Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D431664CD2D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788010E41D;
	Wed, 14 Dec 2022 15:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC81010E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671032382; x=1702568382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gmhemlQVaA2ET6Jkqdn+7G8sK20Cr8ee0Zaqb8A49pM=;
 b=ECpnSrphOFaLayG29H0qhO+Qqo7Tl6flSQaObRy/w7rOV8GT/MmJA9iv
 TCZHeKI7sZmHY0pmEW65s6CDiCodzsiLOYset8wBRyu007+PNhqDKv97G
 F+2MEZE2nJ26UM4bw0Y/EZ0cIe6bDF9yFPkR7juaV7O/aOa1CGoF+MOZT
 g7R+S1ebXuTVqW5UjfVaEh160iA89naQJ2jr5uL+NHpr/xC5Y+YgzNojy
 ru6WsAeXkHpPlVWx7YOYrg+OVgJCRiqr+R+phw3B8zT9LDl3YK3+R6Q5i
 Qw2fDth5SMkMPLXf9iOCnjsNDfiX/Zq2H027K1+baPsCEVj6sZqrkfs7+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="317139340"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="317139340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 07:39:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="681547028"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="681547028"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 07:39:38 -0800
Date: Wed, 14 Dec 2022 16:39:36 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Message-ID: <20221214153936.GB1062210@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 03:57:54PM +0200, Oded Gabbay wrote:
> On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
> > +
> > +static inline int ivpu_hw_info_init(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->info_init(vdev);
> > +};
> > +
> > +static inline int ivpu_hw_power_up(struct ivpu_device *vdev)
> > +{
> > +       ivpu_dbg(vdev, PM, "HW power up\n");
> > +
> > +       return vdev->hw->ops->power_up(vdev);
> > +};
> > +
> > +static inline int ivpu_hw_boot_fw(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->boot_fw(vdev);
> > +};
> > +
> > +static inline bool ivpu_hw_is_idle(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->is_idle(vdev);
> > +};
> > +
> > +static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
> > +{
> > +       ivpu_dbg(vdev, PM, "HW power down\n");
> > +
> > +       return vdev->hw->ops->power_down(vdev);
> > +};
> > +
> > +static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
> > +{
> > +       vdev->hw->ops->wdt_disable(vdev);
> > +};
> > +
> > +/* Register indirect accesses */
> > +static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_pll_freq_get(vdev);
> > +};
> > +
> > +static inline u32 ivpu_hw_reg_telemetry_offset_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_telemetry_offset_get(vdev);
> > +};
> > +
> > +static inline u32 ivpu_hw_reg_telemetry_size_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_telemetry_size_get(vdev);
> > +};
> > +
> > +static inline u32 ivpu_hw_reg_telemetry_enable_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_telemetry_enable_get(vdev);
> > +};
> > +
> > +static inline void ivpu_hw_reg_db_set(struct ivpu_device *vdev, u32 db_id)
> > +{
> > +       vdev->hw->ops->reg_db_set(vdev, db_id);
> > +};
> > +
> > +static inline u32 ivpu_hw_reg_ipc_rx_addr_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_ipc_rx_addr_get(vdev);
> > +};
> > +
> > +static inline u32 ivpu_hw_reg_ipc_rx_count_get(struct ivpu_device *vdev)
> > +{
> > +       return vdev->hw->ops->reg_ipc_rx_count_get(vdev);
> > +};
> > +
> > +static inline void ivpu_hw_reg_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr)
> > +{
> > +       vdev->hw->ops->reg_ipc_tx_set(vdev, vpu_addr);
> > +};
> > +
> > +static inline void ivpu_hw_irq_clear(struct ivpu_device *vdev)
> > +{
> > +       vdev->hw->ops->irq_clear(vdev);
> > +};
> > +
> > +static inline void ivpu_hw_irq_enable(struct ivpu_device *vdev)
> > +{
> > +       vdev->hw->ops->irq_enable(vdev);
> > +};
> > +
> > +static inline void ivpu_hw_irq_disable(struct ivpu_device *vdev)
> > +{
> > +       vdev->hw->ops->irq_disable(vdev);
> > +};
> Why hide all the calls to the hw ops functions inside inline functions ?
> I mean, it just makes it one step longer to read the code...
> Why not directly call vdev->hw->ops->operation ?

It allows to extend the calls for code that are common between individual
implementations.

> > diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
> > new file mode 100644
> > index 000000000000..922cbf30ce34
> > --- /dev/null
> > +++ b/include/uapi/drm/ivpu_drm.h
> > @@ -0,0 +1,95 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Copyright (C) 2020-2022 Intel Corporation
> > + */
> > +
> > +#ifndef __UAPI_IVPU_DRM_H__
> > +#define __UAPI_IVPU_DRM_H__
> > +
> > +#include "drm.h"
> > +
> > +#if defined(__cplusplus)
> > +extern "C" {
> > +#endif
> > +
> > +#define DRM_IVPU_DRIVER_MAJOR 1
> > +#define DRM_IVPU_DRIVER_MINOR 0
> I would prefer not to define versions for the driver. Don't get in
> this trap of trying to keep a version
> number updated over time.  It breaks down the moment you get the code
> merged into the kernel tree as the driver is what is in the kernel, not
> separate from it.
> 
> Also think of the stable kernels, you will backport fixes to those for
> the driver as part of the development process.  So what "version" are
> they now?  They are some mis-match of the old one with new fixes, and as
> such, the version number now means nothing.

Yes, it's not optimal to identify features using major/minor version and
we do not relay heavily on this. For now we expect that some features are
present and working since particular major/minor version and mark feature
tests failed or skipped accordingly.

> Just stick to the version number of the kernel itself, that's the only
> sane way.
> 
> btw, I talked to Daniel about this and he told me this
> major/minor/patchlevel is legacy in drm and should be deprecated, so
> I'm going to send a patch to document that it is deprecated and how to
> use getcap ioctl to find out the features the driver support.

Cool.

Regards
Stanislaw
