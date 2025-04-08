Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E908A813A3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADC010E2BB;
	Tue,  8 Apr 2025 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EI1bZQMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6C910E2BB;
 Tue,  8 Apr 2025 17:28:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aq5lf019761;
 Tue, 8 Apr 2025 17:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IQqsdiGIp4/zZj6Hngv1EioGyfu18AoQYCuyYN2tTuM=; b=EI1bZQMUUTUFZ4Tp
 FW0sYyAdKt3MkjM+tRWj/1htAsWcZs8xGoCSIGA852ZPnv1vyBXXYAcoeMertdZH
 70Sl9Osqt18qdUwhmh5QJoDNXixwRsZ4Fp0vgZPCLhhVAy2DkGZag/uK9sJm+KV0
 cNQ1Gfp42b0zF5NOO6VXOdhwW/Zu4gjbgubzSRyJDgZYN2dLSuHhvMQwmW957aWx
 OS5wJ3s31avDn38trZ4X/2D9xHOM/1Jdlb5vLp4JMxO6dHmtFqKhbqetIwIMTaxI
 HbgCqU1t4BADDuP0PTqMxr8rDk+zZUP/lP5DyFATHC4dXA8rB1CKW1zTinnGn9Pg
 vT8iZg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3gnbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Apr 2025 17:28:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538HSCjv016943
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Apr 2025 17:28:12 GMT
Received: from [10.71.109.90] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 10:28:11 -0700
Message-ID: <52905653-d78c-49b3-a329-a5ed797e149b@quicinc.com>
Date: Tue, 8 Apr 2025 10:28:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref
To: Qasim Ijaz <qasdev00@gmail.com>, <robdclark@gmail.com>,
 <quic_abhinavk@quicinc.com>, <lumag@kernel.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
References: <20250408172223.10827-1-qasdev00@gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250408172223.10827-1-qasdev00@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZMWtFsb8ZB8IyX3xCAGht53oErjV0LqK
X-Proofpoint-ORIG-GUID: ZMWtFsb8ZB8IyX3xCAGht53oErjV0LqK
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f55cae cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=bi7Pn_t20o9l9RWp8FkA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080120
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


On 4/8/2025 10:22 AM, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
> before the sanity checks which can lead to a NULL pointer dereference if
> phys is NULL.
>   
> Fix this by reordering the dereference after the sanity checks.
>   
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>


Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>


> ---
> v2:
> - Moved Signed-off tag below Fixes tag
> - Moved dpu_enc declaration to the top and initialisation below sanity checks
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056..0bd1f2bfaaff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1667,7 +1667,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>    */
>   static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>   {
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
> +	struct dpu_encoder_virt *dpu_enc;
>   
>   	if (!phys) {
>   		DPU_ERROR("invalid argument(s)\n");
> @@ -1678,6 +1678,8 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>   		DPU_ERROR("invalid pingpong hw\n");
>   		return;
>   	}
> +
> +	dpu_enc = to_dpu_encoder_virt(phys->parent);
>   
>   	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
>   	    dpu_enc->cwb_mask) {
