Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB59A4CA0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 11:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94910E270;
	Sat, 19 Oct 2024 09:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="md0/PKJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741CA10E270;
 Sat, 19 Oct 2024 09:32:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49J6QlrC000372;
 Sat, 19 Oct 2024 09:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Hgx2tTwrqqvVBfxhaLy1gvXS
 6S7MhvjClP7ml6upya8=; b=md0/PKJK8DiQcoyWfDEg27QQrA9aHyibg2bRRAHE
 K9w14w6lpr1LQn/5XI9LyqtpE6uBV03bMeKtD5LH5deZGqakkdor3yn1EW1nDhve
 9jU3Iwp6j34y+TlPgaCXKEzqPAys0YNCsl43ARazc1CLyvb1E7AVF5xFIztdpq93
 L8sP2EDB88WAQh+/ywQmQ1sb5Fy6GnhLssGg4UdtgSy94cSdbNIxncFq1fb3z+aY
 ZaZ8NDD+1ZmfSoGQ1u0zcp/dXoHxLASQRSInPgSYnC6w21CNWyu4qeOsUKw26/bs
 VjAdaF7Qz276oHR3XkR3vRSmPMDAfice83vsg5UBsLzQnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vxra2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 09:31:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49J9Vu9F019795
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2024 09:31:56 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 19 Oct 2024 02:31:50 -0700
Date: Sat, 19 Oct 2024 15:01:46 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Message-ID: <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
References: <20241018151143.3543939-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241018151143.3543939-1-arnd@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: c7ebgBZlxI-XvLuA55_ZBEz9X2lqhSug
X-Proofpoint-GUID: c7ebgBZlxI-XvLuA55_ZBEz9X2lqhSug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190068
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

On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang-19 and above sometimes end up with multiple copies of the large
> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> fill the structure, but these create another copy of the structure on
> the stack which gets copied to the first.
> 
> If the functions get inlined, that busts the warning limit:
> 
> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]

Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?

-Akhil.

> 
> Mark all of them as 'noinline_for_stack' ensure we only have one copy
> of the structure per function.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cdb3f6e74d3e..5699e0420eb8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -259,7 +259,8 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> -static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +/* noinline to avoid having multiple copies of 'msg' on stack */
> +static noinline_for_stack void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
>  	msg->bw_level_num = 1;
> @@ -287,7 +288,7 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> -static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	msg->bw_level_num = 13;
>  
> @@ -346,7 +347,7 @@ static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[0][0] = 0x40000000;
>  }
>  
> -static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
> @@ -385,7 +386,7 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][2] =  0x60000001;
>  }
>  
> -static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
> @@ -416,7 +417,7 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> -static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
> @@ -447,7 +448,7 @@ static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> -static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
> @@ -478,7 +479,7 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> -static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
>  	 * Send a single "off" entry just to get things running
> @@ -509,7 +510,7 @@ static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> -static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	msg->bw_level_num = 12;
>  
> @@ -565,7 +566,7 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] = 0x60000001;
>  }
>  
> -static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	msg->bw_level_num = 1;
>  
> @@ -590,7 +591,7 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] = 0x60000001;
>  }
>  
> -static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +static noinline_for_stack void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
>  	msg->bw_level_num = 1;
> -- 
> 2.39.5
> 
