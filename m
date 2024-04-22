Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A188AD19B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3A10F6EB;
	Mon, 22 Apr 2024 16:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EkdefmYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FA4112C45;
 Mon, 22 Apr 2024 16:12:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M8mKK3000381;
 Mon, 22 Apr 2024 16:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=sCyLpknTZwvWXYoyKMfM/GI5z3ThcbGqTFkPKhPm5us=; b=Ek
 defmYeeppshj66AFg3XqOQORVJDDHxCQrzCtg2X0eaU7JMlWRHgYf7Ro44HOMKuQ
 miMmQ02Aw1eOsxVUIAg9cKmnV3fhDP+xksRN6oX1llCtKWIeayjmmFklawfWo+4M
 SXh30pEfKOeenhNtaYY7r1IB7NrZ1ypq1G8IZsYnqugxNChCVTTo3cMAn+EGp9QG
 wK+kC13cP3gfGtpBRiuuixu6P5C/tfJbIqsWzq7X7Gg0B3km7UKAUwFWmoQOiAIg
 zNBMeIxPWwp0oJl/MXJNgUYN9Ok3thuAHdOi5D/2zM2rTdPb3o7mSkjLpHnIapdC
 XijGzpCOZaJAyefPELoQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4qdd18v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 16:12:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MGCL0V031372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 16:12:21 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 09:12:21 -0700
Message-ID: <456bb6f6-03cc-aae1-b7d5-9d97300ba383@quicinc.com>
Date: Mon, 22 Apr 2024 09:12:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
 <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2Y9GD3Dd-GNRSN9jpGiRQi3o-1st-3iv
X-Proofpoint-ORIG-GUID: 2Y9GD3Dd-GNRSN9jpGiRQi3o-1st-3iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=601 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220068
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



On 4/21/2024 3:35 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
>>> MSM display drivers provide kms structure allocated during probe().
>>> Don't clean up priv->kms field in case of an error. Otherwise probe
>>> functions might fail after KMS probe deferral.
>>>
>>
>> So just to understand this more, this will happen when master component
>> probe (dpu) succeeded but other sub-component probe (dsi) deferred?
>>
>> Because if master component probe itself deferred it will allocate priv->kms
>> again isnt it and we will not even hit here.
> 
> Master probing succeeds (so priv->kms is set), then kms_init fails at
> runtime, during binding of the master device. This results in probe
> deferral from the last component's component_add() function and reprobe
> attempt when possible (once the next device is added or probed). However
> as priv->kms is NULL, probe crashes.
> 

Got it, a better commit text would have helped here. Either way,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
