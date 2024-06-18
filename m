Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B090DF6E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 00:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEA810E7F3;
	Tue, 18 Jun 2024 22:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cUNtJLET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7B810E7F3;
 Tue, 18 Jun 2024 22:53:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILfQPI028119;
 Tue, 18 Jun 2024 22:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ow/7AiCtl/ipw7BpaoHge7POu2Z+ZmdTfR/Ltauh0TE=; b=cUNtJLETF11Qk3Wk
 C7zcHibxmod0YrZUiPEWyrkpY+RGlE2tH+CHAu8DDGhJIE/0dPQtP8Cb48HuVRrl
 o8OMwavOaw1g2adbV1PpNmjKdC6SVFeO0w5ZwgNNy+/fcPmJ6P2XZkaQ0FguzKaE
 +On2XY2Dyw9+oBNj2GD2A6lhBn6CWO775QTqI9+Jc99+Vrml/0KDEADQkwTI4xq5
 z614ZqUufu1w8aBLqrpD+YVXZE689U7wYae++Aj19qc6MJfobIZ9TA1EwVCziytU
 +zinX2hhHY/XpTbqskNPR/R16l9rh6aVxZ2ZM0EUW8Yu8cfrVpLl5hZk2In07rcU
 qkfwuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4g3nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 22:52:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45IMqsIY028292
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 22:52:54 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:52:53 -0700
Message-ID: <f6263147-092e-039c-8b7e-99c23370c0bc@quicinc.com>
Date: Tue, 18 Jun 2024 15:52:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: move dpu_format_populate_plane_sizes
 to atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-5-29ec4069c99b@linaro.org>
 <df63b33c-2e5d-1e30-5b6f-8af3d2bd2c6e@quicinc.com>
 <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <gcwsfv7ieedz246a54fjyjgn2skkro6dsohdgf5psyz3aebro3@7yqnc2kqrwyc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yR1T4mcMWRRzgzlrrNtQWIXZafmNOrRm
X-Proofpoint-GUID: yR1T4mcMWRRzgzlrrNtQWIXZafmNOrRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=876 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180168
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



On 6/14/2024 3:34 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 13, 2024 at 04:19:07PM GMT, Abhinav Kumar wrote:
>>
>>
>> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
>>> Move a call to dpu_format_populate_plane_sizes() to the atomic_check
>>> step, so that any issues with the FB layout can be reported as early as
>>> possible.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>
>> Did anything change between v2 to v3 that R-b was dropped?
> 
> No, it was my failure to run b4 trailers, please excuse me.
> 

no problem.

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

>>
>> Here it is again,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
