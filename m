Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAF5FCEE5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 01:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8076410E0D9;
	Wed, 12 Oct 2022 23:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61F810E0D9;
 Wed, 12 Oct 2022 23:25:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CM0Aog025968;
 Wed, 12 Oct 2022 23:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ATY+rKANhUcA1m2bKUbEATQWhSBMgiL3uJ/rfeu58Ls=;
 b=mb4nROM10RQmQogx/dEud0UtR9GQJRuoegNyxGrrBv5PkKiTOhN2Sr3Vz7CvK7Q9JmkY
 cMo6pb1Ge0X1e9mbtUl5874ChTF8cWKdxhK6usp3OdZViAE8HMgmlsrez/icNmxfyHDi
 aWuRoeEfsB7rpRiV/eNkTKvTEEmMkShjRkR558Dd1F9GGYj/jHxIa2rKTK1rQcILJ0Br
 LcaqSKqxGH75Z8i1z38bpR/ZNFfKQb1oKvYQLEYLZBSr+7StfvFVqxtDd8hrVfYH5dEt
 wGNpZDkJV39J06DT0Kiv5Z5YXZzrzTFjsUjbb2k92XowHmmjyOReAWX9///sTlSZZBad 5w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5q4q2brc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:25:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29CNPI0v026081
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:25:18 GMT
Received: from [10.38.241.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 12 Oct
 2022 16:25:14 -0700
Message-ID: <cd860bb3-d2e7-9706-edfc-332f488dfad4@quicinc.com>
Date: Wed, 12 Oct 2022 16:25:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 08/10] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-1-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221009185316.462522-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m8KX8HkSMl8a41P0AhJg_eeU4_M9V_EC
X-Proofpoint-ORIG-GUID: m8KX8HkSMl8a41P0AhJg_eeU4_M9V_EC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_11,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120145
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2022 11:53 AM, Marijn Suijten wrote:
> drm_dsc_config's bits_per_pixel field holds a fractional value with 4
> bits, which all panel drivers should adhere to for
> drm_dsc_pps_payload_pack() to generate a valid payload.  All code in the
> DSI driver here seems to assume that this field doesn't contain any
> fractional bits, hence resulting in the wrong values being computed.
> Since none of the calculations leave any room for fractional bits or
> seem to indicate any possible area of support, disallow such values
> altogether.  calculate_rc_params() in intel_vdsc.c performs an identical
> bitshift to get at this integer value.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7e6b7e506ae8..46032c576a59 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -34,7 +34,7 @@
>   
>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>   
> -static int dsi_populate_dsc_params(struct drm_dsc_config *dsc);
> +static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc);
>   
>   static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>   {
> @@ -909,6 +909,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   	u32 va_end = va_start + mode->vdisplay;
>   	u32 hdisplay = mode->hdisplay;
>   	u32 wc;
> +	int ret;
>   
>   	DBG("");
>   
> @@ -944,7 +945,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		/* we do the calculations for dsc parameters here so that
>   		 * panel can use these parameters
>   		 */
> -		dsi_populate_dsc_params(dsc);
> +		ret = dsi_populate_dsc_params(msm_host, dsc);
> +		if (ret)
> +			return;
>   
>   		/* Divide the display by 3 but keep back/font porch and
>   		 * pulse width same
> @@ -1770,9 +1773,15 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>   	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
>   };
>   
> -static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> +static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc)
>   {
>   	int i;
> +	u16 bpp = dsc->bits_per_pixel >> 4;
> +
> +	if (dsc->bits_per_pixel & 0xf) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support fractional bits_per_pixel\n");
> +		return -EINVAL;
> +	}
>   
>   	if (dsc->bits_per_component != 8) {
>   		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> @@ -1798,8 +1807,8 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i];
>   	}
>   
> -	dsc->initial_offset = 6144; /* Not bpp 12 */
> -	if (dsc->bits_per_pixel != 8)
> +	dsc->initial_offset = 6144;		/* Not bpp 12 */
> +	if (bpp != 8)
>   		dsc->initial_offset = 2048;	/* bpp = 12 */
>   
>   	if (dsc->bits_per_component <= 10)
