Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2739490D
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 01:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFEF6F637;
	Fri, 28 May 2021 23:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FC26F638
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 23:11:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622243488; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2Z/GeWdCXZgnDFcu3EXmGF11JqV9hJt06Gh0AnJGtBE=;
 b=FsZoWYBUFOIrco7EcN+b07h/Fuv9zZ5sVAkzWrPH0bS2tdYQqsle39SXS3p6zVA80aG3D2d2
 l7dNIZKda8IiVMBS9HSUUsXU4xBeWnK7RFy88B2vXTLAAKV5YsFAMHH/6uFTkt/iCHMOjZV7
 EOALZGcfoOGhGbnIIQ/ywA5IHbI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60b17893f726fa41885636d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 23:11:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C4C8AC43460; Fri, 28 May 2021 23:11:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3350EC433D3;
 Fri, 28 May 2021 23:11:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 May 2021 16:11:13 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/dp: Simplify the mvid/nvid
 calculation
In-Reply-To: <20210511042043.592802-2-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-2-bjorn.andersson@linaro.org>
Message-ID: <a761ca2648c290300442f4addb4a0ea2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn

On 2021-05-10 21:20, Bjorn Andersson wrote:
> In the search for causes to timing issues seen during implementation of
> eDP support for SC8180x a fair amount of time was spent concluding why
> the calculated mvid/nvid values where wrong.
> 
> The overall conclusion is that the ratio of MVID/NVID describes, and
> should match, the ratio between the pixel and link clock.
> 
> Downstream this calculation reads the M and N values off the pixel 
> clock
> straight from DISP_CC and are then adjusted based on knowledge of how
> the link and vco_div (parent of the pixel clock) are derrived from the
> common VCO.
> 
> While upstreaming, and then extracting the PHY driver, the resulting
> function performs the following steps:
> 
> 1) Adjust the passed link rate based on the VCO divider used in the PHY
>    driver, and multiply this by 10 based on the link rate divider.
> 2) Pick reasonable choices of M and N, by calculating the ratio between
>    this new clock and the pixel clock.
> 3) Subtract M from N and flip the bits, to match the encoding of the N
>    register in DISP_CC.
> 4) Flip the bits of N and add M, to get the value of N back.
> 5) Multiply M with 5, per the documentation.
> 6) Scale the values such that N is close to 0x8000 (or larger)
> 7) Multply M with 2 or 3 depending on the link rate of HBR2 or HBR3.
> 
> Presumably step 3) was added to provide step 4) with expected input, so
> the two cancel each other out. The factor of 10 from step 1) goes into
> the denominator and is partially cancelled by the 5 in the numerator in
> step 5), resulting in step 7) simply cancelling out step 1).
> 

Both the multiplication of M with 5 and N with 2 or 3 is coming because 
of the
ratio between the vco clk and the link clk.
So we could have 2.7, 5.4 or 8.1 Gbps link clks and the factor of 2 or 3
gets added because hbr2 is 2 * hbr and hbr3 is 3 * hbr.

Your summary is pretty much right otherwise. Let me add some more points 
here:

1) Originally we removed reading the M_VID and N_VID from the DISPCC 
regs because
of previous upstream comments that we can potentially just recalculate 
whatever the clk driver is programming
by using rational_best_approximation
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/clk/qcom/clk-rcg2.c#L1160

Not having to read from DISPCC register is also useful because we dont 
have to maintain the register offset
of the M_VID and N_VID which keeps changing across chipsets.

However we discussed this again after viewing this patch. So the clk 
driver always operates on the vco clk
and calculates the pixel clk from it and sets the M_VID and N_VID based 
on that.
In terms of accuracy, the best way is still to re-use the M_VID and 
N_VID which the clk driver sets because
the pixel clock was generated based on that and that is the actual pixel 
clock we are going to get.

So even before this change we lost some accuracy because the pixel clock 
we are giving here to recalculate
the M_VID and N_VID is a theoretical value. Although for most values of 
pixel clk, theoretical and actual
should match. There could be corner cases of pixel clock where its a bit 
different. Hence ideally, re-using the M_VID
and N_VID which the clk driver set would have been the best but not 
having to hard-code M_VID and N_VID offsets
was a good enough reason to not go back to that again.

Now, coming to this change. Here its trying to again re-calculate the 
M_VID and N_VID by using the same
API which the clk driver uses but uses link clk and pixel clk as the 
parameters Vs the clk driver uses
vco clk and actual pixel clock to calculate this.

So even though this cleanup eliminates the adjustments we need to make 
to account for the VCO clk to link clk ratio,
it also could bring additional difference between what was actually set 
by the clk driver and what we are calculating
here because clk driver used vco clk as the input vs here we use link 
clk after this change.
There might be some pixel clock rates of some resolutions where this 
difference could be risky.

Hence the overall conclusion here was to keep using vco clk as the input 
to rational_best_approximation
and not make more changes to this.

> Left is the code that finds the ratio between the two arguments, scaled
> to keep the denominator close to or larger than 0x8000. And this is our
> mvid/nvid pair.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 41 +++++------------------------
>  1 file changed, 6 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b1a9b1b98f5f..2eb37ee48e42 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -415,39 +415,16 @@ void dp_catalog_ctrl_config_msa(struct
> dp_catalog *dp_catalog,
>  					u32 rate, u32 stream_rate_khz,
>  					bool fixed_nvid)
>  {
> -	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
> -	u32 const link_rate_hbr2 = 540000;
> -	u32 const link_rate_hbr3 = 810000;
> -	unsigned long den, num;
> -
> +	unsigned long mvid, nvid;
>  	struct dp_catalog_private *catalog = container_of(dp_catalog,
>  				struct dp_catalog_private, dp_catalog);
> 
> -	if (rate == link_rate_hbr3)
> -		pixel_div = 6;
> -	else if (rate == 1620000 || rate == 270000)
> -		pixel_div = 2;
> -	else if (rate == link_rate_hbr2)
> -		pixel_div = 4;
> -	else
> -		DRM_ERROR("Invalid pixel mux divider\n");
> -
> -	dispcc_input_rate = (rate * 10) / pixel_div;
> -
> -	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
> -			(unsigned long)(1 << 16) - 1,
> -			(unsigned long)(1 << 16) - 1, &den, &num);
> -
> -	den = ~(den - num);
> -	den = den & 0xFFFF;
> -	pixel_m = num;
> -	pixel_n = den;
> -
> -	mvid = (pixel_m & 0xFFFF) * 5;
> -	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
> +	rational_best_approximation(stream_rate_khz, rate,
> +				    (1 << 16) - 1, (1 << 16) - 1,
> +				    &mvid, &nvid);
> 
> +	/* Adjust values so that nvid is close to DP_LINK_CONSTANT_N_VALUE */
>  	if (nvid < nvid_fixed) {
>  		u32 temp;
> 
> @@ -456,13 +433,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog
> *dp_catalog,
>  		nvid = temp;
>  	}
> 
> -	if (link_rate_hbr2 == rate)
> -		nvid *= 2;
> -
> -	if (link_rate_hbr3 == rate)
> -		nvid *= 3;
> -
> -	DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> +	DRM_DEBUG_DP("mvid=0x%lx, nvid=0x%lx\n", mvid, nvid);
>  	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
>  	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
>  	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
