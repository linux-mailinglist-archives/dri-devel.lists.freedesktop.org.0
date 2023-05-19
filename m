Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B970A162
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 23:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C9B10E60F;
	Fri, 19 May 2023 21:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B8910E60F;
 Fri, 19 May 2023 21:16:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C85C60C8A;
 Fri, 19 May 2023 21:16:43 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 96260C433D2;
 Fri, 19 May 2023 21:16:38 +0000 (UTC)
Date: Fri, 19 May 2023 17:16:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Message-ID: <ZGfnNBRUN72IXRjy@rdvivi-mobl4>
References: <20230419154321.1993419-1-markyacoub@google.com>
 <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, suraj.kandpal@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 freedreno@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 07:55:47PM +0300, Dmitry Baryshkov wrote:
> On 19/04/2023 18:43, Mark Yacoub wrote:
> > Hi all,
> > This is v10 of the HDCP patches. The patches are authored by Sean Paul.
> > I rebased and addressed the review comments in v6-v10.
> > 
> > Main change in v10 is handling the kernel test bot warnings.
> > 
> > Patches 1-4 focus on moving the common HDCP helpers to common DRM.
> > This introduces a slight change in the original intel flow
> > as it splits the unique driver protocol from the generic implementation.
> > 
> > Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.
> > 
> > Patches 8-10 implement HDCP on MSM driver.
> > 
> > Thanks,
> > -Mark Yacoub
> > 
> > Sean Paul (10):
> >    drm/hdcp: Add drm_hdcp_atomic_check()
> >    drm/hdcp: Avoid changing crtc state in hdcp atomic check
> >    drm/hdcp: Update property value on content type and user changes
> >    drm/hdcp: Expand HDCP helper library for enable/disable/check
> >    drm/i915/hdcp: Consolidate HDCP setup/state cache
> >    drm/i915/hdcp: Retain hdcp_capable return codes
> >    drm/i915/hdcp: Use HDCP helpers for i915
> >    dt-bindings: msm/dp: Add bindings for HDCP registers
> >    arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
> 
> Dear i915 maintainers,
> 
> I wanted to ping you regarding this patch series. If there are no comments
> for the series from you side, would it be possible to land Intel-specific
> and generic patches into drm-intel tree? We will continue working on the msm
> specific parts and merge them through the msm tree.

pushed to drm-intel-next.

should be propagated in a few weeks to drm-next on our next pull request.

> 
> >    drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> > 
> >   .../bindings/display/msm/dp-controller.yaml   |    7 +-
> >   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
> >   drivers/gpu/drm/display/drm_hdcp_helper.c     | 1224 +++++++++++++++++
> >   drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
> >   drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
> >   .../drm/i915/display/intel_display_debugfs.c  |   12 +-
> >   .../drm/i915/display/intel_display_types.h    |   51 +-
> >   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  352 ++---
> >   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
> >   drivers/gpu/drm/i915/display/intel_hdcp.c     | 1060 +++-----------
> >   drivers/gpu/drm/i915/display/intel_hdcp.h     |   48 +-
> >   drivers/gpu/drm/i915/display/intel_hdmi.c     |  267 ++--
> >   drivers/gpu/drm/msm/Kconfig                   |    1 +
> >   drivers/gpu/drm/msm/Makefile                  |    1 +
> >   drivers/gpu/drm/msm/dp/dp_catalog.c           |  156 +++
> >   drivers/gpu/drm/msm/dp/dp_catalog.h           |   18 +
> >   drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
> >   drivers/gpu/drm/msm/dp/dp_debug.h             |   11 +-
> >   drivers/gpu/drm/msm/dp/dp_display.c           |   39 +-
> >   drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
> >   drivers/gpu/drm/msm/dp/dp_drm.c               |   39 +-
> >   drivers/gpu/drm/msm/dp/dp_drm.h               |    7 +
> >   drivers/gpu/drm/msm/dp/dp_hdcp.c              |  389 ++++++
> >   drivers/gpu/drm/msm/dp/dp_hdcp.h              |   33 +
> >   drivers/gpu/drm/msm/dp/dp_parser.c            |   14 +
> >   drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
> >   drivers/gpu/drm/msm/dp/dp_reg.h               |   30 +-
> >   drivers/gpu/drm/msm/msm_atomic.c              |   19 +
> >   include/drm/display/drm_hdcp.h                |  296 ++++
> >   include/drm/display/drm_hdcp_helper.h         |   23 +
> >   30 files changed, 2867 insertions(+), 1349 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
> >   create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
