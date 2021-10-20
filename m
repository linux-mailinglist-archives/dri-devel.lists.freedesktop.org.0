Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42A6434A97
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 13:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413B36E98B;
	Wed, 20 Oct 2021 11:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D706E981;
 Wed, 20 Oct 2021 11:53:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AD9C610FF;
 Wed, 20 Oct 2021 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634730793;
 bh=LPilRozXFzNZOz01IWQiBAPTdt+ygRCJKYug0spKdNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvhn22dibhmZuoveod285NcYtaYI65jhGHLy4kXrkuPF+lOrVtlQjNFtJ0VXEAKgd
 4yHPAa05ane+E/hdIOrkMcEP9oZsc50AZXny5UjwlzM+gJf2HdmqB3qH4Yn7fg7hk6
 lFhu+cOcz0rOiyijiAX3Uq2RK1nCaLHHT51hAHuT/PGz67DhHDUvF5pIyWHj9PjYJF
 Jj+83ZGrrpbzJWOPHmCyyG8Bno0Yj0DvfyXxDtsMDzSSVvc/l+VFwEQJ+ohOzOhJnX
 GEtYyyPldbZ+9r8a6DTPRe1cTjcF0vwJlGp/iaVVvBnkcGdqlt3GadBmBGmJM8Sbka
 wd/mj3iWVR/0Q==
Date: Wed, 20 Oct 2021 17:23:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 10/11] drm/msm/dsi: Add support for DSC configuration
Message-ID: <YXADJjJ1y9Xp2Zlj@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-11-vkoul@kernel.org>
 <785fe3bf-71fa-aabd-dadf-828b91396fba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <785fe3bf-71fa-aabd-dadf-828b91396fba@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15-10-21, 02:18, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:
> > When DSC is enabled, we need to configure DSI registers accordingly and
> > configure the respective stream compression registers.
> > 
> > Add support to calculate the register setting based on DSC params and
> > timing information and configure these registers.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 123 ++++++++++++++++++++++++++++-
> >   2 files changed, 132 insertions(+), 1 deletion(-)
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
> >   #endif /* DSI_XML */
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index ba24458c2e38..86e36a3e97b6 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -946,6 +946,26 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
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
> > +	if ((pic_width % dsc->drm->slice_width) || (pic_height % dsc->drm->slice_height)) {
> > +		pr_err("DSI: pic_dim %dx%d has to be multiple of slice %dx%d\n",
> > +		       pic_width, pic_height, dsc->drm->slice_width, dsc->drm->slice_height);
> > +		return -EINVAL;
> > +	}
> 
> This should go to the mode_valid() callback for the dsi_bridge.

Done added a new callback for dsi_bridge to check the mode valid if DSC
is enabled

> 
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
> > @@ -978,7 +998,72 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
> > +			/* If slice_count > slice_per_intf, then use 1
> > +			 * This can happen during partial update
> > +			 */
> > +				dsc->drm->slice_count = 1;
> 
> Is the if() missing here? The indentpation and the comment seems unclear
> about that.

yes, fixed that

-- 
~Vinod
