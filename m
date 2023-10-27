Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A87D9C96
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4F510E9E1;
	Fri, 27 Oct 2023 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6E310E9E1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:07:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39REuueK001211; Fri, 27 Oct 2023 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3jqR2AI8dU/Qtj4h+R79gpI6vpcaRUd4YIM1ttg6en8=;
 b=bV4t+yujCwYs+p3gmm6vrKSB89wYHuDmae+FDej3r5/Sq9hLPsJ/MHtVnczbe0ca1qi2
 mNEp+DdFa1DVJTjFJ0DEjgH9V7HXQuQM6OvtwgDIHIBaKe7515OraMuCjLt7wbtM0z23
 7oaexTH3Y4dcMGy5Uy5tw052VGLN8jmKWklmh524EmyM8C4xCeKFPaK4Kfs7nd3WMZ5u
 HPO/Lr0kr8iEwJzfTnLmAbWpfFaWFe7yf2li1gGnJytmH8w0xF98J8MUy0FZSRbzBj2V
 d3DlSjbxcMDgytXSf9wpu5lvTLkslT7B9jOKQ005zGMe5dd51FlaGJhSbX+61WkDfgGF kQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyww72b7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 15:07:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RF7ODG007841
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 15:07:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 08:07:23 -0700
Message-ID: <f45d777c-03eb-fb6b-fa3a-6c19f56e9d17@quicinc.com>
Date: Fri, 27 Oct 2023 09:07:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/11] accel/ivpu: Add support for delayed D0i3 entry
 message
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-11-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231025094323.989987-11-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: q-8trMddchC6pSxxuR1xugkby30vaxLw
X-Proofpoint-GUID: q-8trMddchC6pSxxuR1xugkby30vaxLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270130
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> Currently the VPU firmware prepares for D0i3 every time the VPU
> is entering D0i2 Idle state. This is not optimal as we might not
> enter D0i3 every time we enter D0i2 Idle and this preparation
> is quite costly.
> 
> This optimization moves D0i3 preparation to a dedicated
> message sent from the host driver only when the driver is about
> to enter D0i3 - this reduces power consumption and latency for
> certain workloads, for example audio workloads that submit
> inference every 10 ms.
> 
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Some nits below.

