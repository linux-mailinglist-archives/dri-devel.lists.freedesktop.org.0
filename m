Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B48C28D9
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092EB10EEA2;
	Fri, 10 May 2024 16:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cJJBZm6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F810EEA2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:41:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADjqR4025156;
 Fri, 10 May 2024 16:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=AWzLAgsWF96JK0Km4TnWgrcGEChXwbKX/E7wujpRwoU=; b=cJ
 JBZm6kEvYwCuCDMRW1HAvfCE9ZGLihkjlNSwBpFNJvYcLbwGCyiSINoqezSOp7Ps
 6aZD/lTB2SEyVDBkbg1Jn7vJKe73lAwGNgxIABeWnEtlyT3qZsKrPtGIPwml0NEP
 8g2wbwxhGQvVYUCnYGhJscd+AlAlxq+B9C4Cxa8J4fjlJlOzN6zrUVDoPTElTypC
 C2H5fAxY3v0QG7CxcfqAVkibwtPPMRZxzLm6pG67cdMsQDQlSRxAxCh+cAw2DoaF
 iXBid+UB5r+cok5g24gVrqqDlxa2oSjv4DzDB8RjLeaxGFQrOjOZhMoSFrVExY2J
 4L7IBc8gsozDHSdQghow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w29ydk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:41:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AGfQn2009088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:41:26 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 09:41:26 -0700
Message-ID: <bc64b7c8-745b-1617-035c-b32f44ad0323@quicinc.com>
Date: Fri, 10 May 2024 10:41:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 06/12] accel/ivpu: Implement support for hardware scheduler
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-7-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240508132106.2387464-7-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _uaMWaK4XIfgdVTY7VLgsKYvi8QFEDsU
X-Proofpoint-ORIG-GUID: _uaMWaK4XIfgdVTY7VLgsKYvi8QFEDsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=993
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100121
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

On 5/8/2024 7:21 AM, Jacek Lawrynowicz wrote:
> +#define IVPU_FOCUS_PRESENT_TIMER_MS 1000
> +
>   static char *ivpu_firmware;
>   module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
>   MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
> @@ -467,6 +469,10 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>   		 boot_params->punit_telemetry_sram_size);
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
>   		 boot_params->vpu_telemetry_enable);
> +	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_scheduling_mode = 0x%x\n",
> +		 boot_params->vpu_scheduling_mode);
> +	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_focus_present_timer_ms = %u\n",
> +		 boot_params->vpu_focus_present_timer_ms);

The timer value is hard coded.  Does that not make this log message 
redundant?

-Jeff
