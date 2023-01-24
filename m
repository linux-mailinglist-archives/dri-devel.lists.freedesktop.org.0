Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C7679AE8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8DC10E683;
	Tue, 24 Jan 2023 14:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416FE10E683
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 14:00:47 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 57FF22049A;
 Tue, 24 Jan 2023 15:00:45 +0100 (CET)
Date: Tue, 24 Jan 2023 15:00:44 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Message-ID: <20230124140044.rg46lhkif7lot2xe@SoMainline.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
 <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
 <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
 <20230124120652.rqmaj2j4jytmvzbl@SoMainline.org>
 <8cd7b10a-bc1e-76b6-89db-32d1cf09bfd9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd7b10a-bc1e-76b6-89db-32d1cf09bfd9@linaro.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-24 14:29:38, Dmitry Baryshkov wrote:
> On 24/01/2023 14:06, Marijn Suijten wrote:
> > On 2023-01-24 13:20:57, Dmitry Baryshkov wrote:
> >> On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
> >> <marijn.suijten@somainline.org> wrote:
> >>>
> >>> On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
> >>>> On 24/01/2023 11:59, Marijn Suijten wrote:
> >>>>> On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
> >>>>>> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
> >>>>>> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
> >>>>>> planes). Correct corresponding SSPP declarations.
> >>>>>>
> >>>>>> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> >>>>>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >>>>>> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> >>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> >>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> index 0f3da480b066..ad0c55464154 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >>>>>> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
> >>>>>>     SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> >>>>>>             sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> >>>>>>     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> >>>>>
> >>>>> Drop the _CURSOR mask here?  And the double space....
> >>>>
> >>>> Ack for the doublespace. By removing _CURSOR we would disallow using
> >>>> these planes as hw cursor planes. This would switch all compositors into
> >>>> sw cursor mode, thus damaging the performance.
> >>>
> >>> Doesn't that require special hardware support, or can any DMA pipe
> >>> support "hw cursor mode/planes", whatever that means?  Sorry for not
> >>> being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
> >>> have a different set of features / capabilities.
> >>
> >> Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
> >> DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
> >> used internally to tell the DRM core that the corresponding plane is
> >> going to be used as a "userspace cursor" plane.
> > 
> > Different capabilities for userspace, but not in terms hardware (/driver
> > support, yet)?  If so, then:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >>> Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
> >>> to believe that it's mostly to let userspace use these DMA pipes for
> >>> cursors (having cursor planes available in uapi) rather than requiring
> >>> any special hardware support (though semantics do seem to change in a
> >>> nontrivial way).
> >>
> >> Correct.
> >> DRM/userspace cursor planes = planes which userspace can use to draw
> >> mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
> >> using them
> >> DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without
> > 
> > But these DMA pipes are _not_ lightweight/limited?
> 
> No, they are not.
> 
> > 
> >> additional features, targeting HW cursor only, not present since
> >> sdm845
> >> DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
> >> 'DRM/userspace cursor plane'.
> > 
> > Ack, so it's not toggling anything hardware specific /yet/.  However,
> > does this prevent userspace from using these pipes/planes for other DMA
> > purposes as they're marked as a different _type_ of plane? 
> 
> This is what 'universal planes' API is solving.
> 
> Historically there were three kinds of planes: primary (iow background), 
> cursor and overlay.
> By default an application sees only the overlay planes and has some 
> additional API to manipulate cursors and backgrounds.
> 
> Then at some point it was found that this split is not worth all the 
> troubles, since applications can better utilize the hardware if they can 
> decide on their own what should be done. So now we still have all three 
> kinds of planes (for the legacy userspace), but behind the scenes they 
> all are the same. If an application knows how to knock the door, it will 
> see all the planes with the capabilities being exposed through plane 
> properties, etc.
> 
> Back to our case. We mark these planes as 'cursor' ones, to let the 
> legacy composers to use them for hardware cursor. I think it was decided 
> that not having the cursor is worse than requiring another blending 
> step. On the other hand newer composers see a full array of planes.

Thanks so much for this backstory, that explains why it shouldn't harm
modern compositors; in modetest I see these planes have the cursor type
property, but no restriction on zpos for example.

> > And will
> > that change when we do end up "implementing more rigorous/strict
> > hardware support"? 
> 
> Once implemented, there will be more planes for msm8998 (and eventually 
> sdm660/630, once we have them too). Some of them will be limited in size 
> or in the Z order (cursor), some will not (rgb, dma, vig).

That's what I saw one of the linked patches; at that point we should add
separate feature bits for this so as to not limit the size or Z-order
range for these DMA-pipes-disguised-as-cursor-planes.

> > For the other SoCs, are their DMA pipes also
> > featureful and would the presence of DPU_SSPP_CURSOR severely limit its
> > functionality? 
> 
> All DMA pipes have the same set of features (in the same generation of 
> course).
> No, it's just a software marker.

Ack yes, so again once the software marker starts limiting properties
for actual CURSOR support (on pre-msm8998) we should distinguish them
from DMA pipes that are simply marked as cursor planes...

> > And is this thing that "virtual planes" would be going
> > to "solve"?
> 
> Included. The virtual planes is trying to solve a slightly different 
> part of the story: to remove 1:1 correspondence between planes and 
> pipes. Sometimes it would be nice to use two HW pipes for a single DRM 
> plane (e.g. the kernel expects to have a single primary plane whose 
> resolution matches the resolution of the CRTC, 4k = two SSPP because of 
> hardware limitations). Sometimes a single HW pipe can be used to drive 
> two DRM planes (see multirect). So, pretty much in the same way as we 
> use one or two LMs to drive a CRTC, it is useful to use 1/2, 1 or 2 
> SSPPs to drive a single DRM plane.

Ah, ack, that makes sense, and it wouldn't / shouldn't be up to
userspace to assign and use the pipes on its own.

- Marijn