> ---
>   drivers/accel/ivpu/ivpu_drv.h     | 10 +++++--
>   drivers/accel/ivpu/ivpu_fw.c      | 48 +++++++++++++++++++++++++++++--
>   drivers/accel/ivpu/ivpu_hw_37xx.c |  8 ++++--
>   drivers/accel/ivpu/ivpu_hw_40xx.c |  3 ++
>   drivers/accel/ivpu/ivpu_jsm_msg.c | 15 ++++++++++
>   drivers/accel/ivpu/ivpu_jsm_msg.h |  1 +
>   drivers/accel/ivpu/ivpu_pm.c      | 11 ++++++-
>   7 files changed, 87 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 5432b5ee90df..84b170a3c323 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -88,6 +88,7 @@ struct ivpu_wa_table {
>   	bool d3hot_after_power_off;
>   	bool interrupt_clear_with_0;
>   	bool disable_clock_relinquish;
> +	bool disable_d0i3_msg;
>   };
>   
>   struct ivpu_hw_info;
> @@ -126,6 +127,7 @@ struct ivpu_device {
>   		int tdr;
>   		int reschedule_suspend;
>   		int autosuspend;
> +		int d0i3_entry_msg;
>   	} timeout;
>   };
>   
> @@ -148,9 +150,11 @@ extern u8 ivpu_pll_min_ratio;
>   extern u8 ivpu_pll_max_ratio;
>   extern bool ivpu_disable_mmu_cont_pages;
>   
> -#define IVPU_TEST_MODE_FW_TEST         BIT(0)
> -#define IVPU_TEST_MODE_NULL_HW         BIT(1)
> -#define IVPU_TEST_MODE_NULL_SUBMISSION BIT(2)
> +#define IVPU_TEST_MODE_FW_TEST            BIT(0)
> +#define IVPU_TEST_MODE_NULL_HW            BIT(1)
> +#define IVPU_TEST_MODE_NULL_SUBMISSION    BIT(2)
> +#define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
> +#define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
>   extern int ivpu_test_mode;
>   
>   struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 51d976ba5276..3fd94c2d06c7 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -33,12 +33,17 @@
>   
>   #define ADDR_TO_L2_CACHE_CFG(addr) ((addr) >> 31)
>   
> -#define IVPU_FW_CHECK_API(vdev, fw_hdr, name, min_major) \
> +/* Check if FW API is compatible with the driver */
> +#define IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, name, min_major) \
>   	ivpu_fw_check_api(vdev, fw_hdr, #name, \
>   			  VPU_##name##_API_VER_INDEX, \
>   			  VPU_##name##_API_VER_MAJOR, \
>   			  VPU_##name##_API_VER_MINOR, min_major)
>   
> +/* Check if API version is lover that the given version */

lower than?

> +#define IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, name, major, minor) \
> +	ivpu_fw_check_api_ver_lt(vdev, fw_hdr, #name, VPU_##name##_API_VER_INDEX, major, minor)
> +
>   static char *ivpu_firmware;
>   module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
>   MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
> @@ -105,6 +110,19 @@ ivpu_fw_check_api(struct ivpu_device *vdev, const struct vpu_firmware_header *fw
>   	return 0;
>   }
>   
> +static bool
> +ivpu_fw_check_api_ver_lt(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr,
> +			 const char *str, int index, u16 major, u16 minor)
> +{
> +	u16 fw_major = (u16)(fw_hdr->api_version[index] >> 16);
> +	u16 fw_minor = (u16)(fw_hdr->api_version[index]);
> +
> +	if (fw_major < major || (fw_major == major && fw_minor < minor))
> +		return true;
> +
> +	return false;
> +}
> +
>   static int ivpu_fw_parse(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
> @@ -164,9 +182,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   	ivpu_info(vdev, "Firmware: %s, version: %s", fw->name,
>   		  (const char *)fw_hdr + VPU_FW_HEADER_SIZE);
>   
> -	if (IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT, 3))
> +	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, BOOT, 3))
>   		return -EINVAL;
> -	if (IVPU_FW_CHECK_API(vdev, fw_hdr, JSM, 3))
> +	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, JSM, 3))
>   		return -EINVAL;
>   
>   	fw->runtime_addr = runtime_addr;
> @@ -197,6 +215,24 @@ static void ivpu_fw_release(struct ivpu_device *vdev)
>   	release_firmware(vdev->fw->file);
>   }
>   
> +/* Initialize workarounds that depend on FW version */
> +static void
> +ivpu_fw_init_wa(struct ivpu_device *vdev)
> +{
> +	const struct vpu_firmware_header *fw_hdr = (const void *)vdev->fw->file->data;
> +
> +	if (IVPU_FW_CHECK_API_VER_LT(vdev, fw_hdr, BOOT, 3, 17) ||
> +	    (ivpu_hw_gen(vdev) > IVPU_HW_37XX) ||
> +	    (ivpu_test_mode & IVPU_TEST_MODE_D0I3_MSG_DISABLE))
> +		vdev->wa.disable_d0i3_msg = true;
> +
> +	/* Force enable the feature for testing purposes */
> +	if (ivpu_test_mode & IVPU_TEST_MODE_D0I3_MSG_ENABLE)
> +		vdev->wa.disable_d0i3_msg = false;
> +
> +	IVPU_PRINT_WA(disable_d0i3_msg);
> +}
> +
>   static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
> @@ -299,6 +335,8 @@ int ivpu_fw_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_fw_release;
>   
> +	ivpu_fw_init_wa(vdev);
> +
>   	ret = ivpu_fw_mem_init(vdev);
>   	if (ret)
>   		goto err_fw_release;
> @@ -426,6 +464,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>   		 boot_params->vpu_telemetry_enable);
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.dvfs_mode = %u\n",
>   		 boot_params->dvfs_mode);
> +	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_delayed_entry = %d\n",
> +		 boot_params->d0i3_delayed_entry);
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_residency_time_us = %lld\n",
>   		 boot_params->d0i3_residency_time_us);
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_entry_vpu_ts = %llu\n",
> @@ -511,6 +551,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
>   	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
>   	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
>   	boot_params->dvfs_mode = vdev->fw->dvfs_mode;
> +	if (!IVPU_WA(disable_d0i3_msg))
> +		boot_params->d0i3_delayed_entry = 1;
>   	boot_params->d0i3_residency_time_us = 0;
>   	boot_params->d0i3_entry_vpu_ts = 0;
>   
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 06d7db28448a..edf4776acf29 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -90,6 +90,7 @@ static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
>   	vdev->timeout.tdr = 2000;
>   	vdev->timeout.reschedule_suspend = 10;
>   	vdev->timeout.autosuspend = 10;
> +	vdev->timeout.d0i3_entry_msg = 5;
>   }
>   
>   static int ivpu_pll_wait_for_cmd_send(struct ivpu_device *vdev)
> @@ -743,8 +744,11 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
>   
>   	ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
>   
> -	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_ip_reset(vdev))
> -		ivpu_err(vdev, "Failed to reset the VPU\n");
> +	if (!ivpu_hw_37xx_is_idle(vdev)) {
> +		ivpu_warn(vdev, "VPU not idle during power down\n");
> +		if (ivpu_hw_37xx_ip_reset(vdev))
> +			ivpu_err(vdev, "Failed to reset the VPU\n");
> +	}

