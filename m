Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0E9CDB2A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 10:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1701B10E1BD;
	Fri, 15 Nov 2024 09:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VO9DOUvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4CA10E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:11:12 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-382171fe8b1so980185f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 01:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731661871; x=1732266671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9vpXoiXhLMF3td8sRQvEmRzRVckuoAGxk/B3yXzMi9U=;
 b=VO9DOUvgG2CJPnjfN8glPR21WP5SX8HxyZOQ6n38ao/pb+MoaRa+LZ0sVq0vK8qu+r
 emyRue3TyrX3ET83odnQuOn2xzH0nMqW753+7GKV3f/SYDkpFbNy4QwrO/yNhVBkVN+e
 XjxzZ3hoBuPIpX6Bld832Ia3sycOCeNcJAAXhE4tFqysiNnfDCTSXj4xRM97PdS9vj82
 W5WT/sjbMpSCz+5cqY7gocQlM9FQ59umf59gmic4unoP2POtywEQd3li5CQeNXyvMACk
 LdtiLVjkZ0BOmwvEp1xIEO59lsyO/NB5IlzT4L4c9XC13BPhJUQZGvkQcoPP1URwrUuy
 2fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731661871; x=1732266671;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9vpXoiXhLMF3td8sRQvEmRzRVckuoAGxk/B3yXzMi9U=;
 b=MRG/tKTu2xFCJF78KnVgmHb3B7r8ddQKykHyTHXsA1GlQKVGSxq2LqujjZ/CLUwwl4
 yf93v/RMF9O8juD9gRIkNsu++6FUITFoMFmuCbPvD9WRPVwYI1mrEd3jVvFAUCy77X7Z
 Sl5YxrSKBXGEGC8aMrMLjfI39Pv+eBjkhVLmGIUHR1JiRp7S0oPr+8k9QKMSYmLaqBiT
 f0ja+EGsCGAUVcB63TZB5MmcQox4LWt0x3d4EfDwCcodu5F2tv1BqlTo90/oltLFiolS
 cXjtxC4k7nzcork0OPScJU3tDYFkZUoVzRZApxBCZFnMpM0BMYjqrZd9xQmE6/ajbgu+
 QdDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLCUbeGjCpzVG7c3hTUom/KspUUwPtyT5h4wBWH31v6DAq3ofYUrZj3n+VbMLftEWrqb5+Y6IcJ/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Bf2B1mAXDC3X/+AUP5vJ/25Jc5fm7CROvtAgMKSPAJgj6tqY
 bS3Ti3gVtTdaWKPLypgZLkTj0SlePHRGF3xmDn61nm4v/trfKEtAb8K2dVarVjg=
X-Google-Smtp-Source: AGHT+IFieFfvih4A4DPrMQVGXmpc94cqEsfn4+XNZLdxbJDkvd6N1Dhs/fUVu8kYNuTyQ9Q9pX341A==
X-Received: by 2002:a05:6000:2cf:b0:37d:3780:31d2 with SMTP id
 ffacd0b85a97d-38214022129mr5684419f8f.15.1731661870728; 
 Fri, 15 Nov 2024 01:11:10 -0800 (PST)
Received: from [192.168.7.189] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adadf8fsm3794456f8f.39.2024.11.15.01.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:11:10 -0800 (PST)
Message-ID: <17243670-7e91-46f8-812d-3f21cee5cd2c@linaro.org>
Date: Fri, 15 Nov 2024 10:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 4/8] drm/msm: adreno: dynamically generate GMU bw table
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
 <20241113-topic-sm8x50-gpu-bw-vote-v1-4-3b8d39737a9b@linaro.org>
 <rvfrkb4v7cilzu3prv5dr2dni7m3jv3crhmto3uume5v5wxr5m@apvyb4lc2rre>
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
In-Reply-To: <rvfrkb4v7cilzu3prv5dr2dni7m3jv3crhmto3uume5v5wxr5m@apvyb4lc2rre>
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

On 15/11/2024 08:24, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 04:48:30PM +0100, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the ddr
>> bandwidth along the frequency and power domain level, but for
>> now we statically fill the bw_table with values from the
>> downstream driver.
>>
>> Only the first entry is used, which is a disable vote, so we
>> currently rely on scaling via the linux interconnect paths.
>>
>> Let's dynamically generate the bw_table with the vote values
>> previously calculated from the OPPs.
> 
> Nice to see this being worked upon. I hope the code can is generic
> enough so that we can use it from other adreno_foo_build_bw_table()
> functions.

I would hope so, but I don't have the HW to properly test it on those
platforms.

> 
>>
>> Those entried will then be used by the GMU when passing the
>> appropriate bandwidth level when voting for a gpu frequency.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 +++++++++++++++++++++++++++--------
>>   1 file changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..9a89ba95843e7805d78f0e5ddbe328677b6431dd 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -596,22 +596,48 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   	msg->cnoc_cmds_data[1][0] = 0x60000001;
>>   }
>>   
>> -static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>> +static void a740_generate_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
>> +				   struct a6xx_hfi_msg_bw_table *msg)
>>   {
>> -	msg->bw_level_num = 1;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>> +	unsigned int i, j;
>>   
>> -	msg->ddr_cmds_num = 3;
>>   	msg->ddr_wait_bitmask = 0x7;
>>   
>> -	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
>> -	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
>> -	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
>> +	for (i = 0; i < 3; i++) {
>> +		if (!info->bcm[i].name)
>> +			break;
>> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcm[i].name);
>> +	}
>> +	msg->ddr_cmds_num = i;
>>   
>> -	msg->ddr_cmds_data[0][0] = 0x40000000;
>> -	msg->ddr_cmds_data[0][1] = 0x40000000;
>> -	msg->ddr_cmds_data[0][2] = 0x40000000;
>> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
>> +		for (j = 0; j < msg->ddr_cmds_num; j++)
>> +			msg->ddr_cmds_data[i][j] = gmu->gpu_bw_votes[i][j];
>> +	msg->bw_level_num = gmu->nr_gpu_bws;
>> +}
>> +
>> +static void a740_build_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
>> +				struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
>> +		a740_generate_bw_table(adreno_gpu, gmu, msg);
>> +	} else {
> 
> Why do we need a fallback code here?

Because at this particular commit, it would generate an invalid table, I should probably remove the fallback at the end

> 
>> +		msg->bw_level_num = 1;
>>   
>> -	/* TODO: add a proper dvfs table */
>> +		msg->ddr_cmds_num = 3;
>> +		msg->ddr_wait_bitmask = 0x7;
>> +
>> +		msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
>> +		msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
>> +		msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
>> +
>> +		msg->ddr_cmds_data[0][0] = 0x40000000;
>> +		msg->ddr_cmds_data[0][1] = 0x40000000;
>> +		msg->ddr_cmds_data[0][2] = 0x40000000;
>> +
>> +		/* TODO: add a proper dvfs table */
> 
> I think TODO is unapplicable anymore.
> 
>> +	}
>>   
>>   	msg->cnoc_cmds_num = 1;
>>   	msg->cnoc_wait_bitmask = 0x1;
>> @@ -691,7 +717,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	else if (adreno_is_a730(adreno_gpu))
>>   		a730_build_bw_table(msg);
>>   	else if (adreno_is_a740_family(adreno_gpu))
>> -		a740_build_bw_table(msg);
>> +		a740_build_bw_table(adreno_gpu, gmu, msg);
>>   	else
>>   		a6xx_build_bw_table(msg);
>>   
>>
>> -- 
>> 2.34.1
>>
> 

