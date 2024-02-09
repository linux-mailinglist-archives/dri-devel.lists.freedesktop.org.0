Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557DE84F8B8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EED910F635;
	Fri,  9 Feb 2024 15:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MZxvUS37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8B810F635
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:39:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 419FUZHr006294; Fri, 9 Feb 2024 15:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=sn30ClCyRJLVUxGp4VywTT0S23XX2C6ZN0bt5ri3Vl4=; b=MZ
 xvUS37DweNNpHYivIZTJaH4WluQXek6hKEMhTqUzm/xNRFyi8D+MeVUuJwGzu2zX
 O9Gvm5xaTFXiquahr67R2yqBSudyZsiInZ15ZoBT+t5y/E38RDb8J7NRZmNfd1kT
 kJULAig0AcewmgN+eZB8NqGjJhIis8W5Nv7kq7riT+Bb0wy4QCIWAt1qRx76g3k5
 OBBRDPveEjbvr0RFfHuPSE9RAqtqzfHIX/nuUBUwKPrwmBganmQfQsMXysdw41Jt
 +i/X7XDmUXj5NRblqaueej9fIITpfVb0cfQZn1psQji/5pUIc2E5ncvECQ1nOHBF
 pzMv7iylbeulaeMWY1FQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4rk84bye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Feb 2024 15:39:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419FdNHB013082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Feb 2024 15:39:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 07:39:23 -0800
Message-ID: <304ed6e4-945c-0c2c-e0ac-63cc33fdb55b@quicinc.com>
Date: Fri, 9 Feb 2024 08:39:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/ivpu: Fix DevTLB errors on suspend/resume and
 recovery
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>
References: <20240206151927.2925585-1-jacek.lawrynowicz@linux.intel.com>
 <20240207102446.3126981-1-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240207102446.3126981-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ehKH2IDwkZgIpfS0tlDULF2KAX6MMxif
X-Proofpoint-ORIG-GUID: ehKH2IDwkZgIpfS0tlDULF2KAX6MMxif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_12,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090115
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

On 2/7/2024 3:24 AM, Jacek Lawrynowicz wrote:
> Issue IP reset before shutdown in order to
> complete all upstream requests to the SOC.
> Without this DevTLB is complaining about
> incomplete transactions and NPU cannot resume from
> suspend.
> This problem is only happening on recent IFWI
> releases.
> 
> IP reset in rare corner cases can mess up PCI
> configuration, so save it before the reset.
> After this happens it is also impossible to
> issue PLL requests and D0->D3->D0 cycle is needed
> to recover the NPU. Add WP 0 request on power up,
> so the PUNIT is always notified about NPU reset.
> 
> Use D0/D3 cycle for recovery as it can recover
> from failed IP reset and FLR cannot.
> 
> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Nit below

