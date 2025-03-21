Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F6A6BF6F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DB010E7F5;
	Fri, 21 Mar 2025 16:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oU7Fs3ea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301B10E7F5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:15:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATAxR022089;
 Fri, 21 Mar 2025 16:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MBRdEC2YlUOGNuYmFaUCuGN/I3DKMV8CuIRZm9h64e4=; b=oU7Fs3eaxw4keBvW
 9o7y/e38Sp5Sn2DxoMVfGfnzWgYEAD8ifRW+BEVes6Gkmka2BXisi4e+XqOSqEnd
 Y5jb39nKZ5jZXRrrR9WvsH0yHGAZnl6lbjyJugQZRzNUZLBOcQP95kuDbX4Zs9CA
 YpxXtLdVBMgZmqEpkplwqTH2CGoRqimllEgzeCfLMhVEBxi89Ozrf+21P+XDpvT8
 BCD6fJWEEh83NpGTgOGy6KO4/cxbMwQ7XNUMeOlmtsuTNlRO2YSWHGU5P4bUoCNL
 rDUZIL+dMzkDpdCk0rlpKYKST/T9a+dldEDsx6K7hhjTebc7miRm+hBtP/BzB+gR
 YToBng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wph8c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Mar 2025 16:15:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LGFRVj014152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Mar 2025 16:15:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 09:15:26 -0700
Message-ID: <6cf7d790-57a8-40b9-b5b0-dedfce78d074@quicinc.com>
Date: Fri, 21 Mar 2025 10:15:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-7-d4dbcfafc141@tomeuvizoso.net>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250225-6-10-rocket-v2-7-d4dbcfafc141@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BOfd9NSv-9Zt74cr0Av2_wp2C2GJ3ORR
X-Proofpoint-GUID: BOfd9NSv-9Zt74cr0Av2_wp2C2GJ3ORR
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd90a0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=ZfkCZY2BxkJJNCUMkzUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=916 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210119
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

On 2/25/2025 12:55 AM, Tomeu Vizoso wrote:
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_rocket_fini_bo *args = data;
> +	struct drm_gem_object *gem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_shmem_object *shmem_obj;
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +
> +	gem_obj = drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	rkt_obj = to_rocket_bo(gem_obj);
> +	shmem_obj = &rkt_obj->base;
> +
> +	WARN_ON(rkt_obj->last_cpu_prep_op == 0);
> +
> +	for (unsigned int core = 1; core < rdev->num_cores; core++) {
> +		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
> +					    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
> +	}
> +
> +	rkt_obj->last_cpu_prep_op = 0;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return 0;
> +}

flags must be 0, and you must check that here. You do not appear to be 
doing that. Otherwise, userspace may put a value in flags, which is 
ignored now, but later when you define flags for a purpose, existing 
userspace will be broken - a uapi violation.
