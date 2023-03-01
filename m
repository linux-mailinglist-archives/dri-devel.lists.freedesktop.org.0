Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9E6A71D1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 18:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3558A10E31E;
	Wed,  1 Mar 2023 17:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CAB10E132
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 17:08:16 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 36EB13F97B;
 Wed,  1 Mar 2023 18:08:14 +0100 (CET)
Date: Wed, 1 Mar 2023 18:08:12 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Message-ID: <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
 <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-01 08:23:28, Abhinav Kumar wrote:
> 
> On 3/1/2023 2:03 AM, Marijn Suijten wrote:
> > On 2023-02-21 10:42:53, Jessica Zhang wrote:
> >> Currently, DPU will enable TE during prepare_commit(). However, this
> >> will cause a crash and reboot to sahara when trying to read/write to
> >> register in get_autorefresh_config(), because the core clock rates
> >> aren't set at that time.
> > 
> > Haven't seeen a crash like this on any of my devices (after implementing
> > INTF TE).  get_autorefresh_config() always reads zero (or 1 for
> > frame_count) except the first time it is called (autorefresh is left
> > enabled by our bootloader on SM6125) and triggers the disable codepath.
> > 
> 
> I feel that the fact that bootloader keeps things on for you is the 
> reason you dont see the issue. With continuoush splash, clocks are kept 
> enabled. We dont have it enabled (confirmed that).

That is quite likely, we may even have them enabled because of
simple-framebuffer in DTs; turning those off likely won't have any
effect for testing this.

For what it's worth, my SM8150 reads 0 for autorefresh.

<snip>

> > Then, for some patch hygiene, starting here:
> > 
> >> Depends on: "Implement tearcheck support on INTF block" [3]
> >>
> >> Changes in V3:
> >> - Added function prototypes
> >> - Reordered function definitions to make change more legible
> >> - Removed prepare_commit() function from dpu_encoder_phys_cmd
> >>
> >> Changes in V4:
> >> - Reworded commit message to be more specific
> >> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
> > 
> > ... until here: all this info belongs /below the cut/ outside of the
> > messge that becomes part of the commit when this patch is applied to the
> > tree.
> 
> For DRM, I thought we are keeping the change log above the ---- ?
> Which means its allowed in the commit message.

I hope not, seems unlikely to have different rules across kernel
subsystems.  The main point is that this changelog and dependency chain
isn't of any value when the final patch is applied, regardless of
whether it is "allowed".

> >> [1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
> >> [2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
> > 
> > Please replace these with "permalinks" (to a commit hash): a branch with
> > line number annotation will fall out of date soon as more patches are
> > applied that touch these files.
> > 
> >> [3] https://patchwork.freedesktop.org/series/112332/
> > 
> > Is this a hard dependency?  It seems this series applies cleanly on
> > -next and - from a cursory view - should be applicable and testable
> > without my INTF TE series.  However, Dmitry asked me to move some code
> > around in review resulting in separate callbacks in the encoder, rather
> > than having various if(has_intf_te) within those callbacks.  That'll
> > cause conflicts when I eventually get to respin a v2.
> > 
> 
> I guess Jessica listed this because without intf_te series there is no 
> crash because hw_pp would be NULL and autorefresh() would return early. 
> So dependency is from the standpoint of when this series is needed and 
> not from compilation point of view.

That is indeed the question.  I'll leave it to the maintainers to decide
what order to apply these in, which we should be made aware of before
submitting v2 so that one of us can resolve the conflicts.

- Marijn
