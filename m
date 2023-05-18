Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB14707A8C
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 09:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1E10E4EE;
	Thu, 18 May 2023 07:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E23D10E4E2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:05:43 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4257F20481;
 Thu, 18 May 2023 09:05:41 +0200 (CEST)
Date: Thu, 18 May 2023 09:05:40 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v10 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Message-ID: <xvcl5ojsrifi26trso6nvvfsimtijygp3iizhl4djdrerc5lej@xrwsawvb3k4t>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-8-git-send-email-quic_khsieh@quicinc.com>
 <w7xre5jdot3fpe3ldj6vcnvribpbalfvova5hhmbgvgvkrcm34@xqvsc5ga2knb>
 <51f0439c-a5e8-b47a-21af-7bbbc944ca53@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f0439c-a5e8-b47a-21af-7bbbc944ca53@quicinc.com>
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
Cc: sean@poorly.run, quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, vkoul@kernel.org, agross@kernel.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 16:22:37, Abhinav Kumar wrote:
<snip>
> >> @@ -529,6 +539,19 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
> >>   	.features = _features, \
> >>   	}
> >>   
> >> +/*
> >> + * NOTE: Each display compression engine (DCE) contains dual hard
> >> + * slice DSC encoders so both share same base address but with
> >> + * its own different sub block address.
> >> + */
> > 
> > I still think this comment is superfluous (and doesn't even apply
> > generically, see i.e. sc7280) and should best be kept exclusively in the
> > SoC-specific catalog files.
> > 
> > - Marijn
> > 
> 
> sc7280 is the only exception as it has only one encoder. But, by and 
> large, for all other chipsets this is true and hence kept here.
> 
> The main reason for this comment is people should not get confused that 
> how come two DSC encoders have the same base address.

And that's why the comment is already placed in the SoC-specific catalog
files where a duplicate base address is visible.  It is not visible
here.

- Marijn

> >> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> >> +	{\
> >> +	.name = _name, .id = _id, \
> >> +	.base = _base, .len = _len, \
> >> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> >> +	.sblk = &_sblk, \
> >> +	}
> >> +
> >>   /*************************************************************
> >>    * INTF sub blocks config
> >>    *************************************************************/
> >> -- 
> >> 2.7.4
> >>
