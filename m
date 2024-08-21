Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF07959206
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 03:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0859910E544;
	Wed, 21 Aug 2024 01:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YpHYFzeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67310E544;
 Wed, 21 Aug 2024 01:05:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KKXL1f020622;
 Wed, 21 Aug 2024 01:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Lj0rG7v/8nItHKx7L0DEpJWHtIBseFbN4ecBj5fracw=; b=YpHYFzeP4zztHZzk
 qng8aUZjmdHR7BkMES/ylIQMRY5+OlZrr4jIKZjarslX1cyyxjqqdLvRY8gNKP1j
 IRNZw67TXCZCkAK15/6LUsh11sI6p/dEHG5+KRAWNeVxUzgdxav0vpxHYdb6QRO4
 BVptuPI0oBXqV6cG5T6TjTFSAhCP8TKwtX+umlR5azoxZ6qbzfOgJ4T8/NDdPys2
 3CwYTR8mKuM7PMr+adYbfHAY289BFUmitBmr9KyuDSaLSfugZJGcLiijVspjWz++
 MTb6rZKodYqJqovo4HcIz5qdEC0eDlt7Z1uEefGxVyCGUGb3HO5MB1ae1IzYg+QA
 MeCloA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412key9cfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2024 01:05:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L15tRr027556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2024 01:05:55 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 18:05:55 -0700
Message-ID: <bbe1fd30-7f13-46b2-b464-4d93d45e44ca@quicinc.com>
Date: Tue, 20 Aug 2024 18:05:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
To: Harry Wentland <harry.wentland@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Arthur Grillo
 <arthurgrillo@riseup.net>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-4-harry.wentland@amd.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240819205714.316380-4-harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BVX-aCqftIGC4tkbYDi1bO5444_MmrkV
X-Proofpoint-GUID: BVX-aCqftIGC4tkbYDi1bO5444_MmrkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_19,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408210006
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

On 8/19/24 13:56, Harry Wentland wrote:
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
> 
> v5:
>  - Bring back static for lerp_u16 and get_lut_index (Arthur)
> 
> v4:
>  - Test the critical points of the lerp function (Pekka)
> 
> v3:
>  - Use include way of testing static functions (Arthur)

note version information is usually after the "---" so that it not part
of the final git history

> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 163 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c          |   4 +
>  4 files changed, 176 insertions(+)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..c1f8b343ff0e 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,8 @@ config DRM_VKMS
>  	  a VKMS.
>  
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS && KUNIT
> +	default KUNIT_ALL_TESTS
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VKMS=y
> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> new file mode 100644
> index 000000000000..fc73e48aa57c
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
...
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");
> \ No newline at end of file

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1. Recently, multiple
developers have been eradicating these warnings treewide, and very few
are left, so please don't introduce a new one :)

Please add the missing MODULE_DESCRIPTION()

/jeff
