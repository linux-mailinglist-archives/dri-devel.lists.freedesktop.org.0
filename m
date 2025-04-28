Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF5FA9F921
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F73710E22D;
	Mon, 28 Apr 2025 19:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Cfk5D5RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7810E08C;
 Mon, 28 Apr 2025 19:02:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SADFOi002817;
 Mon, 28 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aauU0FGniSWBHKvffweWH7HLyt3q/OcuurZpMxy2CLk=; b=Cfk5D5RYRxtBiwt0
 mc/Zxe03Xw0UeJz7Ho34x3NWMbODzAd5ohR6DzNE1//Vc66uqFK1vv0mGDoKiQSJ
 /WUEub4rlnydUIPDdbTo11s7iFv7YG78eOQqM68NhJhEzmj31251+oDgNbmaSSBy
 yHPp03t/03VKqirJcLC1mQm5JMFXTpR2VUoSG2aqcYnqu3tFRJRgPzk+k3MxzrKj
 pi6fVE0bwO6S3Sk6pJv7QghZpfscb9BfDy852mWg5LGnPhxVGYldWP0bdaMt4Tdl
 TPdaz/F7ktggEfGURagHqplxpSDJSsBQmEEBBC7VHKL8ecWabQtH2/kYQKQd5qix
 qWIIew==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9j3q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 19:02:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SJ2mG1006066
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 19:02:49 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 12:02:48 -0700
Message-ID: <7cd99242-e670-420d-bced-b8a979e3fd2f@quicinc.com>
Date: Mon, 28 Apr 2025 12:02:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE
 register
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-1-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-1-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=680fd0da cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=w8TCXdzS96gXyQ4iQjUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n0vkWxy-KaGU8_FxfUBEL44yYIAItQxf
X-Proofpoint-ORIG-GUID: n0vkWxy-KaGU8_FxfUBEL44yYIAItQxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE1MyBTYWx0ZWRfXzOnUrbR4z09D
 g/ZVbSc/k6A70cMiAGbjoXhoU7GA+iJ9zRN7NEFTGblbvEAv3EQb97xx7L4pKgoBNtQjBcPb16G
 lvMAJvG3m5eLaIDnnNou9jjQvcmd67VbTQOTF/ZbbrTlyzjmOAamonEi7LkRIPlPWJO00Nh+9af
 pQrzjUPNOsPipWEd8u1RVfB1NSL9j5AcLA27jKl7gR0p4No62u4H2yZfzf7VZel0ySb70P7Znzo
 P1ZfteYstGHwhYihXW3JIa6PUN5jR2Rh5ZiulVOFmjsd/YFMRPfts5rjz74q6lHWQ2hGDHGmIo+
 1m1krhh3hBGlxyITBasH7MpfSXJinxiVStWnBo+96dO7qTqCP4M66zHh+tbozZPYRT42Xsz5JvV
 NAZUNhDYwK5VPnGAT05crKKelazphxl2HU9b3qbxlWP+5tkEQJ8pFhNd8HZr62Xx0cJPX/Nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280153
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



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> In case of complex pipelines (e.g. the forthcoming quad-pipe) the DPU
> might use more that one MERGE_3D block for a single output.  Follow the
> pattern and extend the CTL_MERGE_3D_ACTIVE active register instead of
> simply writing new value there. Currently at most one MERGE_3D block is
> being used, so this has no impact on existing targets.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 411a7cf088eb72f856940c09b0af9e108ccade4b..cef3bfaa4af82ebc55fb8cf76adef3075c7d73e3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -563,6 +563,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 wb_active = 0;
>   	u32 cwb_active = 0;
>   	u32 mode_sel = 0;
> +	u32 merge_3d_active = 0;
>   
>   	/* CTL_TOP[31:28] carries group_id to collate CTL paths
>   	 * per VM. Explicitly disable it until VM support is
> @@ -578,6 +579,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>   	cwb_active = DPU_REG_READ(c, CTL_CWB_ACTIVE);
>   	dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);
> +	merge_3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
>   
>   	if (cfg->intf)
>   		intf_active |= BIT(cfg->intf - INTF_0);
> @@ -591,15 +593,15 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->dsc)
>   		dsc_active |= cfg->dsc;
>   
> +	if (cfg->merge_3d)
> +		merge_3d_active |= BIT(cfg->merge_3d - MERGE_3D_0);
> +
>   	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>   	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>   	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>   	DPU_REG_WRITE(c, CTL_CWB_ACTIVE, cwb_active);
>   	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> -
> -	if (cfg->merge_3d)
> -		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> -			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>   
>   	if (cfg->cdm)
>   		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> 

