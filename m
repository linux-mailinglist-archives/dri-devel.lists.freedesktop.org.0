Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C39CDB20
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 10:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93810E3CE;
	Fri, 15 Nov 2024 09:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ubhBUYUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28D510E3CE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:09:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53da3b911b9so514713e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 01:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731661786; x=1732266586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4QJxP3ruwFAgMJJzcgTZW3NemwYO/mQm81cR4flDsn0=;
 b=ubhBUYUxYcTFKdgyw2AozpdsKE6i3Fh3Ryxca3yimtp1zclloFO+fweTT6XkSy4j38
 k/svO3wLX37ILWMmEwhFkMEHKZfPrOz9z84H50/nH27IQDogbz9AhO9fpdFLwjydS3tb
 AwV5NgAtzvOGGMVyQdFkMKi+aC2tFY78pBg0l05VP9cBSm+6U2xr4FykzLtpp7lixwl1
 JijvAG+gSSoWk4JYl1+RPrGd9EaX76NNuPoT/s33bTJLfUoPXEelm+hvS0gYblVDc99Q
 iSsgxrl40ROAwSqrqqB4IpkKTjfHDsLeRRmbzx9wth015meMkG7dHyygwDADXJLYwtNy
 04Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731661786; x=1732266586;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4QJxP3ruwFAgMJJzcgTZW3NemwYO/mQm81cR4flDsn0=;
 b=siyIZyfhnZOpum8j71creBIVBBVJc/V3QGsAwQMUG6OGny2QgJdYP5FggGm9QL/XOx
 q1vx4TsW6hWO3WVbSuHkBRpF5QEmuu/80/4dMOtYGSC356TvTWks+sQRowUKVOu7rfyL
 atNgfCB8i9EtM+3X3WojnVj5H+Q1LtMmmyxxR2q6/mZt4Ta3jLoZ4TEzOaDIpYIqRr0Z
 p/VnKzyOJRBAPNEZB8827KfM69/HDmFIjCQNLUZZXpng0tZ9nAplts+iTzBXR5ScJNmI
 TJ+6cnET5/9sgpTHS1kSe3xIMs1Qk9Itp//9UmJObYtxXfBYwmkMFMK16+I3PFPPNsBg
 hVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx/RzSs0x++cFn1Crw+4IaEDd5vrdhBFjVyWcU8kH7Df9bg3X4HAsqD0bRgKCIPyXO8P90RXn9UwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDrpwOX/tktc+5rtOgjTZEjdm7PV0S+xiMFrcmDRJrc8lfaR2W
 bxutnXlufGLv8BFd3fjtrAUritEom8sh/eD7Gcb+Ds7rrhLPX/+j6kBXObsy9fo=
X-Google-Smtp-Source: AGHT+IFKAYSQIiT9HBCqqyFs63licEAgHI+G0N44+wSxeO7YX68r4FBHn5IodDz8hglcPImngCkpcA==
X-Received: by 2002:a05:6512:1294:b0:53d:a9c1:ac62 with SMTP id
 2adb3069b0e04-53dab2a6a42mr875544e87.28.1731661785606; 
 Fri, 15 Nov 2024 01:09:45 -0800 (PST)
Received: from [192.168.7.189] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382247849b0sm1849752f8f.97.2024.11.15.01.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:09:45 -0800 (PST)
Message-ID: <dffb787f-7167-4027-a58d-34bba5f838ab@linaro.org>
Date: Fri, 15 Nov 2024 10:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/8] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-3-3b8d39737a9b@linaro.org>
 <p4x7rodp2qpwfb3hljtbi36mxjdrt5jr3xhad4rebsldlfxart@cz23of57gvrd>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <p4x7rodp2qpwfb3hljtbi36mxjdrt5jr3xhad4rebsldlfxart@cz23of57gvrd>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2024 08:20, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 04:48:29PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> In order to get the vote values to be used by the GPU Management
