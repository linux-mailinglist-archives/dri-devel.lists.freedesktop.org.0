Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A3A1AD40
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 00:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9739510E8AF;
	Thu, 23 Jan 2025 23:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EXDiT3qr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B788810E067;
 Thu, 23 Jan 2025 23:32:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA2ggE015590;
 Thu, 23 Jan 2025 23:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gAmS855LrkGOm9XtI3d28B1eaHK1GbvAhqUj6An45Gc=; b=EXDiT3qrKb9kNgq/
 jjkbDDgU2GJzjhpAEuwZ+HBImWznECZh/KrS3GTN86ToyRH7+melJHSOjTs+/kXm
 4n7nd3eU351jt7LO2eztdJNv++R0A7a8sQvrV8Q/xVsav/8FZFs8yy16fD7xJPXH
 NS4jKTh0FCF8wZrc+ZEiB/zYWcKSuC9iDkrZNgd6xr2uAE92xWZbo63oXQa4xRtk
 ePHNy1c6WINSClIOzfZ6qyG4ZeAq95q5wM/mfmUzZyLKZRSjRRyW/dMteO209jDE
 kAgjvWkJg1uuXytS4Qu43o8bo5WAjISh699nfLpY6454pRzqDWH5iRHPikKdaF/9
 dfbvyQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bknxhpp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 23:32:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NNW13U029551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 23:32:01 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 15:32:00 -0800
Message-ID: <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
Date: Thu, 23 Jan 2025 15:31:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oNg8E-sskgv7ZgF2ygEkIMhwP22U57Xk
X-Proofpoint-GUID: oNg8E-sskgv7ZgF2ygEkIMhwP22U57Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_10,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230170
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



On 1/17/2025 8:00 AM, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.

Hi Jun,

Please add me to the CC list of all future patchsets/revisions.

Thanks,

Jessica Zhang

> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
> 
> To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> are needed:
> https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads
> 
> Changes in v5:
> - Iterate SSPP flushing within the required mixer pair, instead of all
>    active mixers or specific mixer.
> - Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
>    interfaces case.
> - Polish commit messages and code comments.
> - Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org
> 
> Changes in v4:
> - Restrict SSPP flushing to the required mixer, instead of all active mixers.
> - Polish commit messages and code comments.
> - Rebase to latest msm/drm-next branch.
> - Move pipe checking patch to the top of patch set.
> - Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org
> 
> Changes in v3:
> - Split change in trace into a separate patch.
> - Rebase to latest msm-next branch.
> - Reorder patch sequence to make sure valid flag is set in earlier patch
> - Rectify rewrite patch to move logic change into other patch
> - Polish commit messages and code comments.
> - Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org
> 
> Changes in v2:
> - Revise the patch sequence with changing to 2 pipes topology first. Then
>    prepare for quad-pipe setup, then enable quad-pipe at last.
> - Split DSI patches into other patch set.
> - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jun Nie (15):
>        drm/msm/dpu: check every pipe per capability
>        drm/msm/dpu: Do not fix number of DSC
>        drm/msm/dpu: configure DSC per number in use
>        drm/msm/dpu: polish log for resource allocation
>        drm/msm/dpu: decide right side per last bit
>        drm/msm/dpu: fix mixer number counter on allocation
>        drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>        drm/msm/dpu: bind correct pingpong for quad pipe
>        drm/msm/dpu: Add pipe as trace argument
>        drm/msm/dpu: handle pipes as array
>        drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
>        drm/msm/dpu: blend pipes per mixer pairs config
>        drm/msm/dpu: support SSPP assignment for quad-pipe case
>        drm/msm/dpu: support plane splitting in quad-pipe case
>        drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  75 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 404 ++++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
>   12 files changed, 517 insertions(+), 345 deletions(-)
> ---
> base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
> change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81
> 
> Best regards,
> -- 
> Jun Nie <jun.nie@linaro.org>
> 

