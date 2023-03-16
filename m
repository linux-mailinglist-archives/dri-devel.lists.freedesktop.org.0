Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E056BD4D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056810ED37;
	Thu, 16 Mar 2023 16:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440D110E0E5;
 Thu, 16 Mar 2023 16:13:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G9q8B8024057; Thu, 16 Mar 2023 16:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jMxeL/k6UGhziLAYFVISsLgENwPkcTDe0Fm26HsQho4=;
 b=PPvmom4bOYLiEtw22ov0gXrKVfcTJsPAYGE0lyS7wFxnKknnKAP/eWdxrUAbFkmrOYve
 jvY/t3xpkSUbF0SrpzKeS97OwlFmXYI7sCAh6c6QzAheKAP1jpMnMiWGx9w3EnjYyiGz
 CB3lr40J6vk4VDnR+RgUWoj8f3vV5643gN82Xytnz3Lx5lLFvTvx1GPCmH+HxtoCXtbI
 q07jc0XTQa0CEm9JZNAm89L18pJdgFL3WkpD9WsT7J0cJ+mKC04XEU/sO1wFfzmFKggv
 yay1I4AukXeUOJ/qC6CygxwM2O8yorliBpyBiiFwixMtyGlEt8cBs7fGJsgvhzqB71UX wg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpy8jgq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:13:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32GGDVDe013051
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:13:31 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 16 Mar
 2023 09:13:30 -0700
Message-ID: <176c6088-4470-5559-e79e-fd5675db0097@quicinc.com>
Date: Thu, 16 Mar 2023 09:13:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
 <CAA8EJppxX4haZSwdvVbN7bc6kXAyNO1rg6zWZv9wPFdqGrcXuw@mail.gmail.com>
 <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
 <58E03B71-20C4-4F81-96C1-6D8CE517F3FB@linaro.org>
 <fd876ad2-3fd0-eaab-3407-dd32d494f662@quicinc.com>
 <a5d1a74f-1b7a-569d-e487-774720dfae22@quicinc.com>
 <CAA8EJpq_mwUt0+1yGYo6hRx8Vz12DumVdpEjJbPk8gGHhGZ2bA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq_mwUt0+1yGYo6hRx8Vz12DumVdpEjJbPk8gGHhGZ2bA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bIKmKeRxdjHbW_I4hIqQDyQlnylC7jeX
X-Proofpoint-ORIG-GUID: bIKmKeRxdjHbW_I4hIqQDyQlnylC7jeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160130
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, quic_sbillaka@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, andersson@kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/16/2023 9:03 AM, Dmitry Baryshkov wrote:
> Hi,
> 
> [removed previous conversation]
> 
>>
>> Hi Dmitry and Abhinav,
>>
>> Just wanted to follow up on this thread. I've gone over the MSM-specific
>> DSC params for DP and DSI and have found a few shared calculations and
>> variables between both DSI and DP paths:
>>
>> - (as mentioned earlier in the thread) almost all the calculations in
>> dpu_dsc_populate_dsc_config() match dsi_populate_dsc_params() [1]. The
>> only difference in the math I'm seeing is initial_scale_value.
> 
> The value in dsi code is valid for initial_offset = 6144. Please use
> the formula from the standard (= sde_dsc_populate_dsc_config) and add
> it to drm_dsc_helper.c
> 
> If I remember correctly the last remaining item in
> dsi_populate_dsc_params() (except mentioned initial_offset) was
> line_buf_depth, see [3]. I'm not sure about setting it to bpc+1.
> According to the standard it should come from a DSC decoder spec,
> which means it should be set by the DSI panel driver or via
> drm_dp_dsc_sink_line_buf_depth() in the case of DP output.
> 
>> - dsc_extra_pclk_cycle_cnt and dce_bytes_per_line, which were introduced
>> in Kuogee's v1 DSC series [2], are used for DSI, DP, and the DPU timing
>> engine. dsc_extra_pclk_cycle_cnt is calculated based on pclk_per_line
>> (which is calculated differently between DP and DSI), but
>> dce_bytes_per_line is calculated the same way between DP and DSI.
>>
>> To avoid having to duplicate math in 2 different places, I think it
>> would help to have these calculations in some msm_dsc_helper.c file. Any
>> thoughts on this?
> 
> dsc_extra_pclk_cycle_cnt and dce_bytes_per_line are used only in DPU
> code, so they can stay in DPU driver.
> 

They can stay in the dpu driver is fine but where?

Like Jessica wrote, this is computed and used in 3 places today :

1) DSI video engine computation
2) DP controller computation
3) timing engine programming

So either we have a helper in a common location somewhere so that these 
3 modules can call that helper and use it OR each module duplicates the 
computation code.

What should be the common location is the discussion here.

It cannot be dpu_encoder.c as the DSI/DP dont call into the encoder methods.

>>
>> Thanks,
>>
>> Jessica Zhang
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1756
>>
>> [2] https://patchwork.freedesktop.org/patch/519845/?series=113240&rev=1
> 
> [3] https://patchwork.freedesktop.org/patch/525441/?series=114472&rev=2
> 
> 
> 
