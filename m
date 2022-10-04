Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A35F4BC7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921F10E1D0;
	Tue,  4 Oct 2022 22:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7210E1D0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:23:21 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B67C43F21A;
 Wed,  5 Oct 2022 00:23:18 +0200 (CEST)
Date: Wed, 5 Oct 2022 00:23:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/dsi: Remove useless math in DSC
 calculation
Message-ID: <20221004222317.6or3w6vwgyd3yy6z@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Marek Vasut <marex@denx.de>,
 freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-2-marijn.suijten@somainline.org>
 <7ded0eb3-ef99-1979-ffb6-c639288bd863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ded0eb3-ef99-1979-ffb6-c639288bd863@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 07:33:49, Abhinav Kumar wrote:
> 
> 
> On 10/1/2022 12:08 PM, Marijn Suijten wrote:
> > Multiplying a value by 2 and adding 1 to it always results in a value
> > that is uneven, and that 1 gets truncated immediately when performing
> > integer division by 2 again.  There is no "rounding" possible here.
> > 
> > Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 8e4bc586c262..e05bae647431 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1864,12 +1864,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >   	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
> >   	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> >   
> > -	/* bpp * 16 + 0.5 */
> > -	data = dsc->bits_per_pixel * 16;
> > -	data *= 2;
> > -	data++;
> > -	data /= 2;
> > -	target_bpp_x16 = data;
> > +	target_bpp_x16 = dsc->bits_per_pixel * 16;
> >   
> Since this patch is titled, "remove useless math", even the 
> target_bpp_x16 math looks redundant to me,
> 
> first we do
> 
> target_bpp_x16 = dsc->bits_per_pixel * 16;
> 
> then in the next line we do
> 
> data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
> 
> the *16 and /16 will cancel out here.
> 
> Instead we can just do
> 
> data = (dsc->initial_xmit_delay * dsc->drm->bits_per_pixel) ?

Thanks, good catch!  I might have been so focused on explaining the
effect of this patch and uselessness of the proposed `+ 0.5` rounding
here that I missed this intermediate variable now becoming redundant as
well.

Corrected for v2!

- Marijn

> >   	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
> >   	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
