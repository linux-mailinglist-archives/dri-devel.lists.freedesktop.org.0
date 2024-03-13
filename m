Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529C87B23E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CAD10F31C;
	Wed, 13 Mar 2024 19:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VNsDTHp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC54E10EAA0;
 Wed, 13 Mar 2024 19:48:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42DHdPQG010102; Wed, 13 Mar 2024 19:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=RGf8peWt1AvjGPipDI/Mu/ebD5lqVh9ZW7Mee2vSjoA=; b=VN
 sDTHp4vGNL95AaUIN/xBBpCXoxpKhB5ATRbeOvig4gwr6aJ6TvV97fOATqnLTqQK
 H41Mfv2gc/q1F0dhnHWc8pP8c85s7fxxZWvgJBEw7TLG17t3RSKcq93p3LOztNzr
 aNme9tTghs4blP1vEzJmlrJ+SdtDLpS2z/g8132ak5HUmkOWZ9TIBhq5VXPvryKU
 2+N6gY69yCbwdAldZnmqA4+Kygp2nIQHc0ape7AIB+PArZPQB1bnfwJOplDWhf61
 CmN2X6DmKMb4JXNtOjxKkGSZXnBEvKCPTGOX/wUc1Y/xJ4VAAD/JFW4C+tx8/qKW
 FtIsz6xjil7ibD4uC6dA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wugq18cg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 19:48:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DJmfn8003723
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 19:48:41 GMT
Received: from [10.110.70.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 12:48:38 -0700
Message-ID: <2a452b11-0ea7-9271-ea9a-8bdac9df4a2f@quicinc.com>
Date: Wed, 13 Mar 2024 12:48:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dp: fix runtime PM leak on disconnect
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20240313164306.23133-1-johan+linaro@kernel.org>
 <20240313164306.23133-2-johan+linaro@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240313164306.23133-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wLQqDLCOpunuZVCVmE0vQ-WNvii88olm
X-Proofpoint-GUID: wLQqDLCOpunuZVCVmE0vQ-WNvii88olm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130152
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



On 3/13/2024 9:43 AM, Johan Hovold wrote:
> Make sure to put the runtime PM usage count (and suspend) also when
> receiving a disconnect event while in the ST_MAINLINK_READY state.
> 
> This specifically avoids leaking a runtime PM usage count on every
> disconnect with display servers that do not automatically enable
> external displays when receiving a hotplug notification.
> 

Thanks for the fixes. Both look right to me.

I will pick up both of them for -fixes

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Cc: stable@vger.kernel.org      # 6.8
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4c72124ffb5d..8e8cf531da45 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -655,6 +655,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>   		dp_display_host_phy_exit(dp);
>   		dp->hpd_state = ST_DISCONNECTED;
>   		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
> +		pm_runtime_put_sync(&pdev->dev);
>   		mutex_unlock(&dp->event_mutex);
>   		return 0;
>   	}
