Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC23A0500
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 22:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA376E226;
	Tue,  8 Jun 2021 20:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51086E1CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 20:13:37 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so21603380otl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cIDkDsZIjAA97ZO/nbOAwvWi13JzPMgN0KfGcuD3QLU=;
 b=UpyYnh4uH1rUTz3AIK/C6flyZWWHK5Ke1Y49QzrMb8Lm9CTXy8bmqfh5koDdW6wLqd
 00qw/jfypbchHnYq9AyTJNpsEKJM8JoBUevt8Cp/UxRL6EuvTjj8dlbB7JvvZs+AD07c
 K0OvGMdMBCi1OYPVzlenVocGhp39LXcTbff2A36oooliuJIzTnJGqPwbrSfgRTAxvfn6
 5l7d2vDrm7E+YyNpthksHXu8X+GOk+CS3pdTZuDVezURsfVx6e2YQ5GzOa7a80AH/C6E
 jPTMAkYsBf2hHI0PTan4fgLda1pVvfEPHZGHQ1uIr+O4by8jrsp/eGEjxgIetFy1NaNM
 n83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cIDkDsZIjAA97ZO/nbOAwvWi13JzPMgN0KfGcuD3QLU=;
 b=NbVZPsTdM92rmxl+gc2LUaLwoQZR1lIkDGeOQplKx2bKqKb8ESPa/7zk7QPUVWNMFO
 q4bg6E+U1QjOr5LJXFLelFksBYdp3hz/s7u66wNCZWf8apy2j0fuwazZ//fhDjTKjeNR
 1A9MZ6ZYq5zxl0F7v/1GoE5zuD+wNcLveWr4/wLv0GhS8k7upUPZt/+I0zaCAm+BZcjG
 NrcwY8QSy4+hxUlUWyyOLikKz9wkrNTDu1xuxjF2OyLBUbgnh/m8jNVui2H2ow7pPauF
 bJ/F9EKo5Y117GOhpYix798gkq0iIz3kY3CbauhUytNBPPtiYBvtsJnLSicJDXKHxbxh
 R0Bg==
X-Gm-Message-State: AOAM530W8nf7Fd3WqzPiUhlma/EyJSDf9TyvMDW5qjuXM9+zBBi0X1v2
 hDyK40wgKrPEVPKQ1+inE/03XA==
X-Google-Smtp-Source: ABdhPJyAtjgviT0tuU2CASzB5dNdB0sHk3AzzEgIl//zsC0IY+zZeXpALkZZ720jcESPdyBwGv107Q==
X-Received: by 2002:a05:6830:1342:: with SMTP id
 r2mr11192529otq.136.1623183216901; 
 Tue, 08 Jun 2021 13:13:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 129sm3038330ooq.34.2021.06.08.13.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 13:13:36 -0700 (PDT)
Date: Tue, 8 Jun 2021 15:13:34 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Subject: Re: [Freedreno] [PATCH 1/4] drm/msm/dp: Simplify the mvid/nvid
 calculation
Message-ID: <YL/PbsggxgQCiCsM@builder.lan>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-2-bjorn.andersson@linaro.org>
 <a761ca2648c290300442f4addb4a0ea2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a761ca2648c290300442f4addb4a0ea2@codeaurora.org>
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

On Fri 28 May 18:11 CDT 2021, abhinavk@codeaurora.org wrote:

