Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7A5F4805
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 19:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457410E011;
	Tue,  4 Oct 2022 17:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E3910E011;
 Tue,  4 Oct 2022 17:03:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294Gokcm000924;
 Tue, 4 Oct 2022 17:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AEYsfh/eAt8nDw1iuATZ7PecSdIMZP841nXjfzpjNoo=;
 b=daszagFtoy1GJbxo+QhBtAoqxy7nSHXjCYF5M3+ZSmYrRiuK/mJga6rY9SQG7DbEQBfS
 lGbYaY/UHescM4ZqIRZrIOOlkz5io2n7jAXnO4Jh5QlT7e9Cd+xUsYoDmVgdsinZXwVF
 blzE1KHUbXPOAHPk8jfUD69jv4p0i6xNOD7H5cwLNU6Gv22qPXlsISSGVU0DvCBqWIoC
 wSoyO+SWqDpQxwTZgduXzj7Zu+DCowZ0WG6kc0vM9TZSW2uosa63jh9fgLrPTtH/7Or1
 FcNa7S21FYjmpF19cUTTNR6pl23hU5biRpbjq4lOrjUK1Ks8RaIbPy+1nkTWahlzqqdk Rg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxd58pd5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 17:03:13 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 294H1PAi003695; 
 Tue, 4 Oct 2022 17:03:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jxemkktrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 17:03:11 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 294H3B1c005319;
 Tue, 4 Oct 2022 17:03:11 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 294H3BLF005318
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 17:03:11 +0000
Received: from [10.111.163.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 10:03:08 -0700
Message-ID: <7f7a5d78-e50f-b6af-bb3e-bbfbc7fa5f75@quicinc.com>
Date: Tue, 4 Oct 2022 10:03:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 4/5] drm/msm/dpu1: Account for DSC's bits_per_pixel having
 4 fractional bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-5-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221001190807.358691-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pGloqYhjcMLdcZlFUuZu5eaz0S-vN8EE
X-Proofpoint-ORIG-GUID: pGloqYhjcMLdcZlFUuZu5eaz0S-vN8EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_08,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040110
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
 Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Thomas Zimmermann <tzimmermann@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/1/2022 12:08 PM, Marijn Suijten wrote:
> According to the comment this DPU register contains the bits per pixel
> as a 6.4 fractional value, conveniently matching the contents of
> bits_per_pixel in struct drm_dsc_config which also uses 4 fractional
> bits.  However, the downstream source this implementation was
> copy-pasted from has its bpp field stored _without_ fractional part.
> 
> This makes the entire convoluted math obsolete as it is impossible to
> pull those 4 fractional bits out of thin air, by somehow trying to reuse
> the lowest 2 bits of a non-fractional bpp (lsb = bpp % 4??).
> 
> The rest of the code merely attempts to keep the integer part a multiple
> of 4, which is rendered useless thanks to data |= dsc->bits_per_pixel <<
> 12; already filling up those bits anyway (but not on downstream).
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Many of this bugs are because the downstream code from which this 
implementation was derived wasnt the latest perhaps?

Earlier, downstream had its own DSC struct maybe leading to this 
redundant math but now we have migrated over to use the upstream struct 
drm_dsc_config.

That being said, this patch LGTM
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index f2ddcfb6f7ee..3662df698dae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -42,7 +42,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   			      u32 initial_lines)
>   {
>   	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> -	u32 data, lsb, bpp;
> +	u32 data;
>   	u32 slice_last_group_size;
>   	u32 det_thresh_flatness;
>   	bool is_cmd_mode = !(mode & DSC_MODE_VIDEO);
> @@ -56,14 +56,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>   	data = (initial_lines << 20);
>   	data |= ((slice_last_group_size - 1) << 18);
>   	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
> -	data |= dsc->bits_per_pixel << 12;
> -	lsb = dsc->bits_per_pixel % 4;
> -	bpp = dsc->bits_per_pixel / 4;
> -	bpp *= 4;
> -	bpp <<= 4;
> -	bpp |= lsb;
> -
> -	data |= bpp << 8;
> +	data |= (dsc->bits_per_pixel << 8);
>   	data |= (dsc->block_pred_enable << 7);
>   	data |= (dsc->line_buf_depth << 3);
>   	data |= (dsc->simple_422 << 2);
