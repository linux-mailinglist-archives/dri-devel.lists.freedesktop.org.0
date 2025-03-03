Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7DA4CB2A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB210E3F9;
	Mon,  3 Mar 2025 18:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kDamohvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFE310E3C9;
 Mon,  3 Mar 2025 18:45:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523A9uTL031419;
 Mon, 3 Mar 2025 18:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0M8tyQHt6d6xbwUpal9/euLBYrHVQcsnzzfrOgUrMxQ=; b=kDamohvUN6Neui0c
 aEM6wgz266PC2pyTL+Em5tvUV4N1E+qRbXf3Oe4QEsCK9L5N7MJK77wvvJPiTd7x
 eRaMReS28S7Epv1A5lpgBX9wiRBthpcBeMID2ishivikJb5OrZLSOahMLi2Fhn2p
 0a25iUSzkFgrTGPOw+ALVWOw4Ki6z4EXs5HQXtyDpOgx18XJBU+zRx4pmgAeG3OQ
 7zr9/Q17P37BK7MW5IJK/i8f7B+3S4UglSJLAL4HRFD4cRSNbs0Rgsr2abS3YCzX
 UUrw2dDElW5/HwWs1vTmiX5UrHAIPSfXMZVEOIEKxVUPlI6YiJbtkWF4IY7TMKUn
 Op2PwA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh75j68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 18:45:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523IjKAQ032645
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Mar 2025 18:45:20 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 10:45:19 -0800
Message-ID: <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>
Date: Mon, 3 Mar 2025 10:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
 <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZtIcWKUeqjG7ejNoY5izMPVQai8eaOuE
X-Proofpoint-ORIG-GUID: ZtIcWKUeqjG7ejNoY5izMPVQai8eaOuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_09,2025-03-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030143
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



On 2/27/2025 7:07 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Up to now the driver has been using encoder to allocate hardware
>> resources. Switch it to use CRTC id in preparation for the next step.
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> Changes in v6:
>> - Drop duplicate cstate initialization code and unnecessary memset
>> Changes in v5:
>> - Reordered to prevent breaking CI and upon partial application
>>
>> Changes in v4 (due to rebase):
>> - moved *_get_assigned_resources() changes for DSPP and LM from
>>    encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>>   5 files changed, 110 insertions(+), 126 deletions(-)
> 
> This commit breaks several tests in CI:
> - sc7180-trogdor-kingoftown:
>    - kms_cursor_crc@cursor-dpms
>    - kms_pipe_crc_basic@disable-crc-after-crtc
> - sc7180-trogdor-lazor-limozeen
>    - kms_cursor_crc@cursor-dpms
>    - kms_pipe_crc_basic@disable-crc-after-crtc

Hey Dmitry,

Thanks for catching this. Looks like this was exposed due to a recent 
IGT uprev that included  dc2d7fb4f978 ("lib/igt_kms: move setting 
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback").

The issue itself is that when DPMS is toggled, it is possible for RM to 
reserve new HW resources but skip the atomic_enable() due to the checks 
here [1]. This means that the change in HW block reservation won't be 
propagated to encoder if DPMS is set to off.

I've posted a fix for this here [2].

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1502
[2] https://patchwork.freedesktop.org/series/145735/

> 
> Corresponding pipeline is available at [1]
> 
> As I had to rebase your changes on top of msm-next, corresponding tree
> is available at [2]. It might be possible that the regression is
> introduced by my rebase.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165
> 
> [2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb
> 
> -- 
> With best wishes
> Dmitry

