Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616BE4B9920
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344410E8BC;
	Thu, 17 Feb 2022 06:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CACE10E883;
 Thu, 17 Feb 2022 06:19:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B20D4618CC;
 Thu, 17 Feb 2022 06:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53737C340E8;
 Thu, 17 Feb 2022 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645078793;
 bh=4phkKQaKpSnplKxFP+P7GfFkUsrlVvHYQSCB/fTUT8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=STW/z4lnU6/f2WRCtmUX0HNiN4L/YsFnf8nnyyq4ePYYVMqwSVPsYbEn0lv9OyruA
 VbliK9u/tLs/k+kMIE/LqAmZUOx7j7zxDQ4TVzfAPBdWMZTH7wa0DkhrSOdPXeK5X3
 R7HeJgwUNW/ckIhV9djbnVBukLWuiqD3uT/uSCs/SDBtmGzPAC7dYfuq1FzPm/S+GU
 i9bBLpxVL4CPT6Ikq7WDsktDZAu8A5Chn6pD4rZLBhydcJ1PcQEns+DRglIofZ0y/s
 wFpuHkfC1lbdyNKGAofD9ggXD8MJpH8t8jSOQ9cUfLQ2KMBxKxnnlq4YVkqT7KNIC8
 wl3xylhaDDIOQ==
Date: Thu, 17 Feb 2022 11:49:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [REPOST PATCH v4 13/13] drm/msm/dsi: Add support for
 DSC configuration
Message-ID: <Yg3pBQkdq9WpCbVs@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-14-vkoul@kernel.org>
 <a59295f2-d3ba-5d10-ac96-c00e4cf90e4a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59295f2-d3ba-5d10-ac96-c00e4cf90e4a@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-02-22, 19:44, Abhinav Kumar wrote:
> 
> 
> On 2/10/2022 2:34 AM, Vinod Koul wrote:
> > When DSC is enabled, we need to configure DSI registers accordingly and
> > configure the respective stream compression registers.
> > 
> > Add support to calculate the register setting based on DSC params and
> > timing information and configure these registers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 109 ++++++++++++++++++++++++++++-
> >   2 files changed, 118 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > index 49b551ad1bff..c1c85df58c4b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> > @@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
> >   #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
> > +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
> > +
> > +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2			0x000002a0
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
> > +
> > +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3			0x000002ac
> > +
> 
> This file should not be edited manually. The updates have to be generated
> using the headergen tool.

I have already send mesa patch for that. https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967#note_1253974
You should chime in there as well :)

I will split these and get these generated one as a separate patch..


> 
> >   #endif /* DSI_XML */
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 438c80750682..3d8d5a1daaa3 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> >   		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
> >   }
> > +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> > +				  int pic_width, int pic_height)
> > +{
> > +	if (!dsc || !pic_width || !pic_height) {
> > +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsc->drm->pic_width = pic_width;
> > +	dsc->drm->pic_height = pic_height;
> > +
> > +	return 0;
> > +}
> > +
> >   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   {
> >   	struct drm_display_mode *mode = msm_host->mode;
> > @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   		hdisplay /= 2;
> >   	}
> > +	if (msm_host->dsc) {
> > +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> > +
> > +		/* update dsc params with timing params */
> > +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
> > +		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
> > +
> > +		/* we do the calculations for dsc parameters here so that
> > +		 * panel can use these parameters
> > +		 */
> > +		dsi_populate_dsc_params(dsc);
> > +
> > +		/* Divide the display by 3 but keep back/font porch and
> > +		 * pulse width same
> > +		 */
> > +		h_total -= hdisplay;
> > +		hdisplay /= 3;
> > +		h_total += hdisplay;
> > +		ha_end = ha_start + hdisplay;
> > +	}
> > +
> >   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > +		if (msm_host->dsc) {
> > +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> > +			u32 reg, intf_width, slice_per_intf;
> > +			u32 total_bytes_per_intf;
> > +
> > +			/* first calculate dsc parameters and then program
> > +			 * compress mode registers
> > +			 */
> > +			intf_width = hdisplay;
> > +			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> > +
> > +			dsc->drm->slice_count = 1;
> 
> Why is this hard-coded to 1 here? Am i missing something?
> I think I need another day to look into these calculations.

Thanks for spotting this, it should be:
                        dsc->drm->slice_count = DIV_ROUND_UP(intf_width, dsc->drm->slice_widths);

which is slice_per_intf so I will update this

-- 
~Vinod
