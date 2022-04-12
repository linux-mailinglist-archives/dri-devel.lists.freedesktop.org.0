Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6D4FE2F0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79DB10E9D8;
	Tue, 12 Apr 2022 13:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70A10E9D8;
 Tue, 12 Apr 2022 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649770899; x=1681306899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oD6m9SeRfl7eHmHKzLOAmxJnQwG1UbpU/JTq/9MxsDM=;
 b=i4xtZH32l3RVr6e8QgrmWwbkUh3Gp/i+R0ejDjioQxH9mdOzH34LXr7E
 ZpIChuyoChjAmj13hex+1v9u3U4gDCSwSfjj2p+DcdMhYhvG7B/0eQh8C
 zoa3eS34P31gULq9xfQMYdKO/FKUaGE2P3DoFI6WouDzdo7spjnXYmzV2
 OeyNL1fBfQpYDUGHHH1LHaTxLDCUgL7VbUFOq9G0Vv5O4QvJ04NEuYfWg
 cI9i+AP7wJTfPiHLCU8qmPZEVbCb6qslCz15EVgd/fpxQ6ID9ZNfipv1L
 71r0KjCIlzx2bfV+1G2YoOB/rWkUAVMN2Si5MJfDpEjtvdAprcy2aQC69 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242963730"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="242963730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:41:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="526480890"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:41:36 -0700
Date: Tue, 12 Apr 2022 09:41:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Message-ID: <YlWBjy5lxtuGZ4vm@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-1-sean@poorly.run>
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
Cc: jani.nikula@intel.com, markyacoub@chromium.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:47:29PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Rebased set from November. Fixed a nit from Stephen in the msm patch and
> moved hdcp registers into the trogdor dtsi file to avoid differences
> with sc7180-based windows devices. The set is 4 patches lighter since
> some of the changes were accepted into msm.
> 
> I'm still waiting for Intel review of the first 7 patches. Rodrigo/Jani,
> would you please provide your input so we can move forward with this
> set?

I'm a bit concerned with patches 4 and 7. It is hard to map the removals
and additions and there are some changes that looks like changing behaviors,
but end up not being clear in the big patch. Also with big patch it is prune
to the rebasing and backport conflicts.

Would be possible to split some work in moving individual functions from i915
to drm little by little with smaller patches?

But thank you for this great work. It is also good to align our drm drivers.

Thanks,
Rodrigo.

> 
> Thanks,
> 
> Sean
> 
> Link: https://patchwork.freedesktop.org/series/94623/ #v1
> Link: https://patchwork.freedesktop.org/series/94713/ #v2
> Link: https://patchwork.freedesktop.org/series/94712/ #v3
> Link: https://patchwork.freedesktop.org/series/94712/ #v4
> 
> Sean Paul (10):
>   drm/hdcp: Add drm_hdcp_atomic_check()
>   drm/hdcp: Avoid changing crtc state in hdcp atomic check
>   drm/hdcp: Update property value on content type and user changes
>   drm/hdcp: Expand HDCP helper library for enable/disable/check
>   drm/i915/hdcp: Consolidate HDCP setup/state cache
>   drm/i915/hdcp: Retain hdcp_capable return codes
>   drm/i915/hdcp: Use HDCP helpers for i915
>   dt-bindings: msm/dp: Add bindings for HDCP registers
>   arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
>   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> 
>  .../bindings/display/msm/dp-controller.yaml   |    7 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |    6 +-
>  drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
>  .../drm/i915/display/intel_display_types.h    |   58 +-
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
>  drivers/gpu/drm/msm/Makefile                  |    1 +
>  drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
>  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   46 +-
>  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
>  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  453 +++++++
>  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
>  drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
>  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
>  drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
>  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
>  include/drm/drm_hdcp.h                        |  194 +++
>  27 files changed, 2582 insertions(+), 1328 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> 
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
