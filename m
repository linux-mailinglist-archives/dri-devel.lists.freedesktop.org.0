Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CC7BBBB7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5B10E524;
	Fri,  6 Oct 2023 15:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A019910E524
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:25:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 396EeRpe001169; Fri, 6 Oct 2023 15:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Os2/bhhBjZuO79q5+RCJQRriyuFHkn8KKgK5ZxNJ+/A=;
 b=eolGaPrF4jUahf9V1h+FYelbGJ3/UJy1P8cj2J9emDEmWQIYNGejCvCqO+y1V1j11vrg
 L4UO0WnuLRtCa9vn3YQMgFOMpOBtsNrFORQ1VUJhK0A5Agp05hsnffIErfNAiZ0PBv1m
 p9d8KoSZhN+yEptYFUs2qw2kHkyWUVDosNng/wTKy5VYtEHSThqTrf5Y4jH08oo7JVpf
 x+HHdQAkPbD1fm7TRWgLixD5QiK4wN4iIix48bYzMMbXIxb/v9uDR/rTH04drSbjWlYL
 yu/tsGUqZEdkDKezVLQrKJM+zXeXo9XJTrdNhouncghrqTBkVEvp6G3KhKEAWABbZqgA tg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tjf5m8v19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Oct 2023 15:25:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 396FPU56003257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Oct 2023 15:25:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 6 Oct
 2023 08:25:30 -0700
Message-ID: <32e14a51-6c0a-efae-1601-07aa6e9537a2@quicinc.com>
Date: Fri, 6 Oct 2023 09:25:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu: Don't enter d0i3 during FLR
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231003064213.1527327-1-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231003064213.1527327-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lHQwmIIakIv3dDGNsCI-X4-FECwJHJ0L
X-Proofpoint-ORIG-GUID: lHQwmIIakIv3dDGNsCI-X4-FECwJHJ0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060115
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/2023 12:42 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Fix a bug on some platforms where FLR causes complete system
> hang when CPU is low power states (C8 or above).

Why does FLR cause a complete system hang?  Why does avoiding d0i3 fix 
the issue?  Feels like there could be a lot more detail here.

> 
> Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c     | 11 ++++++++---
>   drivers/accel/ivpu/ivpu_drv.h     |  1 +
>   drivers/accel/ivpu/ivpu_hw.h      |  8 ++++++++
>   drivers/accel/ivpu/ivpu_hw_37xx.c |  1 +
>   drivers/accel/ivpu/ivpu_hw_40xx.c |  1 +
>   drivers/accel/ivpu/ivpu_pm.c      |  3 ++-
>   6 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 3f4efa07ce7c..1eb232e903e8 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -367,14 +367,19 @@ int ivpu_boot(struct ivpu_device *vdev)
>   	return 0;
>   }
>   
> -int ivpu_shutdown(struct ivpu_device *vdev)
> +void ivpu_prepare_for_reset(struct ivpu_device *vdev)
>   {
> -	int ret;
> -
>   	ivpu_hw_irq_disable(vdev);
>   	disable_irq(vdev->irq);
>   	ivpu_ipc_disable(vdev);
>   	ivpu_mmu_disable(vdev);
> +}
> +
> +int ivpu_shutdown(struct ivpu_device *vdev)
> +{
> +	int ret;
> +
> +	ivpu_prepare_for_reset(vdev);
>   
>   	ret = ivpu_hw_power_down(vdev);
>   	if (ret)
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 98380c1db9fa..a3b45032e6cf 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -158,6 +158,7 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link);
>   
>   int ivpu_boot(struct ivpu_device *vdev);
>   int ivpu_shutdown(struct ivpu_device *vdev);
> +void ivpu_prepare_for_reset(struct ivpu_device *vdev);
>   
>   static inline u8 ivpu_revision(struct ivpu_device *vdev)
>   {
> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
> index ab341237bcf9..1079e06255ba 100644
> --- a/drivers/accel/ivpu/ivpu_hw.h
> +++ b/drivers/accel/ivpu/ivpu_hw.h
> @@ -13,6 +13,7 @@ struct ivpu_hw_ops {
>   	int (*power_up)(struct ivpu_device *vdev);
>   	int (*boot_fw)(struct ivpu_device *vdev);
>   	int (*power_down)(struct ivpu_device *vdev);
> +	int (*reset)(struct ivpu_device *vdev);
>   	bool (*is_idle)(struct ivpu_device *vdev);
>   	void (*wdt_disable)(struct ivpu_device *vdev);
>   	void (*diagnose_failure)(struct ivpu_device *vdev);
> @@ -91,6 +92,13 @@ static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
>   	return vdev->hw->ops->power_down(vdev);
>   };
>   
> +static inline int ivpu_hw_reset(struct ivpu_device *vdev)
> +{
> +	ivpu_dbg(vdev, PM, "HW reset\n");
> +
> +	return vdev->hw->ops->reset(vdev);
> +};
> +
>   static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
>   {
>   	vdev->hw->ops->wdt_disable(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index edd4d860f135..1e842739e937 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -1036,6 +1036,7 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
>   	.power_up = ivpu_hw_37xx_power_up,
>   	.is_idle = ivpu_hw_37xx_is_idle,
>   	.power_down = ivpu_hw_37xx_power_down,
> +	.reset = ivpu_hw_37xx_reset,
>   	.boot_fw = ivpu_hw_37xx_boot_fw,
>   	.wdt_disable = ivpu_hw_37xx_wdt_disable,
>   	.diagnose_failure = ivpu_hw_37xx_diagnose_failure,
> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
> index a48cd36f9931..d7b8ec0410af 100644
> --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
> @@ -1186,6 +1186,7 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
>   	.power_up = ivpu_hw_40xx_power_up,
>   	.is_idle = ivpu_hw_40xx_is_idle,
>   	.power_down = ivpu_hw_40xx_power_down,
> +	.reset = ivpu_hw_40xx_reset,
>   	.boot_fw = ivpu_hw_40xx_boot_fw,
>   	.wdt_disable = ivpu_hw_40xx_wdt_disable,
>   	.diagnose_failure = ivpu_hw_40xx_diagnose_failure,
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 28a0d1111e12..da46f95b008a 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -261,7 +261,8 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
>   	ivpu_dbg(vdev, PM, "Pre-reset..\n");
>   	atomic_inc(&vdev->pm->reset_counter);
>   	atomic_set(&vdev->pm->in_reset, 1);
> -	ivpu_shutdown(vdev);
> +	ivpu_prepare_for_reset(vdev);
> +	ivpu_hw_reset(vdev);
>   	ivpu_pm_prepare_cold_boot(vdev);
>   	ivpu_jobs_abort_all(vdev);
>   	ivpu_dbg(vdev, PM, "Pre-reset done.\n");

