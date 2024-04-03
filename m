Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A8897AAC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 23:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1294B112F29;
	Wed,  3 Apr 2024 21:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fapoMB1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E29112F27;
 Wed,  3 Apr 2024 21:29:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 433L1kqx019834; Wed, 3 Apr 2024 21:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8YfwFoz0sGdQELg09UoYnuG30bJT4f0o798002yH/Kw=; b=fa
 poMB1Rd5bX92n0ACWmUTLDa6papSTvg9pN9kWXnb3T9QJhZy/g7MIRx5/I6/ho1W
 2serEXvhHhzCc8UtU9iMGS3wA5kasiEEbqS4gg0MZnvhmc1z8Z+KIb+q1ulnKjnF
 WoxS46jm7Xh2IuqD7pajDOcKnFfD3TFR56QEq3URpAedJ+SbFXwFkp+SbTIE/KAP
 nNiYRwzfEAGdQObriGBuMAzMT7GJorXvpL4o83yQmGDAxH3xJK0JDUGRO8d9jP2P
 MFRfpjBJs9aU/XXz1XwwR1BQu7YCpdJwCMYkblGWrvLlQuH3sIYkTZdOpoTqkzFo
 P77gsHSL4vUYtD9aSgEg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x9en001g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Apr 2024 21:29:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433LSsBo005071
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Apr 2024 21:28:54 GMT
Received: from [10.110.9.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 14:28:53 -0700
Message-ID: <01ce1142-04ac-5978-9d5a-88f94b920055@quicinc.com>
Date: Wed, 3 Apr 2024 14:28:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <abel.vesa@linaro.org>,
 <agross@kernel.org>, <airlied@gmail.com>, <andersson@kernel.org>,
 <daniel@ffwll.ch>, <dianders@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
CC: <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
 <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
 <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hYB4IBbHmXEffncdCxv4QEuapA4X3qr3
X-Proofpoint-ORIG-GUID: hYB4IBbHmXEffncdCxv4QEuapA4X3qr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_22,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404030147
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



On 4/3/2024 1:04 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-04-03 12:58:50)
>>
>>
>> On 4/3/2024 12:51 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2024-03-29 12:50:35)
>>>> Currently qmp_combo_dp_power_on() always return 0 in regardless of
>>>> return value of cfg->configure_dp_phy(). This patch propagate
>>>> return value of cfg->configure_dp_phy() all the way back to caller.
>>>
>>> Is this found via code inspection or because the phy is failing to power
>>> on sometimes? I ask because I'm looking at a DP bug on Trogdor with
>>> chromeos' v6.6 based kernel and wondering if this is related.
>>>
>>
>> No, we actually hit an issue. This issue was originally reported as a
>> link training issue while bringing up DP on x1e80100.
>>
>> While debugging that we noticed that we should not have even proceeded
>> to link training because the PLL was not getting locked and it was
>> failing silently since there are no other error prints (and hence the
>> second part of the patch to improve the error logs), and we do not
>> return any error code from this driver, we could not catch the PLL
>> unlocked issue.
> 
> Did link training succeed in that case and the screen was black? Also,
> did you figure out why the PLL failed to lock? I sometimes see reports
> now with an "Unexpected interrupt:" message from the DP driver and the
> interrupt is the PLL unlocked one (DP_INTR_PLL_UNLOCKED).
> 

No the link training had failed.

Yes, root-cause was that the PLL registers were misconfigured in the 
x1e80100 DP PHY for HBR2. Once we programmed the correct values it 
worked. This was specific to x1e80100.

Yes, Doug mentioned this to me on IRC that this issue is still there. 
Surprising because I thought we had pushed 
https://patchwork.freedesktop.org/patch/551847/ long ago and it was 
fixed. It certainly did that time when I had tested this.

>>
>>> Also, is the call to phy_power_on() going to be checked in
>>> the DP driver?
>>>
>>>    $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);
>>
>> Yes, this is a good point. We should also post the patch to add the
>> error checking in DP driver to fail if phy_power_on fails.
> 
> Sounds great, thanks.
