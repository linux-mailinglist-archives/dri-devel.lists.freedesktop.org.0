Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FA58F5E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 04:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF59C10F7C0;
	Thu, 11 Aug 2022 02:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822671137BB;
 Thu, 11 Aug 2022 02:31:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B0LWId005456;
 Thu, 11 Aug 2022 02:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GnAuLifRWY03Z/LAxGuFwQVULnRoYxG+l6O0aheCLUI=;
 b=HuM4NrgCnd6obgJhrNgAbxfW8mzLNo3gQ5YqKuw7mpzWx0F58B8bil4MHoIjt5QdmftT
 hCz+ataBOvrCLLW2T1EixJaA9Ie9WX5m1ifG3ZOmprnl5u9SXuUD6ozZkA8UrEmubOFx
 IGTro+0uWHLUXYODm4+HvzelUItUgI2fW8B2TWU5YiiihqtRvIs4URJquKAFNRsUKAQ+
 2FQkRWc6+/H/vEJSpUDaCAMrWxM8Yx6A+gv/HCEBPwjdZ/YyjaDFvT/w3h7ihvWkszrn
 C1Ovnb1XEvba29qng6HEbtLNiy9m4S3h5MO/8+n22tkImjHWDdGRwl4PqVpaNFVgejQa YQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr24k0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 02:31:20 +0000
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 27B2O3oU008947; 
 Thu, 11 Aug 2022 02:26:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NASANPPMTA05.qualcomm.com (PPS) with ESMTPS id 3hshckdf5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 02:26:19 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B2QJJL011368;
 Thu, 11 Aug 2022 02:26:19 GMT
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA05.qualcomm.com (PPS) with ESMTPS id 27B2QJu7011367
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 02:26:19 +0000
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 19:26:19 -0700
Received: from [10.111.167.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 10 Aug
 2022 19:26:16 -0700
Message-ID: <6c67281a-e00e-f96a-6def-e7e0c15a95b2@quicinc.com>
Date: Wed, 10 Aug 2022 19:26:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>
References: <20220725074313.42172-1-javierm@redhat.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220725074313.42172-1-javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zWa1g_5AHD3uerqB7_hC4aEldKOxN_z-
X-Proofpoint-ORIG-GUID: zWa1g_5AHD3uerqB7_hC4aEldKOxN_z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_01,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110005
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier

Thank you for the patch.

On 7/25/2022 12:43 AM, Javier Martinez Canillas wrote:
> Drivers' .remove and .shutdown callbacks are executed on different code
> paths. The former is called when a device is removed from the bus, while
> the latter is called at system shutdown time to quiesce the device.
> 
> This means that some overlap exists between the two, because both have to
> take care of properly shutting down the hardware. But currently the logic
> used in these two callbacks isn't consistent in msm drivers, which could
> lead to kernel panic.
> 
> For example, on .remove the component is deleted and its .unbind callback
> leads to the hardware being shutdown but only if the DRM device has been
> marked as registered.
> 
> That check doesn't exist in the .shutdown logic and this can lead to the
> driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
> been properly initialized.
> 
> A situation like this can happen if drivers for expected sub-devices fail
> to probe, since the .bind callback will never be executed. If that is the
> case, drm_atomic_helper_shutdown() will attempt to take mutexes that are
> only initialized if drm_mode_config_init() is called during a device bind.
> 
> This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
> shutdown hook in case GPU components failed to bind"), but unfortunately
> it still happens in some cases as the one mentioned above, i.e:
> 
> [  169.495897] systemd-shutdown[1]: Powering off.
> [  169.500466] kvm: exiting hardware virtualization
> [  169.554787] platform wifi-firmware.0: Removing from iommu group 12
> [  169.610238] platform video-firmware.0: Removing from iommu group 10
> [  169.682164] ------------[ cut here ]------------
> [  169.686909] WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0
> ...
> [  169.775691] Hardware name: Google CoachZ (rev3+) (DT)
> [  169.780874] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  169.788021] pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
> [  169.793205] lr : drm_modeset_lock_all_ctx+0x48/0x3d0
> [  169.798299] sp : ffff80000805bb80
> [  169.801701] x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000
> [  169.809025] x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030
> [  169.816349] x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800
> [  169.823674] x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034
> [  169.830998] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
> [  169.838322] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
> [  169.845646] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  169.852971] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
> [  169.860295] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  169.867619] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0
> [  169.874944] Call trace:
> [  169.877467]  drm_modeset_lock_all_ctx+0x3c4/0x3d0
> [  169.882297]  drm_atomic_helper_shutdown+0x70/0x134
> [  169.887217]  msm_drv_shutdown+0x30/0x40
> [  169.891159]  platform_shutdown+0x28/0x40
> [  169.895191]  device_shutdown+0x148/0x350
> [  169.899221]  kernel_power_off+0x38/0x80
> [  169.903163]  __do_sys_reboot+0x288/0x2c0
> [  169.907192]  __arm64_sys_reboot+0x28/0x34
> [  169.911309]  invoke_syscall+0x48/0x114
> [  169.915162]  el0_svc_common.constprop.0+0x44/0xec
> [  169.919992]  do_el0_svc+0x2c/0xc0
> [  169.923394]  el0_svc+0x2c/0x84
> [  169.926535]  el0t_64_sync_handler+0x11c/0x150
> [  169.931013]  el0t_64_sync+0x18c/0x190
> [  169.934777] ---[ end trace 0000000000000000 ]---
> [  169.939557] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
> [  169.948574] Mem abort info:
> [  169.951452]   ESR = 0x0000000096000004
> [  169.955307]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  169.960765]   SET = 0, FnV = 0
> [  169.963901]   EA = 0, S1PTW = 0
> [  169.967127]   FSC = 0x04: level 0 translation fault
> [  169.972136] Data abort info:
> [  169.975093]   ISV = 0, ISS = 0x00000004
> [  169.979037]   CM = 0, WnR = 0
> [  169.982083] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000
> [  169.988697] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
> [  169.995669] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> ...
> [  170.079614] Hardware name: Google CoachZ (rev3+) (DT)
> [  170.084801] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  170.091941] pc : ww_mutex_lock+0x28/0x32c
> [  170.096064] lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
> [  170.101254] sp : ffff80000805bb50
> [  170.104658] x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000
> [  170.111977] x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018
> [  170.119296] x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800
> [  170.126615] x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034
> [  170.133933] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
> [  170.141252] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
> [  170.148571] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [  170.155890] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
> [  170.163209] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [  170.170528] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018
> [  170.177847] Call trace:
> [  170.180364]  ww_mutex_lock+0x28/0x32c
> [  170.184127]  drm_modeset_lock_all_ctx+0x1b0/0x3d0
> [  170.188957]  drm_atomic_helper_shutdown+0x70/0x134
> [  170.193876]  msm_drv_shutdown+0x30/0x40
> [  170.197820]  platform_shutdown+0x28/0x40
> [  170.201854]  device_shutdown+0x148/0x350
> [  170.205888]  kernel_power_off+0x38/0x80
> [  170.209832]  __do_sys_reboot+0x288/0x2c0
> [  170.213866]  __arm64_sys_reboot+0x28/0x34
> [  170.217990]  invoke_syscall+0x48/0x114
> [  170.221843]  el0_svc_common.constprop.0+0x44/0xec
> [  170.226672]  do_el0_svc+0x2c/0xc0
> [  170.230079]  el0_svc+0x2c/0x84
> [  170.233215]  el0t_64_sync_handler+0x11c/0x150
> [  170.237686]  el0t_64_sync+0x18c/0x190
> [  170.241451] Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)
> [  170.247704] ---[ end trace 0000000000000000 ]---
> [  170.252457] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [  170.260654] Kernel Offset: 0x495d77c00000 from 0xffff800008000000
> [  170.266910] PHYS_OFFSET: 0xffffcd8500000000
> [  170.271212] CPU features: 0x800,00c2a015,19801c82
> [  170.276042] Memory Limit: none
> [  170.279183] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 

