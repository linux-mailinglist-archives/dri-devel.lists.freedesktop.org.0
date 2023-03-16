Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A66BC3D0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 03:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B5710EC2C;
	Thu, 16 Mar 2023 02:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F8710EC28;
 Thu, 16 Mar 2023 02:32:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G24XZH027270; Thu, 16 Mar 2023 02:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OJ67w/wYq1NU86c15CbTfl8QCCAh8C+obuqvZPZ6UYg=;
 b=ZsXR8iFWJ+zTDtHygdRERAb9MoB+3nUFSP8wiQqzGUZdKdnUgJL78J38rSPaIqw23s3S
 9uYDxpoW0YxUUD2/vYY3/mELAKh4P6zdR5EBfqXmCZYDtGW5b18QWTDyVr547nA08STY
 ZN9mru0DzfJbSVmKJ0cRAIq8yoN8IdgUHegp/Bk3GMkjGHLx3Y5dhFm78ZUuW32CMXsR
 TBIKuIXimFLy4FmsIcx3/rOT0UtkNzxOv5ccGoIH0g4Jxny4evHBlgeweybY+yHT/0bl
 A1e+ie7euTJF2Vg38E+i89hc6LHiieyh+Qydw21X7t5Wjwpk81yHx33R8weY+A2EC8wW kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxjren7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:32:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G2WrQU001048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:32:53 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 19:32:53 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH] drm/msm/dpu: fix stack smashing in
 dpu_hw_ctl_setup_blendstage
Date: Wed, 15 Mar 2023 19:32:39 -0700
Message-ID: <167893388559.12088.11388074833613461897.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _VRcJAmSgFMMLJm2p4Nx7ElHyDe1TXl2
X-Proofpoint-ORIG-GUID: _VRcJAmSgFMMLJm2p4Nx7ElHyDe1TXl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=925 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160021
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
Cc: Amit Pundir <amit.pundir@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Feb 2023 12:57:08 +0300, Dmitry Baryshkov wrote:
> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> when setting the SSPP_NONE pipe. However it was unnoticed until the
> kernel was tested under AOSP (with some kind of stack protection/check).
> 
> This fixes the following backtrace:
> 
> Unexpected kernel BRK exception at EL1
> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> Hardware name: Thundercomm Dragonboard 845c (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> sp : ffffffc00bdcb720
> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> Call trace:
>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>  drm_atomic_commit+0xac/0xe8
>  drm_mode_atomic_ioctl+0xbf0/0xdac
>  drm_ioctl_kernel+0xc4/0x178
>  drm_ioctl+0x2c8/0x608
>  __arm64_sys_ioctl+0xa8/0xec
>  invoke_syscall+0x44/0x104
>  el0_svc_common.constprop.0+0x44/0xec
>  do_el0_svc+0x38/0x98
>  el0_svc+0x2c/0xb4
>  el0t_64_sync_handler+0xb8/0xbc
>  el0t_64_sync+0x1a0/0x1a4
> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
      https://gitlab.freedesktop.org/drm/msm/-/commit/1c1ded39bfb8

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
