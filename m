Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751DD84EC64
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 00:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3730510EF38;
	Thu,  8 Feb 2024 23:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hgZ0GNT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A6710EF38;
 Thu,  8 Feb 2024 23:15:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418KFeVo031468; Thu, 8 Feb 2024 23:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ZZhWk+wZgNDiau32NBFz8xDbbuelQTbojXmG3eXWRTA=; b=hg
 Z0GNT+akkxmxwfL0LuwN96SgOczNdUfGsVxf0WyAVBFAiffJ20cEGM8Gv1aK5wkU
 5KBDay2LYnZQyzBDO5jaI1zWJbgAFzH+362kOSkgx4tq2gGRUVNsy9ki/WJHs1Bu
 1C0GeyPO47fZsWg5OYbQ0Pr8+5+DtWUExh7A8psp9y5vPr2CUpy9QBhA8kp9a19o
 aaLCG84gi+uzDHKcv5Rx4xAP2ygws/vu8JVZi/7NbPugKIYS9LOInqG/51WsugJ8
 8z+QoDz33CvEJVNo95ev1N97Hs+4dhdS6Xzkalm+/0Ae1BTLFky6+g50FGtpwdKX
 FA4tTfAKKe3ZUcOG/bMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4frwujvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Feb 2024 23:15:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418NF48I006559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Feb 2024 23:15:04 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 15:15:04 -0800
Message-ID: <c10d0960-c124-5f87-c540-024b97e615e0@quicinc.com>
Date: Thu, 8 Feb 2024 15:15:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: move writeback's atomic_check to
 dpu_writeback.c
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-4-caf5dcd125c0@linaro.org>
 <0c6a313b-c897-576d-ad74-8a5822622eab@quicinc.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <0c6a313b-c897-576d-ad74-8a5822622eab@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MyNjugvMFvBHoTgTM9KOnNYESZ9XHE2H
X-Proofpoint-GUID: MyNjugvMFvBHoTgTM9KOnNYESZ9XHE2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_11,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402080131
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


On 2/8/2024 10:49 AM, Abhinav Kumar wrote:
>
>
> On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
>> dpu_encoder_phys_wb is the only user of encoder's atomic_check callback.
>> Move corresponding checks to drm_writeback_connector's implementation
>> and drop the dpu_encoder_phys_wb_atomic_check() function.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 54 
>> -------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  9 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 61 
>> +++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  3 +-
>>   4 files changed, 68 insertions(+), 59 deletions(-)
>>
>
> <Snip>
>
>> +
>> +    crtc = conn_state->crtc;
>> +    if (!crtc)
>> +        return 0;
>> +
>
> This should fix the crash and rest of the change LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Paloma Arellano <quic_parellan@quicinc.com>
>
>
> Please give us a couple of days to re-test this and give our Tested-by 
> as we plan to rebase CDM over DP on top of this and post V2.
