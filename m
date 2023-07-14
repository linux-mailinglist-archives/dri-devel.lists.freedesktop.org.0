Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B251754326
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 21:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D910E8CE;
	Fri, 14 Jul 2023 19:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0112710E392;
 Fri, 14 Jul 2023 19:17:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36ECv7GJ026462; Fri, 14 Jul 2023 19:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1wDVDRCC7K8Tio5hvLPcb5INci5lIChVVfHQTRRMod4=;
 b=KHWype9khF3l8NMh/boE9/K2CNDEwDvuGcmeMCIMoe4duj31psug736RLhCfsxUo60cs
 niVLCkhKVxXlkCFC+4eJ9EJ5Jo1ojNfbrPXgvjfu00fLxfVa+9R4cwxNp2Teig2UBuwP
 3IyjAYtTbvNtCQAH7ZFDfz0awlXRTHlOglhri10wW69XxR492jNrI2P+OIZrvjNxPwqu
 9rkoT5ENIF2pzMkf4G7rVcW1aCD1TmlSb/S/U4HDpkDta/Ag6cABE/bVr84u5fQ9vab8
 EeAt+aEwqvJx21i/xwXaHaFohSL7W+xC4iYtbZIoqW9gaitRW3HQxYU8sGBFZFI9/yPP Mg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpts2p6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 19:17:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EJHjAZ007868
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 19:17:45 GMT
Received: from [10.110.103.248] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 12:17:44 -0700
Message-ID: <8228c4ce-280d-1795-3598-76753fbb3b38@quicinc.com>
Date: Fri, 14 Jul 2023 12:17:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3 2/3] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, <liviu.dudau@arm.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
 <sam@ravnborg.org>, <quic_eberman@quicinc.com>, <a39.skl@gmail.com>,
 <quic_gurus@quicinc.com>, <angelogioacchino.delregno@somainline.org>,
 <james.qian.wang@arm.com>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-3-cuigaosheng1@huawei.com>
 <bd0ef83b-bb57-4dce-a866-18ae6a755e96@quicinc.com>
In-Reply-To: <bd0ef83b-bb57-4dce-a866-18ae6a755e96@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MBHv5yvFJqYIFwwvNKLn2qEc1lV8-hGk
X-Proofpoint-ORIG-GUID: MBHv5yvFJqYIFwwvNKLn2qEc1lV8-hGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_09,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140176
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



On 7/14/2023 12:10 PM, Abhinav Kumar wrote:
> 
> 
> On 7/13/2023 6:48 PM, Gaosheng Cui wrote:
>> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
>> use IS_ERR() to check the return value.
>>
> 
> use IS_ERR_OR_NULL()
> 
> I can even fix this while applying
> 

Actually even subject line needs correction, so better you push another 
rev.

>> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c 
>> b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index a99310b68793..bbb1bf33f98e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, 
>> struct msm_gem_submit *submit
>>                * since we've already mapped it once in
>>                * submit_reloc()
>>                */
>> -            if (WARN_ON(!ptr))
>> +            if (WARN_ON(IS_ERR_OR_NULL(ptr)))
>>                   return;
>>               for (i = 0; i < dwords; i++) {
