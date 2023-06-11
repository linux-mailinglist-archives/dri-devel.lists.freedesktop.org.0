Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2B72B437
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jun 2023 23:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC910E063;
	Sun, 11 Jun 2023 21:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0510E063
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jun 2023 21:42:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B52161F969;
 Sun, 11 Jun 2023 23:42:23 +0200 (CEST)
Date: Sun, 11 Jun 2023 23:42:22 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for compression
Message-ID: <hwckoabnvsqe4p52pwxchysbo7jdgsxuzibx2726pbdwziqa4h@mnwiaw7hjpf3>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
 <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
 <js3mcglahq53mcyxa6deltjlu4xpc2pnafwz2rbk3dl4ovws2o@5xw2wzvfaj2v>
 <f34a03ce-6295-b5d1-bf42-a43cfb382ea3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34a03ce-6295-b5d1-bf42-a43cfb382ea3@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-09 19:58:00, Dmitry Baryshkov wrote:
> On 08/06/2023 23:36, Marijn Suijten wrote:
> > Same title suggestion as earlier: s/adjust/reduce
> > 
> > On 2023-05-22 18:08:56, Jessica Zhang wrote:
> >> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
> >> is enabled.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++++++---
> >>   1 file changed, 18 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index a448931af804..88f370dd2ea1 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
> >>   	clk_disable_unprepare(msm_host->byte_clk);
> >>   }
> >>   
> >> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
> >> +static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
> > 
> > Nit: adjust_pclk_for_compression
> > 
> > As discussed before we realized that this change is more-or-less a hack,
> > since downstream calculates pclk quite differently - at least for
> > command-mode panels.  Do you still intend to land this patch this way,
> > or go the proper route by introducing the right math from the get-go?
> > Or is the math at least correct for video-mode panels?
> 
> Can we please postpone the cmd-vs-video discussion?

If you had read Jessica's reply (and the discussions thus far) this
patch is intended for CMD-mode:

    Moreover, as stated in an earlier revision [3], there is no way to
    validate DSC over DSI for video mode. As far as I know, we do not
    have a way to validate video mode datapath for DSI in general.

Hence my hopefully-relevant question whether this workaround - to reduce
the hdisplay portion that comprises the full pclk signal - is at the
very least right for video mode?  After all, CMD mode doesn't have
porches so it makes no sense to account for those (except that it
currently pretends to represent the "transfer time").

Furthermore there is *zero* documentation describing this workaround,
not even in v6.

> Otherwise I will reserve myself a right to push a patch dropping CMD
> mode support until somebody comes with a proper way to handle CMD
> clock calculation.

Please do.  That should force me or someone else to submit the right
calculations instead of repeatedly getting stuck in this loop of
complaints and incomprehensible patches with no fix in sight.

> It is off-topic for the sake of DSC 1.2 support. Yes, all CMD panel 
> timings are a kind of a hack and should be improved. No, we can not do 
> this as a part of this series. I think everybody agrees that with the 
> current way of calculating CMD panel timings, this function does some 
> kind of a trick.

I understand that you want to be pragrmatic about this situation, but it
seems wrong to build new math on top of fundamentally broken values.  If
there's one thing I learned while contributing to mainline here, it is
that sometimes things are fundamentally broken and you cannot
ship/contribute a shiny new feature before first fixing the
fundamentals.  What makes this different?

> > This function requires a documentation comment to explain that all.
> > 
> >> +		const struct drm_dsc_config *dsc)
> >> +{
> >> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> > 
> > This sounds like a prime candidate for msm_dsc_get_bytes_per_line(), if
> > bits_per_component==8 is assumed.  In fact, it then becomes identical
> > to the following line in dsi_host.c which you added previously:
> > 
> > 	hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 
> This would imply a simple /3, but as far as I understand it is not 
> correct here.

If you read Jessica's comment on that duplicate line in v6, that is
exactly what is happening:

    * hdisplay will be divided by 3 here to account for the fact
    * that DPU sends 3 bytes per pclk cycle to DSI.

That comment acknowledges that it is the same: but why isn't this?  Why
is bits_per_component (number of bits per pixel component _in the source
picture_) suddenly introduced in this pclk calculation while it is not
used anywhere else? 

> > If not, what is the difference between these two calculations?  Maybe
> > they both need to be in a properly-named helper.
> > 
> >> +			dsc->bits_per_component * 3);

