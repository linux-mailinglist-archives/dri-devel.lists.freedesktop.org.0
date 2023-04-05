Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F375F6D714D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53C810E0B6;
	Wed,  5 Apr 2023 00:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C4A10E7FE;
 Wed,  5 Apr 2023 00:33:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3350VG4b024405; Wed, 5 Apr 2023 00:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=88jVywWJf5HnaUF3AQyRSnm/7A7b4dzDSCgr8veIHXo=;
 b=A8vUom3+02z4x4w7WJhDNHs6TEeRMGYB4qVkQVccf1cuDgx0rKciW5M+LL8huzRivGjz
 K9gQooqZPoew4fpDdV9RqFGqcadkSACZoAfqcbbUnROnn/evlhghmFkPhDY9cT9AtOtg
 tarYcd/SwOMlKmZDR2J0FJErg1kwF3YJg/nrcjoLwNar/1ojo9rnk4b9vdsICsLnCZjW
 Kcohaor9A5QQZaZQjHi+4hEh8eLLeStDvenhnQnhKMRN77mVyGjk3eZaWxdMZJQFRV7k
 aFHpIIEp3pPToWiKoJ2LUvGWCzmsvOxuNYhuz3XBUwZs3Lqn30j5mMJ+VxN2CbpACjTx Bg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prn8b1jfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 00:33:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3350XYJ8024464
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 00:33:34 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 17:33:33 -0700
Message-ID: <06c7ee67-218c-820c-92d2-a569299cc5e8@quicinc.com>
Date: Tue, 4 Apr 2023 17:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 5/6] drm/msm/dsi: update hdisplay calculation for
 dsi_timing_setup
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v3-5-6bec0d277a83@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v3-5-6bec0d277a83@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hweFf7anNSin17PGM7dafY7vkKn5TGw9
X-Proofpoint-ORIG-GUID: hweFf7anNSin17PGM7dafY7vkKn5TGw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_13,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050002
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/2023 4:56 PM, Jessica Zhang wrote:
> hdisplay for compressed images should be calculated as bytes_per_slice *
> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> Changes in v3:
> - Split from previous patch
> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>    dsi_timing_setup as to not break dual DSI calculations
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6a6218a9655f..9c33060e4c29 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -912,6 +912,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	DBG("");
>   
> +	if (msm_host->dsc)
> +		hdisplay = msm_dsc_get_uncompressed_pclk_per_intf(msm_host->dsc);
> +

bonded-dsi with DSC is really not a tested configuration. If you move 
this line to before the if (is_bonded_dsi), then you will be dividing /2 
on a compressed value. That wont make sense.

I would still move this back to the if (msm_host->dsc) that way, 
bonded_dsi first divides hdisplay/2 on an uncompressed mode->hdisplay 
then DSC does its math on top of that.

>   	/*
>   	 * For bonded DSI mode, the current DRM mode has
>   	 * the complete width of the panel. Since, the complete
> 
