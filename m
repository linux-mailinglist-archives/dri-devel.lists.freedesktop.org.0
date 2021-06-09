Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEC3A0824
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 02:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B2A6E5D3;
	Wed,  9 Jun 2021 00:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45666E5D3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 00:08:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623197295; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BSV6xlX0X/MGOVMKKHLN7kDPPVxnF8zn2RwBKv3Qo8I=;
 b=CBa5SnxKnD16bA55XueL00oxVKkKr+YlYfNMwpmFNRnyg8z+OgoikuqpJRc+MNO2X/FavdZY
 aOo4OWKcietJdSGAujKPvgGkm1qHvRKqT+dmy8WEwSTtdGDew7NdoEQ293ZdaVLgKcz8DchI
 Q13rwoTAxIQ9lGv3GxoF6HSCsdM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60c0066ded59bf69cc129ed2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 00:08:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A0BACC43460; Wed,  9 Jun 2021 00:08:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9BFBC433F1;
 Wed,  9 Jun 2021 00:08:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 08 Jun 2021 17:08:10 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/dp: Simplify the mvid/nvid
 calculation
In-Reply-To: <YL/PbsggxgQCiCsM@builder.lan>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-2-bjorn.andersson@linaro.org>
 <a761ca2648c290300442f4addb4a0ea2@codeaurora.org>
 <YL/PbsggxgQCiCsM@builder.lan>
Message-ID: <f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org>
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

On 2021-06-08 13:13, Bjorn Andersson wrote:
> On Fri 28 May 18:11 CDT 2021, abhinavk@codeaurora.org wrote:
> 
>> Hi Bjorn
>> 
>> On 2021-05-10 21:20, Bjorn Andersson wrote:
>> > In the search for causes to timing issues seen during implementation of
>> > eDP support for SC8180x a fair amount of time was spent concluding why
>> > the calculated mvid/nvid values where wrong.
>> >
>> > The overall conclusion is that the ratio of MVID/NVID describes, and
>> > should match, the ratio between the pixel and link clock.
>> >
>> > Downstream this calculation reads the M and N values off the pixel clock
>> > straight from DISP_CC and are then adjusted based on knowledge of how
>> > the link and vco_div (parent of the pixel clock) are derrived from the
>> > common VCO.
>> >
>> > While upstreaming, and then extracting the PHY driver, the resulting
>> > function performs the following steps:
>> >
>> > 1) Adjust the passed link rate based on the VCO divider used in the PHY
>> >    driver, and multiply this by 10 based on the link rate divider.
>> > 2) Pick reasonable choices of M and N, by calculating the ratio between
>> >    this new clock and the pixel clock.
>> > 3) Subtract M from N and flip the bits, to match the encoding of the N
>> >    register in DISP_CC.
>> > 4) Flip the bits of N and add M, to get the value of N back.
>> > 5) Multiply M with 5, per the documentation.
>> > 6) Scale the values such that N is close to 0x8000 (or larger)
>> > 7) Multply M with 2 or 3 depending on the link rate of HBR2 or HBR3.
>> >
>> > Presumably step 3) was added to provide step 4) with expected input, so
>> > the two cancel each other out. The factor of 10 from step 1) goes into
>> > the denominator and is partially cancelled by the 5 in the numerator in
>> > step 5), resulting in step 7) simply cancelling out step 1).
>> >
>> 
>> Both the multiplication of M with 5 and N with 2 or 3 is coming 
>> because of
>> the
>> ratio between the vco clk and the link clk.
>> So we could have 2.7, 5.4 or 8.1 Gbps link clks and the factor of 2 or 
>> 3
>> gets added because hbr2 is 2 * hbr and hbr3 is 3 * hbr.
>> 
> 
> Thanks for explaining the origin of these numbers, I had quite a
> difficult time figuring out where the "magic" came from.
> 
>> Your summary is pretty much right otherwise. Let me add some more 
>> points
>> here:
>> 
>> 1) Originally we removed reading the M_VID and N_VID from the DISPCC 
>> regs
>> because
>> of previous upstream comments that we can potentially just recalculate
>> whatever the clk driver is programming
>> by using rational_best_approximation
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/clk/qcom/clk-rcg2.c#L1160
>> 
>> Not having to read from DISPCC register is also useful because we dont 
>> have
>> to maintain the register offset
>> of the M_VID and N_VID which keeps changing across chipsets.
>> 
> 
> Right, so downstream we do all the math and then we scale the
> denominator by 2x or 3x to compensate for the fact that we didn't
> account for the division as the clock left the PLL.
> 
> As this was reworked upstream for some reason this compensation was
> retained, so the denominator would always be 2x or 3x to large for HBR2
> and HBR3. So the way this was solved was to divide by 2x or 3x before
> calculating the ratio.
> 
>> However we discussed this again after viewing this patch. So the clk 
>> driver
>> always operates on the vco clk
>> and calculates the pixel clk from it and sets the M_VID and N_VID 
>> based on
>> that.
>> In terms of accuracy, the best way is still to re-use the M_VID and 
>> N_VID
>> which the clk driver sets because
>> the pixel clock was generated based on that and that is the actual 
>> pixel
>> clock we are going to get.
>> 
>> So even before this change we lost some accuracy because the pixel 
>> clock we
>> are giving here to recalculate
>> the M_VID and N_VID is a theoretical value. Although for most values 
>> of
>> pixel clk, theoretical and actual
>> should match. There could be corner cases of pixel clock where its a 
>> bit
>> different. Hence ideally, re-using the M_VID
>> and N_VID which the clk driver set would have been the best but not 
>> having
>> to hard-code M_VID and N_VID offsets
>> was a good enough reason to not go back to that again.
>> 
>> Now, coming to this change. Here its trying to again re-calculate the 
>> M_VID
>> and N_VID by using the same
>> API which the clk driver uses but uses link clk and pixel clk as the
>> parameters Vs the clk driver uses
>> vco clk and actual pixel clock to calculate this.
>> 
>> So even though this cleanup eliminates the adjustments we need to make 
>> to
>> account for the VCO clk to link clk ratio,
>> it also could bring additional difference between what was actually 
>> set by
>> the clk driver and what we are calculating
>> here because clk driver used vco clk as the input vs here we use link 
>> clk
>> after this change.
>> There might be some pixel clock rates of some resolutions where this
>> difference could be risky.
>> 
>> Hence the overall conclusion here was to keep using vco clk as the 
>> input to
>> rational_best_approximation
>> and not make more changes to this.
>> 
> 
> So what you're saying is that the reason for this obfuscation is to
> replicate any rounding errors happening in the path of the link clock
> generation?
> 
> If that's the case then this needs a giant comment describing exactly
> what's happening and why this function needs to be impenetrable.
> 
> 
> That said, from my attempts to write this patch (and add widebus
> support) I saw a huge flexibility in getting this right, so can you
> please elaborate on the value of the precision of the ratio.
> 

