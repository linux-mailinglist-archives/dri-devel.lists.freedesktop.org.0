Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179770CCBF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604C310E0C2;
	Mon, 22 May 2023 21:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2916010E0C2;
 Mon, 22 May 2023 21:45:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MKiCfw000460; Mon, 22 May 2023 21:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7zzV4se+9XO1mSACSy/SpYmNuDRpqT0xaYJqgBHjy58=;
 b=RCpbguHzxiGKUKkHbhkTtJBzLXbwbpk0hk/v2YsjUCoSYvBiZwqu0fqyAjSLKd+d/z/D
 uUkb99DOwRt5p8ZsYjqAIqRHM0GcdS1Wy/sI55lo8eiXna4syvHJPO4vCgaEu2PHwo70
 S6k72Nwt5hs3nUgLGAP6Wk4t7/YJKGzJnx8gKtrNdC18d3qj2XvrRI6GzZ+1b1x2vX0t
 MHJy/R24TnWHXM7SpYBZQ5uVjuJHgMi3G/2o3afGEPCVYxY8tQevUcNnf5WtlDjYf+5a
 pxDChn3/xiGP0UiCIJcCdg4k5VBjFSPpJkBOP0bvK+CoveH2Iy9GkPAHUdDUwzFxbLF+ Ig== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qppypcmg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:45:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MLj2CY020785
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 21:45:02 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 14:45:01 -0700
Message-ID: <a93c3c36-f262-b89d-8452-98120cffb491@quicinc.com>
Date: Mon, 22 May 2023 14:45:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3Sa6fvhNoISaab_aKiS4vw2UVTrYVWdE
X-Proofpoint-GUID: 3Sa6fvhNoISaab_aKiS4vw2UVTrYVWdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_16,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220184
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/22/2023 1:44 PM, Marijn Suijten wrote:
> On 2023-05-22 13:30:20, Jessica Zhang wrote:
>> Currently, when compression is enabled, hdisplay is reduced via integer
>> division. This causes issues for modes where the original hdisplay is
>> not a multiple of 3.
>>
>> To fix this, use DIV_ROUND_UP to divide hdisplay.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Nit: probably these should go in the opposite order.  And if they're
> all supposed to be chronological, I think it is:
> 
>      Suggested-by:
>      Fixes:
>      Signed-off-by:
>      Reviewed-by:
> 
> But unsure if that's a hard requirement, or even correct at all.

Hi Marijn,

I don't see any explicit documentation on the order of R-b tags. FWIW, I 
see in the git log that S-o-b always goes at the bottom of the commit 
message.

I would prefer the S-o-b to always be at the bottom (as it helps me 
avoid duplicate S-o-b's when doing `git commit -s`), though I can flip 
the order of the R-b and suggested-by tags.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9223d7ec5a73..18d38b90eb28 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		 * pulse width same
>>   		 */
>>   		h_total -= hdisplay;
>> -		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
>> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>   		h_total += hdisplay;
>>   		ha_end = ha_start + hdisplay;
>>   	}
>>
>> -- 
>> 2.40.1
>>
