Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDD70A15E
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 23:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3997010E60D;
	Fri, 19 May 2023 21:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8210E60D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 21:15:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 88C9E3F7A8;
 Fri, 19 May 2023 23:14:57 +0200 (CEST)
Date: Fri, 19 May 2023 23:14:56 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: simplify pixel clk rate handling
Message-ID: <uzzllinf6vuxfb7levkxjoj7yyr3kydu37eawk2tu5gi3juz56@hyqpwumsg7s4>
References: <20230118130031.2345941-1-dmitry.baryshkov@linaro.org>
 <8ebd01e3-00be-b0da-e91a-ab1a4e074074@quicinc.com>
 <85d0a8c6-f6b4-4cd4-7cc6-b13f37523bd4@linaro.org>
 <637c1848-0e3f-9f3d-dc56-8f2d5b8de696@quicinc.com>
 <a9669c51-3171-3751-f249-be4a7f4312c2@linaro.org>
 <9a505edb-f3e8-ade4-8d4e-629bc2840f29@quicinc.com>
 <100f7525-35ed-a2a2-6672-e5874e0a1ac5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <100f7525-35ed-a2a2-6672-e5874e0a1ac5@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-19 22:37:34, Dmitry Baryshkov wrote:
<snip>
> >>>>>> +    ret = cfg_hnd->ops->calc_clk_rate(msm_host);
> >>>>>
> >>>>> I am not too sure what we are gaining by this.
> >>>>>
> >>>>> Its not that we are replacing dsi_get_pclk_rate().
> >>>>>
> >>>>> We are moving the dsi_get_pclk_rate() from the calc_clk_rate() to 
> >>>>> the msm_dsi_host_get_phy_clk_req().
> >>>>>
> >>>>> Also, with this change, dsi_calc_clk_rate_6g() looks kind of empty 
> >>>>> to stand on its own.
> >>>>>
> >>>>> The original intention of the calc_clk_rate() op seems to be 
> >>>>> calculate and store all the clocks (byte, pixel and esc).
> >>>>>
> >>>>> Why change that behavior by breaking it up?
> >>>>
> >>>> Unification between platforms. Both v2 and 6g platforms call 
> >>>> dsi_calc_pclk(). Let's just move it to a common code path.
> >>>
> >>> Hi Dmitry,
> >>>
> >>> I think what Abhinav means here is that the meaning and functionality 
> >>> of calc_clk_rate() changes with this patch.
> >>>
> >>> Before, calc_clk_rate() does *all* the clk_rate calculations and 
> >>> assignments. But after this change, it will only calculate and assign 
> >>> the escape clk rate.
> >>>
> >>> I agree with Abhinav that this change renders the calc_clk_rate() op 
> >>> misleading as it will not calculate all of the clock rates anymore.
> >>
> >> Would it make sense if I rename it to calc_other_clock_rates()?
> >>
> > 
> > Not really. I would rather still have it separate and drop this patch.
> > 
> > So even if pixel clock calculation looks common today between v2 and 6g, 
> > lets say tomorrow there is a 7g or 8g which needs some other math there, 
> > I think this is the right place where it should stay so that we 
> > calculate all clocks together.
> 
> Ack.

Unfortunate, but okay.  Then don't forget to send the following hunk of
this patch in isolation:

    -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
    +	pclk_bpp = msm_host->pixel_clk_rate * bpp;

- Marijn

> >> Moving pclk calculation to the core code emphasises that pclk 
> >> calculation is common between v2 and 6g hosts.
> >>
> >>>
> >>> Thanks,
> >>>
> >>> Jessica Zhang
> >>>
> >>>>
> >>>>>
> >>>>>>       if (ret) {
> >>>>>>           pr_err("%s: unable to calc clk rate, %d\n", __func__, ret);
> >>>>>>           return;
> >>>>
> >>>> -- 
> >>>> With best wishes
> >>>> Dmitry
> >>>>
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
