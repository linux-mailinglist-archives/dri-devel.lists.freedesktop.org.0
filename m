Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FC6F5D15
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0550710E066;
	Wed,  3 May 2023 17:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA5010E066;
 Wed,  3 May 2023 17:34:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343GcDSb010737; Wed, 3 May 2023 17:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2SLyxb/oLFHe3Ff3BXtyoEm91MUW65yTTYRI3lRrWgE=;
 b=g34fVGZKG76Pp+sTgeZOTleEZXZjGS1NVsJf88NDukLEGQLUYpt5McGdsgJ+0XwTA13o
 yIToF6PsZSn1yGcyLa+9KCzsCY2D22Y54p6M7XXQC1FXeZ6rrmXXqU/6jvTA/m+QOmSP
 pYkarNV1HHvt0R/LdPLVJCmd4grSpOk3Uot0ZhyKenJ75eSBRxjn6/7dQjCLRJEMyEKP
 hUYv4IjDrD7h53FSR+NDCs7MZM/qtE1661UHzdRlmN8Lfj+uEz23aTsHc4mZv7zXpbji
 wquozkywd2mKLWXTdQ13D1LXgCD32/DzLwD05VuI16vuvO4IZ0E9BsFjWv76pHYlQxXK 7w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbjwn9b7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 17:34:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343HYhNc024246
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 17:34:43 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 10:34:43 -0700
Message-ID: <ff496926-98e3-98b4-e81c-594f4d67d123@quicinc.com>
Date: Wed, 3 May 2023 10:34:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hiUM3e70zqOygWXzuqNVxh0fZHx9FlJg
X-Proofpoint-ORIG-GUID: hiUM3e70zqOygWXzuqNVxh0fZHx9FlJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_12,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030150
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

Hi Dmitry,

IIRC slice per packet is given by the panel specs with the default value 
being 1 if no value is specified, so it might be better to have it as 
part of mipi_dsi_device.

Will update the TODO comment accordingly.

Thanks,

Jessica Zhang

> 
>> +             */
>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>
> 
> -- 
> With best wishes
> Dmitry
> 
