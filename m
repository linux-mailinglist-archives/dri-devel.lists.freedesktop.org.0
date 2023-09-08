Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E418797FE1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 02:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C710E84A;
	Fri,  8 Sep 2023 00:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F120210E84A;
 Fri,  8 Sep 2023 00:53:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 387NgWGe012853; Fri, 8 Sep 2023 00:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=miy+Vlui4nRPR1lwAAkRUrZN9kJ3JvNv2FoULnJ3aoU=;
 b=doJNqSDPhNWYmT4X9Gl07p+vGnvnlZmi+z40DHh4pzinJiDoY+AEdBp/qDkLuTGBj+AB
 JyUE2VwZ8dd7LH1NCk6SJC2KxgtEBqf6KvZBwoYl0tsXo4gqUrwhxMJMpBSxDAAaRRB0
 HDWupsof+zvuxqHcQUHpycHXGbDO/QNXI1cSHLMIqLw9Dt86812pHXIiHVEWe+l/G78J
 nxu+fH0/2I9ura5IS/Ef/KvGNuEALd/OT5Loi9DTquXQQWlT7x9UMjlrkfcKCojqHptD
 GCg7FqWN+BD8WyqNNrJKTAl7SDgarUjKD/m6UHZ7NsOlblISRDQkf3liHq6FM9iQ0kdA LA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sy4bqjqvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 00:52:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3880qmgb001093
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Sep 2023 00:52:48 GMT
Received: from [10.71.110.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 7 Sep
 2023 17:52:45 -0700
Message-ID: <19aa1b04-e136-2e19-785d-a7856f4e8e41@quicinc.com>
Date: Thu, 7 Sep 2023 17:52:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to
 avoid overflow
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota
 <quic_kalyant@quicinc.com>
References: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
 <f110b0fa-f41f-47e8-a83b-30de2f2b128c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <f110b0fa-f41f-47e8-a83b-30de2f2b128c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hzN233f0AsRYMhUt-AJXe4NmPQVZ0UTr
X-Proofpoint-ORIG-GUID: hzN233f0AsRYMhUt-AJXe4NmPQVZ0UTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_14,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080006
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/2023 5:35 PM, Dmitry Baryshkov wrote:
> On 08/09/2023 03:32, Abhinav Kumar wrote:
>> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
>> used during plane bandwidth calculations. However for high resolution
>> displays this overflows easily and leads to below errors
> 
> Can we move the u64 conversion closer to the place where we actually 
> need it? Having u64 source width looks very strange.
> 

Its this math 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L139 
which overflows.

So its not just one variable but I can even change this to u32 as that 
also fixes the issue. Let me know if u32 works better.

Perhaps I went too far to go from int to u64.

>>
>> [dpu error]crtc83 failed performance check -7
>>
>> Promote the intermediate variables to u64 to avoid overflow.
>>
>> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling 
>> for display")
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index ae970af1154f..c6193131beec 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -118,7 +118,7 @@ static u64 _dpu_plane_calc_bw(const struct 
>> dpu_mdss_cfg *catalog,
>>       const struct drm_display_mode *mode,
>>       struct dpu_sw_pipe_cfg *pipe_cfg)
>>   {
>> -    int src_width, src_height, dst_height, fps;
>> +    u64 src_width, src_height, dst_height, fps;
>>       u64 plane_prefill_bw;
>>       u64 plane_bw;
>>       u32 hw_latency_lines;
> 
