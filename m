Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4E4BF495
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DF10E525;
	Tue, 22 Feb 2022 09:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C400B10E64F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:21:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21M7FV2l030870;
 Tue, 22 Feb 2022 10:21:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kEFhzcWqIoIRBPhQy2qkdqT6c0JMDhAmAB+2aO+k88w=;
 b=nzMGm8qIDTZhm8pgNU+SOPimOyVCMjfXixF6gNtqtzasObJOYIrIP4slOKw/xxIkC9lk
 coYdVuLNOFLg5sR59cRryErhTaf8UqFd76crCA7ILJsgMlapu1YAtCouBLDPu9PHjnGf
 mEBOFb53sI4dA4nYEbarAEDvRISCSitnBtgkk373xdfDfpeAnbBcwsvD1kWbGMMCdxFG
 kZ0OLWLLYPPwaTZ2gVvp93BXD4W5CDHr5lCwZbNaLBD8YXkBLFQiLTL7xeMaCB/KkEHD
 E7hh2efZCZVzSibubbbJ+2X22qShQKzLwMI2rwNtR1WHOUvYRXokgnpLfX89s9Ufw0pR TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ecu9g8tyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 10:21:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FFE9100034;
 Tue, 22 Feb 2022 10:21:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E521215136;
 Tue, 22 Feb 2022 10:21:48 +0100 (CET)
Received: from [10.211.4.126] (10.75.127.48) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Feb
 2022 10:21:47 +0100
Message-ID: <857b5ec9-4cfc-c700-a528-feae83dee890@foss.st.com>
Date: Tue, 22 Feb 2022 10:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/stm: ltdc: add support for CRC hashing feature
Content-Language: en-US
To: =?UTF-8?Q?Rapha=c3=abl_Gallais-Pou?= <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220211104620.421177-1-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20220211104620.421177-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
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
Cc: linux-arm-kernel@lists.infradead.org,
 Raphael Gallais-Pou <raphael.gallais-pou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raphael,
thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Best regards


