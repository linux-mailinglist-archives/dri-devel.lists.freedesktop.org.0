Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963DD5F5B86
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 23:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7610E78C;
	Wed,  5 Oct 2022 21:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6410E78A;
 Wed,  5 Oct 2022 21:14:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295L6WwP029173;
 Wed, 5 Oct 2022 21:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m8rcUOmSkkOBsqzuwn+dnbX0t6FP3OQ03nPOvq9bcVk=;
 b=XOYcf+MXIAmdVZGqMdudKj4Ym6rvpoqI2Ev50qjtjLJSWnBk5opZd4PQIaqUZcXSERPV
 KNxAge5Al6viiDU5nCoUBSDAvGMRgsR5qRWWe0oeCr5JKIMlSPic/jE3QIGWXcsrzjGk
 oOB2p1FugaRC1gw3iG30Pr4fzMQrmYFDYRL2suxLJL3+JmB5j6+6FscQFsuXP6U9AnlE
 BgrRBYrAb2Xg9W3IvmJMszpUfYilNq1OgoP4EfBko67xasOTeJIeFrvOJRXKGl7wjzqv
 UVySLkwHGPXMcpkSATJdOGwoDjTa83EuhOztoht6Ix500Mcpf6/MOkw0tCMTya8BrOwW qQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0escvc9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 21:14:08 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 295Ku7JN006827; 
 Wed, 5 Oct 2022 21:14:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3k1e0drn5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 21:14:07 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 295L27se014655;
 Wed, 5 Oct 2022 21:14:07 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 295LE73u027387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 21:14:07 +0000
Received: from [10.38.244.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 5 Oct 2022
 14:14:04 -0700
Message-ID: <a110f32a-261c-e5da-2c1d-609ba9ec1680@quicinc.com>
Date: Wed, 5 Oct 2022 14:14:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/7] drm/msm/dsi: Remove useless math in DSC
 calculations
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
 <20221005181657.784375-2-marijn.suijten@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221005181657.784375-2-marijn.suijten@somainline.org>
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
X-Proofpoint-ORIG-GUID: 2omwmzd_ViBXMlRXd0jRT5coS9A-OjGr
X-Proofpoint-GUID: 2omwmzd_ViBXMlRXd0jRT5coS9A-OjGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050131
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



On 10/5/2022 11:16 AM, Marijn Suijten wrote:
> Multiplying a value by 2 and adding 1 to it always results in a value
> that is uneven, and that 1 gets truncated immediately when performing
> integer division by 2 again.  There is no "rounding" possible here.
> 
> After that target_bpp_x16 is used to store a multiplication of
> bits_per_pixel by 16 which is only ever read to immediately be divided
> by 16 again, and is elided in much the same way.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8e4bc586c262..70077d1f0f21 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1784,7 +1784,6 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   	int hrd_delay;
>   	int pre_num_extra_mux_bits, num_extra_mux_bits;
>   	int slice_bits;
> -	int target_bpp_x16;
>   	int data;
>   	int final_value, final_scale;
>   	int i;
> @@ -1864,14 +1863,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>   	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
>   	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
>   
> -	/* bpp * 16 + 0.5 */
> -	data = dsc->bits_per_pixel * 16;
> -	data *= 2;
> -	data++;
> -	data /= 2;
> -	target_bpp_x16 = data;
> -
> -	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
> +	data = dsc->initial_xmit_delay * dsc->bits_per_pixel;
>   	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
>   	dsc->final_offset = final_value;
>   
