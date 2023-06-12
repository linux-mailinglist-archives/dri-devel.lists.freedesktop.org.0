Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9B72CD74
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2B710E1E9;
	Mon, 12 Jun 2023 18:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567810E055
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:04:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3A92520071;
 Mon, 12 Jun 2023 20:04:28 +0200 (CEST)
Date: Mon, 12 Jun 2023 20:04:26 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v6 6/6] drm/msm/dsi: Document DSC related
 pclk_rate and hdisplay calculations
Message-ID: <ufirohxuhba32znw74pxvyhsvgfr7sejrreh4unhj6chmneood@aszgvd7xrr6l>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
 <6uiyqgggt2a3gkcihtyzr4rvq5igbe3ojpeiqnji22663bhh2l@3jifgk7bw4u5>
 <ffdaddd0-4f2b-7846-322b-8efeadf7ed0c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffdaddd0-4f2b-7846-322b-8efeadf7ed0c@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-12 10:26:39, Abhinav Kumar wrote:
> 
> 
> On 6/11/2023 3:03 PM, Marijn Suijten wrote:
> > On 2023-06-09 15:57:18, Jessica Zhang wrote:
> >> Add documentation comments explaining the pclk_rate and hdisplay math
> >> related to DSC.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index fb1d3a25765f..aeaadc18bc7b 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -564,6 +564,13 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
> >>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
> >>   		const struct drm_dsc_config *dsc)
> >>   {
> >> +	/*
> >> +	 * Adjust the pclk rate by calculating a new hdisplay proportional to
> >> +	 * the compression ratio such that:
> >> +	 *     new_hdisplay = old_hdisplay * target_bpp / source_bpp
> >> +	 *
> >> +	 * Porches need not be adjusted during compression.
> >> +	 */
> >>   	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> >>   			dsc->bits_per_component * 3);
> > 
> > I won't reiterate my original troubles with this logic and the comment
> > as that has well been described in v5 replies.
> > 
> > Just want to ask why this comment couldn't be added in patch 5/6
> > immediately when the logic is introduced?  Now readers won't have a clue
> > what is going on until they skip one patch ahead.
> > 
> 
> Both myself and Dmitry discussed that in this particular case, we will 
> add the documentation as a follow-up patch and merge it together. Not 
> usually the process, but in this case, just decided to do it this way. 
> The series will still be merged as one.

Just saying that it doesn't make much sense from a "reading the patches
after they've been merged" point of view, maybe there was a
misunderstanding here that Dmitry would have been okay with a followup
patch if the pclk patch got merged... But since it didn't, I would at
least prefer that to be squashed (but I am not the maintainer, so you'll
obviously take that with a grain of salt).

> > Furthermore it is lacking any explanation that this is a workaround for
> > cmd-mode, and that porches are currently used to represent "transfer
> > time" until those calculations are implemented.  At that point there is
> > no concept of "not adjusting porches for compressed signals" anymore.
> > 
> 
> This is a much bigger topic and goes out of scope of this patch and 
> series and I dont want to explain all that in this documentation patch.
> 
> If we explain that this is specific to command mode, what would the 
> panel drivers fill out for porches . Obviously they cannot fill out a 0.
> 
> Coming to transfer time. Even if current panel drivers use 0 porches, 
> the clock you get should still be sufficient for 60fps or a transfer 
> time of 16.66ms.
> 
> Transfer time was a concept introduced for some specific command mode 
> panels where we needed to finish transferring the frame even faster than 
> 16.66ms like 12ms or 13ms.

That probably explains why, for the same sofef01 Driver-IC for example,
but with slight variations in panels (and SoC...), I was able to achieve
60Hz on the Xperia 10 II with 0-porches, yet the Xperia 5 (and 10 III?)
require quite a bit more "pclk" to reach 60Hz.

(I don't think 10 III ever achieved 60Hz, but the clocktree and/or panel
 cmds might be wrong)

> Yes, without that, upstream and downstream math doesnt match. But that 
> doesnt mean its going to break the panels or that upstream math is 
> wrong. If you think command mode porches should be 0, then this will 
> give you the clk for 60fps. If you add some random porches, it will just 
> give a faster clock.

And exactly this little bit of text is what I'd like to see in a comment
:)

> Porches can be used instead of transfer time till we add that math but 
> again, thats only needed for panels which need a faster transfer time 
> than 16.66ms.

Same here, why can't we have this in a code comment?

> So we dont need to call this a workaround in my opinion at all (and hack 
> as you called in v5 is totally out of proportion).

Don't get me wrong, it is still a hack to only scale the hdisplay
portion without ever explaining in any comment why the porches are not
taken into account (the explanation you gave above is perfect!), instead
of calculating the right pclk from the get-go and ignoring the DRM mode
clock altogether.

> One could even argue that if the panel needs a transfer time faster than 
> 16.66ms, then the mode->clock should also be bumped up. Panels dont do 
> that today either.

But we cannot easily bump the `clock` member as that'd break the value
returned by drm_mode_vrefresh(), unless we also come up with a fake
porch in htotal or vtotal as that is what it will be divided by.

This ties into a recent discussion where "someone" mentioned that DRM
isn't really designed with CMD mode panels, in mind... and perhaps my
observations here are just scratching the surface?

> Hence, I am going to consider transfer time as an enhancement and not 
> going to take that up in this series so I am not for adding that comment 
> here.

No need to add a TODO stating that it needs to be added, but it'd be
good to at the very least explain ***why*** only the hdisplay portion is
scaled and not everything else?

> And as I have explained, this patch is not a workaround either. Its just 
> calculating the clock based on what we have today in the panel drivers.

Agree to disagree?  Beyond sending my take on these two patches as an
RFC, I don't think there's a point discussing this much furter as we
seem to disagree and misunderstand eachother on a fundamental level.
And we haven't even gotten into the "src_bpp / target_bpp" versus "24
bits per pclk" details yet.

- Marijn

> >> @@ -961,6 +968,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   
> >>   		/* Divide the display by 3 but keep back/font porch and
> >>   		 * pulse width same
> >> +		 *
> >> +		 * hdisplay will be divided by 3 here to account for the fact
> >> +		 * that DPU sends 3 bytes per pclk cycle to DSI.
> >>   		 */
> >>   		h_total -= hdisplay;
> >>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> > 
> > Still very glad to have this, thank you for adding it.  Note that it
> > only further undermines the pclk adjustments, as I just explained in v5
> > review.
> > 
> > - Marijn
> > 
> >>
> >> -- 
> >> 2.40.1
> >>
