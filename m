Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EEE8928B4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 02:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7601910E4CE;
	Sat, 30 Mar 2024 01:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Rwil++6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7550310E4CE;
 Sat, 30 Mar 2024 01:15:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42U0rAgA011883; Sat, 30 Mar 2024 01:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=RkVNn6MDg6Dgg+fumtXYcl+5uglNdoTu5XTC7Jr4eNA=; b=Rw
 il++6YvRecVGmHAJw0YsXroC+VWuS1mxySbs956gNUuAVGBdFbClNC12xhnDaN/m
 gM+U2c/b/Zm4ZFHMQWSy6aAAQwjVmWwxdfbEcIxyve5aAX8L+0sfdJ2U13CYEpAf
 Lqe0MwK2BWjy+iaW7S3aGARlAsUCRG1H0mIKR4lnjtJyGaPhuPCm/XROEbW4Nr6w
 hT2sXpNKtUl48bfrAue9x70HwxxbaXMo4t9gUEQIfcyxArXwMnvEfubTfYv0lxr9
 aS4Klq3tZg12RxjuGFcChFRnqza29l2MpgwtJ/yhm9/1mHSvis38CJvUS66unGDn
 5yGtLctYgJGlPMkei1+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5sm6j91t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Mar 2024 01:15:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42U1FR8v014057
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Mar 2024 01:15:27 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 18:15:24 -0700
Message-ID: <8b3108e1-2cb4-4531-576e-0b9791caa71d@quicinc.com>
Date: Fri, 29 Mar 2024 18:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
 <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kRcQd22DnptL-pbhL2zQzUwtYLo1eqEl
X-Proofpoint-GUID: kRcQd22DnptL-pbhL2zQzUwtYLo1eqEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=835 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403300007
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

Hi Doug

On 3/29/2024 4:07 PM, Doug Anderson wrote:
> Hi,
> 
> On Sat, Feb 3, 2024 at 5:47 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
>> pre-emphasis to 2, while the real maximum value for the sum of the
>> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
>> limitation.
>>
>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
>>   drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
>>   drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
>>   3 files changed, 15 insertions(+), 27 deletions(-)
> 
> What ever happened with this patch? It seemed important so I've been
> trying to check back on it, but it seems to still be in limbo. I was
> assuming that (maybe?) Abhinav would check things against the hardware
> documentation and give it a Reviewed-by and then it would land...
> 
> -Doug

The issue for which this patch was originally made (DP link training 
issue on x1e80100) was not getting fixed by this patch.

That one turned out as actually a PLL locking issue. So this kind of 
went off the radar as it was not immediately needed to fix anything.

I will wait for Kuogee's response on this patch. He was OOO entire Feb 
so this got missed.
