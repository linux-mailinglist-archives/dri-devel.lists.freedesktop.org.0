Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B86E0825844
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6210110E62C;
	Fri,  5 Jan 2024 16:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB410E620
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:36:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405EaT7X030980; Fri, 5 Jan 2024 16:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/3nCZzaEiBvdVFnEJq9B80CPRIqGp3F3iFGuCgbw80g=; b=Z/
 x4W2fNJP+Lty54Atf3JJKTOBNBuEC03/fneQ2QMlmN/bkmlODMAUJ5xQ9GVnbOxl
 J4nWdYeTxFlS1BYwSaIiOPONPeCP1Bt/REqnPEIFS609LiJXgyUPD35veKdX6j9d
 8VlJR9gUMnYSyQQqMFR9E3nt39KctCYC+Id05KgWx7T3F8ljWD+CaFUhIlRUb0Iw
 NCbpIu/yVLq9Gmkm4uRnSE0TqGQJn4mP/UayN0nntGaFkG64WNuHtQqRgK+wBkhw
 GR8SOQWzgyFHisGn1xFgmLwD9Tja/dKSbBenN8jQHUDw2gbBseatxppuI9+2nOFX
 c7KVS8WLQP9cK9FjB/+Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve94r9jg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 16:35:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405GZDsv017089
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 16:35:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 08:35:12 -0800
Message-ID: <663dc292-0aa0-367c-e2f3-ade7ffba3b94@quicinc.com>
Date: Fri, 5 Jan 2024 09:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 05/10] accel/ivpu: Fix potential infinite loops in IRQ
 handlers
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-6-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-6-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bxMIHViPx3vBzmWNapbzLIVu0vvhkQ-i
X-Proofpoint-GUID: bxMIHViPx3vBzmWNapbzLIVu0vvhkQ-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxlogscore=900 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050137
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

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> Limit number of iterations in ivpu_mmu_irq_evtq_handler() and
> ivpu_ipc_irq_handler().

"potential infinite loops" sounds like something that has not been 
observed.  Has a problem actually occurred?

Are you concerned that the FW is broken and spamming Linux with events?

Why a limit of 100 events?  Seems arbitrary.

I suspect threaded irqs might be useful here, but it is hard to tell.

> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_ipc.c |  6 ++++++
>   drivers/accel/ivpu/ivpu_mmu.c | 21 +++++++++++++--------
>   2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index e86621f16f85..f69780248803 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -389,12 +389,18 @@ void ivpu_ipc_irq_handler(struct ivpu_device *vdev, bool *wake_thread)
>   	unsigned long flags;
>   	bool dispatched;
>   	u32 vpu_addr;
> +	int msg_count = 0;
>   
>   	/*
>   	 * Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
>   	 * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
>   	 */
>   	while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {
> +		if (++msg_count > IPC_MAX_RX_MSG) {
> +			ivpu_pm_schedule_recovery(vdev);
> +			return;
> +		}
> +
>   		vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
>   		if (vpu_addr == REG_IO_ERROR) {
>   			ivpu_err_ratelimited(vdev, "Failed to read IPC rx addr register\n");
> diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
> index 1f813625aab3..c82929b0ae9d 100644
> --- a/drivers/accel/ivpu/ivpu_mmu.c
> +++ b/drivers/accel/ivpu/ivpu_mmu.c
> @@ -236,6 +236,8 @@
>   #define IVPU_MMU_CERROR_ABT          0x2
>   #define IVPU_MMU_CERROR_ATC_INV_SYNC 0x3
>   
> +#define IVPU_MMU_MAX_EVENT_COUNT     100
> +
>   static const char *ivpu_mmu_event_to_str(u32 cmd)
>   {
>   	switch (cmd) {
> @@ -887,7 +889,7 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
>   
>   void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>   {
> -	bool schedule_recovery = false;
> +	int event_count = 0;
>   	u32 *event;
>   	u32 ssid;
>   
> @@ -895,16 +897,19 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
>   
>   	while ((event = ivpu_mmu_get_event(vdev)) != NULL) {
>   		ivpu_mmu_dump_event(vdev, event);
> +		if (++event_count > IVPU_MMU_MAX_EVENT_COUNT) {
> +			ivpu_pm_schedule_recovery(vdev);
> +			return;
> +		}
>   
>   		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, event[0]);
> -		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
> -			schedule_recovery = true;
> -		else
> -			ivpu_mmu_user_context_mark_invalid(vdev, ssid);
> -	}
> +		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
> +			ivpu_pm_schedule_recovery(vdev);
> +			return;
> +		}
>   
> -	if (schedule_recovery)
> -		ivpu_pm_schedule_recovery(vdev);
> +		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
> +	}
>   }
>   
>   void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)

