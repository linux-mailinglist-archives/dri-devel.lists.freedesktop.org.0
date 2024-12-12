Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B39EFE80
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 22:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21B110E462;
	Thu, 12 Dec 2024 21:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IeNWADDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482910E462
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 21:39:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a766b475so11068195e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 13:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734039588; x=1734644388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=I0k1fvuKT9m1wErYutTpuyN8BLsuG8GZk48OKFLo0lA=;
 b=IeNWADDtg942vi98KqGV1zkQaWSFUjTojbDeOE8Zh227Q21g0MesZPYzc5FNWDj0LA
 MNqpHQ3ij3ndQa+mmmjkqJ0L9jL7mXd7wdaGSrTBKPjL4qNOjAFtZeEGRrZaJlmS/x/b
 gOS6himSMdo4tJ0ACAgD5RMoP7WLZi2TFt7tzTypVUtC3KHjSe8TNvuashWDhHMbPBa/
 fJsn6LLQvY1EKI+VdTvItRRB9YKtKWfs/hL9Mg3o3Ah5dW2K8KkgWe5hGA/mpvZeOmK1
 m3OxoqoxkJ2FDVu0nfl9V/5DHESvy1NCKP4hX72f9b9MbVvoft3lPMlkXTgwFh1iETrR
 gGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734039588; x=1734644388;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=I0k1fvuKT9m1wErYutTpuyN8BLsuG8GZk48OKFLo0lA=;
 b=lnZgv4w021f1Hv6Kk2PMnskr7UEcpv3cr2w6qgqEMIspY37MBnnouzXHST7KcJVs7Y
 9qyEIwVMboEhQvWvPtJ2sSfeR6HHxNFq8dELm8n7bZJ1Jo3su7gcfJNZjkfqAOjhGXFv
 bCpDnK6EhICCTFGOA+kn707Jrtsj2FwhGPpb1rd2TDl4UkiE+TJDSmgdJsWAOPA/9gfA
 Cza6mQbcLIfgz5T7mE3bz2GArpQOgaqXR1kS7PADvPSAEb1IaQdtSGNVfGLjBA6bW6YU
 t++TxT4a7CuRWsX6u+m1PSmSknrIPKGQYKzs70sfSHoc1jdzIOirnPt57x/ohfDGPSFG
 GcDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv4YqnYFvDR5YiRz6OjtCCaCsFIWeESL9dBquTbuZ7AD/x3OfRgqCdQa6WAQn5xk0C6EsOf2BU+A4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbxrNkEHF3x2CUbrcFwy3F+TjZNXmnZVKExu3Gd4gB1oBH9sin
 o7zwYud06Nni2Ex3fIhHM6uhwcNM/QoG8b2V2ApsBGU0Q63m/Zvh29O5ufG7JiqYvijFNb2oElj
 BvBY=
X-Gm-Gg: ASbGnctYFPoBcJfo2nCHLE+B4qDmWW1KOskASqcvka0m5wbUI47h7xxPX0GaLoHBcxX
 fz1IY3guyMeUHESLuDy7cVNYw819srfMqRvM2GsfpvH83G7U4y7kHTSGRJDOG3fxB8pPCX016uR
 4Snx4v6X4B1VabcPFOJipKauOOVPo4ANi+MiivVCtOrRU29/0YeDsxx1pnJ08tybYFzzaVB4aFD
 YlI7sGQnbam4frZI0+nnAKUBkNdgylAwvmn9rLUHsBOSsO+34UaRegukkXGqvC/zlrsNcDT93e1
 8WYIUo9rXeWqI2z7F2pVpliDdpHXDOFQqg==
X-Google-Smtp-Source: AGHT+IFdbMU+m/VBA7CRP6F9gkZQC7hZocBSfp3JyHJOM9EcJT7Yo+BQtQGBqVzNNych5hj5m0mWmg==
X-Received: by 2002:a05:6000:98f:b0:382:47d0:64be with SMTP id
 ffacd0b85a97d-38880adab11mr126646f8f.29.1734039587874; 
 Thu, 12 Dec 2024 13:39:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a?
 ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514e86sm5175242f8f.72.2024.12.12.13.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 13:39:47 -0800 (PST)
Message-ID: <c0e588d9-1ba4-4486-a889-df0649c40180@linaro.org>
Date: Thu, 12 Dec 2024 22:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
 <8d854f93-36da-4779-9ab0-381912aef4b4@oss.qualcomm.com>
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
In-Reply-To: <8d854f93-36da-4779-9ab0-381912aef4b4@oss.qualcomm.com>
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

On 12/12/2024 21:10, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
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
>>
>> Those entries will then be used by the GMU when passing the
>> appropriate bandwidth level while voting for a gpu frequency.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/list.h>
>>   
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   
>>   #include "a6xx_gmu.h"
>>   #include "a6xx_gmu.xml.h"
>> @@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>>   		NULL, 0);
>>   }
>>   
>> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
>> +				   struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +	unsigned int i, j;
>> +
>> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
>> +		if (!info->bcms[i].name)
>> +			break;
>> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
>> +	}
>> +	msg->ddr_cmds_num = i;
>> +
>> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
>> +		for (j = 0; j < msg->ddr_cmds_num; j++)
>> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
>> +	msg->bw_level_num = gmu->nr_gpu_bws;
>> +
>> +	/* Compute the wait bitmask with each BCM having the commit bit */
>> +	msg->ddr_wait_bitmask = 0;
>> +	for (j = 0; j < msg->ddr_cmds_num; j++)
>> +		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
>> +			msg->ddr_wait_bitmask |= BIT(j);
>> +
>> +	/*
>> +	 * These are the CX (CNOC) votes - these are used by the GMU
>> +	 * The 'CN0' BCM is used on all targets, and votes are basically
>> +	 * 'off' and 'on' states with first bit to enable the path.
>> +	 */
>> +
> 
> /* The CNoC BCM only needs a simple off/on vote pair on all platforms */
> 
>> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
>> +	msg->cnoc_cmds_num = 1;
>> +
>> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
>> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
> 
> While it evaluates to the same, I think this is logically 1 (as in, one
> unit of bus rate). The question of which bit that corresponds to is
> handled by the macro.

"1" has not meaning, especially when we're supposed sending a bandwidth value, bit(0) means this bit has a special value

> 
> Also, a7xx sets values in both x and y parts here, while a6xx only does
> so in the y part.
> 
>> +
>> +	/* Compute the wait bitmask with each BCM having the commit bit */
>> +	msg->cnoc_wait_bitmask = 0;
>> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
>> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
>> +			msg->cnoc_wait_bitmask |= BIT(j);
> 
> This is a very fancy way to say msg->cnoc_wait_bitmask = BIT(0)

Fancy but we know how it's calculated...

> 
> Konrad