How is this different from dsi_get_bpp()?

> I hope to see a documentation patch to be posted, telling that this 
> scales hdisplay and thus pclk by the factor of compressed_bpp / 
> uncompressed_bpp.
> 
> This is not how it is usually done, but I would accept a separate 
> documentation patch going over the calculation here and in 
> dsi_timing_setup (and maybe other unobvious cases, if there is anything 
> left).

I'd love to see additional documentation for existing logic, but the
next revision of this patch could atomically add these comments while
adding the logic (seems to not have been done for v6...)?

> > As we established in the drm/msm issue [2] there is currently a
> > confusion whether this /3 (and the /3 in dsi_timing_setup) come from the
> > ratio between dsi_get_bpp() and dsc->bpp or something else.  Can you
> > clarify that with constants and comments?
> > 
> > [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/24
> > 
> >> +
> >> +	return (new_hdisplay + (mode->htotal - mode->hdisplay))
> >> +			* mode->vtotal * drm_mode_vrefresh(mode);
> > 
> > As clarified in [1] I was not necessarily suggesting to move this math
> > to a separate helper, but to also use a few more properly-named
> > intermediate variables to not have multi-line math and self-documenting
> > code.  These lines could be split to be much more clear.
> 
> I think it's fine more or less. One pair of parenthesis is unnecessary, 
> but that's mostly it. Maybe `new_htotal' variable would make some sense.
> 
> Also, please excuse me if this was discussed somewhere. This calculation 
> means that only the displayed data is compressed, but porches are not 
> touched. Correct?

Porches don't exist in CMDmode (but they do in mainline, because
transfer time is not calculated yet).  For video mode I don't know.

> > [1]: https://lore.kernel.org/linux-arm-msm/u4x2vldkzsokfcpbkz3dtwcllbdk4ljcz6kzuaxt5frx6g76o5@uku6abewvye7/
> > 
> >> +}
> >> +
> >> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> >> +		const struct drm_dsc_config *dsc, bool is_bonded_dsi)
> >>   {
> >>   	unsigned long pclk_rate;
> >>   
> >> @@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
> >>   	if (is_bonded_dsi)
> >>   		pclk_rate /= 2;
> >>   
> >> +	/* If DSC is enabled, divide hdisplay by compression ratio */
> >> +	if (dsc)
> >> +		pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);
> 
> Looking for the perfection, I'd also move the pclk adjustment to come 
> before the is_bonded_dsi check.

Perfection?

- Marijn

> > The confusion with this comment (and the reason the aforementioned
> > discussion [2] carried on so long) stems from the fact a division makes
> > sense for a bit/byte clock, but not for a pixel clock: we still intend
> > to send the same number of pixels, just spending less bytes on them.  So
> > as you clarify the /3 above, can you also clarify that here or drop this
> > comment completely when the function is correctly documented instead?
> > 
> > - Marijn
> > 
> >> +
> >>   	return pclk_rate;
> >>   }
> >>   
> >> @@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
> >>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> >>   	u8 lanes = msm_host->lanes;
> >>   	u32 bpp = dsi_get_bpp(msm_host->format);
> >> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> >> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
> >>   	unsigned long pclk_bpp;
> >>   
> >>   	if (lanes == 0) {
> >> @@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
> >>   
> >>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>   {
> >> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> >> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
> >>   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
> >>   							msm_host->mode);
> >>   
> >>
> >> -- 
> >> 2.40.1
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
