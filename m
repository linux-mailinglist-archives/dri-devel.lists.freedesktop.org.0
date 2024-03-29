Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F125892377
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 19:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D86310F8FC;
	Fri, 29 Mar 2024 18:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aHCraI5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA6C10FB46;
 Fri, 29 Mar 2024 18:39:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42THvciQ015978; Fri, 29 Mar 2024 18:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=yRTwX+qHIYV9yXVJsqfoQZk6JWIEWiuhlYjrIn5+DXs=; b=aH
 CraI5USeigX/vwtHYajXj9vCMHNSl452e2ql/1xW7eEDwgkwhmWqQK+ytMx9J8r1
 uZywaiYb32zK3GSPsX2hyPMNIpK0szHL3JCryQb1/JGC9zXnsYIqnZwc1deFZppM
 1Edusrnr0QfgTSIFifCZT/xW3mefb2xQkBO7BrFbaTRL+ved2SpDiDaf76HMWdpY
 d3t0ooM0KFWHjtUavM5nMDcO4BVayvK4blCVf/HZwlP9O1dyrOp121Vr8Tc6flrB
 IVQFf3gbA3sC+AG9sx49KVveHHmwwZd4v3fZt/7bitMtKiWveg5nPZPE8YplBuZq
 ME6V/eWhm/cU+l7kiZSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5w6g0tbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 18:39:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TIdGoU005391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 18:39:16 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 11:39:13 -0700
Message-ID: <da9dcd58-41c1-089c-2061-be3bad6349a7@quicinc.com>
Date: Fri, 29 Mar 2024 11:39:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: fix the `CRASHDUMP_READ` target of
 `a6xx_get_shader_block()`
Content-Language: en-US
To: Miguel Ojeda <ojeda@kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240326212324.185832-1-ojeda@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240326212324.185832-1-ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P0GcQC4Y0AiUXacx71zjBPF3HBkp2tqH
X-Proofpoint-ORIG-GUID: P0GcQC4Y0AiUXacx71zjBPF3HBkp2tqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=948
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290165
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



On 3/26/2024 2:23 PM, Miguel Ojeda wrote:
> Clang 14 in an (essentially) defconfig arm64 build for next-20240326
> reports [1]:
> 
>      drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error:
>      variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
> 
> The variable `out` in these functions is meant to compute the `target` of
> `CRASHDUMP_READ()`, but in this case only the initial value (`dumper->iova
> + A6XX_CD_DATA_OFFSET`) was being passed.
> 
> Thus use `out` as it was intended by Connor [2].
> 
> There was an alternative patch at [3] that removed the variable
> altogether, but that would only use the initial value.
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/lkml/CACu1E7HhCKMJd6fixZSPiNAz6ekoZnkMTHTcLFVmbZ-9VoLxKg@mail.gmail.com/ [2]
> Link: https://lore.kernel.org/lkml/20240307093727.1978126-1-colin.i.king@gmail.com/ [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---


LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
