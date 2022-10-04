Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F25F4A3D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 22:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DEA10E0EA;
	Tue,  4 Oct 2022 20:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C4610E0EA;
 Tue,  4 Oct 2022 20:22:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294JDs3e026295;
 Tue, 4 Oct 2022 20:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=b8vNXd50c8xgukprq4t2IdrQDqWKgWlp+GJSkE3pmCA=;
 b=WxQuXA+Mrpkb3yCsKr/P+Am02fx8vo7a3oF73uscKjKlT8h1ufDL4c/zcoTJCNkwCibk
 zgKqT8koz0xroeLAgp0HXo8LFT8xH1JQ0tQVg/dS6ol+VeGPGJnvfacHJL2lqWKJNxCv
 ze5+sC/69sfDbWAeHjmE+TbVzjc+o2t2v3Nq2j2EceFhJ/l/iQXghS4eFnI5W8ce4zd9
 YJuUkvJkKAAQczsQe2+baA3Ff0hvJhbfz2e0RnHKJI8Sr2pZ/PjckoOeZV9yyUwul9G3
 YJeD6taAf2DwgNJhAIv4ziyf2jyLIyQbdf1jAcA41AZf0RPQg66Lf1a3QjTv8WUej+Ft 1w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0rf40chu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 20:22:31 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 294KMUeI022666; 
 Tue, 4 Oct 2022 20:22:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jxemkva8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 20:22:30 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 294KMUTJ022661;
 Tue, 4 Oct 2022 20:22:30 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 294KMUrJ022660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 20:22:30 +0000
Received: from [10.38.243.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 13:22:26 -0700
Message-ID: <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
Date: Tue, 4 Oct 2022 13:22:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221001190807.358691-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZFqJ0ez-j4AJ1SMO18aXAa17j3tqjVeD
X-Proofpoint-ORIG-GUID: ZFqJ0ez-j4AJ1SMO18aXAa17j3tqjVeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040132
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/1/2022 12:08 PM, Marijn Suijten wrote:
> msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
> of a char thanks to two's complement: this however results in those bits
> bleeding into the next parameter when the field is only expected to
> contain 6-bit wide values.
> As a consequence random slices appear corrupted on-screen (tested on a
> Sony Tama Akatsuki device with sdm845).
> 
> Use AND operators to limit all values that constitute the RC Range
> parameter fields to their expected size.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> index c869c6e51e2b..2e7ef242685d 100644
> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>   	 */
>   	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>   		pps_payload->rc_range_parameters[i] =
> -			cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
> +			cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
>   				     DSC_PPS_RC_RANGE_MINQP_SHIFT) |
> -				    (dsc_cfg->rc_range_params[i].range_max_qp <<
> +				    ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
>   				     DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
> -				    (dsc_cfg->rc_range_params[i].range_bpg_offset));
> +				    (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));
>   	}
>   

Looking at some examples of this for other vendors, they have managed to 
limit the value to 6 bits in their drivers:

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L532

https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c#L87

Perhaps, msm should do the same thing instead of the helper change.

If you want to move to helper, other drivers need to be changed too to 
remove duplicate & 0x3f.

FWIW, this too has already been fixed in the latest downstream driver too.


Thanks

Abhinav

>   	/* PPS 88 */
