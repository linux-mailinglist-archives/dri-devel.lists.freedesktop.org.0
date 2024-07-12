Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E292FFA6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480A210ED74;
	Fri, 12 Jul 2024 17:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gxz6ANKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790A10ED6F;
 Fri, 12 Jul 2024 17:20:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CApDfv027173;
 Fri, 12 Jul 2024 17:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mj0We3FIkDAV3//rHgKZjs9kgJpwKU1fbyeqjxjXhmk=; b=gxz6ANKUxL/VhwQR
 47bXiFZF+p7WB4OcbOPHZX8CzwRKXru0DdYrmR6C0NLhms2mPYIMEGpRJG/WyhGK
 iibWWfy36G6f4l5acpHGI6TzsgiX1iswFqAVrIrELzT3C+5s7GZKF8CdaOpoHlCh
 UgMd56jC3K/2t793gHOoWuMKYQtsLWdCi1Xp44ZyS3FfLFU5sEt5gz96YO9cIYMg
 KfmbYwX05BZbeAislqWa2txMevpzADu0Emtqe2dfkbyqzA95T9mx96f0kfvs2YmZ
 ezqTKPuTTkU0i4UsCYuIDu534o0NiO8G49hUtgwHeq+knxiuRj3jy9lhJMNlYdPS
 dDUSZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ar3fjc5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 17:20:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46CHK3t0007219
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 17:20:03 GMT
Received: from [10.110.71.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 10:20:02 -0700
Message-ID: <37ca13e0-1fac-4e5c-8e97-8ab5a67ec876@quicinc.com>
Date: Fri, 12 Jul 2024 10:19:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] drm/msm/dpu: cleanup FB if
 dpu_format_populate_layout fails
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-1-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-1-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CBOea9aFWftTzBdSf0-6FaAeE-X_ArPu
X-Proofpoint-ORIG-GUID: CBOea9aFWftTzBdSf0-6FaAeE-X_ArPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120117
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



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> If the dpu_format_populate_layout() fails, then FB is prepared, but not
> cleaned up. This ends up leaking the pin_count on the GEM object and
> causes a splat during DRM file closure:
> 
> msm_obj->pin_count
> WARNING: CPU: 2 PID: 569 at drivers/gpu/drm/msm/msm_gem.c:121 update_lru_locked+0xc4/0xcc
> [...]
> Call trace:
>   update_lru_locked+0xc4/0xcc
>   put_pages+0xac/0x100
>   msm_gem_free_object+0x138/0x180
>   drm_gem_object_free+0x1c/0x30
>   drm_gem_object_handle_put_unlocked+0x108/0x10c
>   drm_gem_object_release_handle+0x58/0x70
>   idr_for_each+0x68/0xec
>   drm_gem_release+0x28/0x40
>   drm_file_free+0x174/0x234
>   drm_release+0xb0/0x160
>   __fput+0xc0/0x2c8
>   __fput_sync+0x50/0x5c
>   __arm64_sys_close+0x38/0x7c
>   invoke_syscall+0x48/0x118
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x4c/0x120
>   el0t_64_sync_handler+0x100/0x12c
>   el0t_64_sync+0x190/0x194
> irq event stamp: 129818
> hardirqs last  enabled at (129817): [<ffffa5f6d953fcc0>] console_unlock+0x118/0x124
> hardirqs last disabled at (129818): [<ffffa5f6da7dcf04>] el1_dbg+0x24/0x8c
> softirqs last  enabled at (129808): [<ffffa5f6d94afc18>] handle_softirqs+0x4c8/0x4e8
> softirqs last disabled at (129785): [<ffffa5f6d94105e4>] __do_softirq+0x14/0x20
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
>   1 file changed, 3 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
