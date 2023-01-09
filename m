Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D18661FE6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59D10E28B;
	Mon,  9 Jan 2023 08:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFE410E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:21:23 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.227.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CB6EE3EEA9;
 Mon,  9 Jan 2023 09:21:19 +0100 (CET)
Date: Mon, 9 Jan 2023 09:21:18 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: Remove num_enc from topology struct
 in favour of num_dsc
Message-ID: <20230109082118.v2abyucljztsflxj@SoMainline.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-7-marijn.suijten@somainline.org>
 <42b45762-7fb9-2694-9fab-039ee09e4709@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42b45762-7fb9-2694-9fab-039ee09e4709@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Vinod Koul <vkoul@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-09 01:31:57, Dmitry Baryshkov wrote:
> On 22/12/2022 01:19, Marijn Suijten wrote:
> > Downstream calls this num_enc yet the DSC patches introduced a new
> > num_dsc struct member, leaving num_enc effectively unused.
> > 
> > Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 4 ++--
> >   drivers/gpu/drm/msm/msm_drv.h               | 2 --
> >   3 files changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 9c6817b5a194..a158cd502d38 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -579,19 +579,18 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >   			topology.num_dspp = topology.num_lm;
> >   	}
> >   
> > -	topology.num_enc = 0;
> >   	topology.num_intf = intf_count;
> >   
> >   	if (dpu_enc->dsc) {
> > -		/* In case of Display Stream Compression (DSC), we would use
> > -		 * 2 encoders, 2 layer mixers and 1 interface
> > +		/*
> > +		 * In case of Display Stream Compression (DSC), we would use
> > +		 * 2 DSC encoders, 2 layer mixers and 1 interface
> >   		 * this is power optimal and can drive up to (including) 4k
> >   		 * screens
> >   		 */
> > -		topology.num_enc = 2;
> >   		topology.num_dsc = 2;
> > -		topology.num_intf = 1;
> >   		topology.num_lm = 2;
> > +		topology.num_intf = 1;
> 
> Unless there is a reason, please move num_intf assignment back while 
> preparing v3.

The assignment was reordered to match the order described in the comment
right above, such that this reads more naturally.  Not sure if it's
worth sending that as a separate fix, or drop it entirely.

> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

<snip>
