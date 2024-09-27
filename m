Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E3988BBF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 23:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DE810E049;
	Fri, 27 Sep 2024 21:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PnqU91B6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7310E049
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 21:21:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RGVf22000697;
 Fri, 27 Sep 2024 21:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0yEClELjN+6bFKsB6IxQo97MQrne77x0cqZpeUk4ELA=; b=PnqU91B6j3vuiky1
 hOnr7RlvfOuGbxZqfIMB69VWywtfkgi0kLL1HM+8NGfIatsBwiZlRVZQAMcc3EIC
 Qb1EXj4ugq+OiDubRSeEccW0Cy4kZmGP5oBs2gl8YikVnZglW47P31zpSNoCRsz+
 c2Mk7cJ19bZIo7qo6GeAhcPHTasmCXgaVYzbvHLyPQQM9P5sxLEVqCJse0zIV+wX
 qZXA8M4xPRv6qd0OA2DE6OWZDVW59J/x1RbVsx/2q5+ueJ1SJF6wTniqcNOV7+wt
 RvXczHJZI0JmuZgCLXNDU9CkHoJWqMmSda/TGZSGtUfP27+YrKCLZuywjW1l6j7I
 pUHL6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9kx8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 21:21:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RLL7xs006038
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 21:21:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 14:21:07 -0700
Message-ID: <efd75ade-c451-6b11-0d2e-a8afae985091@quicinc.com>
Date: Fri, 27 Sep 2024 15:21:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 14/29] accel/ivpu: Add auto selection logic for job
 scheduler
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-15-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240924081754.209728-15-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nl_jhdVyJ9r6YJOdxNa-R84dYmGFnxuH
X-Proofpoint-GUID: nl_jhdVyJ9r6YJOdxNa-R84dYmGFnxuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=896 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270156
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

On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
> --- a/drivers/accel/ivpu/ivpu_sysfs.c
> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
> @@ -6,6 +6,8 @@
>   #include <linux/device.h>
>   #include <linux/err.h>
>   
> +#include "ivpu_drv.h"
> +#include "ivpu_fw.h"
>   #include "ivpu_hw.h"
>   #include "ivpu_sysfs.h"
>   
> @@ -39,8 +41,20 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
>   
>   static DEVICE_ATTR_RO(npu_busy_time_us);
>   
> +static ssize_t
> +sched_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ivpu_device *vdev = to_ivpu_device(drm);
> +
> +	return sysfs_emit(buf, "%s\n", vdev->fw->sched_mode ? "HW" : "OS");
> +}
> +
> +static DEVICE_ATTR_RO(sched_mode);
> +
>   static struct attribute *ivpu_dev_attrs[] = {
>   	&dev_attr_npu_busy_time_us.attr,
> +	&dev_attr_sched_mode.attr,
>   	NULL,
>   };
>   

No Documentation/ABI entry?