The overall goal here is just to replicate whats happening in the clock 
driver and clock hardware to calculate the pixel clock.
That is, use the same inputs and function as the ones used in clk driver 
to calculated to set the DISPCC_MVID and DISPCC_NVID regs.

I think i have already explained why we need the *2 and *3 in the math. 
If you need, sure I can document this as well in code
comments.

By obfuscation are you referring to this snippet?
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dp/dp_catalog.c#L446

This is just recalculating the dispcc rate from the pixel clock rate so 
that we feed the same input
to the rational_best_approximation as what the clock driver would do and 
hence making our input
and output same for the rational_best_approximation as the clock driver 
to maintain consistency and I will explain why.

Let me explain a little bit more on the mnd precision i am referring to.

The clock driver will also use the same API to calculate the mnds and 
generate a pixel clock.
It might not match the requested theoretical pixel clock as the mnds 
calculated with this API might have some precision errors.

rational_best_approximation(dispcc_input_rate, stream_rate_khz,
			(unsigned long)(1 << 16) - 1,
			(unsigned long)(1 << 16) - 1, &den, &num);

By using the same input (dispcc rate) and output(pixel clk) rates, we 
are getting the same mnds and hence same mvid and nvid.

If you use the link clk rate here instead, it might generate some other 
mvid/nvid and the pixel clock for that might be which is different
from what is the actual pixel clock which the PLL generated ( due to the 
mnd calculated using the API ).

Hence to preserve the same loss of accuracy which the clock driver would 
have, we would prefer to use the same input here too.

Let me know if its still not clear.

> Regards,
> Bjorn
