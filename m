Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8470A1A1
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 23:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454710E622;
	Fri, 19 May 2023 21:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980A710E61F;
 Fri, 19 May 2023 21:20:50 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A98823F92F;
 Fri, 19 May 2023 23:20:47 +0200 (CEST)
Date: Fri, 19 May 2023 23:20:46 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Adjust pclk rate for compression
Message-ID: <u4x2vldkzsokfcpbkz3dtwcllbdk4ljcz6kzuaxt5frx6g76o5@uku6abewvye7>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
 <79b468f5-8f2e-175b-5bce-1b3ea5127628@quicinc.com>
 <i4bemmveyvowfy7dogetoygaflfttpe26dpg7bbimrzf53wv3w@o3odsno4pb2w>
 <d4e78b24-a3f1-37a3-11c1-92631b3e7c45@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e78b24-a3f1-37a3-11c1-92631b3e7c45@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-19 12:04:00, Jessica Zhang wrote:
<snip>
> >>> +	/* If DSC is enabled, divide hdisplay by compression ratio */
> >>> +	if (dsc) {
> >>> +		int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * msm_dsc_get_bpp_int(dsc),
> >>> +				dsc->bits_per_component * 3);
> >>> +		int fps = DIV_ROUND_UP(pclk_rate, mode->htotal * mode->vtotal);
> >>
> >> Should've used drm_mode_vrefresh() here... Will spin a v3 with that
> >> change (along with any additional comments)
> > 
> > Perhaps unsigned long on some of these?  Overall the computations and
> > multi-lines look rather cluttered, perhaps (parts of) this is/are a
> > prime candidate to go into the new helpers?
> 
> Hi Marijn,
> 
> Sorry for the late reply, wanted to get the MSM DSC helpers series 
> settled first before addressing these changes.

No hurry and no worry, that is exactly why I requested this to be split
across multiple series so that we can make progress on that in isolation
(or rather, make progress on the first series in the chain before
iterating on the next).  On the other hand Dmitry made the right remark
that it does cause contention for some patches that only become relevant
in future series... but that's mostly down to how the patches are
distributed across series.

> Sounds good, I'll put these calculations in a separate 
> dsi_adjust_compressed_pclk() helper.

Not sure if "adjust" carries the meaning, but I'll leave it to you to
come up with an initial revision and then we can discuss.  I am mostly
curious if there are generic (DSI) timing rules that apply DRM-wide, or
if these would be MSM-specific.

Otherwise assigning them to properly named local variables is the
perfect way to self-document the code.

> > Note that I cannot get the 4k mode working at 60Hz on one of my panels
> > (30Hz works with minor corruption), regardless of this patch.  See also:
> > https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1900031
> As discussed elsewhere, we suspect that this is unrelated to DSC 
> specifically and might be an issue with the upstream driver not taking 
> transfer time into account with calculating pclk_rate.
> 
> We will look into this as a separate issue.

Yes that is very likely, but it is still a good idea to take into
account when looking into adjusting DSC timing: can we do that in any
sensible way without first accounting for transfer time?

<snip>
> >>>    	dsi_calc_pclk(msm_host, is_bonded_dsi);
> >>>    
> >>> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> >>> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
> > 
> > Let's rebase on top of "drm/msm/dsi: simplify pixel clk rate handling"
> > [1] to clean this up.
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20230118130031.2345941-1-dmitry.baryshkov@linaro.org/
> 
> I've looked into this patch and have made a comment on it. Just have 
> some reservations about it as it changes the functionality of a clk 
> handler op.
> 
> I will hold off on rebasing and wait for that thread to resolve first.

Looks like the resolution was to drop it, but we should still first
apply the following hunk from it so that this line in your patch can be
skipped entirely.

    -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
    +	pclk_bpp = msm_host->pixel_clk_rate * bpp;

- Marijn
