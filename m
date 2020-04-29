Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05071BE082
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F996E14F;
	Wed, 29 Apr 2020 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7326E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:16:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588169806; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nnaIfrV4qLeRSIGOFX1I6F/ufbM8nw9ujY7Wju+a3ug=;
 b=k+wqhMDtTUuF9a5Wvd6/tz0jfaLOWtlWrZJp0H4jTQFz0IQ5rKahN8h6wlplub2cWqZCsV3d
 vBE4L6GAcdl0klMHCnd+jz51ipp4jQc29061v34bZKy/gc/uMBwtWXgP1VQBvAz/urbLK3v9
 3SQpQ02feMSj2JmLI5T+DY2o0/c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea98c4d.7fc2fc8cbed8-smtp-out-n05;
 Wed, 29 Apr 2020 14:16:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0E2B8C43637; Wed, 29 Apr 2020 14:16:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D3419C433CB;
 Wed, 29 Apr 2020 14:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3419C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
To: Matthias Kaehlcke <mka@chromium.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-6-git-send-email-rnayak@codeaurora.org>
 <20200429001425.GL4525@google.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <92892448-c10c-4440-4933-17706d46ef93@codeaurora.org>
Date: Wed, 29 Apr 2020 19:46:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429001425.GL4525@google.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, viresh.kumar@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/29/2020 5:44 AM, Matthias Kaehlcke wrote:
> On Tue, Apr 28, 2020 at 07:02:53PM +0530, Rajendra Nayak wrote:
>> On some qualcomm platforms DPU needs to express a perforamnce state
>> requirement on a power domain depennding on the clock rates.
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 25 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 11f2beb..fe5717df 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/errno.h>
>>   #include <linux/mutex.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/sort.h>
>>   #include <linux/clk.h>
>>   #include <linux/bitmap.h>
>> @@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
>>   		rate = core_clk->max_rate;
>>   
>>   	core_clk->rate = rate;
>> -	return msm_dss_clk_set_rate(core_clk, 1);
>> +	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
>>   }
>>   
>>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index ce19f1d..2f53bbf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/dma-buf.h>
>>   #include <linux/of_irq.h>
>> +#include <linux/pm_opp.h>
>>   
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>> @@ -1033,11 +1034,23 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>   	if (!dpu_kms)
>>   		return -ENOMEM;
>>   
>> +	dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
>> +	if (IS_ERR(dpu_kms->opp_table))
>> +		return PTR_ERR(dpu_kms->opp_table);
>> +	/* OPP table is optional */
>> +	ret = dev_pm_opp_of_add_table(dev);
>> +	if (!ret) {
>> +		dpu_kms->has_opp_table = true;
>> +	} else if (ret != -ENODEV) {
>> +		dev_err(dev, "Invalid OPP table in Device tree\n");
> 
> nit: s/Device/device/ ?
> 
> uber-nit: s/Invalid/invalid/
> 
>    most log messages in this file start with a lower case letter, except
>    for acronyms/register names
> 
> please also change it in the other drivers unless you disagree.

Sure, will do. Thanks.

> 
>> +		return ret;
>> +	}
>> +
>>   	mp = &dpu_kms->mp;
>>   	ret = msm_dss_parse_clock(pdev, mp);
>>   	if (ret) {
>>   		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
>> -		return ret;
>> +		goto err;
>>   	}
>>   
>>   	platform_set_drvdata(pdev, dpu_kms);
>> @@ -1051,6 +1064,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>   
>>   	priv->kms = &dpu_kms->base;
>>   	return ret;
>> +err:
>> +	if (dpu_kms->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(dpu_kms->opp_table);
>> +	return ret;
>>   }
>>   
>>   static void dpu_unbind(struct device *dev, struct device *master, void *data)
>> @@ -1059,6 +1077,9 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
>>   	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>>   	struct dss_module_power *mp = &dpu_kms->mp;
>>   
>> +	if (dpu_kms->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(dpu_kms->opp_table);
>>   	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>>   	devm_kfree(&pdev->dev, mp->clk_config);
>>   	mp->num_clk = 0;
>> @@ -1090,6 +1111,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>   	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>>   	struct dss_module_power *mp = &dpu_kms->mp;
>>   
>> +	/* Drop the performance state vote */
>> +	dev_pm_opp_set_rate(dev, 0);
>>   	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>>   	if (rc)
>>   		DPU_ERROR("clock disable failed rc:%d\n", rc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index 211f5de9..2a52e4e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -128,6 +128,10 @@ struct dpu_kms {
>>   
>>   	struct platform_device *pdev;
>>   	bool rpm_enabled;
>> +
>> +	struct opp_table *opp_table;
>> +	bool has_opp_table;
>> +
>>   	struct dss_module_power mp;
>>   
>>   	/* reference count bandwidth requests, so we know when we can
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
