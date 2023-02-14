Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83869551A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 01:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD5F10E081;
	Tue, 14 Feb 2023 00:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D0510E07F;
 Tue, 14 Feb 2023 00:01:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DIdBfL021357; Tue, 14 Feb 2023 00:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QKwbJ7VWZK3mWprsj/l0zdBzaCT82PR2iA6kh0gyZCc=;
 b=a50HmrJYxqP8EdD/KhvB5OFMqnQmwimStXxKqr6QCku+kYYa3bna3WAAjf87DPJvO46D
 6/kNj1PxU9/BbbAw1fYW6hy3hFXR/EOfmRrBZT2dtKULvaWAFaVsB3gfEjq3J/xKjCCT
 537lOU3X+aazv19mfKkvVM/NsQpt2CnckrySGZc4jT1Gm40AEi8mIySjrgoSrNL7ribe
 cvw7kI2c5zZQKKYraGjbdI7XfmypKdzkOnk12UrOUmpf7msOFy/KsLGJGTVOe4nrgwtw
 FqA2dMC6fyz1qHn+NssRipRoGcVkQ21vz1HMmGM+dALhIogUMzMCaibsuq4KDSI8iifX sA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqpmmh6j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 00:01:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31E01C2Q017781
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 00:01:12 GMT
Received: from [10.110.55.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 16:01:11 -0800
Message-ID: <4c23d2d5-fa6b-7548-d189-5b7a1913e266@quicinc.com>
Date: Mon, 13 Feb 2023 16:01:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, <freedreno@lists.freedesktop.org>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kmy6HNeYSBcpv1Qt23c4ZIKeRFak6OYH
X-Proofpoint-GUID: kmy6HNeYSBcpv1Qt23c4ZIKeRFak6OYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130210
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/13/2023 1:51 PM, Dmitry Baryshkov wrote:
> On 13/02/2023 21:48, Jessica Zhang wrote:
>> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
>> functions in both MDP4 and DPU drivers.
>>
>> Changes in V2:
>> - Added changes to remove empty prepare_commit() functions
>>
>> Changes in V3:
>> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>>    clarity
>> - Fixed spelling mistakes and wording issues
>> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> Is it just me or patch 4/4 is missing? Patchwork also hasn't seen it:
> https://patchwork.freedesktop.org/series/113967/
> 

Yes, not sure what happened there. Even i couldnt see it.

We have posted in-reply-to now.

> If you can send it with the proper in-reply-to (set to 
> 20230213194819.608-1-quic_jesszhan@quicinc.com), that would be great.
> 
>>
>> Jessica Zhang (4):
>>    drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>>    drm/msm: Check for NULL before calling prepare_commit()
>>    drm/msm/dpu: Remove empty prepare_commit() function
>>    drm/msm/mdp4: Remove empty prepare_commit() function
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
>>   drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
>>   6 files changed, 9 insertions(+), 56 deletions(-)
>>
> 
