Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEA21DE91
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 19:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774D86E544;
	Mon, 13 Jul 2020 17:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34656E544
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:22:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594660970; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3/XX7PjmIFYVvOgHnEITFTHUI6Eqb++G7wohiRsN8sQ=;
 b=dpfQXwbdvEua5KTERxJTxcxpuTDiWOmfRxHaAkJQ4vpTJbhd+p7oB+mzdYJJbm2ZGpDZnWTU
 ByBtVsOA17/4CUQW0yI7bxBT+KLi19UjthQRtQ8WDVwlITm3zqWnhlTuPqlub8fSME323Ma/
 YzDzihnMX8tlNrvAEvocW6gF9fU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f0c986875eeb235f667d4e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 17:22:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 53568C433A0; Mon, 13 Jul 2020 17:22:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AE05C433CB;
 Mon, 13 Jul 2020 17:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9AE05C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 13 Jul 2020 11:22:41 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RFC PATCH] interconnect: qcom: add functions to query addr/cmds
 for a path
Message-ID: <20200713172241.GB3815@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Georgi Djakov <georgi.djakov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 kbuild test robot <lkp@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>
References: <20200701042528.12321-1-jonathan@marek.ca>
 <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, kbuild test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 06:24:26PM +0300, Georgi Djakov wrote:
> On 7/1/20 07:25, Jonathan Marek wrote:
> > The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
> > to query the interconnect driver for bcm addresses and commands.
> 
> It's not very clear to me how the GMU firmware would be dealing with this? Does
> anyone have an idea whether the GMU makes any bandwidth decisions? Or is it just
> a static configuration and it just enables/disables a TCS?

The GMU can perform a direct vote to the hardware. For now it is a static
configuration with pre-determined bandwidths generated from the OPP table.

> I think that we can query the address from the cmd-db, but we have to know the
> bcm names and the path. All the BCM/TCS information looks to be very low-level
> and implementation specific, so exposing it through an API is not very good,
> but hard-coding all this information is not good either.

Exactly my concern. The BCM information in particular is going to end up being
extremely target specific.

Jordan

> Thanks,
> Georgi
> 
> > 
> > I'm not sure what is the best way to go about implementing this, this is
> > what I came up with.
> > 
> > I included a quick example of how this can be used by the a6xx driver to
> > fill out the GMU bw_table (two ddr bandwidth levels in this example, note
> > this would be using the frequency table in dts and not hardcoded values).
> > 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
> >  drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
> >  include/soc/qcom/icc.h                | 11 ++++++
> >  3 files changed, 68 insertions(+), 13 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
