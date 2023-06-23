Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828473ADA6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 02:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D8610E5C5;
	Fri, 23 Jun 2023 00:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE1810E5C3;
 Fri, 23 Jun 2023 00:15:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35N0F2qS013007; Fri, 23 Jun 2023 00:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ycODmxH+OtO0rlCaJDLKpIUkH5zZ48Y41mQJwarbHXk=;
 b=XUEApQdbUb1BlJIM9VuEaH7V9KX2rWZf9w8OaBNnjgHjjR8ivi9jzoKIRr9lFXD1X1o4
 1GDr/sa6pJj5mdbojDs32ucckrhDQhSNpK573HzF6y6T5DFG5I38hUCIb3hTahxWAJv5
 BbJv9slQzF9n/6Gg+OIb04DNtdU6CEoY2zNKPxm1yTAVXt93Ex952NXr4YKi5z/ga/AT
 1wn+EN9WHOThSQ6JompBjSqpZo7SM6/bs1YC1Ov0+xNEJE+dWeHkiLH7ot5QBhSfq9vr
 J2yKtBTVccYTH4zZKiYa7jEsFOwLeVtyYqIk1ZRG3vN0MUtU3Un+7NnFeuaEQ7LlIyQ1 Mg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rcju8291a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 00:15:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35N0F1S6022404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 00:15:01 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 17:15:00 -0700
Message-ID: <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
Date: Thu, 22 Jun 2023 17:14:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xnReIcsP7CMj2BtCWTokFc92XnTHtuTU
X-Proofpoint-GUID: xnReIcsP7CMj2BtCWTokFc92XnTHtuTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_18,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306220207
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 2:06 PM, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> - Added a pointer from dsi_timing_setup() docs to
>    dsi_adjust_pclk_for_compression() (Marijn)
> - Fixed two typo (Marijn)
> 
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 3f6dfb4f9d5a..a8a31c3dd168 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   	clk_disable_unprepare(msm_host->byte_clk);
>   }
>   
> +/**
> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
> + * @mode: the selected mode for the DSI output
> + * @dsc: DRM DSC configuration for this DSI output
> + *
> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> + * the compression ratio such that:
> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> + *
> + * Porches do not need to be adjusted:
> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> + * - For the CMD mode there are no actual porches. Instead these fields
> + *   currently represent the overhead to the image data transfer. As such, they
> + *   are calculated for the final mode parameters (after the compression) and
> + *   are not to be adjusted too.
> + *
> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> + *  refresh rate and data overhead as a starting point of the calculations.
> + */
>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>   		const struct drm_dsc_config *dsc)

I am fine with this part of the doc.

>   {
> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		if (ret)
>   			return;
>   
> -		/* Divide the display by 3 but keep back/font porch and
> -		 * pulse width same
> +		/*
> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
> +		 * not used, a single pixel is transferred at each pulse, no
> +		 * matter what bpp or pixel format is used. In case of DSC
> +		 * compression this results (due to data alignment
> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> +		 * cycle.
> +		 *

I dont want to talk about data alignment nor formats and I will not ack 
any references to those.

I would like to keep this simple and say that DPU sends 3 bytes of 
compressed data / pclk (6 with widebus enabled) and all this math is 
doing is that its calculating number of bytes and diving it by 3 OR 6 
with widebus to calculate the pclk cycles. Thats it.

> +		 * If widebus is enabled, bus width is extended to 6 bytes.
> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> +		 * less or equal to 8 or 3 compressed pixels in case bpp is
> +		 * greater than 8.
> +		 *
> +		 * The back/font porch and pulse width are kept intact.  They
> +		 * represent timing parameters rather than actual data
> +		 * transfer. See the documentation of
> +		 * dsi_adjust_pclk_for_compression().

this part is fine.

> +		 *
> +		 * XXX: widebus is not supported by the driver (yet).
>   		 */
>   		h_total -= hdisplay;
>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
