Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CC211CD8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B576EA83;
	Thu,  2 Jul 2020 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C46E961
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:04:57 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g13so18978593qtv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CN+fMZHjRz6cQZ6By1KV3J/CB1Q6jvTnPN3oKiEz6+E=;
 b=ewfXnkAqVEr73ZZ+221DRIwPImdL/mndMfhyS721xbdHnW1G6sWfGUF6mriUkt0j8b
 WSNomjCz0BZF9dJrkASd4vEFnELdLcrDW58mTCvuTlczzQNnr1moiHmv6uxL/eGNKS9l
 J6dxAmh9SUqKqEY7zvajME5nA+2fntrOAKJwTx7MuNZcAYlhGD2mzOxYZ1sm9Tl1sKTN
 yyqhmKTAetfeCecpjZqDaHbvwYalF9oHml8/h9LYK1a3vvjEr+om8x4NEumvHc+j3bEp
 zKSE664voxBy2j4jJRLzf1AVB7zvdclcOxtPBRv2I92u3DlV1T0VpppKA1D6FqQeTe7X
 yIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CN+fMZHjRz6cQZ6By1KV3J/CB1Q6jvTnPN3oKiEz6+E=;
 b=H1CFGU9SudnG5MGJaQiZ/JS1K1O39EYNZVbGJg9FEiV9YiPf67zVfJCtQwN0aK8+N1
 Pl2v2F2STrrXGCm6ycvJuSyiRCUwfXx3en0NFplp7ZPK/8iM7MXjoxrolL2jBav0POrS
 eqNeZpzyvaUCffhnq4YUVnl4CsNtpIiMkurH89bckJDx5dURsv/KQGVgdPmkiYYx7AAm
 /Oefq/YRl2MiNHRSyyJCLFKWY/E0hIxhZawwfaM7PwnZNWKWLXF4OEpAyW8JYHk0irCG
 jAg7KuZWUwnCwSDzI6FkqcLzKGAwblcAnN+59bNrwSbwQVm3MT6eXuWWUUIEUc8ku7WE
 S2Bg==
X-Gm-Message-State: AOAM53098gck6HssRDwIczsGHWG7tbaeKVAGi1R5zxNi+45bKw+8Fvt3
 TDhN10iDAPSSbakUeOpBcfW3Gg==
X-Google-Smtp-Source: ABdhPJwXo9kSffKLrPPQIOK7rHILdvBMLIyVKGq9lzhY/udOhfuTBecFsZrL0mUqUoFypHQql+VjjA==
X-Received: by 2002:ac8:378f:: with SMTP id d15mr26658349qtc.256.1593623096432; 
 Wed, 01 Jul 2020 10:04:56 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id q5sm7041265qtf.12.2020.07.01.10.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:04:55 -0700 (PDT)
Subject: Re: [RFC PATCH] interconnect: qcom: add functions to query addr/cmds
 for a path
To: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, kbuild test robot <lkp@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>
References: <20200701042528.12321-1-jonathan@marek.ca>
 <20200701165628.GA19996@jcrouse1-lnx.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <7c1f9635-f4d5-a977-905d-3d7cc9d74ec2@marek.ca>
