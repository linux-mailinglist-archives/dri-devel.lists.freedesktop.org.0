Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B029C75430F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 21:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2695E10E037;
	Fri, 14 Jul 2023 19:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4110E037;
 Fri, 14 Jul 2023 19:11:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36EEWamv018044; Fri, 14 Jul 2023 19:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=x7TDTlhMddl8unTMhMFsuVOPLDaUEAR+dgjPrSfAJ4c=;
 b=ZKs5BfPnZyPXOvbWVRckNWreitVYh0OOS0UJzMyQWAHvS12HJA8Q2nCLtn0UQ2+r4PY1
 Mj3JSoBorr5DQxofEsOwyJsIoeg92R4vJ004RbaRexfuBRoxukQsPsyC799lhrmUhm34
 XTHRO9iL/UVvTS9rmxPmOV43vwVx7rtEWzeO7UIcwPUt4LwOTgk3QhV3VzrExzFo/Qtl
 iDJkQ5D54RBsf091kFd534knDjrRLKIdi2JY4rlAOHeQzVt7WxMJ/qu2bJuI+cTGa7Lm
 rGj6a2FDeGlBfRODjHJd1C0Bvgn/rMIyKYU7oB9tKPKdC8P/JAPDqIpHa7ofNZLbweq+ CA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptw2np0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 19:10:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EJArTv017969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 19:10:53 GMT
Received: from [10.110.103.248] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 12:10:52 -0700
Message-ID: <bd0ef83b-bb57-4dce-a866-18ae6a755e96@quicinc.com>
Date: Fri, 14 Jul 2023 12:10:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, <liviu.dudau@arm.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <quic_eberman@quicinc.com>, <a39.skl@gmail.com>,
 <quic_gurus@quicinc.com>, <angelogioacchino.delregno@somainline.org>,
 <james.qian.wang@arm.com>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-3-cuigaosheng1@huawei.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230714014820.2186203-3-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pwBwnxNvKAbbG84mEy5J_Yp_jkA4yFt7
X-Proofpoint-GUID: pwBwnxNvKAbbG84mEy5J_Yp_jkA4yFt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140175
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/13/2023 6:48 PM, Gaosheng Cui wrote:
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 

use IS_ERR_OR_NULL()

I can even fix this while applying

> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a99310b68793..bbb1bf33f98e 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>   			 * since we've already mapped it once in
>   			 * submit_reloc()
>   			 */
> -			if (WARN_ON(!ptr))
> +			if (WARN_ON(IS_ERR_OR_NULL(ptr)))
>   				return;
>   
>   			for (i = 0; i < dwords; i++) {
