Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843C6FB81B
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 22:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0110E2EE;
	Mon,  8 May 2023 20:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A869F10E157;
 Mon,  8 May 2023 20:09:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348K0gvD012110; Mon, 8 May 2023 20:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OyQwalDuN7oms2wh9UPlAaOgEOsDWZhEq1MkLJ1lJmQ=;
 b=VRypG7pm5CuM/9h0ZXNK6hG6/lzOc89ata1C+BOmyHz9/f+S8HYmerp0lL09Fn5nGPc4
 +jk9ZTSLCaXOvFNlNUJkBVxI3lWGcpH3sUiaUua1HvSOtP/Is+i/TVB/EqtblVVms/k1
 g1s1xOIqKGAGxiZQj4sC0mhmLuc6IEPJrdnUgheZe3K7Ts3nrB7mRXR/K+o9kdb6s6C0
 5ixIuWTiWi+eyFWIXo1nG+e8D9LFvB0sjvQAb8mObpuKqDnAtZj+otWdUp9oKzrkxUO5
 7eDNQJcmFweBuGsc7doQVX0pdpgMnbBOMbDWpSOIBx/YCCaCttRAzsPFJkGB6P0lcq2e WQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf788825q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 20:09:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 348K9W27004089
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 May 2023 20:09:32 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 8 May 2023
 13:09:31 -0700
Message-ID: <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
Date: Mon, 8 May 2023 13:09:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mc4XdW5uDk3a_lsbAnNj4YSbd8sELcV6
X-Proofpoint-GUID: mc4XdW5uDk3a_lsbAnNj4YSbd8sELcV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305080134
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
> On 03/05/2023 04:19, Jessica Zhang wrote:
>> Currently, word count is calculated using slice_count. This is incorrect
>> as downstream uses slice per packet, which is different from
>> slice_count.
>>
>> Slice count represents the number of soft slices per interface, and its
>> value will not always match that of slice per packet. For example, it is
>> possible to have cases where there are multiple soft slices per interface
>> but the panel specifies only one slice per packet.
>>
>> Thus, use the default value of one slice per packet and remove 
>> slice_count
>> from the word count calculation.
>>
>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>> compute word count")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 35c69dbe5f6f..b0d448ffb078 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>           if (!msm_host->dsc)
>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>           else
>> -            wc = msm_host->dsc->slice_chunk_size * 
>> msm_host->dsc->slice_count + 1;
>> +            /*
>> +             * When DSC is enabled, WC = slice_chunk_size * 
>> slice_per_packet + 1.
>> +             * Currently, the driver only supports default value of 
>> slice_per_packet = 1
>> +             *
>> +             * TODO: Expand drm_panel struct to hold slice_per_packet 
>> info
>> +             *       and adjust DSC math to account for 
>> slice_per_packet.
> 
> slice_per_packet is not a part of the standard DSC, so I'm not sure how 
> that can be implemented. And definitely we should not care about the 
> drm_panel here. It should be either a part of drm_dsc_config, or 
> mipi_dsi_device.
>

This is not correct.

It is part of the DSI standard (not DSC standard). Please refer to 
Figure 40 "One Line Containing One Packet with Data from One or More 
Compressed Slices" and Figure 41 "One Line Containing More than One 
Compressed Pixel Stream Packet".

This has details about this. So I still stand by my point that this 
should be in the drm_panel.

>> +             */
>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>
> 