>   drivers/accel/ivpu/ivpu_hw_37xx.c | 44 ++++++++++++++++++++++---------
>   drivers/accel/ivpu/ivpu_pm.c      | 39 +++++++++++++++------------
>   2 files changed, 54 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 77accd029c4a..89af1006df55 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -510,16 +510,6 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
>   	return ret;
>   }
>   
> -static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
> -{
> -	ivpu_boot_dpu_active_drive(vdev, false);
> -	ivpu_boot_pwr_island_isolation_drive(vdev, true);
> -	ivpu_boot_pwr_island_trickle_drive(vdev, false);
> -	ivpu_boot_pwr_island_drive(vdev, false);
> -
> -	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
> -}
> -
>   static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>   {
>   	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
> @@ -616,12 +606,37 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>   	return 0;
>   }
>   
> +static int ivpu_hw_37xx_ip_reset(struct ivpu_device *vdev)
> +{
> +	int ret;
> +	u32 val;
> +
> +	if (IVPU_WA(punit_disabled))
> +		return 0;
> +
> +	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> +	if (ret) {
> +		ivpu_err(vdev, "Timed out waiting for TRIGGER bit\n");
> +		return ret;
> +	}
> +
> +	val = REGB_RD32(VPU_37XX_BUTTRESS_VPU_IP_RESET);
> +	val = REG_SET_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, val);
> +	REGB_WR32(VPU_37XX_BUTTRESS_VPU_IP_RESET, val);
> +
> +	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
> +	if (ret)
> +		ivpu_err(vdev, "Timed out waiting for RESET completion\n");
> +
> +	return ret;
> +}
> +
>   static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>   {
>   	int ret = 0;
>   
> -	if (ivpu_boot_pwr_domain_disable(vdev)) {
> -		ivpu_err(vdev, "Failed to disable power domain\n");
> +	if (ivpu_hw_37xx_ip_reset(vdev)) {
> +		ivpu_err(vdev, "Failed to reset NPU\n");
>   		ret = -EIO;
>   	}
>   
> @@ -661,6 +676,11 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
>   {
>   	int ret;
>   
> +	/* PLL requests may fail when powering down, so issue WP 0 here */
> +	ret = ivpu_pll_disable(vdev);
> +	if (ret)
> +		ivpu_warn(vdev, "Failed to disable PLL: %d\n", ret);
> +
>   	ret = ivpu_hw_37xx_d0i3_disable(vdev);
>   	if (ret)
>   		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index f501f27ebafd..5f73854234ba 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -58,11 +58,14 @@ static int ivpu_suspend(struct ivpu_device *vdev)
>   {
>   	int ret;
>   
> +	/* Save PCI state before powering down as it sometimes gets corrupted if NPU hangs */
> +	pci_save_state(to_pci_dev(vdev->drm.dev));
> +
>   	ret = ivpu_shutdown(vdev);
> -	if (ret) {
> +	if (ret)
>   		ivpu_err(vdev, "Failed to shutdown VPU: %d\n", ret);

In the two logs you add in this change, the log has "NPU".  Here, there 
is "VPU".  As far as I understand VPU is the old term and NPU is the new 
term therefore it seems like all the logs should be updated to use the 
new term for consistency.  Outside of scope for this change though.

> -		return ret;
> -	}
> +
> +	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
>   
>   	return ret;
>   }
> @@ -71,6 +74,9 @@ static int ivpu_resume(struct ivpu_device *vdev)
>   {
>   	int ret;
>   
> +	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D0);
> +	pci_restore_state(to_pci_dev(vdev->drm.dev));
> +
>   retry:
>   	ret = ivpu_hw_power_up(vdev);
>   	if (ret) {
> @@ -120,15 +126,20 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
>   
>   	ivpu_fw_log_dump(vdev);
>   
> -retry:
> -	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
> -	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
> -		cond_resched();
> -		goto retry;
> -	}
> +	atomic_inc(&vdev->pm->reset_counter);
> +	atomic_set(&vdev->pm->reset_pending, 1);
> +	down_write(&vdev->pm->reset_lock);
> +
> +	ivpu_suspend(vdev);
> +	ivpu_pm_prepare_cold_boot(vdev);
> +	ivpu_jobs_abort_all(vdev);
> +
> +	ret = ivpu_resume(vdev);
> +	if (ret)
> +		ivpu_err(vdev, "Failed to resume NPU: %d\n", ret);
>   
> -	if (ret && ret != -EAGAIN)
> -		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
> +	up_write(&vdev->pm->reset_lock);
> +	atomic_set(&vdev->pm->reset_pending, 0);
>   
>   	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
>   	pm_runtime_mark_last_busy(vdev->drm.dev);
> @@ -200,9 +211,6 @@ int ivpu_pm_suspend_cb(struct device *dev)
>   	ivpu_suspend(vdev);
>   	ivpu_pm_prepare_warm_boot(vdev);
>   
> -	pci_save_state(to_pci_dev(dev));
> -	pci_set_power_state(to_pci_dev(dev), PCI_D3hot);
> -
>   	ivpu_dbg(vdev, PM, "Suspend done.\n");
>   
>   	return 0;
> @@ -216,9 +224,6 @@ int ivpu_pm_resume_cb(struct device *dev)
>   
>   	ivpu_dbg(vdev, PM, "Resume..\n");
>   
> -	pci_set_power_state(to_pci_dev(dev), PCI_D0);
> -	pci_restore_state(to_pci_dev(dev));
> -
>   	ret = ivpu_resume(vdev);
>   	if (ret)
>   		ivpu_err(vdev, "Failed to resume: %d\n", ret);