Date: Wed, 1 Jul 2020 13:03:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200701165628.GA19996@jcrouse1-lnx.qualcomm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/20 12:56 PM, Jordan Crouse wrote:
> On Wed, Jul 01, 2020 at 12:25:25AM -0400, Jonathan Marek wrote:
>> The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
>> to query the interconnect driver for bcm addresses and commands.
>>
>> I'm not sure what is the best way to go about implementing this, this is
>> what I came up with.
>>
>> I included a quick example of how this can be used by the a6xx driver to
>> fill out the GMU bw_table (two ddr bandwidth levels in this example, note
>> this would be using the frequency table in dts and not hardcoded values).
> 
> I would like to add my enthusiasm for this idea but I'm not much of an
> interconnect or RPMh expert so I would defer to them to be sure that the APIs
> are robust enough to cover all the corner cases.
> 
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
>>   drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
>>   include/soc/qcom/icc.h                | 11 ++++++
>>   3 files changed, 68 insertions(+), 13 deletions(-)
>>   create mode 100644 include/soc/qcom/icc.h
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index ccd44d0418f8..1fb8f0480be3 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -4,6 +4,7 @@
>>   #include <linux/completion.h>
>>   #include <linux/circ_buf.h>
>>   #include <linux/list.h>
>> +#include <soc/qcom/icc.h>
>>   
>>   #include "a6xx_gmu.h"
>>   #include "a6xx_gmu.xml.h"
>> @@ -320,24 +321,18 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   	msg->cnoc_cmds_data[1][2] =  0x60000001;
>>   }
>>   
>> -static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>> +static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg, struct icc_path *path)
>>   {
>>   	/*
>>   	 * Send a single "off" entry just to get things running
>>   	 * TODO: bus scaling
>>   	 */
>> -	msg->bw_level_num = 1;
>> -
>> -	msg->ddr_cmds_num = 3;
>> +	msg->bw_level_num = 2;
>>   	msg->ddr_wait_bitmask = 0x01;
> 
> We're going to need a API function for the wait bitmask too.
>   
>> -	msg->ddr_cmds_addrs[0] = 0x50000;
>> -	msg->ddr_cmds_addrs[1] = 0x50004;
>> -	msg->ddr_cmds_addrs[2] = 0x5007c;
>> -
>> -	msg->ddr_cmds_data[0][0] =  0x40000000;
>> -	msg->ddr_cmds_data[0][1] =  0x40000000;
>> -	msg->ddr_cmds_data[0][2] =  0x40000000;
>> +	msg->ddr_cmds_num = qcom_icc_query_addr(path, msg->ddr_cmds_addrs);
>> +	qcom_icc_query_cmd(path, msg->ddr_cmds_data[0], 0, 0);
>> +	qcom_icc_query_cmd(path, msg->ddr_cmds_data[1], 0, 7216000);
>>   
>>   	/*
>>   	 * These are the CX (CNOC) votes - these are used by the GMU but the
>> @@ -388,7 +383,6 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   	msg->cnoc_cmds_data[1][2] =  0x60000001;
>>   }
>>   
>> -
>>   static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_hfi_msg_bw_table msg = { 0 };
>> @@ -400,7 +394,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	else if (adreno_is_a640(adreno_gpu))
>>   		a640_build_bw_table(&msg);
>>   	else if (adreno_is_a650(adreno_gpu))
>> -		a650_build_bw_table(&msg);
>> +		a650_build_bw_table(&msg, adreno_gpu->base.icc_path);
>>   	else
>>   		a6xx_build_bw_table(&msg);
>>   
>> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
>> index 3ac5182c9ab2..3ce2920330f9 100644
>> --- a/drivers/interconnect/qcom/icc-rpmh.c
>> +++ b/drivers/interconnect/qcom/icc-rpmh.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include "bcm-voter.h"
>>   #include "icc-rpmh.h"
>> +#include "../internal.h"
>>   
>>   /**
>>    * qcom_icc_pre_aggregate - cleans up stale values from prior icc_set
>> @@ -92,6 +93,55 @@ int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_icc_set);
>>   
>> +static u32 bcm_query(struct qcom_icc_bcm *bcm, u64 sum_avg, u64 max_peak)
>> +{
>> +	u64 temp, agg_peak = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < bcm->num_nodes; i++) {
>> +		temp = max_peak * bcm->aux_data.width;
>> +		do_div(temp, bcm->nodes[i]->buswidth);
>> +		agg_peak = max(agg_peak, temp);
>> +	}
>> +
>> +	temp = agg_peak * 1000ULL;
>> +	do_div(temp, bcm->aux_data.unit);
>> +
>> +	// TODO vote_x
>> +
>> +	return BCM_TCS_CMD(true, temp != 0, 0, temp);
>> +}
>> +
>> +int qcom_icc_query_addr(struct icc_path *path, u32 *addr)
> 
> The leaf driver won't know the size of the path, so we'll likely need to kmalloc
> and return the array or allow addr to be NULL and have the leaf driver do the
> allocation itself once it knows what k is.
> 

In the a6xx gpu case, the a6xx_hfi_msg_bw_table has a fixed array size 
(allows up to 8 commands for ddr and 6 for cnoc), so there shouldn't be 
a need for any allocation.

Allowing addr to be NULL to get the # of addrs/cmds (so the a6xx driver 
can bail out if it can't fit, although that should never happen) would 
be OK (or having an array size parameter so the function can return an 
error), but IMO not needed for the "qcom_icc_query_cmd" function below, 
since it returns the same number of commands the "qcom_icc_query_addr" 
returns addresses.

>> +{
>> +	struct qcom_icc_node *qn;
>> +	int i, j, k = 0;
>> +
>> +	for (i = 0; i < path->num_nodes; i++) {
>> +		qn = path->reqs[i].node->data;
>> +		for (j = 0; j < qn->num_bcms; j++, k++)
>> +			addr[k] = qn->bcms[j]->addr;
>> +	}
>> +
>> +	return k;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_icc_query_addr);
>> +
>> +int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max)
>> +{
>> +	struct qcom_icc_node *qn;
>> +	int i, j, k = 0;
>> +
>> +	for (i = 0; i < path->num_nodes; i++) {
>> +		qn = path->reqs[i].node->data;
>> +		for (j = 0; j < qn->num_bcms; j++, k++)
>> +			cmd[k] = bcm_query(qn->bcms[j], avg, max);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Same as above.  When downstream did this for their old bespoke bus API they had
> one function returns a struct with addrs / commands / wait bitmask.
> 
> I don't mind splitting up the function, but either way something is going to
> have to query the number of commands in the path and allocate the buffers.
> 
> Jordan
> 
>> +EXPORT_SYMBOL_GPL(qcom_icc_query_cmd);
>> +
>>   /**
>>    * qcom_icc_bcm_init - populates bcm aux data and connect qnodes
>>    * @bcm: bcm to be initialized
>> diff --git a/include/soc/qcom/icc.h b/include/soc/qcom/icc.h
>> new file mode 100644
>> index 000000000000..8d0ddde49739
>> --- /dev/null
>> +++ b/include/soc/qcom/icc.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __SOC_QCOM_ICC_H__
>> +#define __SOC_QCOM_ICC_H__
>> +
>> +#include <linux/interconnect.h>
>> +
>> +int qcom_icc_query_addr(struct icc_path *path, u32 *addr);
>> +int qcom_icc_query_cmd(struct icc_path *path, u32 *cmd, u64 avg, u64 max);
>> +
>> +#endif /* __SOC_QCOM_ICC_H__ */
>> -- 
>> 2.26.1
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