This appears to be an unrelated change to $SUBJECT

>   
>   	if (ivpu_pll_disable(vdev)) {
>   		ivpu_err(vdev, "Failed to disable PLL\n");
> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
> index d8df2addd18a..971d8d4ecba1 100644
> --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
> @@ -139,18 +139,21 @@ static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
>   		vdev->timeout.tdr = 2000000;
>   		vdev->timeout.reschedule_suspend = 1000;
>   		vdev->timeout.autosuspend = -1;
> +		vdev->timeout.d0i3_entry_msg = 500;
>   	} else if (ivpu_is_simics(vdev)) {
>   		vdev->timeout.boot = 50;
>   		vdev->timeout.jsm = 500;
>   		vdev->timeout.tdr = 10000;
>   		vdev->timeout.reschedule_suspend = 10;
>   		vdev->timeout.autosuspend = -1;
> +		vdev->timeout.d0i3_entry_msg = 100;
>   	} else {
>   		vdev->timeout.boot = 1000;
>   		vdev->timeout.jsm = 500;
>   		vdev->timeout.tdr = 2000;
>   		vdev->timeout.reschedule_suspend = 10;
>   		vdev->timeout.autosuspend = 10;
> +		vdev->timeout.d0i3_entry_msg = 5;
>   	}
>   }
>   
> diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
> index 35a689475c68..03cf6b35d73a 100644
> --- a/drivers/accel/ivpu/ivpu_jsm_msg.c
> +++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
> @@ -260,3 +260,18 @@ int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid)
>   	return ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_SSID_RELEASE_DONE, &resp,
>   				     VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
>   }
> +
> +int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev)
> +{
> +	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_PWR_D0I3_ENTER };
> +	struct vpu_jsm_msg resp;
> +
> +	if (IVPU_WA(disable_d0i3_msg))
> +		return 0;
> +
> +	req.payload.pwr_d0i3_enter.send_response = 1;
> +
> +	return ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_PWR_D0I3_ENTER_DONE,
> +					    &resp, VPU_IPC_CHAN_GEN_CMD,
> +					    vdev->timeout.d0i3_entry_msg);
> +}
> diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.h b/drivers/accel/ivpu/ivpu_jsm_msg.h
> index 66979a948c7c..ae75e5dbcc41 100644
> --- a/drivers/accel/ivpu/ivpu_jsm_msg.h
> +++ b/drivers/accel/ivpu/ivpu_jsm_msg.h
> @@ -22,4 +22,5 @@ int ivpu_jsm_trace_get_capability(struct ivpu_device *vdev, u32 *trace_destinati
>   int ivpu_jsm_trace_set_config(struct ivpu_device *vdev, u32 trace_level, u32 trace_destination_mask,
>   			      u64 trace_hw_component_mask);
>   int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid);
> +int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev);
>   #endif
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 0ace218783c8..b5f613971be5 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -15,6 +15,7 @@
>   #include "ivpu_fw.h"
>   #include "ivpu_ipc.h"
>   #include "ivpu_job.h"
> +#include "ivpu_jsm_msg.h"
>   #include "ivpu_mmu.h"
>   #include "ivpu_pm.h"
>   
> @@ -153,6 +154,8 @@ int ivpu_pm_suspend_cb(struct device *dev)
>   		}
>   	}
>   
> +	ivpu_jsm_pwr_d0i3_enter(vdev);
> +
>   	ivpu_suspend(vdev);
>   	ivpu_pm_prepare_warm_boot(vdev);
>   
> @@ -188,6 +191,7 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
>   {
>   	struct drm_device *drm = dev_get_drvdata(dev);
>   	struct ivpu_device *vdev = to_ivpu_device(drm);
> +	bool hw_is_idle = true;
>   	int ret;
>   
>   	ivpu_dbg(vdev, PM, "Runtime suspend..\n");
> @@ -200,11 +204,16 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
>   		return -EAGAIN;
>   	}
>   
> +	if (!vdev->pm->suspend_reschedule_counter)
> +		hw_is_idle = false;
> +	else if (ivpu_jsm_pwr_d0i3_enter(vdev))
> +		hw_is_idle = false;
> +
>   	ret = ivpu_suspend(vdev);
>   	if (ret)
>   		ivpu_err(vdev, "Failed to set suspend VPU: %d\n", ret);
>   
> -	if (!vdev->pm->suspend_reschedule_counter) {
> +	if (!hw_is_idle) {
>   		ivpu_warn(vdev, "VPU failed to enter idle, force suspended.\n");
>   		ivpu_pm_prepare_cold_boot(vdev);
>   	} else {

