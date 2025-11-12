Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE00C51B35
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE9310E05C;
	Wed, 12 Nov 2025 10:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Oz30K3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kk28w3V4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF36A10E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:37:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9sGgF4052806
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=; b=p0Oz30K3ZkEWwuzp
 iqiim70ICP+vQQno+zYJnXP3FiLNW/NqOujPtIY2anc++sqN5gaDBPycS0NGFyFX
 dpaoAHlUUwgvFGRmEFlte6Q8mA+lKrD9UJkcg1RWWZA4pZpilpZt69WCHX9kZaoz
 3iG3mxKT/mv/TWO1givhucRFRitwKYp92KbL6yeP7RnsGST1HSYK6DeJ8D2z78pf
 fLH8OFRFwugXCRlNnTYSgmUaLMsZMHKuIBbKB7GCEQEYfqshTC+LviPVOOA7SKdX
 CXobtf7q7JlojXQJW4Mn8oAhLcQ+baKjrmDIsLWcCpZC6lJXo78vrDERvDKQ13HS
 /bV64Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v9bvs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:37:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b25db7fd44so25048685a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762943852; x=1763548652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=;
 b=kk28w3V4/fuzxk6gKdvRuKY8ftlyuFgYL3Ojq5uEnqZiIldoEPYryG7idt68Upprl/
 j7IaQBP4yQhTrTygYhMWQjRqixs8nDCraCdfkC4biFs3Qrmbkm0DLTQNy+tNpqb6GZlo
 2xizybjdTVA2c4xSbcuTfKRoGSEcLA0DhsZO8WQz1i7lcuMdFQ6/vCacVM81DPuZE5Pg
 VeonLMayBHATnwwKP1zr6wcKZSIFOXpxbPzPYSfL41bRjd3BgbMdoGMgP5CsTaWpLraq
 mlfcg7R/Y1LX+FCbr0Mv5rmNOgv9td+6cismIuQ9MRvCWyPv0sWrNRmiGsv+mFyY41V1
 w+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762943852; x=1763548652;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEvEVaysBiDJvqu7zSpO/ven4wuPjiUA9FzLjPjO1Lk=;
 b=nE0/8eqdLbJ5cW9AtcpnA0zfUNE7AnZ9CwPEiNYvFscD8aGO5lnpKaets27uLlsTkq
 o5wQVLtROuMeMplD54dX8wccdInuXPy/1D+Oz0WNYwOhPZR5Ke6EYXVoKFyc1JAaZgCe
 A4Ztu2YDydohj044+bRXbqsSgESfPpkuBSfeRI/fLLSmvJLnWtYMXyaPSuoYtOpfFg5B
 H/gmKBVliOvuMUSyJ1Vbxjae3jIdC3f5HeLt5HhUOzzrX2U2WmdvMiSALzGFG+Wb7UF8
 A2JJSKUFO6AlZ2iPxs9N7tEw++8LLtGVXdUSUZbIhMx4+YoAp6KqgdJkEklPs5QXNTSR
 z3Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0lulpQ7ds1Ha1PwlCO7Cfy2XIatcElaoSnKwNIlIIh7K3fLR0SIm9NC81kP3nIc90RnkKo9MmDpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNWZ5cRrStnLAyr1f6lKP+psTdea4rXep9iPpHCbzoohQo+MaT
 MW6gyryXsnP7FyDx9M1iwulM/tHWTzXeEejGyy5ckfQx6yWvdc/qLYcY6qzNUdnAN8RqDXENmOo
 QDLiTZZujCTJncYqU9wBLPfFvgSdTYQoODnI2gts9ajCalt0ceIB14qM7zgoOzhoK2fY2uLc=
X-Gm-Gg: ASbGncsmCX9guAG5R39gcqh6acYVmZLlM7kN2XHDzTAq14FFEwJQWuJGivpiJ94fgmD
 Kio1v7lo1Ef5eFhxQ4zImKAu2+WtmxEqzCG7k3eylgmztgfe25/IM4pfKn1x4iyVsNu0Otrqfop
 kZqKa+CxXnleViKAZuXWef8y2KckknD4d0ymE12Qp52QgslBntkyGxKlIRGcSemZ3GxCuUNg0lq
 iQ9jdg8WFZJ3V5O5BWmzTjQgqiBkmS1C+LfVi9linPj+fd8gLVd+jxbKXiVWFQuD5ZNQHOJXzpF
 fEh8fETstXL01XXdkJkqmrS2nZcOCXGoVrs8lklNTz8dhU6HLvX1/c8iwWjC5AKOKCjo0u6WnF2
 IT3mp98d/WRJB/moosCa1iRzqKt4/d//rkizwLgQ/YTdxaawKiubYS4V/
