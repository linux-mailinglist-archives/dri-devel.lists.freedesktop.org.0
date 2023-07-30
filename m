Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E582876876B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3335910E110;
	Sun, 30 Jul 2023 19:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A8D10E110
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:28:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6D642202E0;
 Sun, 30 Jul 2023 21:28:21 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:28:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 7/7] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Message-ID: <ufoirdhnrxfpx2mstx5vxiacwl7jfie6454jd3snoaalqxq67n@7f5sjdyl7x4g>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-8-dmitry.baryshkov@linaro.org>
 <bmmqdo6dyewxrgcfk3vcuff3tgrb6iqgzby3ionl4shaido2vw@cqc2qnvu3fnj>
 <b2uzkzfoj4sfg3fx3ufjd7i2x5dbbnsccodrgk7cnfvjf3yak4@tbesdrg2tke4>
 <4f0da76f-7b73-130f-e787-8fd8425da62a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f0da76f-7b73-130f-e787-8fd8425da62a@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-30 03:16:59, Dmitry Baryshkov wrote:
<snip>
> >>> +	if (!phys_enc->has_intf_te &&
> >>> +	    (!phys_enc->hw_pp ||
> >>> +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
> >>
> >> when is hw_pp assigned?  Can't we also check that somewhere in an init
> >> phase?
> > 
> > It would happen right before dpu_encoder_phys_cmd_atomic_mode_set()
> > where we already happen to check has_intf_te to switch on PP
> > intr_readptr vs INTF intr_tear_rd_ptr.  Might be the perfect place for
> > the pingpong callback checks?
> 
> The problem is that mode_set doesn't return an error (by design). I'd 
> put a TODO here, so that if we ever move/change resource allocation, 
> this check can be done next to it (atomic_check isn't a good place, 
> since phys_enc.atomic_check happens before resource reallocation).

As thought of in another patch, perhaps it could just be a WARN_ON() as
these almost always relate directly to constant information provided by
the catalog, which we trust to be sound (and these error cases to hardly
be reachable) after it has been validated, reviewed and merged.

- Marijn
