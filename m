Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD315167A5
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 22:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354210E233;
	Sun,  1 May 2022 20:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0DE10E1FF
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 20:06:40 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 34AB43F3E7;
 Sun,  1 May 2022 22:06:37 +0200 (CEST)
Date: Sun, 1 May 2022 22:06:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-30 12:25:57, Abhinav Kumar wrote:
> 
> 
> On 4/30/2022 11:58 AM, Marijn Suijten wrote:
> > On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
> >> The downstream uses read-modify-write for updating command mode
> >> compression registers. Let's follow this approach. This also fixes the
> >> following warning:
> >>
> >> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I pointed this out in review multiple times, so you'll obviously get my:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > (But are you sure there's nothing else to clear in the 1st CTRL
> > register, only the lowest 16 bits?  That should mean `reg` never
> > contains anything in 0xffff0000)
> 
> The top 16 bits contain information for stream 1.
> 
> Stream 1 is unused. And whatever is the reset value we should retain that.
> 
> So this patch is correct.

I was not debating the correctness of this patch, quite the contrary:
it's already much better than it was before.

I'm simply asking whether we should prevent `reg` (not `reg_ctrl`!)
from having anything in the top 16 bits, which would overwrite the reset
value for stream 1 which you correctly say should be retained as it is.
It seems unlikely that this happens, but better be safe than sorry?

Looking at the DSI register definition for DSC [1] again, I wonder if
there's support for defining a common bitfield layout and reusing it
thrice: the two channels for CMD mode and a single use for VIDEO.  Don't
think that'd make the kernel code better though if even possible at all.

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967/diffs

- Marijn

> > 
> > However, this seems to indicate that the DSC patch series has been
> > approved and merged somehow??
> > 
> >> ---
> >>
> >> Changes since v1:
> >>   - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
> >>     (Abhinav)
> >>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index c983698d1384..a95d5df52653 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >>   		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> >>   		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> >>   
> >> +		reg_ctrl &= ~0xffff;
> >>   		reg_ctrl |= reg;
> >> +
> >> +		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
> >>   		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
> >>   
> >> -		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
> >> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
> >>   		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
> >>   	} else {
> >>   		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> >> -- 
> >> 2.35.1
> >>
