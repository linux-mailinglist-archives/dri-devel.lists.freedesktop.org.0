Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CEA1AD82
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 00:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0B410E217;
	Thu, 23 Jan 2025 23:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="DR6tb8vu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34C010E1AF;
 Thu, 23 Jan 2025 23:46:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NDs18q029423;
 Thu, 23 Jan 2025 23:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3ihYuTKzuDB2YmVsRmxQh+o4gFIQlnPGAHE5UXcwc28=; b=DR6tb8vuWj5DGdBp
 agsb3mrXTALmimF+xokPrsUYACNOZebUdzP/NK43Pj3bQjGO5D869EKV7slIMmz+
 mfLyaSU45fz2C2JhyW/z4WczK/Obq8G/rjDWetVmQSUXW5zHJWtF4CS5tjrramaS
 bjNNNBrieOMLhwj5qU6E8Kv5kt2+leJq0fmdh56k88jrQ3ydxBNitaeRXYfPkzIJ
 vj9/Db9HNfPmafi+r6QX6u7Vyiyh3OsI2vO/4jSZOgx6nHlqHPJzRcG3bxUMsStg
 5GzebCe2XUQNW7dQ+HFuTWkd6IPLo0K4THEhZHR2o2HABrShVmcd0XjWMCY73w7K
 UA7PcQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bq2cs6q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 23:46:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NNkNYs026439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2025 23:46:23 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 15:46:23 -0800
Message-ID: <df532786-1cbe-45d8-bd9c-f70eaed0492b@quicinc.com>
Date: Thu, 23 Jan 2025 15:46:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, "David Airlie" <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XcbhqTtVy5weSh9zasBVNUQPHlrsN_p6
X-Proofpoint-ORIG-GUID: XcbhqTtVy5weSh9zasBVNUQPHlrsN_p6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_10,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230172
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/22/2025 8:23 AM, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Hi Marijn,

Thanks for the patch. LGTM

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
> Changes in v2:
> - Fairphone is one word, lowercase the P from phone (Luca);
> - Skip unnecessary if (dpu_enc->dsc) check and always count the number
>    of non-NULL dpu_enc->hw_dsc[i] instead (Dmitry);
> - Revert irrelevant whitespace cleanup in DSC comment, even if
>    worthless enough to send separately (Dmitry);
> - Drop dsc_common_mode=0 initialization and move existing 0-assignment
>    from a random place in the function down to where this variable is
>    actually being updated (Dmitry);
> - Link to v1: https://lore.kernel.org/r/20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>   1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..b585cd17462345f94bcc2ddd57902cc7c312ae63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   		if (dpu_enc->phys_encs[i])
>   			intf_count++;
>   
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> -	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		if (dpu_enc->hw_dsc[i])
> +			num_dsc++;
>   
>   	return (num_dsc > 0) && (num_dsc > intf_count);
>   }
> @@ -686,13 +686,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	if (dsc) {
>   		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>   		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> +		if (dpu_kms->catalog->dsc_count >= 2) {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +		} else {
> +			topology.num_dsc = 1;
> +			topology.num_lm = 1;
> +		}
>   		topology.num_intf = 1;
>   	}
>   
> @@ -2020,7 +2026,6 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>   static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   				 struct drm_dsc_config *dsc)
>   {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>   	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>   	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> @@ -2030,22 +2035,24 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	int dsc_common_mode;
>   	int pic_width;
>   	u32 initial_lines;
> +	int num_dsc = 0;
>   	int i;
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>   		hw_pp[i] = dpu_enc->hw_pp[i];
>   		hw_dsc[i] = dpu_enc->hw_dsc[i];
>   
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +
> +		num_dsc++;
>   	}
>   
> -	dsc_common_mode = 0;
>   	pic_width = dsc->pic_width;
>   
> -	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
> +	dsc_common_mode = 0;
> +	if (num_dsc > 1)
> +		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>   	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>   		dsc_common_mode |= DSC_MODE_MULTIPLEX;
>   	if (enc_master->intf_mode == INTF_MODE_VIDEO)
> @@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   	this_frame_slices = pic_width / dsc->slice_width;
>   	intf_ip_w = this_frame_slices * dsc->slice_width;
>   
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w = intf_ip_w / 2;
> +	enc_ip_w = intf_ip_w / num_dsc;
>   	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < num_dsc; i++)
>   		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>   					 dsc, dsc_common_mode, initial_lines);
>   }
> 
> ---
> base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
> change-id: 20240204-dpu-111-topology-b12c1de82c8a
> 
> Best regards,
> -- 
> Marijn Suijten <marijn.suijten@somainline.org>
> 

