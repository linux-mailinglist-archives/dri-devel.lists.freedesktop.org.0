Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5099EBB30
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 21:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A791010E5BB;
	Tue, 10 Dec 2024 20:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VbuC8QAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31E10E3D0;
 Tue, 10 Dec 2024 20:54:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BADLm2r019669;
 Tue, 10 Dec 2024 20:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EfP/1ndzy/lnII1TAGJrT83Y
 J8RnC+6DM6hX7bq8Bto=; b=VbuC8QARjSJGgj8niQgc38pgC6mulhotH31AREEy
 6/Khq86Un1/oTjQf8n0Mn1s0ZeMEn5VDicE1mOqO0bhFziWleKewwm+/a/dCTzPB
 TTS34D2bOy2ODyGsw+uGvncBkmaymF9gMIj4y7lJO9J33wsJsrvdy2+Y1nwDfTS/
 /yJ33/EJLgiDDBWTTLG1yhHsxLjq6dwz8jJoa6+1W26/t5oD4rSZ2N5lP8HLSmbu
 RrzdEZeTRlXDKC6NlRHNC+XtcsvUuZKb1YbuMvBLTbhVbPylhAvy8azYv12wy1R7
 rSovL/ee5e0a0m1z+Qk9Q4g0/ZNGHQ80wakBynDyvDTExg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341ch24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 20:54:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAKsTvU026919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 20:54:29 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 12:54:29 -0800
Date: Tue, 10 Dec 2024 12:54:28 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Pavan Kondeti <quic_pkondeti@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <20241210125012120-0800.eberman@hu-eberman-lv.qualcomm.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KcDNblzE7V94XKjvUeILn4LcMXt4kbQ8
X-Proofpoint-ORIG-GUID: KcDNblzE7V94XKjvUeILn4LcMXt4kbQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100151
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

On Mon, Dec 09, 2024 at 01:49:15PM +0530, Akhil P Oommen wrote:
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
> 
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> 
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT

I think this might be misleading. As I understand, KVM in nVHE doesn't
support loading secure firmware. I'm not aware of any support added to
make it work. So, the driver will try to load zap shader and it fails
same as it does today.

> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
> 	programs SECVID register
> 
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------------
>  1 file changed, 54 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..9dcaa8472430 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>  
> +#ifdef CONFIG_ARM64
> +#include <asm/virt.h>
> +#endif
> +
>  #define GPU_PAS_ID 13
>  
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>  	return ret;
>  }
>  
> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> +{
> +	int ret;
> +
> +#ifdef CONFIG_ARM64
> +	/*
> +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> +	 * to switch the secure mode to avoid the dependency on zap shader.
> +	 */
> +	if (is_kernel_in_hyp_mode())
> +		goto direct_switch;
> +#endif
> +
> +	/*
> +	 * Try to load a zap shader into the secure world. If successful
> +	 * we can use the CP to switch out of secure mode. If not then we
> +	 * have no resource but to try to switch ourselves out manually. If we
> +	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
> +	 * be blocked and a permissions violation will soon follow.
> +	 */
> +	ret = a6xx_zap_shader_init(gpu);
> +	if (ret == -ENODEV) {
> +		/*
> +		 * This device does not use zap shader (but print a warning
> +		 * just in case someone got their dt wrong.. hopefully they
> +		 * have a debug UART to realize the error of their ways...
> +		 * if you mess this up you are about to crash horribly)
> +		 */
> +		dev_warn_once(gpu->dev->dev,
> +			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
> +		goto direct_switch;
> +	} else if (ret)
> +		return ret;
> +
> +	OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> +	OUT_RING(gpu->rb[0], 0x00000000);
> +
> +	a6xx_flush(gpu, gpu->rb[0]);
> +	if (!a6xx_idle(gpu, gpu->rb[0]))
> +		return -EINVAL;
> +
> +	return 0;
> +
> +direct_switch:
> +	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> +	return 0;
> +}
> +
>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>  		       A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW | \
>  		       A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>  	if (ret)
>  		goto out;
>  
> -	/*
> -	 * Try to load a zap shader into the secure world. If successful
> -	 * we can use the CP to switch out of secure mode. If not then we
> -	 * have no resource but to try to switch ourselves out manually. If we
> -	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
> -	 * be blocked and a permissions violation will soon follow.
> -	 */
> -	ret = a6xx_zap_shader_init(gpu);
> -	if (!ret) {
> -		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
> -		OUT_RING(gpu->rb[0], 0x00000000);
> -
> -		a6xx_flush(gpu, gpu->rb[0]);
> -		if (!a6xx_idle(gpu, gpu->rb[0]))
> -			return -EINVAL;
> -	} else if (ret == -ENODEV) {
> -		/*
> -		 * This device does not use zap shader (but print a warning
> -		 * just in case someone got their dt wrong.. hopefully they
> -		 * have a debug UART to realize the error of their ways...
> -		 * if you mess this up you are about to crash horribly)
> -		 */
> -		dev_warn_once(gpu->dev->dev,
> -			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
> -		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
> -		ret = 0;
> -	} else {
> +	ret = a6xx_switch_secure_mode(gpu);
> +	if (!ret)
>  		return ret;
> -	}
>  
>  out:
>  	if (adreno_has_gmu_wrapper(adreno_gpu))
> 
> ---
> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
