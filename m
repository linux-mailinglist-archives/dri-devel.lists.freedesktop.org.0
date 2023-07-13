Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2D375293C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A3710E70E;
	Thu, 13 Jul 2023 16:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DE110E70E;
 Thu, 13 Jul 2023 16:57:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36DGSEla017820; Thu, 13 Jul 2023 16:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E+iCmzi+T84WCDzIffC9UkofVQ5H6j3XpH/JCpKBIi4=;
 b=ew3LbUTGRB3p7OnXlYJsc8sBhwwbi8/m9uwEe6M3A+1oNMmtsFRFlvA4IkFCL9gIpaTh
 ui4kDRZQowvnvFL5FGsZ3ESXTtGmUVgWMvo2tTwV65c+f5WayGuXLaEOphR/RE8FXH5x
 wfC84FRRwnhiXeeeifCvxqmer8ne5cvkqYvG60YS2U32UAkYZTyABSaa1giMtoIWE9Dd
 wQIR7hUimwMoAgLVboUtXSowmALWAzN27Fyz91eIAo+lwwW/yaM6SvYajozVaYEHQZfo
 UcWZt5tOwskT6aPF6vzixa8o+h8OXikohTosyUGYYBMAl9p8mllFCpgU4Cx4CKtz6kx8 kQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtbmusaaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 16:56:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36DGunSW005740
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jul 2023 16:56:49 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 13 Jul
 2023 09:56:48 -0700
Message-ID: <28acc9a1-8289-2a84-8781-c082179e8c87@quicinc.com>
Date: Thu, 13 Jul 2023 09:56:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, <liviu.dudau@arm.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <quic_eberman@quicinc.com>, <a39.skl@gmail.com>,
 <quic_gurus@quicinc.com>, <angelogioacchino.delregno@somainline.org>,
 <james.qian.wang@arm.com>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-3-cuigaosheng1@huawei.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230713020556.1956639-3-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ujmFfedV5opBeM1onJK0KAbec_oE1LnG
X-Proofpoint-ORIG-GUID: ujmFfedV5opBeM1onJK0KAbec_oE1LnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307130150
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



On 7/12/2023 7:05 PM, Gaosheng Cui wrote:
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

You dropped Dmitry's R-b in this revision.

https://patchwork.freedesktop.org/patch/511035/?series=110745&rev=1

If you are going to spin a v3, pls add it back. Otherwise I will while 
applying.

>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index a99310b68793..a499e3b350fc 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>   			 * since we've already mapped it once in
>   			 * submit_reloc()
>   			 */
> -			if (WARN_ON(!ptr))
> +			if (WARN_ON(IS_ERR(ptr)))
>   				return;
>   
>   			for (i = 0; i < dwords; i++) {
