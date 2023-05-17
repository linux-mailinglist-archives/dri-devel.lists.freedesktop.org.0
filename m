Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C8707203
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB810E225;
	Wed, 17 May 2023 19:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5F810E225
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:25:15 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8718B20371;
 Wed, 17 May 2023 21:25:13 +0200 (CEST)
Date: Wed, 17 May 2023 21:25:12 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v11 8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
Message-ID: <xpfpp7aiy4i7girzqgvdjsthwwtewn4ffzugqp4xgkcqhgor4x@hlarb2cu5xsr>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-8-30270e1eeac3@quicinc.com>
 <l5caompoxuarl3fxhpv37xmpahprvwn2w6mg2y4tla5uitckmf@ytytt7wivfs7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l5caompoxuarl3fxhpv37xmpahprvwn2w6mg2y4tla5uitckmf@ytytt7wivfs7>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 21:13:36, Marijn Suijten wrote:
> 
> On 2023-05-17 11:51:17, Jessica Zhang wrote:
> > 
> > Use MSM and DRM DSC helper methods to configure DSC for DSI.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 74d38f90398a..b21108948061 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -28,6 +28,7 @@
> >  #include "dsi.xml.h"
> >  #include "sfpb.xml.h"
> >  #include "dsi_cfg.h"
> > +#include "msm_dsc_helper.h"
> >  #include "msm_kms.h"
> >  #include "msm_gem.h"
> >  #include "phy/dsi_phy.h"
> > @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >  	/* first calculate dsc parameters and then program
> >  	 * compress mode registers
> >  	 */
> > -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> > +	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
> >  
> >  	/*
> >  	 * If slice_count is greater than slice_per_intf
> > @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> >  	if (dsc->slice_count > slice_per_intf)
> >  		dsc->slice_count = 1;
> >  
> > -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> > +	total_bytes_per_intf = dsc->slice_count * slice_per_intf;
> 
> Oh no, this line shouldn't have changed.  Besides not conforming to the
> "use MSM and DRM DSC helper methods" title, this is now no longer
> computing the bytes that we were in v10.  Was this tested?

Regarding testing, it probably goes unnoticed easily because of only
being used in eol_byte_num = total_bytes_per_intf % 3: on hdisplay=1096
and slice_count=slice_per_intf=2 both result in eol_byte_num=1 :)

- Marijn

> 
> - Marijn
> 
> >  
> >  	eol_byte_num = total_bytes_per_intf % 3;
> >  	pkt_per_line = slice_per_intf / dsc->slice_count;
> > @@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> >  		return ret;
> >  	}
> >  
> > -	dsc->initial_scale_value = 32;
> > +	dsc->initial_scale_value = drm_dsc_initial_scale_value(dsc);
> >  	dsc->line_buf_depth = dsc->bits_per_component + 1;
> >  
> >  	return drm_dsc_compute_rc_parameters(dsc);
> > 
> > -- 
> > 2.40.1
> > 
