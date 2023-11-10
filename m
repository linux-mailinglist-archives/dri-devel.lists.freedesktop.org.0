Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B587E7DDF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33F10E11E;
	Fri, 10 Nov 2023 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9710E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 16:44:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AAGYQ5X014468; Fri, 10 Nov 2023 16:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yOT9dK1JpatXxqzUBCMfWUouTtxvXPJP9IAud6HgSYI=;
 b=XyN8xjWqWQT52OccXevALGsvbQQRm8MLhranpq60ib2A9vbQTIdtV/tgYMeQIo4gedde
 KDi2H6POc1MsPlKl2xCMnf3TNH+Zl0+KQwUDjw1ZEUXyBY+ECQYNB03IoY9YF5zqk1eG
 aDVj99Z8MtfhtbHtyhNVrpUcp1Yv8VU2q8oWCfdRV1KaMVp/Cz9Xu+5TxDX1rcxZm5IS
 /LD7Zn5+toWE8Ek4TYAnoMBaFYi4L2OP639EKKPJejMpGs/FuNuwtWNPoWtUr5Dcg706
 LDXUdjZHWfTKCR5NWs+9F5z8f3Qqw73FZ+KggDYyR/iZg9EOIT/T22kNCJ82j1UsDvpP vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u9q0w075d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 16:44:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AAGiTNY002945
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 16:44:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 10 Nov
 2023 08:44:28 -0800
Message-ID: <3dfeec85-1d05-2b9d-fe37-aebbfe9732b6@quicinc.com>
Date: Fri, 10 Nov 2023 09:44:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/5] accel/ivpu: Use threaded IRQ to handle JOB done
 messages
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
 <20231107123514.2218850-6-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231107123514.2218850-6-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: E-EmiruHGkLL_6ViTvcwt-GJsqbqZ56d
X-Proofpoint-ORIG-GUID: E-EmiruHGkLL_6ViTvcwt-GJsqbqZ56d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100139
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

On 11/7/2023 5:35 AM, Jacek Lawrynowicz wrote:
> Remove job_done thread and replace it with generic callback based
> mechanism.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c     |  30 ++---
>   drivers/accel/ivpu/ivpu_drv.h     |   3 +-
>   drivers/accel/ivpu/ivpu_hw_37xx.c |  29 +++--
>   drivers/accel/ivpu/ivpu_ipc.c     | 195 +++++++++++++++++-------------
>   drivers/accel/ivpu/ivpu_ipc.h     |  22 +++-
>   drivers/accel/ivpu/ivpu_job.c     |  84 +++----------
>   drivers/accel/ivpu/ivpu_job.h     |   6 +-
>   7 files changed, 185 insertions(+), 184 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index c4456abe228c..48cbcb254237 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -318,13 +318,15 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
>   	if (ivpu_test_mode & IVPU_TEST_MODE_FW_TEST)
>   		return 0;
>   
> -	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
> +	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG, NULL);
>   
>   	timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
>   	while (1) {
>   		ret = ivpu_ipc_irq_handler(vdev);
> -		if (ret)
> +		if (ret != IRQ_HANDLED) {

What about the IRQ_WAKE_THREAD case?

> +			ret = -EIO;
>   			break;
> +		}
>   		ret = ivpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
>   		if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
>   			break;

> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index a172cfb1c31f..d1795cd6cc09 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -891,9 +891,13 @@ static void ivpu_hw_37xx_irq_noc_firewall_handler(struct ivpu_device *vdev)
>   }
>   
>   /* Handler for IRQs from VPU core (irqV) */
> -static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
> +static irqreturn_t ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>   {
>   	u32 status = REGV_RD32(VPU_37XX_HOST_SS_ICB_STATUS_0) & ICB_0_IRQ_MASK;
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (!status)
> +		return IRQ_NONE;
>   
>   	REGV_WR32(VPU_37XX_HOST_SS_ICB_CLEAR_0, status);
>   
> @@ -901,7 +905,7 @@ static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>   		ivpu_mmu_irq_evtq_handler(vdev);
>   
>   	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
> -		ivpu_ipc_irq_handler(vdev);
> +		ret |= ivpu_ipc_irq_handler(vdev);

Why the bitwise operation?  handler() returns a irqreturn_t, so it seems 
like this should just be ret = handler();

>   
>   	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
>   		ivpu_dbg(vdev, IRQ, "MMU sync complete\n");
> @@ -918,17 +922,17 @@ static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>   	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, NOC_FIREWALL_INT, status))
>   		ivpu_hw_37xx_irq_noc_firewall_handler(vdev);
>   
> -	return status;
> +	return ret;
>   }
>   
>   /* Handler for IRQs from Buttress core (irqB) */
> -static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
> +static irqreturn_t ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
>   {
>   	u32 status = REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) & BUTTRESS_IRQ_MASK;
>   	bool schedule_recovery = false;
>   
> -	if (status == 0)
> -		return 0;
> +	if (!status)
> +		return IRQ_NONE;
>   
>   	if (REG_TEST_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
>   		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE irq: %08x",
> @@ -964,23 +968,26 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
>   	if (schedule_recovery)
>   		ivpu_pm_schedule_recovery(vdev);
>   
> -	return status;
> +	return IRQ_HANDLED;
>   }
>   
>   static irqreturn_t ivpu_hw_37xx_irq_handler(int irq, void *ptr)
>   {
>   	struct ivpu_device *vdev = ptr;
> -	u32 ret_irqv, ret_irqb;
> +	irqreturn_t ret = IRQ_NONE;
>   
>   	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
>   
> -	ret_irqv = ivpu_hw_37xx_irqv_handler(vdev, irq);
> -	ret_irqb = ivpu_hw_37xx_irqb_handler(vdev, irq);
> +	ret |= ivpu_hw_37xx_irqv_handler(vdev, irq);
> +	ret |= ivpu_hw_37xx_irqb_handler(vdev, irq);

I think this violates coding-style. typedefs are only to be used in 
limited circumstances.  The one I think that applies here is that the 
type is intended to be completely opaque and only accessed through 
proper accessor functions.  You are peering into the type and using the 
information that it is implemented as a bitfield, which is not for you 
to know.

If irqreturn_t changes in structure, this will break, and I don't think 
it will be caught by the compiler, or be obvious.

>   
>   	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
>   	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
>   
> -	return IRQ_RETVAL(ret_irqb | ret_irqv);
> +	if (ret & IRQ_WAKE_THREAD)
> +		return IRQ_WAKE_THREAD;
> +
> +	return ret;
>   }
>   
>   static void ivpu_hw_37xx_diagnose_failure(struct ivpu_device *vdev)
