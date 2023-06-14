Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B419D7309EE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 23:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360D910E46B;
	Wed, 14 Jun 2023 21:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC58410E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 21:41:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D3EAF3F841;
 Wed, 14 Jun 2023 23:41:42 +0200 (CEST)
Date: Wed, 14 Jun 2023 23:41:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Message-ID: <udz5ij7g74zgnnwqw2q65idzzmiszhnvfieerw7izikgvotnkp@5tboohkd4t6t>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-14 13:39:57, Abhinav Kumar wrote:
> On 6/14/2023 12:54 PM, Abhinav Kumar wrote:
> > On 6/14/2023 12:35 PM, Abhinav Kumar wrote:
> >> On 6/14/2023 5:23 AM, Marijn Suijten wrote:
> >>> On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
> >>>> On 14/06/2023 14:42, Marijn Suijten wrote:
> >>>>> On 2023-06-13 18:57:11, Jessica Zhang wrote:
> >>>>>> DPU 5.x+ supports a databus widen mode that allows more data to be 
> >>>>>> sent
> >>>>>> per pclk. Enable this feature flag on all relevant chipsets.
> >>>>>>
> >>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>> ---
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
> >>>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
> >>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> index 36ba3f58dcdf..0be7bf0bfc41 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> @@ -103,7 +103,8 @@
> >>>>>>        (BIT(DPU_INTF_INPUT_CTRL) | \
> >>>>>>         BIT(DPU_INTF_TE) | \
> >>>>>>         BIT(DPU_INTF_STATUS_SUPPORTED) | \
> >>>>>> -     BIT(DPU_DATA_HCTL_EN))
> >>>>>> +     BIT(DPU_DATA_HCTL_EN) | \
> >>>>>> +     BIT(DPU_INTF_DATABUS_WIDEN))
> >>>>>
> >>>>> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.  In the
> >>>>> last patch for DSI you state and enable widebus for DSI 6G 2.5+ only,
> >>>>> meaning DPU and DSI are now desynced, and the output is completely
> >>>>> corrupted.
> >>>
> 
> I looked at the internal docs and also this change. This change is 
> incorrect because this will try to enable widebus for DPU >= 5.0 and DSI 
>  >= 2.5
> 
> That was not the intended right condition as thats not what the docs say.
> 
> We should enable for DPU >= 7.0 and DSI >= 2.5

That makes more sense, DSI 2.5 is SM8350 which has DPU 7.0.

> Is there any combination where this compatibility is broken? That would 
> be the strange thing for me ( not DPU 5.0 and DSI 2.5 as that was incorrect)

No clue if there are any interim SoCs...

> Part of this confusion is because of catalog macro re-use again.

Somewhat agreed.  SC7180 is a DPU 6.2 SoC, and for this mask to be used
across DPU 5.x and above it should have been renamed to SM8150 and as
suggested by Dmitry, have DPU_5_x_` as suffix.

As I've asked many times before, we should inline these masks (not just
the macros) (disclaimer: haven't reviewed if Dmitry's series actually
does so!).

> This series is a good candidate and infact I think we should only do 
> core_revision based check on DPU and DSI to avoid bringing the catalog 
> mess into this.
> 
> >>> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >>> corrupted with this series so something else on this series might be
> >>> broken.
> >>>
> > 
> > Missed this response. That seems strange.

No worries.  But don't forget to look at the comments on patch 2/3
either.  Some of it is a continuation of pclk scaling factor for DSC
which discussion seems to have ceased on.

> > This series was tested on SM8350 HDK with a command mode panel.
> > 
> > We will fix the DPU-DSI handshake and post a v2 but your issue needs 
> > investigation in parallel.
> > 
> > So another bug to track that would be great.

Will see if I can set that up for you!

> >>>>> Is the bound in dsi_host wrong, or do DPU and DSI need to communicate
> >>>>> when widebus will be enabled, based on DPU && DSI supporting it?
> >>>>
> >>>> I'd prefer to follow the second approach, as we did for DP. DPU asks 
> >>>> the
> >>>> actual video output driver if widebus is to be enabled.
> >>>
> >>
> >> I was afraid of this. This series was made on an assumption that the 
> >> DPU version of widebus and DSI version of widebus would be compatible 
> >> but looks like already SM8150 is an outlier.

Fwiw SM8250 would have been an outlier as well :)

> >> Yes, I think we have to go with second approach.
> >>
> >> DPU queries DSI if it supports widebus and enables it.
> >>
> >> Thanks for your responses. We will post a v2.

No hurry, btw.  As alluded to above, let's also look at the comments on
patch 2/3 and discuss how this affects pclk.

> >>> Doesn't it seem very strange that DPU 5.x+ comes with a widebus feature,
> >>> but the DSI does not until two revisions later?  Or is this available on
> >>> every interface, but only for a different (probably DP) encoder block?
> >>>
> >>
> >> Yes its strange.
> >>
> 
> I have clarified this above. Its not strange but appeared strange 
> because we were checking wrong conditions.

Hehe :)

- Marijn
