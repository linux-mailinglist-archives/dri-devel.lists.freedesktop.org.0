Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A427A751499
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7596B10E5FB;
	Wed, 12 Jul 2023 23:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551310E5F9;
 Wed, 12 Jul 2023 23:43:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CNX1Tg030629; Wed, 12 Jul 2023 23:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fJ7MHhQYTWb7ko2Juqp3TSzCdz39xMhEI0nHD1lAB6I=;
 b=DBhBnpp5CqdREEX8yCJClLfgStyT2VhI04Gvm4QeWdqSQQvVNhZYAIlu0r+ONXhfdP8w
 7ycx7L1J/RHiW8SrzAMafL6juGEno9xnGs4YwfLMxpexRDpGHjpDTn0Lhvm6B4MV9yb3
 rAN0vtPKGv+MiYkdQ5IA9ONB2u6xWq1BU8XKTn9Lmhumlecd9OIW8CneS8eUkNU34C8D
 A7gRLkmK60hjIkvh4omOsaR19LOQe+/EPTXhmyWhowRa8Lep/2RHoSWSQ1GU5Cm73W0W
 n2yppc9SlEZeyghhiJR8B8el4ZephSOgH9xW+5q3p7GM/8UYRl7mEuJ53b8ahzj/LDrh YQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsetdtv1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 23:42:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36CNgjp7032605
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 23:42:46 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 16:42:45 -0700
Message-ID: <efaf59e0-f51a-6de9-4d12-a795ed84cbab@quicinc.com>
Date: Wed, 12 Jul 2023 16:42:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, <james.qian.wang@arm.com>,
 <liviu.dudau@arm.com>, <mihail.atanassov@arm.com>,
 <brian.starkey@arm.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>,
 <sean@poorly.run>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <emma@anholt.net>, <mripard@kernel.org>, <vladimir.lypak@gmail.com>,
 <quic_akhilpo@quicinc.com>, <dianders@chromium.org>,
 <olvaffe@gmail.com>, <angelogioacchino.delregno@somainline.org>,
 <marijn.suijten@somainline.org>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-3-cuigaosheng1@huawei.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221110094445.2930509-3-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: y9XMVHdNrXlOCJYIos_FHM2aaSJ9GO8w
X-Proofpoint-GUID: y9XMVHdNrXlOCJYIos_FHM2aaSJ9GO8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_15,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120210
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



On 11/10/2022 1:44 AM, Gaosheng Cui wrote:
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
