Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99B78B9BF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 22:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69910E352;
	Mon, 28 Aug 2023 20:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6910E352
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 20:49:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SJOspd002905; Mon, 28 Aug 2023 20:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8z/XHrB2Cs8jTWowVA0e6uFyRkUgg0NoMlYLmk75m7o=;
 b=SuVKf6c9mihzvvhowBb3JWRg4557aTn7a91quJEJRCPHKq51viyEC1GwRnfa0LIc05Xl
 88jFtnFepZy/OORUkItmHMheAr///U6SzLykplSdcxMagSY8DKXlGviEmljvXkgtzXll
 imopYJrUOtyIm1vj1nUfbhutfedMM+jUUmXSAfWDxmBBgmQUKX3NM7wSlZwmvR0pLQpP
 t4wBr+ZQn9WzX7yiALJtpMozPZokK5svPkos5eDLMH3IcO8fiM5yNjq43PYikW4SliOV
 /iySwCm6YmIU0XhdNAY+vdPGi6m08KC2Kt4QO0I+eAbINqlwHJ5l1LZ8LnNK11vAfOE0 QQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sruhns1x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 20:49:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37SKnZpq010319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 20:49:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 13:49:34 -0700
Message-ID: <c1dcb25e-5a8a-9d25-deb5-81a81af16726@quicinc.com>
Date: Mon, 28 Aug 2023 14:49:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/9] accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-6-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230828094736.4137092-6-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nXaqg1TZnDuNDwR34fqBikHAs-DorMwo
X-Proofpoint-ORIG-GUID: nXaqg1TZnDuNDwR34fqBikHAs-DorMwo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_18,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280180
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

On 8/28/2023 3:47 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> ivpu_fw_load() doesn't have to be called separately in ivpu_dev_init().
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 4 ----
>   drivers/accel/ivpu/ivpu_fw.c  | 6 +++---
>   drivers/accel/ivpu/ivpu_fw.h  | 2 +-
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 5310b54f036d..fa0680ba9340 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -561,10 +561,6 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_ipc_fini;
>   
> -	ret = ivpu_fw_load(vdev);
> -	if (ret)
> -		goto err_job_done_thread_fini;
> -
>   	ret = ivpu_boot(vdev);
>   	if (ret)
>   		goto err_job_done_thread_fini;
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 9b6ecd3e9537..32a1ea322ca2 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -301,6 +301,8 @@ int ivpu_fw_init(struct ivpu_device *vdev)
>   	if (ret)
>   		goto err_fw_release;
>   
> +	ivpu_fw_load(vdev);
> +
>   	return 0;
>   
>   err_fw_release:
> @@ -314,7 +316,7 @@ void ivpu_fw_fini(struct ivpu_device *vdev)
>   	ivpu_fw_release(vdev);
>   }
>   
> -int ivpu_fw_load(struct ivpu_device *vdev)
> +void ivpu_fw_load(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
>   	u64 image_end_offset = fw->image_load_offset + fw->image_size;
> @@ -331,8 +333,6 @@ int ivpu_fw_load(struct ivpu_device *vdev)
>   	}
>   
>   	wmb(); /* Flush WC buffers after writing fw->mem */
> -
> -	return 0;
>   }
>   
>   static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> index 8567fdf925fe..10ae2847f0ef 100644
> --- a/drivers/accel/ivpu/ivpu_fw.h
> +++ b/drivers/accel/ivpu/ivpu_fw.h
> @@ -31,7 +31,7 @@ struct ivpu_fw_info {
>   
>   int ivpu_fw_init(struct ivpu_device *vdev);
>   void ivpu_fw_fini(struct ivpu_device *vdev);
> -int ivpu_fw_load(struct ivpu_device *vdev);
> +void ivpu_fw_load(struct ivpu_device *vdev);

If ivpu_fw_load() is defined in ivpu_fw.c and only used in ivpu_fw.c, do 
you need it in this header file anymore?  Seems like you could remove 
this, and also make the function static.

>   void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
>   
>   static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)