Can you please remove the timestamps and just keep the stacktrace?

> Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Other than that, I can see all prev comments have been addressed and 
this change LGTM as well, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes in v3:
> - Drop the msm_shutdown_hw() wrapper and just call drm_atomic_helper_shutdown()
>    in both callbacks (Dmitry Baryshkov).
> - Copy the comment in msm_drm_uninit() to msm_drv_shutdown() (Dmitry Baryshkov).
> 
> Changes in v2:
> - Take the registered check out of the msm_shutdown_hw() and make callers to check instead.
> - Make msm_shutdown_hw() an inline function.
> - Add a Fixes: tag.
> 
>   drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 1ed4cd09dbf8..1333fea57713 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1242,10 +1242,15 @@ void msm_drv_shutdown(struct platform_device *pdev)
>   	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>   	struct drm_device *drm = priv ? priv->dev : NULL;
>   
> -	if (!priv || !priv->kms)
> -		return;
> -
> -	drm_atomic_helper_shutdown(drm);
> +	/*
> +	 * Shutdown the hw if we're far enough along where things might be on.
> +	 * If we run this too early, we'll end up panicking in any variety of
> +	 * places. Since we don't register the drm device until late in
> +	 * msm_drm_init, drm_dev->registered is used as an indicator that the
> +	 * shutdown will be successful.
> +	 */
> +	if (drm && drm->registered)
> +		drm_atomic_helper_shutdown(drm);
>   }
>   
>   static struct platform_driver msm_platform_driver = {
