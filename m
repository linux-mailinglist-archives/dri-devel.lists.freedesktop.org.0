Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4DF9F1161
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B602D10F061;
	Fri, 13 Dec 2024 15:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PSqyHddo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6946510F061
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:52:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD80m2b032708;
 Fri, 13 Dec 2024 15:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UgnROq1vuYgmqCuJXhX8nM6TKA3LlEqSCIyNjDl+1lE=; b=PSqyHddof6xOAqEx
 PbavCwcYKbToFnnGZgXowSbHvwSqoflYi+/rKk/ToviaWkqgmHqajRGowZXuU2SK
 Ecn2hBCUq0KsV8B9+5JetWlG5W4O7fa7ptoByXXw2HVFoTZi55uzuchRB+riPcWZ
 hJTQHihYPpvDsDFgp4+EcgaPZDuX3V83KefSpLEuFBQmB617PSx4oPzfaSOrzIGp
 3kPnfAvgUlNGC4JHgR6OEhUS9na3tfe5lznrozuZZD2KQNpFJHoUe2ln7HY6XDcP
 2dJZRcOUGl1FTwksjGQo5uEl6sMXy0WgPAtjpB+1WOIXxnUTzcqu+4Pps9G1p9kk
 ZTOXbw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfg37v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:52:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDFqALV029783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:52:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 07:52:09 -0800
Message-ID: <4823e374-cb3b-5a23-93c0-db7286e12679@quicinc.com>
Date: Fri, 13 Dec 2024 08:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/3] accel/ivpu: Fix general protection fault in
 ivpu_bo_list()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <stable@vger.kernel.org>, Karol Wachowski
 <karol.wachowski@intel.com>
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
 <20241210130939.1575610-2-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241210130939.1575610-2-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5SBk49dQkwv2oZsD42_l6GMavmjnPW0d
X-Proofpoint-ORIG-GUID: 5SBk49dQkwv2oZsD42_l6GMavmjnPW0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130113
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

On 12/10/2024 6:09 AM, Jacek Lawrynowicz wrote:
> Check if ctx is not NULL before accessing its fields.
> 
> Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
> Cc: <stable@vger.kernel.org> # v6.8
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index d8e97a760fbc0..16178054e6296 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -409,7 +409,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>   	mutex_lock(&bo->lock);
>   
>   	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
> -		   bo, bo->ctx->id, bo->vpu_addr, bo->base.base.size,
> +		   bo, bo->ctx ? bo->ctx->id : 0, bo->vpu_addr, bo->base.base.size,
>   		   bo->flags, kref_read(&bo->base.base.refcount));
>   
>   	if (bo->base.pages)

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
