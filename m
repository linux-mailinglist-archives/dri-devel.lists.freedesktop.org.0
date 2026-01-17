Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC91D39131
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 22:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D3C10E1DF;
	Sat, 17 Jan 2026 21:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="AJGkrbtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDEF10E1DF
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 21:46:19 +0000 (UTC)
Message-ID: <a5efb372-1a2a-4262-abc8-49bbeffa6961@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1768686377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tf7bG0pQMeMOUwUX/zh90P2Catwiv2K+Qr3H1Jwo+Tw=;
 b=AJGkrbtcsIl7HSbVXnUybuvEQfv79OxyzwvRJjoKwJRzBGFv5IJQB7YNUoAwXgu50dwMNp
 ivCW9AtS1P4ro+u238vouoMO5E9KqawfzZZ5o0sjFK3n97BLYkDvxpAP6coNYuJmnfB5p7
 8/PEpynJU2f1u3tGJxXrd9GQ+qjhUe1txEfK0JbgGatPtuo971nUP0ys1mBwJZnLZ/jEbr
 qVg1ukyZDillqvjI32WB5HDTu7E5sB2FbOHTJD7PG/vi6mOE2fLGePDaysYfUQF9ie14dA
 5oFtosuXH6hjgdVzQ7ICIxyndA7M0LQ00SBTo2rKrSF/2m557nfAFS96NrpgdQ==
Date: Sat, 17 Jan 2026 18:46:09 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
 <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
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


On 1/15/26 6:08 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 04:54:28AM -0300, Val Packett wrote:
>> On 1/12/26 3:31 AM, Xilin Wu wrote:
>>> On 5/7/2025 9:38 AM, Jessica Zhang wrote:
>>>> Filter out modes that have a clock rate greater than the max core clock
>>>> rate when adjusted for the perf clock factor
>>>>
>>>> This is especially important for chipsets such as QCS615 that have lower
>>>> limits for the MDP max core clock.
>>>>
>>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>>> perf clock factor) [1], the modes supported by the driver should be less
>>>> than the max core clock rate.
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>> ---
>>> Hi. This patch effectively filters out the 3840x2160@120Hz mode on
>>> SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly
>>> exceeds the supported max core clock of 600000.
>>>
>>> However, 4K 120Hz works flawlessly with the limit removed on this
>>> platform. I even tried connecting two 4K 120Hz displays, and they can
>>> work properly simultaneously. Is it possible to bring back support for
>>> this mode, or adjust the limits?
>> hm, interestingly on X1E80100 we didn't hit *that* limit,
>> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk was
> Hmm, what is your modeline then? Xilin's mode params looks sane and
> standard enough.

as mentioned in 
https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051:

"3840x2160": 120 1097750 3840 3888 3920 4000 2160 2166 2176 2287 0x40 0x9

## 1097750 / 2 = 548875; 548875 * 1.05 = 576318.75

vs.

"3840x2160": 120 1188000 3840 4016 4104 4400 2160 2168 2178 2250 0x40 0x5

## 1188000 / 2 = 594000; 594000 * 1.05 = 623700

Yeah, what's interesting is that both are just slightly above the max 
disp_cc_mdss_mdp_clk_src on the respective platforms. 576318 is only 
slightly above 575000, and 623700 is only slightly above 608000. So it's 
actually the *same* limit, just that the numbers are different per 
platform (sorry for any confusion).

Sooo.. what *is* the deal with the 105% inefficiency factor, is it 
possible to find out where it came from and why it's hardcoded to that 
number everywhere?

Can we add a loop that reduces it until the result fits into the max 
clk? Or should the factor be ignored for this calculation maybe?

~val

