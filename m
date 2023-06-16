Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A4733BB0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 23:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8469D10E043;
	Fri, 16 Jun 2023 21:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7773610E043
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 21:54:51 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C1D0F40EC4;
 Fri, 16 Jun 2023 23:54:47 +0200 (CEST)
Date: Fri, 16 Jun 2023 23:54:46 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
Message-ID: <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-16 14:18:39, Abhinav Kumar wrote:
> 
> 
> On 6/14/2023 12:56 AM, Dmitry Baryshkov wrote:
> > On 14/06/2023 04:57, Jessica Zhang wrote:
> >> Add a DPU INTF op to set the DATABUS_WIDEN register to enable the
> >> databus-widen mode datapath.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
> >>   3 files changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index b856c6286c85..124ba96bebda 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> @@ -70,6 +70,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >>       if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
> >>           phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
> >> +
> >> +    if (phys_enc->hw_intf->ops.enable_widebus)
> >> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
> > 
> > No. Please provide a single function which takes necessary 
> > configuration, including compression and wide_bus_enable.
> > 
> 
> There are two ways to look at this. Your point is coming from the 
> perspective that its programming the same register but just a different 
> bit. But that will also make it a bit confusing.
> 
> So lets say the function is called intf_cfg2_xxx(..., bool widebus, bool 
> data_compress)
> 
> Now for the caller who wants to just enable widebus this will be
> 
> intf_cfg2_xxx(....., true, false)
> 
> if we want to do both
> 
> intf_cfg2_xxx(...., true, true)
> 
> the last one where we want to do just data_compress(highly unlikely and 
> not recommended)
> 
> intf_cfg2_xxx(...., false, true)
> 
> Now someone looking at the code will have to go and find out what each 
> bool is.
> 
> Whereas with separate ops, its kind of implicit.

That's why you never pass bools as function argument (edge-case if it is
the only argument, and its meaning becomes clear from the function
name).  Use enumerations anywhere else.

- Marijn

> 
> For that reason, I dont think this patch is bad at all.
