Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C46F6249
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 02:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6032010E16B;
	Thu,  4 May 2023 00:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523FD10E06A;
 Thu,  4 May 2023 00:09:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343Njgsc004088; Thu, 4 May 2023 00:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1PMEx4qztYJUIIAqUTHBKZp8gI0LBm434DtrOFHPIpg=;
 b=GdNd1ILLCHzwh7WY+J+D7sFF4qtaJyb++Mz0ze+zaN2QbBEny1H1U344zOs629dmTk+R
 bEue4jlbBllsoDVrm8xu81dHd/cGNwijZbWvMU5mBu3U4vFswDFEFCipaS65vsW9cvcf
 LjsUnYHSLNoU5AQ3q5bjkyoZsq7vBybH1WTzYZjwbjLmcOgy/NxRATGdefTh/bWH9KDN
 gTZTT05tbtfDxkomRapLL3x3b+aNeTVnPI6r7uJfaOWFUS7wHm5fhH3PVL56c//2y9Es
 2TtXai9Boy8mL79csG45/LAH4Q83Ig6wX7KdeDDM+y3IYH5g3ETj73s7O2Su/VRrOYhj 6w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbsr41199-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 00:09:49 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34409maA010054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 May 2023 00:09:48 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 17:09:48 -0700
Message-ID: <b039a202-5415-29a5-6c27-ff22ecefb79e@quicinc.com>
Date: Wed, 3 May 2023 17:09:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] drm/msm/dpu: Enable compression for command mode
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-4-6bc6f03ae735@quicinc.com>
 <hxqxnfcydzyfrlvihmil3gecan6p6xyjw44gielu63ltgtqul7@xwvoprzofq6g>
 <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
 <rg6nlm4knw4hgtnwtvr4a5wqusyvvsetygiwxscp6bs6pun7ii@wzz6rd2y3vcn>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <rg6nlm4knw4hgtnwtvr4a5wqusyvvsetygiwxscp6bs6pun7ii@wzz6rd2y3vcn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SQTdqx9OSGdl1hjOI6cM5gMnEWsM_S6P
X-Proofpoint-ORIG-GUID: SQTdqx9OSGdl1hjOI6cM5gMnEWsM_S6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_15,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030206
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 4:00 PM, Marijn Suijten wrote:
> Hi Jessica,
> 
> On 2023-05-03 12:04:59, Jessica Zhang wrote:
>>
>>
>> On 5/3/2023 12:28 AM, Marijn Suijten wrote:
>>> On 2023-05-02 18:19:15, Jessica Zhang wrote:
>>>> Add a dpu_hw_intf op to enable data compression.
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 2 ++
>>>>    3 files changed, 13 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> index 74470d068622..4321a1aba17f 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>
>>> Can we have INTF DCE on video-mode encoders as well?
>>
>> Hi Marijn,
>>
>> Currently, there's no way to validate DSC for video mode as I've only
>> made changes to support DSI for command mode. We are planning to post
>> changes to support DSC over DP, which will include changes for video mode.
> 
> Okay, but then mention so in the patch description (which is rather
> short in this revision).

Acked.

> 
> <snip>
> 
>>>>    #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>>>>    #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
>>>
>>> These should probably be reindented to match the below... And the rest
>>> of the defines use spaces instead of tabs.
>>
>> Fair point, though I think fixing the whitespace for these 2 macros
>> specifically might be better in a more relevant series.
> 
> Yes, I have many patches to start cleaning these up, as well as all the
> broken kerneldoc comments, but it's an uphill battle.  Not sure if I'll
> get to it any time soon if at all.
> 
>> With that being said, I'll change the spacing of the DATA_COMPRESS bit
>> to spaces instead of tabs.
> 
> Thanks, that seems to be the most common format.
> 
>>>> +#define INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
>>>>    
>>>>    #define INTF_MISR_CTRL			0x180
>>>>    #define INTF_MISR_SIGNATURE		0x184
>>>
>>> This does not seem to apply on top of:
>>> https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-10-27ce1a5ab5c6@somainline.org/
>>
>> Seems like I'm missing some patches from that series on my working
>> branch. Will rebase on top of the full series for the v2.
> 
> Thanks, but do discuss with Abhinav/Dmitry which series will land first.
> 
>>>> +static inline void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>>>
>>> Why inline?  This is used as a pointer callback.
>>
>> Acked, will remove the inline.
>>
>>>
>>>> +{
>>>> +	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, INTF_CFG2_DCE_DATA_COMPRESS);
>>>
>>> dpu_hw_intf_setup_timing_engine() also programs INTF_CONFIG2.  Is it
>>> double-buffered, or is that config **always** unused when DSI CMD mode
>>> is used in conjunction with DSC/DCE?  Otherwise this should perhaps OR
>>> the bitflag into the register, or write the whole thing at once in
>>> dpu_hw_intf_setup_timing_engine()?
>>
>> For command mode, INTF_CONFIG2 is unused aside from setting
>> DATA_COMPRESS for DSC.
>>
>> Since setup_timing_engine() is only used for video mode, the
>> corresponding changes will be made in the DSC v1.2 for DP changes.
> 
> Ack, that makes sense.  However, is this a guarantee that nothing else
> will write INTF_CONFIG2 in the future, or will we solve that problem
> when it happens?  I'm afraid more config-bits get added to this register
> in the future and might possibly race/overwrite each other.

That's a fair point. There's no guarantee that nothing else will set 
INTF_CONFIG2 for command mode in the future. I think it would be better 
to add a register read now instead of having to fix that issue in a 
future change.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
> <snip>