>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>> create a vote value to be send to the appropriate Bus Control
>> Modules (BCMs) declared in the GPU info struct.
>>
>> The vote array will be used to dynamically generate the GMU bw_table
>> sent during the GMU power-up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 163 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  12 +++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>   3 files changed, 176 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..504a7c5d5a9df4c787951f2ae3a69d566d205ad5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   #include <drm/drm_gem.h>
>>   
>>   #include "a6xx_gpu.h"
>> @@ -1287,6 +1288,119 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>>   	return 0;
>>   }
>>   
>> +struct a6xx_bcm_data {
>> +	u32 buswidth;
>> +	unsigned int unit;
>> +	unsigned int width;
> 
> In bits?
> 
>> +	unsigned int vcd;
> 
> What is this?

I'll also copy the icc-rpmh.h doc associated with those fields

> 
>> +	bool fixed;
> 
> What does it mean?

I took it from downstream, but it's the same as qcom_icc_bcm enable_mask instead here the mask depends on the platform and OPP, this is why I specified it in perfmode.

> 
>> +	unsigned int perfmode;
>> +	unsigned int perfmode_bw;
>> +};
>> +
>> +struct bcm_db {
>> +	__le32 unit;
>> +	__le16 width;
>> +	u8 vcd;
>> +	u8 reserved;
>> +};
>> +
>> +static int a6xx_gmu_rpmh_get_bcm_data(const struct a6xx_bcm *bcm,
>> +				      struct a6xx_bcm_data *bcm_data)
> 
> Is there a reason to copy CMD DB and BCM data to the interim
> representation instead of using those directly?

I guess I can keep bcm_db & a6xx_bcm as-is and do the _to_cpu() in-place.

> 
>> +{
>> +	const struct bcm_db *data;
>> +	size_t count;
>> +
>> +	data = cmd_db_read_aux_data(bcm->name, &count);
>> +	if (IS_ERR(data))
>> +		return PTR_ERR(data);
>> +
>> +	if (!count)
>> +		return -EINVAL;
>> +
>> +	bcm_data->unit = le32_to_cpu(data->unit);
>> +	bcm_data->width = le16_to_cpu(data->width);
>> +	bcm_data->vcd = data->vcd;
>> +	bcm_data->fixed = bcm->fixed;
>> +	bcm_data->perfmode = bcm->perfmode;
>> +	bcm_data->perfmode_bw = bcm->perfmode_bw;
>> +	bcm_data->buswidth = bcm->buswidth;
>> +
>> +	return 0;
>> +}
>> +
>> +static void a6xx_gmu_rpmh_calc_bw_vote(struct a6xx_bcm_data *bcms,
>> +				       int count, u32 bw, u32 *data)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		bool valid = true;
>> +		bool commit = false;
>> +		u64 peak, y;
>> +
>> +		if (i == count - 1 || bcms[i].vcd != bcms[i + 1].vcd)
>> +			commit = true;
>> +
>> +		if (bcms[i].fixed) {
>> +			if (!bw)
>> +				data[i] = BCM_TCS_CMD(commit, false, 0x0, 0x0);
>> +			else
>> +				data[i] = BCM_TCS_CMD(commit, true, 0x0,
>> +					bw >= bcms[i].perfmode_bw ?
>> +						bcms[i].perfmode : 0x0);
>> +			continue;
>> +		}
>> +
>> +		/* Multiple the bandwidth by the width of the connection */
> 
> ... and divide by the bus width. However it's not clear why you are
> multiplying bandwidth (bits or bytes per second) with the width
> (probably also bits?). Or is it not a width but the number of paths
> between units?

So this is basically the same as in bcm_agregate:
https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/interconnect/qcom/bcm-voter.c#L91

Just done slightly differently since we don't aggregate stuff but we want
to set the bandwidth directly here from the GMU.

> 
>> +		peak = (u64)bw * bcms[i].width;
>> +		do_div(peak, bcms[i].buswidth);
>> +
>> +		/* Input bandwidth value is in KBps */
> 
> Input or OPP / Interconnect?

I don't see the point, it's the input of the function which directly comes from OPP which is in KBps

> 
>> +		y = peak * 1000ULL;
>> +		do_div(y, bcms[i].unit);
>> +
>> +		/*
>> +		 * If a bandwidth value was specified but the calculation ends
>> +		 * rounding down to zero, set a minimum level
>> +		 */
>> +		if (bw && y == 0)
>> +			y = 1;
> 
> Is it a real usecase or just a safety net? If the bandwidth ends up
> being very low, maybe we should warn the users about it?

Probably a safety net, perhaps we could warn instead

> 
>> +
>> +		y = min_t(u64, y, BCM_TCS_CMD_VOTE_MASK);
>> +		if (!y)
>> +			valid = false;
> 
> This can probably be coupled with the previous condition.

Yeah I should probably refactor it and just avoid doing the
calculation if bw == 0.

