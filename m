Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98B70BEED
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 14:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B510E31A;
	Mon, 22 May 2023 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5D510E313;
 Mon, 22 May 2023 12:59:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E208D614C7;
 Mon, 22 May 2023 12:59:22 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 082DAC433D2;
 Mon, 22 May 2023 12:59:18 +0000 (UTC)
Date: Mon, 22 May 2023 08:59:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
Message-ID: <ZGtnH5YJ8u6bMo4j@rdvivi-mobl4>
References: <20230419154321.1993419-1-markyacoub@google.com>
 <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
 <ZGfnNBRUN72IXRjy@rdvivi-mobl4>
 <27b4bce7-2f63-9199-71e6-4ed52a96d0c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27b4bce7-2f63-9199-71e6-4ed52a96d0c1@linaro.org>
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

On Sat, May 20, 2023 at 02:07:51AM +0300, Dmitry Baryshkov wrote:
> On 20/05/2023 00:16, Rodrigo Vivi wrote:
> > On Fri, May 19, 2023 at 07:55:47PM +0300, Dmitry Baryshkov wrote:
> > > On 19/04/2023 18:43, Mark Yacoub wrote:
> > > > Hi all,
> > > > This is v10 of the HDCP patches. The patches are authored by Sean Paul.
> > > > I rebased and addressed the review comments in v6-v10.
> > > > 
> > > > Main change in v10 is handling the kernel test bot warnings.
> > > > 
> > > > Patches 1-4 focus on moving the common HDCP helpers to common DRM.
> > > > This introduces a slight change in the original intel flow
> > > > as it splits the unique driver protocol from the generic implementation.
> > > > 
> > > > Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.
> > > > 
> > > > Patches 8-10 implement HDCP on MSM driver.
> > > > 
> > > > Thanks,
> > > > -Mark Yacoub
> > > > 
> > > > Sean Paul (10):
> > > >     drm/hdcp: Add drm_hdcp_atomic_check()
> > > >     drm/hdcp: Avoid changing crtc state in hdcp atomic check
> > > >     drm/hdcp: Update property value on content type and user changes
> > > >     drm/hdcp: Expand HDCP helper library for enable/disable/check
> > > >     drm/i915/hdcp: Consolidate HDCP setup/state cache
> > > >     drm/i915/hdcp: Retain hdcp_capable return codes
> > > >     drm/i915/hdcp: Use HDCP helpers for i915
> > > >     dt-bindings: msm/dp: Add bindings for HDCP registers
> > > >     arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
> > > 
> > > Dear i915 maintainers,
> > > 
> > > I wanted to ping you regarding this patch series. If there are no comments
> > > for the series from you side, would it be possible to land Intel-specific
> > > and generic patches into drm-intel tree? We will continue working on the msm
> > > specific parts and merge them through the msm tree.
> > 
> > pushed to drm-intel-next.
> > 
> > should be propagated in a few weeks to drm-next on our next pull request.
> 
> Probably there is some kind of confusion here. You've pushed the DSC
> patches, while the response was sent to the HDCP series.

I'm sorry, my confusion for replying to the wrong thread.

So, on this one here I believe it would be helpful if there's a split
in the series with the already reviewed ones related to i915 are resent
separated from the rest, send with --subject-prefix="CI" so when that
pass CI we just merge it through drm-intel-next


> 
> -- 
> With best wishes
> Dmitry
> 
