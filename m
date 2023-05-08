Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919DE6FBA56
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8E210E30B;
	Mon,  8 May 2023 21:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1610E30B;
 Mon,  8 May 2023 21:56:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 794D33F586;
 Mon,  8 May 2023 23:56:53 +0200 (CEST)
Date: Mon, 8 May 2023 23:56:52 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Adjust pclk rate for compression
Message-ID: <i4bemmveyvowfy7dogetoygaflfttpe26dpg7bbimrzf53wv3w@o3odsno4pb2w>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
 <79b468f5-8f2e-175b-5bce-1b3ea5127628@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79b468f5-8f2e-175b-5bce-1b3ea5127628@quicinc.com>
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

On 2023-05-05 14:49:08, Jessica Zhang wrote:
> On 5/5/2023 2:23 PM, Jessica Zhang wrote:
> > Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
> > is enabled.
> > 
> > Changes in v2:
> > - Adjusted pclk_rate math to divide only the hdisplay value by
> >    compression ratio
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 43a5ec33eee8..0e5778e8091f 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
> >   	clk_disable_unprepare(msm_host->byte_clk);
> >   }
> >   
> > -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
> > +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> > +		struct drm_dsc_config *dsc, bool is_bonded_dsi)
> >   {
> >   	unsigned long pclk_rate;
> >   
> > @@ -576,6 +577,14 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
> >   	if (is_bonded_dsi)
> >   		pclk_rate /= 2;
> >   
> > +	/* If DSC is enabled, divide hdisplay by compression ratio */
> > +	if (dsc) {
> > +		int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * msm_dsc_get_bpp_int(dsc),
> > +				dsc->bits_per_component * 3);
> > +		int fps = DIV_ROUND_UP(pclk_rate, mode->htotal * mode->vtotal);
> 
> Should've used drm_mode_vrefresh() here... Will spin a v3 with that 
> change (along with any additional comments)

Perhaps unsigned long on some of these?  Overall the computations and
multi-lines look rather cluttered, perhaps (parts of) this is/are a
prime candidate to go into the new helpers?

Note that I cannot get the 4k mode working at 60Hz on one of my panels
(30Hz works with minor corruption), regardless of this patch.  See also:
https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1900031

> > +		pclk_rate = (new_hdisplay + (mode->htotal - mode->hdisplay)) * mode->vtotal * fps;
> > +	}
> > +
> >   	return pclk_rate;
> >   }
> >   
> > @@ -585,7 +594,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
> >   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> >   	u8 lanes = msm_host->lanes;
> >   	u32 bpp = dsi_get_bpp(msm_host->format);
> > -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> > +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
> >   	u64 pclk_bpp = (u64)pclk_rate * bpp;
> >   
> >   	if (lanes == 0) {
> > @@ -604,7 +613,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
> >   
> >   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   {
> > -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> > +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
> >   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
> >   							msm_host->mode);
> >   
> > @@ -634,7 +643,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >   
> >   	dsi_calc_pclk(msm_host, is_bonded_dsi);
> >   
> > -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> > +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;

Let's rebase on top of "drm/msm/dsi: simplify pixel clk rate handling"
[1] to clean this up.

[1]: https://lore.kernel.org/linux-arm-msm/20230118130031.2345941-1-dmitry.baryshkov@linaro.org/

- Marijn

> >   	do_div(pclk_bpp, 8);
> >   	msm_host->src_clk_rate = pclk_bpp;
> >   
> > 
> > -- 
> > 2.40.1
> > 
