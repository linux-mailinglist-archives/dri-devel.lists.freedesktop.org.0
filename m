Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC9A469E3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739110E9A8;
	Wed, 26 Feb 2025 18:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fIblk4NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB9910E9A8;
 Wed, 26 Feb 2025 18:36:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QACbh9017602;
 Wed, 26 Feb 2025 18:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 15W1y3P4DrOFNj99P2Uho9amWPmNpGqqq17R4/J0xDU=; b=fIblk4NIc51f/gzr
 iTvZdk3SWtgyhS41bj5/f+av7c79uqX/o+QNt27ZkCTfwVve9rQKp3fatDZ8bqn4
 i7dIbyFRumkg3e2NYE1ZsJ/2PEJD7BuCaeYj+1n7Zp157MK5EsKoBVZFK0u+EUu7
 3D2P+kQTwZxTS4YaqNLwOLuqSkoLKuZlsiVfyRBD2WCJoy79kWxXyUnNhZjQ8uQe
 JprQHTQ6H1aDn7CKa37mxSY0jwzuDPmuU3LkyOo+OI1MH6KKVG2qnlbujRJI4jIt
 qNEAqinYi9+F6yDDiaQRJjfdSWE5uvMYgRlRvL2YrEnCOv40OO2xTfVtZ023wquh
 vqZ8iw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn2ykk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 18:35:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QIZbI3022564
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 18:35:37 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 10:35:36 -0800
Message-ID: <f9cbfa96-19c9-4187-a6fb-338296128c11@quicinc.com>
Date: Wed, 26 Feb 2025 10:35:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: don't set crtc_state->mode_changed
 from atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Chandan Uddaraju
 <chandanu@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 "Jordan Crouse" <jordan@cosmicpenguin.net>, Sravanthi Kollukuduru
 <skolluku@codeaurora.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Archit
 Taneja" <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, "Simona Vetter" <simona.vetter@ffwll.ch>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
 <20250123-drm-dirty-modeset-v2-4-bbfd3a6cd1a4@linaro.org>
 <vn3f6jzx27twq7maamdmeqahvn4zzoxmdttkm7epg2qgn4ueov@hqzjzzzw3mog>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <vn3f6jzx27twq7maamdmeqahvn4zzoxmdttkm7epg2qgn4ueov@hqzjzzzw3mog>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: T4g1JIGXwrjoQ5jXyxU1v6m5r8jw-Oun
X-Proofpoint-GUID: T4g1JIGXwrjoQ5jXyxU1v6m5r8jw-Oun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260146
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



On 2/26/2025 3:55 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 02:43:36PM +0200, Dmitry Baryshkov wrote:
>> The MSM driver uses drm_atomic_helper_check() which mandates that none
>> of the atomic_check() callbacks toggles crtc_state->mode_changed.
>> Perform corresponding check before calling the drm_atomic_helper_check()
>> function.
>>
>> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
>> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
>>   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
>>   5 files changed, 77 insertions(+), 5 deletions(-)
>>
> 
> JFI, this patch generates following warnings, deferred now:
> 
> 10:49:07.279: [  235.096198] WARNING: CPU: 1 PID: 515 at drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:459 dpu_kms_check_mode_changed+0xb0/0xbc
> 10:49:07.279: [  235.107375] Modules linked in:
> 10:49:07.279: [  235.110532] CPU: 1 UID: 0 PID: 515 Comm: kms_atomic_tran Tainted: G        W          6.14.0-rc4-gd229bc98da6b #1
> 10:49:07.279: [  235.121069] Tainted: [W]=WARN
> 10:49:07.279: [  235.124130] Hardware name: Google Lazor Limozeen without Touchscreen (rev5 - rev8) (DT)
> 10:49:07.279: [  235.132356] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 10:49:07.279: [  235.139513] pc : dpu_kms_check_mode_changed+0xb0/0xbc
> 10:49:07.279: [  235.144712] lr : msm_atomic_check+0xc0/0xe0
> 10:49:07.279: [  235.149023] sp : ffff8000843f3960
> 10:49:07.279: [  235.150686] usb 1-1.1: new high-speed USB device number 100 using xhci-hcd
> 10:49:07.279: [  235.152439] x29: ffff8000843f3960 x28: ffff65a18386d080 x27: ffff65a184826a80
> 10:49:07.279: [  235.166848] x26: 0000000000000038 x25: 0000000000000008 x24: ffff65a1866fd580
> 10:49:07.279: [  235.174188] x23: 0000000000000028 x22: 0000000000000028 x21: 0000000000000038
> 10:49:07.279: [  235.181527] x20: ffff65a184826a80 x19: 0000000000000000 x18: 0000000000000000
> 10:49:07.279: [  235.188866] x17: 0000000000000000 x16: 0000000000000000 x15: 0000aaab013dfeb8
> 10:49:07.279: [  235.196215] x14: 00000000000c0000 x13: 0040a00000400800 x12: 0000000000000000
> 10:49:07.279: [  235.203553] x11: 0000000000000050 x10: 0000000000000000 x9 : ffffbdf7fc448530
> 10:49:07.279: [  235.210892] x8 : 00000000ffffffff x7 : ffff65a182610400 x6 : 0000000000000038
> 10:49:07.279: [  235.218231] x5 : ffff65a18314b000 x4 : 0000000000000000 x3 : 0000000000000001
> 10:49:07.279: [  235.225570] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff65a18ca7a600
> 10:49:07.279: [  235.232910] Call trace:
> 10:49:07.279: [  235.235440]  dpu_kms_check_mode_changed+0xb0/0xbc (P)
> 10:49:07.279: [  235.240641]  msm_atomic_check+0xc0/0xe0
> 10:49:07.279: [  235.244594]  drm_atomic_check_only+0x498/0x934
> 10:49:07.279: [  235.249169]  drm_atomic_commit+0x48/0xc4
> 10:49:07.279: [  235.253209]  drm_mode_atomic_ioctl+0xa98/0xd00
> 10:49:07.279: [  235.257791]  drm_ioctl_kernel+0xbc/0x12c
> 10:49:07.280: [  235.261832]  drm_ioctl+0x228/0x4e4
> 10:49:07.280: [  235.265339]  __arm64_sys_ioctl+0xb4/0xec
> 10:49:07.280: [  235.269381]  invoke_syscall+0x48/0x110
> 10:49:07.280: [  235.273248]  el0_svc_common.constprop.0+0x40/0xe0
> 10:49:07.280: [  235.278090]  do_el0_svc+0x1c/0x28
> 10:49:07.280: [  235.281512]  el0_svc+0x48/0x110
> 10:49:07.280: [  235.284753]  el0t_64_sync_handler+0x10c/0x138
> 10:49:07.280: [  235.289234]  el0t_64_sync+0x198/0x19c

Hey Dmitry,

This warning is eventually dropped in the CRTC RM refactor (specifically 
[1]).

Applying in this order might fix the warning:

1. CRTC RM refactor
2. This mode_changed() series
3. The rest of the CWB series

This will cause some merge conflicts with the CRTC RM refactor though 
and you'll need to move the dpu_kms changes in [1] to this patch.

What do you think?

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/patch/637487/?series=144912&rev=1

> 
> 
> -- 
> With best wishes
> Dmitry