> 
>> +
>> +		data[i] = BCM_TCS_CMD(commit, valid, y, y);
>> +	}
>> +}
>> +
>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info, struct a6xx_gmu *gmu)
>> +{
>> +	struct a6xx_bcm_data bcms[3];
>> +	unsigned int bcm_count = 0;
>> +	int ret, index;
>> +
>> +	/* Retrieve BCM data from cmd-db and merge with a6xx_info bcm table */
>> +	for (index = 0; index < 3; index++) {
> 
> Magic number 3.
> 
>> +		if (!info->bcm[index].name)
>> +			continue;
>> +
>> +		ret = a6xx_gmu_rpmh_get_bcm_data(&info->bcm[index], &bcms[index]);
>> +		if (ret)
>> +			return ret;
>> +
>> +		++bcm_count;
>> +	}
>> +
>> +	/* Generate BCM votes values for each bandwidth & bcm */
>> +	for (index = 0; index < gmu->nr_gpu_bws; index++)
>> +		a6xx_gmu_rpmh_calc_bw_vote(bcms, bcm_count, gmu->gpu_bw_table[index],
>> +					   gmu->gpu_bw_votes[index]);
>> +
>> +	return 0;
>> +}
>> +
>>   /* Return the 'arc-level' for the given frequency */
>>   static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>   					   unsigned long freq)
>> @@ -1390,12 +1504,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>>    * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>>    * to construct the list of votes on the CPU and send it over. Query the RPMh
>>    * voltage levels and build the votes
>> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
>> + * and BCM parameters to build the votes.
>>    */
>>   
>>   static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>>   	int ret;
>>   
>> @@ -1407,6 +1524,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>>   		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>   
>> +	/* Build the interconnect votes */
>> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE)
>> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1442,6 +1563,38 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>>   	return index;
>>   }
>>   
>> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
>> +		u32 size)
>> +{
>> +	int count = dev_pm_opp_get_opp_count(dev);
>> +	struct dev_pm_opp *opp;
>> +	int i, index = 0;
>> +	unsigned int bandwidth = 1;
>> +
>> +	/*
>> +	 * The OPP table doesn't contain the "off" bandwidth level so we need to
>> +	 * add 1 to the table size to account for it
>> +	 */
>> +
>> +	if (WARN(count + 1 > size,
>> +		"The GMU bandwidth table is being truncated\n"))
>> +		count = size - 1;
>> +
>> +	/* Set the "off" bandwidth */
>> +	bandwidths[index++] = 0;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
>> +		if (IS_ERR(opp))
>> +			break;
>> +
>> +		dev_pm_opp_put(opp);
>> +		bandwidths[index++] = bandwidth++;
>> +	}
>> +
>> +	return index;
>> +}
>> +
>>   static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> @@ -1472,6 +1625,16 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   
>>   	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>   
>> +	/*
>> +	 * The GMU also handles GPU Interconnect Votes so build a list
>> +	 * of DDR bandwidths from the GPU OPP table
>> +	 */
>> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE)
>> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>> +
>> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>> +
>>   	/* Build the list of RPMh votes that we'll send to the GMU */
>>   	return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..95c632d8987a517f067c48c61c6c06b9a4f61fc0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -19,6 +19,14 @@ struct a6xx_gmu_bo {
>>   	u64 iova;
>>   };
>>   
>> +struct a6xx_bcm {
>> +	char *name;
>> +	unsigned int buswidth;
>> +	bool fixed;
>> +	unsigned int perfmode;
>> +	unsigned int perfmode_bw;
>> +};
>> +
>>   /*
>>    * These define the different GMU wake up options - these define how both the
>>    * CPU and the GMU bring up the hardware
>> @@ -82,6 +90,10 @@ struct a6xx_gmu {
>>   	unsigned long gpu_freqs[16];
>>   	u32 gx_arc_votes[16];
>>   
>> +	int nr_gpu_bws;
>> +	unsigned long gpu_bw_table[16];
>> +	u32 gpu_bw_votes[16][3];
> 
> Is it is the same magic 16 as we have few lines above or is this 16 a
> different magic 16? And also 3 is a pure dark secret.

It's the same magic 16, since we use the same OPPs, the 3 is the actual number of BCMs we currently use, I wonder sure define should go, including the magic 16.

> 
>> +
>>   	int nr_gmu_freqs;
>>   	unsigned long gmu_freqs[4];
>>   	u32 cx_arc_votes[4];
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..d779d700120cbd974ee87a67214739b1d85156e2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>   	u32 gmu_chipid;
>>   	u32 gmu_cgc_mode;
>>   	u32 prim_fifo_threshold;
>> +	const struct a6xx_bcm bcm[3];
>>   };
>>   
>>   struct a6xx_gpu {
>>
>> -- 
>> 2.34.1
>>
> 

