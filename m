Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BBCBE4E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2B910E51B;
	Mon, 15 Dec 2025 14:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="2kUFm4M8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612610E521
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:36:01 +0000 (UTC)
Received: from [172.16.12.102] (89-24-64-24.customers.tmcz.cz [89.24.64.24])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 487EF5340D1C;
 Mon, 15 Dec 2025 15:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1765809357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s/LxO1TnP71dtYZuBpKQAsPafds0lCPJh42zK3IG/Lg=;
 b=2kUFm4M8RTO5dhSvwonel91l7PTrF9U5L+FmgPy3LaymYh+jNvchKRAsZyEP0k7Z4z2Bav
 BoSUf66ywghIp3nlAxgCMz8XaXWeDeCZHSMnx2nRUgMY/u8ia80pWbedIGMdITc2TKGzlw
 TereQ9BpBiS9hTbNSnxk2ks6Hn4LLpA=
Message-ID: <6a547cb2-4014-4918-8e5d-fc7593ba4f2c@ixit.cz>
Date: Mon, 15 Dec 2025 15:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: rcg2, msm/dsi: Fix hangs caused by
 register writes while clocks are off
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
 <20251213-stability-discussion-v1-2-b25df8453526@ixit.cz>
 <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aeefcr2yynlgnkiocv5eeqs4heaym6bts55z5iziqkysdzzqnt@oz2yau4nqwq7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 13/12/2025 05:01, Dmitry Baryshkov wrote:
> On Sat, Dec 13, 2025 at 12:08:17AM +0100, David Heidelberg via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> This patch fixes system hangs that occur when RCG2 and DSI code paths
>> perform register accesses while the associated clocks or power domains
>> are disabled.
> 
> In general this should not be happening. Do you have a description of
> the corresponding code path?
> 
>>
>> For the Qualcomm RCG2 clock driver, updating M/N/D registers while the
>> clock is gated can cause the hardware to lock up. Avoid toggling the
>> update bit when the clock is disabled and instead write the configuration
>> directly.
>>
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/clk/qcom/clk-rcg2.c        | 18 ++++++++++++++++++
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++++++
>>   2 files changed, 31 insertions(+)
> 
> This needs to be split into two patches.

Thank you for the feedback! Petr promised to look into it and sent v2 
until end of the week.

David

> 
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index e18cb8807d735..a18d2b9319670 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1182,6 +1182,24 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
>>   		f.m = frac->num;
>>   		f.n = frac->den;
>>   
>> +		/*
>> +		 * If clock is disabled, update the M, N and D registers and
>> +		 * don't hit the update bit.
>> +		 */
>> +		if (!clk_hw_is_enabled(hw)) {
>> +			int ret;
>> +
>> +			ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret = __clk_rcg2_configure(rcg, &f, &cfg);
>> +			if (ret)
>> +				return ret;
>> +
>> +			return regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
>> +		}
>> +
>>   		return clk_rcg2_configure(rcg, &f);
>>   	}
>>   	return -EINVAL;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index e0de545d40775..374ed966e960b 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -762,6 +762,12 @@ dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
>>   
>>   static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>>   {
>> +	/* Check if we're already powered off before writing registers */
>> +	if (!msm_host->power_on) {
>> +		pr_info("DSI CTRL: Skipping register write - host already powered off\n");
> 
> It definitely should be dev_something. Probably dev_warn().
> 
>> +		return;
>> +	}
>> +
>>   	dsi_write(msm_host, REG_DSI_CTRL, 0);
>>   }
>>   
>> @@ -2489,6 +2495,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>>   {
>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>> +	int ret;
>> +
> 
> Extra empty line
> 
>>   
>>   	mutex_lock(&msm_host->dev_mutex);
>>   	if (!msm_host->power_on) {
>> @@ -2496,6 +2504,11 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>>   		goto unlock_ret;
>>   	}
>>   
>> +	/* Ensure clocks are enabled before register access */
> 
> And this looks like yet another fix, prompting for a separate commmit.
> 
>> +	ret = pm_runtime_get_sync(&msm_host->pdev->dev);
>> +	if (ret < 0)
>> +		pm_runtime_put_noidle(&msm_host->pdev->dev);
> 
> pm_runtime_resume_and_get()
> 
> Also, where is a corresponding put() ? We are leaking the runtime PM
> counter otherwise.
> 
>> +
>>   	dsi_ctrl_disable(msm_host);
>>   
>>   	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
>>
>> -- 
>> 2.51.0
>>
>>
> 

-- 
David Heidelberg