X-Received: by 2002:a05:620a:c44:b0:8a2:eb35:8df9 with SMTP id
 af79cd13be357-8b29b96bfacmr174330585a.11.1762943852383; 
 Wed, 12 Nov 2025 02:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnodYPH8G4uSHNNb8nQWE1cE1kx1PmZfPb6CE/gBIDzIV9Um7jRFbvxAfRziignE7KgxTdXA==
X-Received: by 2002:a05:620a:c44:b0:8a2:eb35:8df9 with SMTP id
 af79cd13be357-8b29b96bfacmr174327385a.11.1762943851866; 
 Wed, 12 Nov 2025 02:37:31 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa0f37csm1559184066b.64.2025.11.12.02.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:37:31 -0800 (PST)
Message-ID: <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BN-h5zPsUY4M76ubgdsyfO2VeIdTnwsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NSBTYWx0ZWRfX2dDQVxcKMq/D
 frqaH/6yec5EaD1RR38g9hGFKmZTj3iBKzox3H9hcO+eNzjW4HA7z5rSRRw9O0qqwIU4FJ+pwRJ
 wJHJNQHg7Rlb1obWWZK+pIgnkoQBeKHzEVM9GiUquGPfqPyg1JJr0uMLGrwrqZFmzqyH92f/Lj1
 1bF3Rf4eJbs7A0d8fNKOu3vBg3BGZiSvcu1dHUiUqjYGJU22VAyHkXef5nkCsNaaqgxDzxuU0V4
 8xqPsGam5fLtt7iJmfSes4w0srJC7kaqmXNauR5oKsuuNHVCML8mahhP2jhUMxALAPa3HzyVKoD
 pmbI1VZfprftHaZeypnQZ9waDVB0V3JeVBQfb/SM4hwlgZBVEKgxtYuCMfJycIRfFMcKoFFoETi
 isMJidg2nKQ0yw3Ln1zjE0wGHZ/LEQ==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=6914636d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XltbfQAJAwjtl7jyp1EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BN-h5zPsUY4M76ubgdsyfO2VeIdTnwsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120085
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. This was not a problem so far, but
> A840 GPU is very sensitive to this requirement. Also, move these
> registers to the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
> +	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
> +		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);

We haven't been doing this a lot in the GPU driver, but adding a
.num_entries-like field is both more memory efficient and less error-prone

> +
> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */

duplicate comment

> +	if (adreno_is_a8xx(adreno_gpu)) {
> +		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
> +		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);

Either set this prio value here, or in a8xx_gpu.c

> +	}
> +
>  	/* Set up the lowest idle level on the GMU */
>  	a6xx_gmu_power_config(gmu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 029f7bd25baf..66771958edb2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* enable hardware clockgating */
>  	a6xx_set_hwcg(gpu, true);
>  
> -	/* VBIF/GBIF start*/
> -	if (adreno_is_a610_family(adreno_gpu) ||
> -	    adreno_is_a640_family(adreno_gpu) ||
> -	    adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu)) {
> +	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
> +	if (adreno_is_a610_family(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);

a640/650 family GPUs didn't receive a .gbif_cx addition in the catalog to match

>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
> -			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
> +	}
> +
> +	if (adreno_is_a610_family(adreno_gpu) ||
> +	    adreno_is_a640_family(adreno_gpu) ||
> +	    adreno_is_a650_family(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
> +	} else if (adreno_is_a7xx(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
>  	} else {
>  		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);

Downstream seems to set QOS_CNTL at the same time as QSB_SIDEn for
these targets


>  	}
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 031ca0e4b689..cf700f7de09b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -46,6 +46,7 @@ struct a6xx_info {
>  	const struct adreno_protect *protect;
>  	const struct adreno_reglist_list *pwrup_reglist;
>  	const struct adreno_reglist_list *ifpc_reglist;
> +	const struct adreno_reglist *gbif_cx;
>  	const struct adreno_reglist_pipe *nonctxt_reglist;
>  	u32 gmu_chipid;
>  	u32 gmu_cgc_mode;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 2ef69161f1d0..ad140b0d641d 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>  
> +	/* Increase priority of GMU traffic over GPU traffic */
> +	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);

Kgsl (later) added this for A740 too - would it be beneficial to enable
unconditionally on gen7+?

Konrad