On 2/11/22 11:46, Raphaël Gallais-Pou wrote:
> From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> 
> This patch adds the CRC hashing feature supported by some recent hardware
> versions of the LTDC. This is useful for test suite such as IGT-GPU-tools
> [1] where a CRTC output frame can be compared to a test reference frame
> thanks to their respective CRC hash.
> 
> [1] https://cgit.freedesktop.org/drm/igt-gpu-tools
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 104 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/stm/ltdc.h |   3 ++
>   2 files changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..b29476aec3a1 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -77,6 +77,7 @@
>   #define LTDC_CPSR	0x0044		/* Current Position Status */
>   #define LTDC_CDSR	0x0048		/* Current Display Status */
>   #define LTDC_EDCR	0x0060		/* External Display Control */
> +#define LTDC_CCRCR	0x007C		/* Computed CRC value */
>   #define LTDC_FUT	0x0090		/* Fifo underrun Threshold */
>   
>   /* Layer register offsets */
> @@ -121,6 +122,7 @@
>   
>   #define GCR_LTDCEN	BIT(0)		/* LTDC ENable */
>   #define GCR_DEN		BIT(16)		/* Dither ENable */
> +#define GCR_CRCEN	BIT(19)		/* CRC ENable */
>   #define GCR_PCPOL	BIT(28)		/* Pixel Clock POLarity-Inverted */
>   #define GCR_DEPOL	BIT(29)		/* Data Enable POLarity-High */
>   #define GCR_VSPOL	BIT(30)		/* Vertical Synchro POLarity-High */
> @@ -227,6 +229,13 @@
>   
>   #define NB_PF		8		/* Max nb of HW pixel format */
>   
> +/*
> + * Skip the first value and the second in case CRC was enabled during
> + * the thread irq. This is to be sure CRC value is relevant for the
> + * frame.
> + */
> +#define CRC_SKIP_FRAMES 2
> +
>   enum ltdc_pix_fmt {
>   	PF_NONE,
>   	/* RGB formats */
> @@ -664,6 +673,26 @@ static inline void ltdc_set_ycbcr_coeffs(struct drm_plane *plane)
>   		     ltdc_ycbcr2rgb_coeffs[enc][ran][1]);
>   }
>   
> +static inline void ltdc_irq_crc_handle(struct ltdc_device *ldev,
> +				       struct drm_crtc *crtc)
> +{
> +	u32 crc;
> +	int ret;
> +
> +	if (ldev->crc_skip_count < CRC_SKIP_FRAMES) {
> +		ldev->crc_skip_count++;
> +		return;
> +	}
> +
> +	/* Get the CRC of the frame */
> +	ret = regmap_read(ldev->regmap, LTDC_CCRCR, &crc);
> +	if (ret)
> +		return;
> +
> +	/* Report to DRM the CRC (hw dependent feature) */
> +	drm_crtc_add_crc_entry(crtc, true, drm_crtc_accurate_vblank_count(crtc), &crc);
> +}
> +
>   static irqreturn_t ltdc_irq_thread(int irq, void *arg)
>   {
>   	struct drm_device *ddev = arg;
> @@ -671,9 +700,14 @@ static irqreturn_t ltdc_irq_thread(int irq, void *arg)
>   	struct drm_crtc *crtc = drm_crtc_from_index(ddev, 0);
>   
>   	/* Line IRQ : trigger the vblank event */
> -	if (ldev->irq_status & ISR_LIF)
> +	if (ldev->irq_status & ISR_LIF) {
>   		drm_crtc_handle_vblank(crtc);
>   
> +		/* Early return if CRC is not active */
> +		if (ldev->crc_active)
> +			ltdc_irq_crc_handle(ldev, crtc);
> +	}
> +
>   	/* Save FIFO Underrun & Transfer Error status */
>   	mutex_lock(&ldev->err_lock);
>   	if (ldev->irq_status & ISR_FUIF)
> @@ -1079,6 +1113,48 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
>   	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE);
>   }
>   
> +static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
> +{
> +	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> +	int ret;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	if (!crtc)
> +		return -ENODEV;
> +
> +	if (source && strcmp(source, "auto") == 0) {
> +		ldev->crc_active = true;
> +		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
> +	} else if (!source) {
> +		ldev->crc_active = false;
> +		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
> +	} else {
> +		ret = -EINVAL;
> +	}
> +
> +	ldev->crc_skip_count = 0;
> +	return ret;
> +}
> +
> +static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
> +				       const char *source, size_t *values_cnt)
> +{
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	if (!crtc)
> +		return -ENODEV;
> +
> +	if (source && strcmp(source, "auto") != 0) {
> +		DRM_DEBUG_DRIVER("Unknown CRC source %s for %s\n",
> +				 source, crtc->name);
> +		return -EINVAL;
> +	}
> +
> +	*values_cnt = 1;
> +	return 0;
> +}
> +
>   static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>   	.destroy = drm_crtc_cleanup,
>   	.set_config = drm_atomic_helper_set_config,
> @@ -1091,6 +1167,20 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
>   	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>   };
>   
> +static const struct drm_crtc_funcs ltdc_crtc_with_crc_support_funcs = {
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = ltdc_crtc_enable_vblank,
> +	.disable_vblank = ltdc_crtc_disable_vblank,
> +	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +	.set_crc_source = ltdc_crtc_set_crc_source,
> +	.verify_crc_source = ltdc_crtc_verify_crc_source,
> +};
> +
>   /*
>    * DRM_PLANE
>    */
> @@ -1478,8 +1568,13 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   
>   	drm_plane_create_zpos_immutable_property(primary, 0);
>   
> -	ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> -					&ltdc_crtc_funcs, NULL);
> +	/* Init CRTC according to its hardware features */
> +	if (ldev->caps.crc)
> +		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> +						&ltdc_crtc_with_crc_support_funcs, NULL);
> +	else
> +		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> +						&ltdc_crtc_funcs, NULL);
>   	if (ret) {
>   		DRM_ERROR("Can not initialize CRTC\n");
>   		goto cleanup;
> @@ -1629,6 +1724,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_input = false;
>   		ldev->caps.ycbcr_output = false;
>   		ldev->caps.plane_reg_shadow = false;
> +		ldev->caps.crc = false;
>   		break;
>   	case HWVER_20101:
>   		ldev->caps.layer_ofs = LAY_OFS_0;
> @@ -1643,6 +1739,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_input = false;
>   		ldev->caps.ycbcr_output = false;
>   		ldev->caps.plane_reg_shadow = false;
> +		ldev->caps.crc = false;
>   		break;
>   	case HWVER_40100:
>   		ldev->caps.layer_ofs = LAY_OFS_1;
> @@ -1657,6 +1754,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.ycbcr_input = true;
>   		ldev->caps.ycbcr_output = true;
>   		ldev->caps.plane_reg_shadow = true;
> +		ldev->caps.crc = true;
>   		break;
>   	default:
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index 6968d1ca5149..59fc5d1bbbab 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -27,6 +27,7 @@ struct ltdc_caps {
>   	bool ycbcr_input;	/* ycbcr input converter supported */
>   	bool ycbcr_output;	/* ycbcr output converter supported */
>   	bool plane_reg_shadow;	/* plane shadow registers ability */
> +	bool crc;		/* cyclic redundancy check supported */
>   };
>   
>   #define LTDC_MAX_LAYER	4
> @@ -46,6 +47,8 @@ struct ltdc_device {
>   	u32 irq_status;
>   	struct fps_info plane_fpsi[LTDC_MAX_LAYER];
>   	struct drm_atomic_state *suspend_state;
> +	int crc_skip_count;
> +	bool crc_active;
>   };
>   
>   int ltdc_load(struct drm_device *ddev);
