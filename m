Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA338C023C
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 18:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5D21130AA;
	Wed,  8 May 2024 16:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="D3y5bDv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3931130A6;
 Wed,  8 May 2024 16:46:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Cr692003477;
 Wed, 8 May 2024 16:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=QQcRbdP1TrvOiwGcWZc8A7ebL2foBKGMw4vYbB1n7bk=; b=D3
 y5bDv/ww6Gsn4leQKJRvhzlrQuNVlWUB+efWhxZurCy2SNgVYm09D6+5gd8+FAjl
 leD3WGRZR8RtWk5SIZ+fQMink1+U4JJfnsMDy+WKmvah9fClpo2UTwV6Xg1h43zO
 b8O1jIXTCxsQyxmaO8E1QfFGzJkh1sxWQIcoaN0YHD9NerxBtVKqLNrUqMDnH1kQ
 ZU3lFrFgfQhGnnz0U1XhkEV3YxvoXRR/qIKw16CWJtJDlX9Z72ynmlkAOZPLnjTX
 Uh7Hg06Z/GMr1iOzhAVID8lwNGsMmbpNdkdJJ4NxTPNUym80PqozuSaQNvx+HV9I
 gCej8JgLlS547Xiv1nRg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930rpt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 May 2024 16:46:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448Gk4MM008246
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 May 2024 16:46:04 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:46:04 -0700
Message-ID: <83b6e1aa-c8ec-0bd7-2c98-20705741b76a@quicinc.com>
Date: Wed, 8 May 2024 09:46:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for python earlier than v3.9
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20240508091751.336654-1-jonathanh@nvidia.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240508091751.336654-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fr03b_TBEt47KehI53EoPrrGLuPf96TJ
X-Proofpoint-ORIG-GUID: fr03b_TBEt47KehI53EoPrrGLuPf96TJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080121
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



On 5/8/2024 2:17 AM, Jon Hunter wrote:
> Building the kernel with python3 versions earlier than v3.9 fails with ...
> 
>   Traceback (most recent call last):
>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
>       main()
>     File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
>       parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
>   AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> 
> The argparse attribute 'BooleanOptionalAction' is only supported for
> python v3.9 and later. Fix support for earlier python3 versions by
> explicitly defining '--validate' and '--no-validate' arguments.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/gpu/drm/msm/registers/gen_header.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks for your patch, I had sent something similar y'day.

If you are alright with https://patchwork.freedesktop.org/patch/593057/, 
we can use that one.

> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index fc3bfdc991d2..64f67d2e3f1c 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -948,7 +948,8 @@ def main():
>   	parser = argparse.ArgumentParser()
>   	parser.add_argument('--rnn', type=str, required=True)
>   	parser.add_argument('--xml', type=str, required=True)
> -	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> +	parser.add_argument('--validate', dest='validate', action='store_true')
> +	parser.add_argument('--no-validate', dest='validate', action='store_false')
>   
>   	subparsers = parser.add_subparsers()
>   	subparsers.required = True
