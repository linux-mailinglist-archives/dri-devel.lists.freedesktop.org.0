Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DF95FCEB7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 01:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689E10E1F2;
	Wed, 12 Oct 2022 23:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17A810E1F2;
 Wed, 12 Oct 2022 23:03:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CMrZxB005011;
 Wed, 12 Oct 2022 23:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z/00gzl0chtUGKnk6+6a/IXc4W8BOyQEfDKkrrKaGSQ=;
 b=oJVJWdueAjXeq7YTnFXzasDhoH9cAMAmDJvvLlOz8GGT8IewOkMN3fMJViRY2NymCZN4
 2EQ2Sv+wnZlsWgWGd71npfJsIqH0j0zhCz3LInTvhm1GbGDzBXhqPNbeYaksuVLnurGN
 NMWiLJDLY4LBWlAZP51TfBjhL/3Ehve9XwmUefeG2qWAhSBj8NZRD9fXmMY4C04fxXi+
 LnM3hiIe+xXBTRNM/jETD7Z8zgdR/kBVGxHT/F/8ArWpz0FAV0TYqfiUu0OmtN1RcOqX
 jvwjST+hm3zpddWT6fbHZRBD+/RQDf3QBMLoY6s1/HKS9jpfMEMPQqjNhv4Bhwd1mNU8 nA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5eh339xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:03:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29CN3CJQ016486
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 23:03:12 GMT
Received: from [10.38.241.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 12 Oct
 2022 16:03:09 -0700
Message-ID: <5c178d7e-5022-f5e5-791d-d3800114b42b@quicinc.com>
Date: Wed, 12 Oct 2022 16:03:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221009185058.460688-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ja0Tr9aJJVlp9CqstugiLkStvUu3-yFr
X-Proofpoint-ORIG-GUID: ja0Tr9aJJVlp9CqstugiLkStvUu3-yFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_11,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120144
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
Cc: Sean Paul <sean@poorly.run>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2022 11:50 AM, Marijn Suijten wrote:
> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), and it is yet unknown
> why this comment was put in place instead of resolved from the get-go.
> Not only does it save on duplication, it would have also spared certain
> issues.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct has
> it with 4 fractional bits.  drm_dsc_compute_rc_parameters() already
> accounts for this feat, and the sole remaining use of
> dsc->bits_per_pixel inside dsi_populate_dsc_params() will be addressed
> in a separate patch.
> 

This is a nice cleanup! Thanks for doing this. I would actually like to 
move towards the drm_dsc_compute_rc_parameters() API.

But I would like to hold back this change till Vinod clarifies because 
Vinod had mentioned that with drm_dsc_compute_rc_parameters() he was 
seeing a mismatch in the computation of two values.

slice_bpg_offset and the final_offset.

The difference between the upstream drm_dsc_compute_rc_parameters() and 
dsi_populate_dsc_params() causing this was not clear to me from his 
explanation earlier.

So this was left as a to-do item.

I would like this to be re-tested on pixel3 and check if this works for 
vinod. If not, i think its the right time to debug why and not delay 
this more.

Thanks

Abhinav
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 64 +++---------------------------
>   1 file changed, 6 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 83cde4d62b68..68c39debc22f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -21,6 +21,7 @@
>   
>   #include <video/mipi_display.h>
>   
> +#include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_of.h>
>   
>   #include "dsi.h"
> @@ -1771,14 +1772,6 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>   
>   static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   {
> -	int mux_words_size;
> -	int groups_per_line, groups_total;
> -	int min_rate_buffer_size;
> -	int hrd_delay;
> -	int pre_num_extra_mux_bits, num_extra_mux_bits;
> -	int slice_bits;
> -	int data;
> -	int final_value, final_scale;
>   	int i;
>   
>   	dsc->rc_model_size = 8192;
> @@ -1804,11 +1797,11 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   	if (dsc->bits_per_pixel != 8)
>   		dsc->initial_offset = 2048;	/* bpp = 12 */
>   
> -	mux_words_size = 48;		/* bpc == 8/10 */
> -	if (dsc->bits_per_component == 12)
> -		mux_words_size = 64;
> +	if (dsc->bits_per_component <= 10)
> +		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +	else
> +		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>   
> -	dsc->mux_word_size = mux_words_size;
>   	dsc->initial_xmit_delay = 512;
>   	dsc->initial_scale_value = 32;
>   	dsc->first_line_bpg_offset = 12;
> @@ -1820,52 +1813,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   	dsc->rc_quant_incr_limit0 = 11;
>   	dsc->rc_quant_incr_limit1 = 11;
>   
> -	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> -	 * params are calculated
> -	 */
> -	groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
> -	dsc->slice_chunk_size = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> -
> -	/* rbs-min */
> -	min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> -				dsc->initial_xmit_delay * dsc->bits_per_pixel +
> -				groups_per_line * dsc->first_line_bpg_offset;
> -
> -	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
> -
> -	dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
> -
> -	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> -				       (dsc->rc_model_size - dsc->initial_offset);
> -
> -	slice_bits = 8 * dsc->slice_chunk_size * dsc->slice_height;
> -
> -	groups_total = groups_per_line * dsc->slice_height;
> -
> -	data = dsc->first_line_bpg_offset * 2048;
> -
> -	dsc->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->slice_height - 1));
> -
> -	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->bits_per_component + 4) - 2);
> -
> -	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
> -			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
> -
> -	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
> -	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> -
> -	data = dsc->initial_xmit_delay * dsc->bits_per_pixel;
> -	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> -	dsc->final_offset = final_value;
> -
> -	final_scale = 8 * dsc->rc_model_size / (dsc->rc_model_size - final_value);
> -
> -	data = (final_scale - 9) * (dsc->nfl_bpg_offset + dsc->slice_bpg_offset);
> -	dsc->scale_increment_interval = (2048 * dsc->final_offset) / data;
> -
> -	dsc->scale_decrement_interval = groups_per_line / (dsc->initial_scale_value - 8);
> -
> -	return 0;
> +	return drm_dsc_compute_rc_parameters(dsc);
>   }
>   
>   static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
