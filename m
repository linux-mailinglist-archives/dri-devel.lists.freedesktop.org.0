Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC447211166
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEA16E95E;
	Wed,  1 Jul 2020 16:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FF26E957
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:56:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593622613; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=271+mSrCwkc1GCPrnTrrvdPUZMb/idFAy+FFyDR2n+g=;
 b=oYFCWPl3ciuto2hDhp9eGw8DkTihISSm8fFPOkgLOS9HRWGjvB+0VMnkXurLB5/1DDuzEqjG
 Vo69QCDjWSUTCywXGECqBhg4TiSGmSIV8gft6bCJ1vnSjlnb+aeyBatVl8Cp0uKenBvdB7sH
 CYOpbvaPgE8OvGs8qhPv6e+vcC8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5efcc045117610c7ff42d217 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 16:56:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 24E3BC433CB; Wed,  1 Jul 2020 16:56:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C0754C433C6;
 Wed,  1 Jul 2020 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0754C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 1 Jul 2020 10:56:31 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [RFC PATCH] interconnect: qcom: add functions to query addr/cmds
 for a path
Message-ID: <20200701165628.GA19996@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 kbuild test robot <lkp@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>
References: <20200701042528.12321-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701042528.12321-1-jonathan@marek.ca>
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
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 01, 2020 at 12:25:25AM -0400, Jonathan Marek wrote:
> The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
> to query the interconnect driver for bcm addresses and commands.
> 
> I'm not sure what is the best way to go about implementing this, this is
> what I came up with.
> 
> I included a quick example of how this can be used by the a6xx driver to
> fill out the GMU bw_table (two ddr bandwidth levels in this example, note
> this would be using the frequency table in dts and not hardcoded values).

I would like to add my enthusiasm for this idea but I'm not much of an
interconnect or RPMh expert so I would defer to them to be sure that the APIs
are robust enough to cover all the corner cases.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
>  drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
>  include/soc/qcom/icc.h                | 11 ++++++
>  3 files changed, 68 insertions(+), 13 deletions(-)
>  create mode 100644 include/soc/qcom/icc.h
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index ccd44d0418f8..1fb8f0480be3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -4,6 +4,7 @@
>  #include <linux/completion.h>
>  #include <linux/circ_buf.h>
>  #include <linux/list.h>
> +#include <soc/qcom/icc.h>
>  
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> @@ -320,24 +321,18 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][2] =  0x60000001;
>  }
>  
> -static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg, struct icc_path *path)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
>  	 * TODO: bus scaling
>  	 */
> -	msg->bw_level_num = 1;
> -
> -	msg->ddr_cmds_num = 3;
> +	msg->bw_level_num = 2;
>  	msg->ddr_wait_bitmask = 0x01;

We're going to need a API function for the wait bitmask too.
 
> -	msg->ddr_cmds_addrs[0] = 0x50000;
> -	msg->ddr_cmds_addrs[1] = 0x50004;
> -	msg->ddr_cmds_addrs[2] = 0x5007c;
> -
> -	msg->ddr_cmds_data[0][0] =  0x40000000;
> -	msg->ddr_cmds_data[0][1] =  0x40000000;
> -	msg->ddr_cmds_data[0][2] =  0x40000000;
> +	msg->ddr_cmds_num = qcom_icc_query_addr(path, msg->ddr_cmds_addrs);
> +	qcom_icc_query_cmd(path, msg->ddr_cmds_data[0], 0, 0);
> +	qcom_icc_query_cmd(path, msg->ddr_cmds_data[1], 0, 7216000);
>  
>  	/*
>  	 * These are the CX (CNOC) votes - these are used by the GMU but the
> @@ -388,7 +383,6 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][2] =  0x60000001;
>  }
>  
> -
>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_hfi_msg_bw_table msg = { 0 };
> @@ -400,7 +394,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  	else if (adreno_is_a640(adreno_gpu))
>  		a640_build_bw_table(&msg);
>  	else if (adreno_is_a650(adreno_gpu))
> -		a650_build_bw_table(&msg);
> +		a650_build_bw_table(&msg, adreno_gpu->base.icc_path);
>  	else
>  		a6xx_build_bw_table(&msg);
>  
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 3ac5182c9ab2..3ce2920330f9 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -9,6 +9,7 @@
>  
>  #include "bcm-voter.h"
>  #include "icc-rpmh.h"
> +#include "../internal.h"
>  
>  /**
>   * qcom_icc_pre_aggregate - cleans up stale values from prior icc_set
> @@ -92,6 +93,55 @@ int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>  }
>  EXPORT_SYMBOL_GPL(qcom_icc_set);
>  
> +static u32 bcm_query(struct qcom_icc_bcm *bcm, u64 sum_avg, u64 max_peak)
> +{
> +	u64 temp, agg_peak = 0;
> +	int i;
> +
> +	for (i = 0; i < bcm->num_nodes; i++) {
> +		temp = max_peak * bcm->aux_data.width;
> +		do_div(temp, bcm->nodes[i]->buswidth);
> +		agg_peak = max(agg_peak, temp);
> +	}
> +
> +	temp = agg_peak * 1000ULL;
> +	do_div(temp, bcm->aux_data.unit);
> +
> +	// TODO vote_x
> +
> +	return BCM_TCS_CMD(true, temp != 0, 0, temp);
> +}
> +
> +int qcom_icc_query_addr(struct icc_path *path, u32 *addr)

The leaf driver won't know the size of the path, so we'll likely need to kmalloc
and return the array or allow addr to be NULL and have the leaf driver do the
allocation itself once it knows what k is.

> +{
> +	struct qcom_icc_node *qn;
> +	int i, j, k = 0;
> +
> +	for (i = 0; i < path->num_nodes; i++) {
> +		qn = path->reqs[i].node->data;
> +		for (j = 0; j < qn->num_bcms; j++, k++)
> +			addr[k] = qn->bcms[j]->addr;
> +	}
> +
> +	return k;
> +}
> +EXPORT_SYMBOL_GPL(qcom_icc_query_addr);
> +
> +int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max)
> +{
> +	struct qcom_icc_node *qn;
> +	int i, j, k = 0;
> +
> +	for (i = 0; i < path->num_nodes; i++) {
> +		qn = path->reqs[i].node->data;
> +		for (j = 0; j < qn->num_bcms; j++, k++)
> +			cmd[k] = bcm_query(qn->bcms[j], avg, max);
> +	}
> +
> +	return 0;
> +}

Same as above.  When downstream did this for their old bespoke bus API they had
one function returns a struct with addrs / commands / wait bitmask.

I don't mind splitting up the function, but either way something is going to
have to query the number of commands in the path and allocate the buffers.

Jordan

> +EXPORT_SYMBOL_GPL(qcom_icc_query_cmd);
> +
>  /**
>   * qcom_icc_bcm_init - populates bcm aux data and connect qnodes
>   * @bcm: bcm to be initialized
> diff --git a/include/soc/qcom/icc.h b/include/soc/qcom/icc.h
> new file mode 100644
> index 000000000000..8d0ddde49739
> --- /dev/null
> +++ b/include/soc/qcom/icc.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_QCOM_ICC_H__
> +#define __SOC_QCOM_ICC_H__
> +
> +#include <linux/interconnect.h>
> +
> +int qcom_icc_query_addr(struct icc_path *path, u32 *addr);
> +int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max);
> +
> +#endif /* __SOC_QCOM_ICC_H__ */
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
