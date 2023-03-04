Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653D6AA922
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 11:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AAA10E172;
	Sat,  4 Mar 2023 10:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBFB10E12C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 10:29:19 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 37F1E200B8;
 Sat,  4 Mar 2023 11:29:17 +0100 (CET)
Date: Sat, 4 Mar 2023 11:29:15 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Message-ID: <20230304102915.mxkwlc7qf2rz2abt@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
 <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
 <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
 <866c86bb-fc16-bc78-6c0d-e693bf926241@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <866c86bb-fc16-bc78-6c0d-e693bf926241@quicinc.com>
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

On 2023-03-01 13:42:55, Abhinav Kumar wrote:
<snip>
> >>> Then, for some patch hygiene, starting here:
> >>>
> >>>> Depends on: "Implement tearcheck support on INTF block" [3]
> >>>>
> >>>> Changes in V3:
> >>>> - Added function prototypes
> >>>> - Reordered function definitions to make change more legible
> >>>> - Removed prepare_commit() function from dpu_encoder_phys_cmd
> >>>>
> >>>> Changes in V4:
> >>>> - Reworded commit message to be more specific
> >>>> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
> >>>
> >>> ... until here: all this info belongs /below the cut/ outside of the
> >>> messge that becomes part of the commit when this patch is applied to the
> >>> tree.
> >>
> >> For DRM, I thought we are keeping the change log above the ---- ?
> >> Which means its allowed in the commit message.
> > 
> > I hope not, seems unlikely to have different rules across kernel
> > subsystems.  The main point is that this changelog and dependency chain
> > isn't of any value when the final patch is applied, regardless of
> > whether it is "allowed".
> > 
> 
> I looked at a recently posted change by Rob and change log is above the ---
> 
> https://patchwork.kernel.org/project/dri-devel/patch/20230301185432.3010939-1-robdclark@gmail.com/
> 
> So we will follow that.

I hope that was in error, or no-one pointed it out to Rob.  As said
before there is no use to having this information in the applied patch,
even the kernel guidelines state so:

https://docs.kernel.org/process/submitting-patches.html

    Other comments relevant only to the moment or the maintainer, not
    suitable for the permanent changelog, should also go here. **A good
    example of such comments might be patch changelogs which describe
    what has changed between the v1 and v2 version of the patch.**

    **Please put this information after the --- line** which separates
    the changelog from the rest of the patch. The version information is
    not part of the changelog which gets committed to the git tree. It
    is additional information for the reviewers. If it’s placed above
    the commit tags, it needs manual interaction to remove it. If it is
    below the separator line, it gets automatically stripped off when
    applying the patch:

<snip>

> It should be first the intf TE series and then this one. You can go 
> ahead and post your v2, we will rebase on top of yours.

Sounds good; though as said before I'm extremely short on time making it
hard to actively commit to this, especially as the catalog changes are
really hard to juggle between various "local" branches to test on the
many (Sony) devices we are working on.  As usual, a preview of v2 is
still available at:

https://github.com/SoMainline/linux/commits/marijn/dpu

And I will do my best to get the last comments worked out.

- Marijn
