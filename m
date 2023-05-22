Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A170C4E0
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C35E10E1A9;
	Mon, 22 May 2023 18:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD4810E1A9;
 Mon, 22 May 2023 18:03:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MGKIuS019507; Mon, 22 May 2023 18:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7FWcWoYpEo6qyXfPmpFBf5sJ3rHxVHmm/8f37QkNMa8=;
 b=EyALMqNaKyv9btn1NfDrTLqcPZbXFTT5KneJH1BIqCZdubobD6pU7UNhxG/MdOXXQyjy
 pQkEjzahAj8WAi+RL7PMxoQKC/nznKQHSKrl3rRV1pr0yptlDRKBqlFXvjHpVNDj+Vcz
 lFDo1S1gKtAH46mdLvEivBpYUQPmuwGNb163jrBJ/ZxT889ScifYi5qbleZxn8TbAWeR
 h0o2GR4QPsJCuxNIYGtA5kEDhmwTi40OZlOQNaEcQtCO8YchidCp1ZkIrB9jE/JS4yO5
 P66Pm4e4QlwWIp3C23wvxuaIfoi+tssOMvTBIKXS9w+6wLoshQuXueqy1wGAqjxM3GGZ vw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qppkdmfaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:03:33 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MI3WKB029508
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 18:03:32 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 22 May
 2023 11:03:31 -0700
Message-ID: <5059b759-2c9c-fd81-f9a8-37e4dccd3ea8@quicinc.com>
Date: Mon, 22 May 2023 11:03:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
 <20230405-add-dsc-support-v3-1-6e1d35a206b3@quicinc.com>
 <uh5cshbplstpnp7npqvnxwefyh7h4zur3vrkt626pdeczgdnya@s3mhsrlc4smy>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <uh5cshbplstpnp7npqvnxwefyh7h4zur3vrkt626pdeczgdnya@s3mhsrlc4smy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Rrk-t_FZVE1E-j1qlyTOgxSkuuoaZyaP
X-Proofpoint-GUID: Rrk-t_FZVE1E-j1qlyTOgxSkuuoaZyaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_12,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220152
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



On 5/20/2023 1:07 AM, Marijn Suijten wrote:
> On 2023-05-19 14:17:26, Jessica Zhang wrote:
>> Currently, when compression is enabled, hdisplay is reduced via integer
>> division. This causes issues for modes where the original hdisplay is
>> not a multiple of 3.
>>
>> To fix this, use DIV_ROUND_UP to divide hdisplay.
>>
>> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> This should have been:
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> Fixes: f3a99460406b ("drm/msm/dsi: update hdisplay calculation for dsi_timing_setup")
> 
> This hash is not valid (and checkpatch points it out...), as it is your
> local commit from the MSM DSC helper methods series.  The original issue
> was introduced in:
> 
> Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")

Hi Marijn,

Acked.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
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
