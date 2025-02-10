Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D5A2FE5D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7925A10E3FE;
	Mon, 10 Feb 2025 23:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4710E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 23:24:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 769443E8E6;
 Tue, 11 Feb 2025 00:24:25 +0100 (CET)
Date: Tue, 11 Feb 2025 00:24:24 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 dmitry.baryshkov@linaro.org, sean@poorly.run, jonathan@marek.ca,
 jun.nie@linaro.org, 
 fekz115@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <oexunzihzwxux6aitpfpgpljhn2lndzqwnx5ruu3nzsahd7gzm@ttr6fuya5ncu>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
 <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-02-10 18:13:58, Konrad Dybcio wrote:
> On 10.02.2025 6:10 PM, Konrad Dybcio wrote:
> > On 8.02.2025 11:09 PM, Marijn Suijten wrote:
> >> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
...
> >>>  	dsc->simple_422 = 0;
> >>>  	dsc->convert_rgb = 1;
> >>>  	dsc->vbr_enable = 0;
> >>
> >> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> >> dpu_hw_dsc_config(), which has:
> >>
> >> 	data |= (dsc->line_buf_depth << 3);
> >> 	data |= (dsc->simple_422 << 2);
> >> 	data |= (dsc->convert_rgb << 1);
> >> 	data |= dsc->bits_per_component;
> >>
> >> The original value of `8` would overlap with the lowest bit of line_buf_depth
> >> (4th bit in `data`).  Now, the 2nd bit which will take the value from
> >> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> >> your new bpc value of 10.
> >>
> >> Can you double-check that this code in DPU1 is actually valid?  I assume you
> >> have tested this panel at least and it is working (worthy mention in the cover
> >> letter?), this just seems like yet another mistake in the original bindings
> >> (though the register always had a matching value with downstream on 8 BPC panels
> >> for me).
> > 
> > It seems like the lowest bit should be set iff the input is 10bpc, the
> > current situation where our '8' bleeds into the following (correctly named
> > fields) is bad.
> 
> See also
> 
> https://github.com/Wikidepia/kernel_xiaomi_santoni-4.9/blob/master/drivers/gpu/drm/msm/sde/sde_hw_dsc.c#L67-L80

Correct, this is also what Dmitry already replied on Sunday and what I
formulated into a patch earlier today (now sent), which I hope you can ack.

- Marijn

> 
> Konrad