> Hi Bjorn
> 
> On 2021-05-10 21:20, Bjorn Andersson wrote:
> > In the search for causes to timing issues seen during implementation of
> > eDP support for SC8180x a fair amount of time was spent concluding why
> > the calculated mvid/nvid values where wrong.
> > 
> > The overall conclusion is that the ratio of MVID/NVID describes, and
> > should match, the ratio between the pixel and link clock.
> > 
> > Downstream this calculation reads the M and N values off the pixel clock
> > straight from DISP_CC and are then adjusted based on knowledge of how
> > the link and vco_div (parent of the pixel clock) are derrived from the
> > common VCO.
> > 
> > While upstreaming, and then extracting the PHY driver, the resulting
> > function performs the following steps:
> > 
> > 1) Adjust the passed link rate based on the VCO divider used in the PHY
> >    driver, and multiply this by 10 based on the link rate divider.
> > 2) Pick reasonable choices of M and N, by calculating the ratio between
> >    this new clock and the pixel clock.
> > 3) Subtract M from N and flip the bits, to match the encoding of the N
> >    register in DISP_CC.
> > 4) Flip the bits of N and add M, to get the value of N back.
> > 5) Multiply M with 5, per the documentation.
> > 6) Scale the values such that N is close to 0x8000 (or larger)
> > 7) Multply M with 2 or 3 depending on the link rate of HBR2 or HBR3.
> > 
> > Presumably step 3) was added to provide step 4) with expected input, so
> > the two cancel each other out. The factor of 10 from step 1) goes into
> > the denominator and is partially cancelled by the 5 in the numerator in
> > step 5), resulting in step 7) simply cancelling out step 1).
> > 
> 
> Both the multiplication of M with 5 and N with 2 or 3 is coming because of
> the
> ratio between the vco clk and the link clk.
> So we could have 2.7, 5.4 or 8.1 Gbps link clks and the factor of 2 or 3
> gets added because hbr2 is 2 * hbr and hbr3 is 3 * hbr.
> 

Thanks for explaining the origin of these numbers, I had quite a
difficult time figuring out where the "magic" came from.

> Your summary is pretty much right otherwise. Let me add some more points
> here:
> 
> 1) Originally we removed reading the M_VID and N_VID from the DISPCC regs
> because
> of previous upstream comments that we can potentially just recalculate
> whatever the clk driver is programming
> by using rational_best_approximation
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/clk/qcom/clk-rcg2.c#L1160
> 
> Not having to read from DISPCC register is also useful because we dont have
> to maintain the register offset
> of the M_VID and N_VID which keeps changing across chipsets.
> 

Right, so downstream we do all the math and then we scale the
denominator by 2x or 3x to compensate for the fact that we didn't
account for the division as the clock left the PLL.

As this was reworked upstream for some reason this compensation was
retained, so the denominator would always be 2x or 3x to large for HBR2
and HBR3. So the way this was solved was to divide by 2x or 3x before
calculating the ratio.

> However we discussed this again after viewing this patch. So the clk driver
> always operates on the vco clk
> and calculates the pixel clk from it and sets the M_VID and N_VID based on
> that.
> In terms of accuracy, the best way is still to re-use the M_VID and N_VID
> which the clk driver sets because
> the pixel clock was generated based on that and that is the actual pixel
> clock we are going to get.
> 
> So even before this change we lost some accuracy because the pixel clock we
> are giving here to recalculate
> the M_VID and N_VID is a theoretical value. Although for most values of
> pixel clk, theoretical and actual
> should match. There could be corner cases of pixel clock where its a bit
> different. Hence ideally, re-using the M_VID
> and N_VID which the clk driver set would have been the best but not having
> to hard-code M_VID and N_VID offsets
> was a good enough reason to not go back to that again.
> 
> Now, coming to this change. Here its trying to again re-calculate the M_VID
> and N_VID by using the same
> API which the clk driver uses but uses link clk and pixel clk as the
> parameters Vs the clk driver uses
> vco clk and actual pixel clock to calculate this.
> 
> So even though this cleanup eliminates the adjustments we need to make to
> account for the VCO clk to link clk ratio,
> it also could bring additional difference between what was actually set by
> the clk driver and what we are calculating
> here because clk driver used vco clk as the input vs here we use link clk
> after this change.
> There might be some pixel clock rates of some resolutions where this
> difference could be risky.
> 
> Hence the overall conclusion here was to keep using vco clk as the input to
> rational_best_approximation
> and not make more changes to this.
> 

So what you're saying is that the reason for this obfuscation is to
replicate any rounding errors happening in the path of the link clock
generation?

If that's the case then this needs a giant comment describing exactly
what's happening and why this function needs to be impenetrable.


That said, from my attempts to write this patch (and add widebus
support) I saw a huge flexibility in getting this right, so can you
please elaborate on the value of the precision of the ratio.

Regards,
Bjorn
