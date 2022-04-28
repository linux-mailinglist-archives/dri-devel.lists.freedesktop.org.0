Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842E51334C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327DC10F97F;
	Thu, 28 Apr 2022 12:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70C210F97C;
 Thu, 28 Apr 2022 12:02:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 869CD496;
 Thu, 28 Apr 2022 14:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651147337;
 bh=cVI336YmUrYwwUHMi1fMd1u88MApPL0/OQgHEF3kT50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SlvcSSVGGtj2+MAaT/V6mKkvQe7Y++kGytpI60fFp4JMMDUwO92tXukcKZesFWcIN
 vq/ImynoHNN5qjtPJj8iweEYRZjM6dHvD04RalFM3rPt96N8QOzUItiYyZfnAZ4oKG
 9/2TZzLH4+qC98TzCqo4oB2Fjf6hp0acN3T0sAs0=
Date: Thu, 28 Apr 2022 15:02:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: Re: [RFC PATCH 0/3] i915 writeback private framework
Message-ID: <YmqCSDYfWawBcOU5@pendragon.ideasonboard.com>
References: <20220421050756.2036609-1-suraj.kandpal@intel.com>
 <DM5PR11MB1739991ACAEF173E24B53CCAE3FD9@DM5PR11MB1739.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM5PR11MB1739991ACAEF173E24B53CCAE3FD9@DM5PR11MB1739.namprd11.prod.outlook.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj,

On Thu, Apr 28, 2022 at 05:51:47AM +0000, Kandpal, Suraj wrote:
> ++Laurent ,Dmitry, and Abhinav
> 
> Hi,
> Can you have a look at the private implementation i915 is currently going with till
> we can figure out how  to work with drm core .

No, sorry, I barely have time to follow up on core DRM changes, I can't
help with private i915 topics in my spare time.

> > A patch series was floated in the drm mailing list which aimed to change the
> > drm_connector and drm_encoder fields to pointer in the
> > drm_connector_writeback structure, this received a huge pushback from the
> > community but since i915 expects each connector present in the drm_device
> > list to be a intel_connector but drm_writeback framework.
> > [1] https://patchwork.kernel.org/project/dri-
> > devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/
> > [2] https://patchwork.kernel.org/project/dri-
> > devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/
> > This forces us to use a drm_connector which is not embedded in
> > intel_connector the current drm_writeback framework becomes very
> > unfeasible to us as it would mean a lot of checks at a lot of places to take into
> > account the above issue.Since no one had an issue with encoder field being
> > changed into a pointer it was decided to break the connector and encoder
> > pointer changes into two different series.The encoder field changes is
> > currently being worked upon by Abhinav Kumar
> > [3]https://patchwork.kernel.org/project/dri-devel/list/?series=633565
> > In the meantime for i915 to start using the writeback functionality we came
> > up with a interim solution to own writeback pipeline bypassing one provided
> > by drm which is what these patches do.
> > Note: these are temp patches till we figure out how we can either change
> > drm core writeback to work with our intel_connector structure or find a
> > different solution which allows us to work with the current drm_writeback
> > framework
> > 
> > Suraj Kandpal (3):
> >   drm/i915: Creating writeback pipeline to bypass drm_writeback
> >     framework
> >   drm/i915: Define WD trancoder for i915
> >   drm/i915: Enabling WD Transcoder
> > 
> >  drivers/gpu/drm/i915/Makefile                 |   2 +
> >  drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |  89 +-
> > drivers/gpu/drm/i915/display/intel_display.h  |  15 +
> >  .../drm/i915/display/intel_display_types.h    |  18 +
> >  drivers/gpu/drm/i915/display/intel_dpll.c     |   3 +
> >  drivers/gpu/drm/i915/display/intel_opregion.c |   3 +
> >  .../gpu/drm/i915/display/intel_wb_connector.c | 296 ++++++
> > .../gpu/drm/i915/display/intel_wb_connector.h |  99 ++
> >  drivers/gpu/drm/i915/display/intel_wd.c       | 978 ++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_wd.h       |  82 ++
> >  drivers/gpu/drm/i915/i915_drv.h               |   5 +
> >  drivers/gpu/drm/i915/i915_irq.c               |   8 +-
> >  drivers/gpu/drm/i915/i915_pci.c               |   7 +-
> >  drivers/gpu/drm/i915/i915_reg.h               | 139 +++
> >  15 files changed, 1742 insertions(+), 3 deletions(-)  create mode 100644
> > drivers/gpu/drm/i915/display/intel_wb_connector.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.h
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_wd.c
> >  create mode 100644 drivers/gpu/drm/i915/display/intel_wd.h

-- 
Regards,

Laurent Pinchart
