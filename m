Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438247040EC
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 00:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8724910E2AC;
	Mon, 15 May 2023 22:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDC10E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 22:24:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AF8E11FA71;
 Tue, 16 May 2023 00:24:00 +0200 (CEST)
Date: Tue, 16 May 2023 00:23:59 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Message-ID: <y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-8-git-send-email-quic_khsieh@quicinc.com>
 <cmoqfe5nunreajdvu2vk3ztwkbjesivgejjoi2wmsxske5gq3q@lr25iuwmuevb>
 <ccef1e88-5c38-0759-523a-c957854697ef@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccef1e88-5c38-0759-523a-c957854697ef@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-15 15:03:46, Abhinav Kumar wrote:
> On 5/15/2023 2:21 PM, Marijn Suijten wrote:
> > On 2023-05-12 11:00:22, Kuogee Hsieh wrote:
> >>
> >> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
> >> feature flag information.  Each display compression engine (DCE) contains
> >> dual hard slice DSC encoders so both share same base address but with
> >> its own different sub block address.
> > 
> > Can we have an explanation of hard vs soft slices in some commit message
> > and/or code documentation?
> > 
> 
> Not in this one. It wont look appropriate. I would rather remove "hard" 
> to avoid confusion.

That is totally fine, let's remove it instead.

<snip>
> >> +	DSC_BLK_1_2("dce_0", DSC_0, 0x80000, 0x100, 0, dsc_sblk_0),
> > 
> > Downstream says that the size is 0x10 (and 0x100 for the enc sblk, 0x10
> > for the ctl sblk).  This simply fills it up to the start of the enc sblk
> > so that we can see all registers in the dump?  After all only
> > DSC_CMN_MAIN_CNF is defined in the main register space, so 0x10 is
> > adequate.
> > 
> 
> .len today is always only for the dump. and yes even here we have only 
> 0x100 for the enc and 0x10 for the ctl.
> 
> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> +	.enc = {.base = 0x100, .len = 0x100},
> +	.ctl = {.base = 0xF00, .len = 0x10},
> +};
> 
> The issue here is that, the dpu snapshot does not handle sub_blk parsing 
> today. Its a to-do item. So for that reason, 0x100 was used here to 
> atleast get the full encoder dumps.

But then you don't see the ENC block?  It starts at 0x100 (or 0x200) so
then the length should be longer... it should in fact depend on even/odd
DCE then?

> 
> >> +	DSC_BLK_1_2("dce_0", DSC_1, 0x80000, 0x100, 0, dsc_sblk_1),
> > 
> > Should we add an extra suffix to the name to indicate which hard-slice
> > DSC encoder it is?  i.e. "dce_0_0" and "dce_0_1" etc?
> 
> Ok, that should be fine. We can add it.

Great, thanks!

> >> +	DSC_BLK_1_2("dce_1", DSC_2, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_0),
> >> +	DSC_BLK_1_2("dce_1", DSC_3, 0x81000, 0x100, BIT(DPU_DSC_NATIVE_422_EN), dsc_sblk_1),
> > 
> 
> > See comment below about loose BIT() in features.
> 
> Responded below.
> > 
> >> +};
> >> +
> >>   static const struct dpu_intf_cfg sm8350_intf[] = {
> >>   	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> >>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> >> @@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
> >>   	.dspp = sm8350_dspp,
> >>   	.pingpong_count = ARRAY_SIZE(sm8350_pp),
> >>   	.pingpong = sm8350_pp,
> >> +	.dsc = sm8350_dsc,
> >> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
> > 
> > Count goes first **everywhere else**, let's not break consistency here.
> > 
> 
> the order of DSC entries is swapped for all chipsets. Please refer to 
> dpu_sc8180x_cfg, dpu_sm8250_cfg etc.

Thanks for confirming that this is not the case in a followup mail :)

> So if you are talking about consistency, this is actually consistent 
> with whats present in other chipsets.
> 
> If you are very particular about this, then once this lands, you can 
> change the order for all of them in another change.
> 
> Same answer for all swap comments.
<snip>
> >> +/*
> >> + * NOTE: Each display compression engine (DCE) contains dual hard
> >> + * slice DSC encoders so both share same base address but with
> >> + * its own different sub block address.
> >> + */
> >> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> > 
> > There are no address values here so this comment doesn't seem very
> > useful, and it is already duplicated on every DSC block array, where the
> > duplication is more visible.  Drop the comment here?
> > 
> 
> _base is the address. So base address. Does that clarify things?

This is referring to the NOTE: comment above.  There's _base as address
here, yes, but there's no context here that it'll be used in duplicate
fashion, unlike the SoC catalog files.  The request is to just drop it
here as it adds no value.

> >> +	{\
> >> +	.name = _name, .id = _id, \
> >> +	.base = _base, .len = _len, \
> > 
> > The len is always 0x100 (downstream says 0x10), should we hardcode it
> > here and drop _len?  We can always add it back if a future revision
> > starts changing it, but that's not the case currently.
> > 
> >> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> > 
> > We don't willy-nilly append bits like that: should there be global
> > feature flags?
> 
> So this approach is actually better. This macro is a DSC_1_2 macro so it 
> will have the 1.2 feature flag and other features like native_422 
> support of that encoder are ORed on top of it. Nothing wrong with this.

I agree it is better, but we seem to be very selective in whether to
stick to the "old" principles in DPU versus applying a new pattern that
isn't used elsewhere yet (i.e. your request to _not_ shuffle the order
of .dsc and .dsc_count assignment to match other .x and .x_count, and do
that in a future patch instead).  If we want to be consistent
everywhere, these should be #defines that we'll flatten out in a
followup if at all.

> > Or is this the start of a new era where we expand those defines in-line
> > and drop them altogether?  I'd much prefer that but we should first
> > align on this direction (and then also make the switch globally in a
> > followup).
> > 
> 
> Its case by case. No need to generalize.
> 
> In this the feature flag ORed with the base feature flag of DSC_1_2 
> makes it more clear.

- Marijn
