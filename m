Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECBE6F792F
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 00:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A436310E53C;
	Thu,  4 May 2023 22:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876910E53C;
 Thu,  4 May 2023 22:34:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344MTPCr001012; Thu, 4 May 2023 22:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/Lv0bJIN+ShY3qSC4jGguki7sQttneND8/KAditTJBk=;
 b=YpPAu+Qn3gcZ/y7FY989wlECqQiqUZcmF7ZxbEk6sdl+un+99h8UEKfZpnbhlGiewToc
 NOC+DxNcpT0qpezM+F5J9IDzedUijymmeu2ePCF8PJJpr7K5pOma4PwoJuZxwGtZrB2c
 OmkKGnyZlHIPX3LC1//5E/bHL7JA3d+Od07sVFhf7E3kWdRaUDPHaGasdl8mIyN5EQ3e
 tDm6cxzykr5AlVmB3153K+JJGw2nltgp1xdJJ4SJN52QKQ8v8/B9GgUUXqgVLsHP8NRp
 uyW/hmxdMtrHzkVGbTtzp91HVuOhdFc/6eULkCg5k1gl/ZvcmpvPIMd+lvTl9RRmvwDH Jw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc5042cva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 22:34:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 344MY9pl001521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 4 May 2023 22:34:09 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 4 May 2023
 15:34:09 -0700
Message-ID: <4e7f88f9-037b-b5d4-3079-81f394da657f@quicinc.com>
Date: Thu, 4 May 2023 15:34:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 6/7] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-6-cb7f59f0f7fb@quicinc.com>
 <ynr6n5p2envixdn6pycjo4fat6n64xe4pkplhq5c2ukhi2q2tf@hqlsuusl66cl>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ynr6n5p2envixdn6pycjo4fat6n64xe4pkplhq5c2ukhi2q2tf@hqlsuusl66cl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RF3tCV6BhW5bZOiKq1hn7pwbIEzpXcYT
X-Proofpoint-ORIG-GUID: RF3tCV6BhW5bZOiKq1hn7pwbIEzpXcYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_13,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305040182
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2023 2:56 PM, Marijn Suijten wrote:
> On 2023-04-12 16:25:20, Jessica Zhang wrote:
>> hdisplay for compressed images should be calculated as bytes_per_slice *
>> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
>> dsi_timing_setup instead of directly using mode->hdisplay.
>>
>> Changes in v3:
>> - Split from previous patch
>> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>>    dsi_timing_setup as to not break dual DSI calculations
>>
>> Changes in v4:
>> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 508577c596ff..ae966d4e349d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>   		 * pulse width same
>>   		 */
>>   		h_total -= hdisplay;
>> -		hdisplay /= 3;
>> +		hdisplay = msm_dsc_get_pclk_per_intf(msm_host->dsc) / 3;
> 
> This patch is unfortunately regressing the Sony Xperia XZ3 (sdm845,
> single DSI), which will only show garbage when it is applied.
> 
> Are you sure this is correct, and the helper is returning the right
> values?  I'll see if I can help review and validate those later, and
> debug if necessary.

Hi Marijn,

Just checking, are you testing this with the DSI for DSC v1.2 changes? 
That series includes a fix to the word count calculation [1] needed to 
get DSC working.

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/patch/535115/?series=117219&rev=1

> 
> - Marijn
> 
>>   		h_total += hdisplay;
>>   		ha_end = ha_start + hdisplay;
>>   	}
>>
>> -- 
>> 2.40.0
>>
