Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256AB768764
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0D10E105;
	Sun, 30 Jul 2023 19:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C97510E10F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:26:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B46E1F995;
 Sun, 30 Jul 2023 21:26:14 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:26:12 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE operations only when
 supported by HW
Message-ID: <qn67eiyw7egfgmfqd6uahyyniyptrutf6r37arsfryqiaxj3tl@4wszcae3egsi>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
 <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
 <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
 <bd59cd28-b3ba-1805-da2c-8ec6b0b2f1b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd59cd28-b3ba-1805-da2c-8ec6b0b2f1b0@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-30 02:18:10, Dmitry Baryshkov wrote:
> On 29/07/2023 21:31, Marijn Suijten wrote:
> > On 2023-07-29 02:59:32, Dmitry Baryshkov wrote:
> >> On 27/07/2023 23:03, Marijn Suijten wrote:
> >>> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
> >>>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> >>>> Rather than checking for the flag, check for the presense of the
> >>>> corresponding interrupt line.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> That's a smart use of the interrupt field.  I both like it, and I do
> >>> not.  While we didn't do any validation for consistency previously, this
> >>> means we now have multiple ways of controlling available "features":
> >>>
> >>> - Feature flags on hardware blocks;
> >>> - Presence of certain IRQs;
> >>> - DPU core revision.
> >>
> >> I hesitated here too. For INTF it is clear that there is no other good
> >> way to check for the TE feature. For PP we can just check for the DPU
> >> revision.
> > 
> > For both we could additionally check the DPU revision, and for INTF we
> > could check for TYPE_DSI.  Both would aid in extra validation, if we
> > require the IRQ to be present or absent under these conditions.
> 
> Yep, maybe that's better.
> 
> > 
> > It might also help to document this, either here and on the respective
> > struct fields so that catalog implementers know when they should supply
> > or leave out an IRQ?
> 
> Probably a WARN_ON would be enough.

SGTM, it is after all only for bring-up as after that (additions have
been validated, reviewed and merged) we "trust the kernel" including our
catalog, so errors like this should pretty much be unreachable.

- Marijn
