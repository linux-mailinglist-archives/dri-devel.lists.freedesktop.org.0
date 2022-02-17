Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2974BACBD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB610E899;
	Thu, 17 Feb 2022 22:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9785F10E88B;
 Thu, 17 Feb 2022 22:39:15 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D04AB3F777;
 Thu, 17 Feb 2022 23:39:13 +0100 (CET)
Date: Thu, 17 Feb 2022 23:39:12 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 03/13] drm/msm/disp/dpu1: Add support for DSC in
 pingpong block
Message-ID: <20220217223912.xl5ofq3aoy44p4vv@SoMainline.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-4-vkoul@kernel.org>
 <20220217215437.gvxmfjgfqzljactz@SoMainline.org>
 <643681f1-0887-ad61-2686-2f4408f56637@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <643681f1-0887-ad61-2686-2f4408f56637@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-18 01:12:02, Dmitry Baryshkov wrote:
> On 18/02/2022 00:54, Marijn Suijten wrote:
> > On 2021-11-16 11:52:46, Vinod Koul wrote:
> >> In SDM845, DSC can be enabled by writing to pingpong block registers, so
> >> add support for DSC in hw_pp
> > 
> > Nit: I don't think the ", so add support for DSC in XXX" part in this
> > and other commit messages add anything.  You've already stated that in
> > the title, the commit body is just extra justification (and can perhaps
> > be filled with extra details about the patch contents instead).
> > 
> >> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
> >>   2 files changed, 46 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> index 55766c97c4c8..47c6ab6caf95 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> >> @@ -28,6 +28,9 @@
> >>   #define PP_FBC_MODE                     0x034
> >>   #define PP_FBC_BUDGET_CTL               0x038
> >>   #define PP_FBC_LOSSY_MODE               0x03C
> >> +#define PP_DSC_MODE                     0x0a0
> >> +#define PP_DCE_DATA_IN_SWAP             0x0ac
> > 
> > This enum does not seem used here, is it used in another patch?
> > 
> >> +#define PP_DCE_DATA_OUT_SWAP            0x0c8
> >>   
> >>   #define PP_DITHER_EN			0x000
> >>   #define PP_DITHER_BITDEPTH		0x004
> >> @@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
> >>   	return line;
> >>   }
> >>   
> >> +static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
> >> +{
> >> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> >> +
> >> +	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
> >> +	return 0;
> >> +}
> >> +
> >> +static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
> >> +{
> >> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> >> +
> >> +	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
> >> +}
> >> +
> >> +static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
> >> +{
> >> +	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
> >> +	int data;
> >> +
> >> +	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
> >> +	data |= BIT(18); /* endian flip */
> >> +	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
> >> +	return 0;
> >> +}
> >> +
> >>   static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
> >>   				unsigned long features)
> >>   {
> >> @@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
> >>   	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
> >>   	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> >>   	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> >> +	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> >> +	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> >> +	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> >>   
> >>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
> >>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> >> index 89d08a715c16..12758468d9ca 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> >> @@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
> >>   	 */
> >>   	void (*setup_dither)(struct dpu_hw_pingpong *pp,
> >>   			struct dpu_hw_dither_cfg *cfg);
> >> +	/**
> >> +	 * Enable DSC
> >> +	 */
> >> +	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
> >> +
> >> +	/**
> >> +	 * Disable DSC
> >> +	 */
> >> +	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
> > 
> > It looks like most other callbacks in dpu1 use an `enable` function with
> > a boolean, instead of having a separate disable function.  That should
> > simplify the implementation down to a single ternary-if, too.  Would
> > that be desired to use here?
> 
> Just my 2c. I personally hate the unified functions with the boolean 
> argument. One of the reasons being the return value. Typically you do 
> not expect that the disable function can fail (or return an error). But 
> the unified function provides an error (to be handled) even in the 
> disable case.
> 
> Last, but not least, overall the kernel API is biased towards separate 
> enable and disable calls.

Fair enough, we should replace the other functions then.  Or perhaps
drop the return argument entirely, it's always zero for enable_dsc
anyway.  I doubt we'll ever add additional checks here?  If we do,
things can be split again.

- Marijn
