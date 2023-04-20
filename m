Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB936E98A2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84B910EC90;
	Thu, 20 Apr 2023 15:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFF610E960;
 Thu, 20 Apr 2023 15:44:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KDdRHm007783; Thu, 20 Apr 2023 15:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=95hNvwsnOntj3IjZdDdz9tDvXz8259oYrPBtE1QxUE8=;
 b=V0grKoWSJ3GIxvYixyMXU20PPON7qn5vaH6L54sDh8kNPB0sP2zIxzbJfcbBJRCDJxxy
 Zbn7ieVHGJmRCSvv2LPN/sJ+dDUud3UsgXjcZ253MOPEWZPAnzYatLYrodM9JoDhqxCJ
 VBKIW0aRoLeUHdJFbnOan+O66uv18ymCtZ7a7AJyyrqysS1Pyl7+tGTgfJzOOPx+V5LO
 y+jQIZDsZ0E9dDRjh69S16+u/wW5I/HhEX7lwPuRJ5EnhYvnfrTdEWB2sf4wmWlNPikK
 6NvLhpXeByQJj0z/TzB/v0+gx6zjdJGeBmLNNNvKxeC6y9RoeiXGvjBuXJGsk/fPqlZY RQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p522h1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:44:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KFiSD9010024
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:44:28 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 20 Apr
 2023 08:44:27 -0700
Message-ID: <50dabfb6-98a8-7e17-fe0f-bbf895980cca@quicinc.com>
Date: Thu, 20 Apr 2023 08:44:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/atomic: Don't try async if crtc not active
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20230418164158.549873-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230418164158.549873-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mp34yyQrkH9uEVrk6V42wZX2h6L7QtTB
X-Proofpoint-GUID: mp34yyQrkH9uEVrk6V42wZX2h6L7QtTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_11,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=985 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200129
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/18/2023 9:41 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For a similar reason as commit f2c7ca890182 ("drm/atomic-helper: Don't
> set deadline for modesets"), we need the crtc to be already active in
> order to compute a target vblank time for an async commit.  Otherwise
> we get this splat reminding us that we are doing it wrong:
> 
>     ------------[ cut here ]------------
>     msm_dpu ae01000.mdp: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
>     WARNING: CPU: 7 PID: 1923 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>     Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp llc tun vhost_vsock vhost vhost_iotlb vmw_vsock_virtio_transport_common vsock uinput rfcomm algif_hash algif_skcipher af_alg veth venus_dec venus_enc cros_ec_typec typec qcom_spmi_temp_alarm qcom_spmi_adc_tm5 qcom_spmi_adc5 xt_cgroup qcom_vadc_common qcom_stats hci_uart btqca xt_MASQUERADE venus_core 8021q coresight_tmc coresight_funnel coresight_etm4x coresight_replicator snd_soc_lpass_sc7180 coresight snd_soc_sc7180 ip6table_nat fuse ath10k_snoc ath10k_core ath mac80211 iio_trig_sysfs bluetooth cfg80211 cros_ec_sensors cros_ec_sensors_core ecdh_generic industrialio_triggered_buffer ecc kfifo_buf cros_ec_sensorhub r8153_ecm cdc_ether usbnet r8152 mii lzo_rle lzo_compress zram hid_vivaldi hid_google_hammer hid_vivaldi_common joydev
>     CPU: 7 PID: 1923 Comm: DrmThread Not tainted 5.15.107-18853-g3be267609a0b-dirty #16 a1ffc1a66e79c21c3536d8c9a42e819236e39714
>     Hardware name: Google Wormdingler rev1+ BOE panel board (DT)
>     pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>     lr : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x144/0x370
>     sp : ffffffc012e2b800
>     x29: ffffffc012e2b840 x28: ffffff8083676094 x27: ffffffc012e2bb28
>     x26: ffffff8084539800 x25: 0000000000000000 x24: ffffff8083676000
>     x23: ffffffd3c8cdc5a0 x22: ffffff80845b9d00 x21: ffffffc012e2b8b4
>     x20: ffffffc012e2b910 x19: 0000000000000001 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000010 x15: ffffffd3c8451a88
>     x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000000001
>     x11: c0000000ffffdfff x10: ffffffd3c973ef58 x9 : 8ea3526b3cc95900
>     x8 : 8ea3526b3cc95900 x7 : 0000000000000000 x6 : 000000000000003a
>     x5 : ffffffd3c99676cd x4 : 0000000000000000 x3 : ffffffc012e2b4b8
>     x2 : ffffffc012e2b4c0 x1 : 00000000ffffdfff x0 : 0000000000000000
>     Call trace:
>      drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>      drm_crtc_vblank_helper_get_vblank_timestamp+0x20/0x30
>      drm_crtc_get_last_vbltimestamp+0x68/0xb0
>      drm_crtc_next_vblank_start+0x5c/0xa8
>      msm_atomic_commit_tail+0x264/0x664
>      commit_tail+0xac/0x160
>      drm_atomic_helper_commit+0x160/0x168
>      drm_atomic_commit+0xfc/0x128
>      drm_atomic_helper_disable_plane+0x8c/0x110
>      __setplane_atomic+0x10c/0x138
>      drm_mode_cursor_common+0x3a8/0x410
>      drm_mode_cursor_ioctl+0x48/0x70
>      drm_ioctl_kernel+0xe0/0x158
>      drm_ioctl+0x25c/0x4d8
>      __arm64_sys_ioctl+0x98/0xd0
>      invoke_syscall+0x4c/0x100
>      el0_svc_common+0x98/0x104
>      do_el0_svc+0x30/0x90
>      el0_svc+0x20/0x50
>      el0t_64_sync_handler+0x78/0x108
>      el0t_64_sync+0x1a4/0x1a8
>     ---[ end trace a0f587e1ab9589e8 ]---
> 
> Fixes: 52ff0d3073d2 ("drm/msm/atomic: Switch to vblank_start helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
