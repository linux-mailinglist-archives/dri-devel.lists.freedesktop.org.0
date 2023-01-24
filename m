Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8167974A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406310E673;
	Tue, 24 Jan 2023 12:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDEF10E673
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 12:06:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AB46D41B01;
 Tue, 24 Jan 2023 13:06:53 +0100 (CET)
Date: Tue, 24 Jan 2023 13:06:52 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [1/2] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
Message-ID: <20230124120652.rqmaj2j4jytmvzbl@SoMainline.org>
References: <20230115124143.464809-1-dmitry.baryshkov@linaro.org>
 <20230124095944.4zez2jmidjuh3nvf@SoMainline.org>
 <9f182939-0e32-c0a9-ee09-9e97a48bb7ac@linaro.org>
 <20230124111250.b2r2co4jjxofjchp@SoMainline.org>
 <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprPxm6PObLapAXr_D5d85oT8y2GhoCzABLq_u2xFDhkvQ@mail.gmail.com>
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

On 2023-01-24 13:20:57, Dmitry Baryshkov wrote:
> On Tue, 24 Jan 2023 at 13:12, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-01-24 12:19:27, Dmitry Baryshkov wrote:
> > > On 24/01/2023 11:59, Marijn Suijten wrote:
> > > > On 2023-01-15 14:41:42, Dmitry Baryshkov wrote:
> > > >> DMA2 and DMA3 planes on msm8998 should use corresponding DMA2 and DMA3
> > > >> clocks rather than CURSOR0/1 clocks (which are used for the CURSOR
> > > >> planes). Correct corresponding SSPP declarations.
> > > >>
> > > >> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> > > >> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > > >> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> > > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> ---
> > > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
> > > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> index 0f3da480b066..ad0c55464154 100644
> > > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > > >> @@ -1180,9 +1180,9 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
> > > >>    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
> > > >>            sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> > > >>    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
> > > >
> > > > Drop the _CURSOR mask here?  And the double space....
> > >
> > > Ack for the doublespace. By removing _CURSOR we would disallow using
> > > these planes as hw cursor planes. This would switch all compositors into
> > > sw cursor mode, thus damaging the performance.
> >
> > Doesn't that require special hardware support, or can any DMA pipe
> > support "hw cursor mode/planes", whatever that means?  Sorry for not
> > being well versed in this area, I'd expect DMA pipes and CURSOR pipes to
> > have a different set of features / capabilities.
> 
> Yes, they have different capabilities. but DMA_CURSOR_MSM8998_MASK =
> DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR). And the DPU_SSPP_CURSOR is
> used internally to tell the DRM core that the corresponding plane is
> going to be used as a "userspace cursor" plane.

Different capabilities for userspace, but not in terms hardware (/driver
support, yet)?  If so, then:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> > Commit 07ca1fc0f8a0 ("drm/msm/dpu: enable cursor plane on dpu") leads me
> > to believe that it's mostly to let userspace use these DMA pipes for
> > cursors (having cursor planes available in uapi) rather than requiring
> > any special hardware support (though semantics do seem to change in a
> > nontrivial way).
> 
> Correct.
> DRM/userspace cursor planes = planes which userspace can use to draw
> mouse cursor. Legacy compositors and legacy cursor IOCTLs stick to
> using them
> DPU/MDP5 CURSOR plane (sspp_12/13) = lightweight limited plane without

But these DMA pipes are _not_ lightweight/limited?

> additional features, targeting HW cursor only, not present since
> sdm845
> DPU_SSPP_CURSOR = bit which tells DPU core to mark a plane as
> 'DRM/userspace cursor plane'.

Ack, so it's not toggling anything hardware specific /yet/.  However,
does this prevent userspace from using these pipes/planes for other DMA
purposes as they're marked as a different _type_ of plane?  And will
that change when we do end up "implementing more rigorous/strict
hardware support"?  For the other SoCs, are their DMA pipes also
featureful and would the presence of DPU_SSPP_CURSOR severely limit its
functionality?  And is this thing that "virtual planes" would be going
to "solve"?

<snip>

> > As we've seen in [1] (specifically [2]) there are a few more driver/hw
> > changes required to properly implement/support DPU_SSPP_CURSOR?
> >
> > [1]: https://github.com/rawoul/linux/commits/next_20220624-msm8998-hdmi
> > [2]; https://github.com/rawoul/linux/commit/7d8d739cfbfa551120868986d5824f7b2b116ac1

Referring to changes like these ^.

- Marijn
