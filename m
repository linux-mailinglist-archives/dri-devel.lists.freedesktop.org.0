Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D792C6F61A1
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 01:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721BE10E0C8;
	Wed,  3 May 2023 23:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6780F10E060
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 23:00:31 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 799BA3FDCE;
 Thu,  4 May 2023 01:00:25 +0200 (CEST)
Date: Thu, 4 May 2023 01:00:24 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 4/4] drm/msm/dpu: Enable compression for command mode
Message-ID: <rg6nlm4knw4hgtnwtvr4a5wqusyvvsetygiwxscp6bs6pun7ii@wzz6rd2y3vcn>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-4-6bc6f03ae735@quicinc.com>
 <hxqxnfcydzyfrlvihmil3gecan6p6xyjw44gielu63ltgtqul7@xwvoprzofq6g>
 <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
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

Hi Jessica,

On 2023-05-03 12:04:59, Jessica Zhang wrote:
> 
> 
> On 5/3/2023 12:28 AM, Marijn Suijten wrote:
> > On 2023-05-02 18:19:15, Jessica Zhang wrote:
> >> Add a dpu_hw_intf op to enable data compression.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 2 ++
> >>   3 files changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index 74470d068622..4321a1aba17f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > 
> > Can we have INTF DCE on video-mode encoders as well?
> 
> Hi Marijn,
> 
> Currently, there's no way to validate DSC for video mode as I've only 
> made changes to support DSI for command mode. We are planning to post 
> changes to support DSC over DP, which will include changes for video mode.

Okay, but then mention so in the patch description (which is rather
short in this revision).

<snip>

> >>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
> >>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> > 
> > These should probably be reindented to match the below... And the rest
> > of the defines use spaces instead of tabs.
> 
> Fair point, though I think fixing the whitespace for these 2 macros 
> specifically might be better in a more relevant series.

Yes, I have many patches to start cleaning these up, as well as all the
broken kerneldoc comments, but it's an uphill battle.  Not sure if I'll
get to it any time soon if at all.

> With that being said, I'll change the spacing of the DATA_COMPRESS bit 
> to spaces instead of tabs.

Thanks, that seems to be the most common format.

> >> +#define INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
> >>   
> >>   #define INTF_MISR_CTRL			0x180
> >>   #define INTF_MISR_SIGNATURE		0x184
> > 
> > This does not seem to apply on top of:
> > https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-10-27ce1a5ab5c6@somainline.org/
> 
> Seems like I'm missing some patches from that series on my working 
> branch. Will rebase on top of the full series for the v2.

Thanks, but do discuss with Abhinav/Dmitry which series will land first.

> >> +static inline void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> > 
> > Why inline?  This is used as a pointer callback.
> 
> Acked, will remove the inline.
> 
> > 
> >> +{
> >> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, INTF_CFG2_DCE_DATA_COMPRESS);
> > 
> > dpu_hw_intf_setup_timing_engine() also programs INTF_CONFIG2.  Is it
> > double-buffered, or is that config **always** unused when DSI CMD mode
> > is used in conjunction with DSC/DCE?  Otherwise this should perhaps OR
> > the bitflag into the register, or write the whole thing at once in
> > dpu_hw_intf_setup_timing_engine()?
> 
> For command mode, INTF_CONFIG2 is unused aside from setting 
> DATA_COMPRESS for DSC.
> 
> Since setup_timing_engine() is only used for video mode, the 
> corresponding changes will be made in the DSC v1.2 for DP changes.

Ack, that makes sense.  However, is this a guarantee that nothing else
will write INTF_CONFIG2 in the future, or will we solve that problem
when it happens?  I'm afraid more config-bits get added to this register
in the future and might possibly race/overwrite each other.

- Marijn

<snip>
