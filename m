Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42077D10FCD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BD110E30C;
	Mon, 12 Jan 2026 07:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="X8XpVIoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737D510E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:54:53 +0000 (UTC)
Message-ID: <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1768204481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWKyeRy2s78zQYIRD23rnsmDUGzSSXuD7HSb16jI09M=;
 b=X8XpVIoWRpf1zniVfJmlUz/iAe9mQOQI+sFVIJ3u4aFKghNOX5E01hs9WDdYqJw10TCzjP
 xi6uUiwRRUO1M/m+BDikRUeam1XjYRU4mDeX8gWZH5+8eJAnps9dyDQYzoHSgXQGqBTFB1
 JyE+HaYi4uUCRSOBp+Mklm7Vug25GGf14OJGy0eN8K5Pe16MT0m6RToyXSgjBlv8raXW2E
 8PViDFL9vsLpxg3W2bEKA9k1PeWIB+oS8iDf8Gq8VAWXUJP8iyQFjXlAxLklMSnTv83RFD
 JAu3Ok02UyofsPkrMyFQfCCmX2IWGapo/KCmzyiHhlV8sGrvd23p+tuENLYWCw==
Date: Mon, 12 Jan 2026 04:54:28 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Xilin Wu <sophon@radxa.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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


On 1/12/26 3:31 AM, Xilin Wu wrote:
> On 5/7/2025 9:38 AM, Jessica Zhang wrote:
>> Filter out modes that have a clock rate greater than the max core clock
>> rate when adjusted for the perf clock factor
>>
>> This is especially important for chipsets such as QCS615 that have lower
>> limits for the MDP max core clock.
>>
>> Since the core CRTC clock is at least the mode clock (adjusted for the
>> perf clock factor) [1], the modes supported by the driver should be less
>> than the max core clock rate.
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>
> Hi. This patch effectively filters out the 3840x2160@120Hz mode on 
> SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which 
> slightly exceeds the supported max core clock of 600000.
>
> However, 4K 120Hz works flawlessly with the limit removed on this 
> platform. I even tried connecting two 4K 120Hz displays, and they can 
> work properly simultaneously. Is it possible to bring back support for 
> this mode, or adjust the limits? 

hm, interestingly on X1E80100 we didn't hit *that* limit, 
the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk 
was set to (575000), and reducing the clk_inefficiency_factor from 105 
to 104 was enough to lower it.

https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051

I guess it's also sink dependent, like if the mode for some monitors has 
much more front/back porch etc.? What's the entire modeline that 
resulted in 623700?

~val

