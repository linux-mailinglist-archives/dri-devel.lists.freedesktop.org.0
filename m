Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4AA6F8B96
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C6710E683;
	Fri,  5 May 2023 21:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CDF10E681;
 Fri,  5 May 2023 21:49:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345LjGNE016389; Fri, 5 May 2023 21:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2VOfAgAHz7GoAhbBeUgZ6PmTWurWxEtD2CmpUOQLhd8=;
 b=a04WfWTfoGjn+r/rwg1EJr7i7W/fI9/50xD9OlPkpFwYhwkRN8h7+rbt+MZYCMVWbjvh
 n+77PFlL3tFXAZhwcB+GiaB8RhYOyOjHuKbu0+2M7XlyKLHp8rv+6KiOXPL7E5WiKo96
 /q3npgE1sTnA6kBbqP2kOPCIMH0AB2rB1cu2OqcT3RZ+UqkklwIbDWKGsXSyzWDcVXo1
 t2eol41fmL55eo7voN6X6ukqRmv9D/d9yibCvVk8xG4coTP3rnuomLLHDcXTlHAnea7+
 eJPNxxM/wSgX8TnU6W6xHOuQk3/0UxL2cnSbQod2y7jce0oD4J2MJL2M8kXG+sEBCJ5D dA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qctsv23rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 21:49:11 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345Ln9Wu014872
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 21:49:09 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 14:49:09 -0700
Message-ID: <79b468f5-8f2e-175b-5bce-1b3ea5127628@quicinc.com>
Date: Fri, 5 May 2023 14:49:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Adjust pclk rate for compression
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: egN0mcLAftTKUuyoA74G7ZkG_gCgoEoC
X-Proofpoint-GUID: egN0mcLAftTKUuyoA74G7ZkG_gCgoEoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_27,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305050176
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/2023 2:23 PM, Jessica Zhang wrote:
> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
> is enabled.
> 
> Changes in v2:
> - Adjusted pclk_rate math to divide only the hdisplay value by
>    compression ratio
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 43a5ec33eee8..0e5778e8091f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   	clk_disable_unprepare(msm_host->byte_clk);
>   }
>   
> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> +		struct drm_dsc_config *dsc, bool is_bonded_dsi)
>   {
>   	unsigned long pclk_rate;
>   
> @@ -576,6 +577,14 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>   	if (is_bonded_dsi)
>   		pclk_rate /= 2;
>   
> +	/* If DSC is enabled, divide hdisplay by compression ratio */
> +	if (dsc) {
> +		int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * msm_dsc_get_bpp_int(dsc),
> +				dsc->bits_per_component * 3);
> +		int fps = DIV_ROUND_UP(pclk_rate, mode->htotal * mode->vtotal);

Should've used drm_mode_vrefresh() here... Will spin a v3 with that 
change (along with any additional comments)

> +		pclk_rate = (new_hdisplay + (mode->htotal - mode->hdisplay)) * mode->vtotal * fps;
> +	}
> +
>   	return pclk_rate;
>   }
>   
> @@ -585,7 +594,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	u8 lanes = msm_host->lanes;
>   	u32 bpp = dsi_get_bpp(msm_host->format);
> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>   	u64 pclk_bpp = (u64)pclk_rate * bpp;
>   
>   	if (lanes == 0) {
> @@ -604,7 +613,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>   
>   static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   {
> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>   	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>   							msm_host->mode);
>   
> @@ -634,7 +643,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	dsi_calc_pclk(msm_host, is_bonded_dsi);
>   
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
>   	do_div(pclk_bpp, 8);
>   	msm_host->src_clk_rate = pclk_bpp;
>   
> 
> -- 
> 2.40.1
> 
