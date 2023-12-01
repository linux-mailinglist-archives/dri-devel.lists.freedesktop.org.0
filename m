Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBC800234
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 04:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB4210E7AB;
	Fri,  1 Dec 2023 03:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E610510E7AB;
 Fri,  1 Dec 2023 03:47:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B13dvlW017399; Fri, 1 Dec 2023 03:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=+r2rv+dNg+6SBATgYO1foh+WVUCA9djl2MZgUyzyGMc=;
 b=ZIH8dP6jeyE7APX52dx3jgXVDC+tr1G9pDyOSwmU1M1KiNrvhYVqospz1CIb9y0D236c
 itP9kMBCoQsvy9rafvpku70zpuLntTiWkwYuaUMQBjXDmXNlI/oI9EJ35TOB4P1h/eX1
 fv8cGUzzkBklrk36JuIRdYSLZmmORi6GqpLKryDdEgAszlZMmYIh0lYc1Dx29S4mXenQ
 afSsUir9gktK6fRrEl5H1GsManiSLjMMRpNqJ8AetkYwyO0qZqXA3fZsZd98FgTQ+rPh
 u35CqHi3C/quwEF2apVyoKADECZdxEBjXmr5wIkXiafPMle5Is7CTFTZ/SoRmsw4uBRP kA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2gfhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 03:47:12 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B13lBeF009919
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 03:47:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 19:47:11 -0800
Date: Thu, 30 Nov 2023 19:47:10 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Paloma Arellano <quic_parellan@quicinc.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Message-ID: <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231201014101.15802-3-quic_parellan@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dwD1Zkh6WcPiJbiSuQ_eeHuGpye-sILB
X-Proofpoint-ORIG-GUID: dwD1Zkh6WcPiJbiSuQ_eeHuGpye-sILB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010020
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> Add a missing mutex lock to control vblank irq. Thus prevent race
> conditions when registering/unregistering the irq callback.
> 

I'm guessing that the mutex is needed because vblank_refcount, while
being an atomic_t, doesn't actually provide any protection during
concurrency?

I also tried to follow the calls backwards, but I'm uncertain how you
end up here concurrently.

When wrapped in proper mutual exclusion, can't vblank_refcount just be
turned into an "int"...given that you're not actually able to rely on
it's atomic behavior anyways...


So, please rewrite the commit message with a detailed description of how
the concurrency happens, and please review if vblank_refcount should be
an atomic at all...

> v2: Slightly changed wording of commit message
> v3: Mistakenly did not change wording in last version. It is done now.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1cf7ff6caff4e..19ff7d1d5ccad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -119,6 +119,8 @@ enum dpu_enc_rc_states {
>   *	Virtual encoder defers as much as possible to the physical encoders.
>   *	Virtual encoder registers itself with the DRM Framework as the encoder.
>   * @base:		drm_encoder base class for registration with DRM
> + * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
> + * 						for IRQ purposes

I think this protects vblank_refcount, so state that instead of the
vague "for IRQ purposes".

>   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>   * @enabled:		True if the encoder is active, protected by enc_lock
>   * @num_phys_encs:	Actual number of physical encoders contained.
> @@ -166,6 +168,7 @@ enum dpu_enc_rc_states {
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> +	struct mutex vblank_ctl_lock;
>  	spinlock_t enc_spinlock;
>  
>  	bool enabled;
> @@ -2255,6 +2258,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  	phys_params.dpu_kms = dpu_kms;
>  	phys_params.parent = &dpu_enc->base;
>  	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
> +	phys_params.vblank_ctl_lock = &dpu_enc->vblank_ctl_lock;
>  
>  	WARN_ON(disp_info->num_of_h_tiles < 1);
>  
> @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	dpu_enc->enabled = false;
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
> +	mutex_init(&dpu_enc->vblank_ctl_lock);

Is this somehow propagated to multiple different dpu_encoder_phys
instances, or why do you need to initialize it here and pass the pointer
through 2 different intermediate structures before assigning it to
phys_enc->vblank_ctl_lock below?

>  
>  	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
>  	if (ret)
> @@ -2495,6 +2500,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
>  	phys_enc->dpu_kms = p->dpu_kms;
>  	phys_enc->split_role = p->split_role;
>  	phys_enc->enc_spinlock = p->enc_spinlock;
> +	phys_enc->vblank_ctl_lock = p->vblank_ctl_lock;

Could you not just mutex_init() the one and only vblank_ctl_lock here?

>  	phys_enc->enable_state = DPU_ENC_DISABLED;
>  
>  	atomic_set(&phys_enc->vblank_refcount, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 6f04c3d56e77c..5691bf6b82ee6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -155,6 +155,8 @@ enum dpu_intr_idx {
>   * @hw_wb:		Hardware interface to the wb registers
>   * @dpu_kms:		Pointer to the dpu_kms top level
>   * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
> + * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
> + * 						for IRQ purposes

Same here.

>   * @enabled:		Whether the encoder has enabled and running a mode
>   * @split_role:		Role to play in a split-panel configuration
>   * @intf_mode:		Interface mode
> @@ -183,6 +185,7 @@ struct dpu_encoder_phys {
>  	struct dpu_hw_wb *hw_wb;
>  	struct dpu_kms *dpu_kms;
>  	struct drm_display_mode cached_mode;
> +	struct mutex *vblank_ctl_lock;
>  	enum dpu_enc_split_role split_role;
>  	enum dpu_intf_mode intf_mode;
>  	spinlock_t *enc_spinlock;
> @@ -253,6 +256,8 @@ struct dpu_encoder_phys_cmd {
>   * @split_role:		Role to play in a split-panel configuration
>   * @hw_intf:		Hardware interface to the intf registers
>   * @hw_wb:		Hardware interface to the wb registers
> + * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
> + * 						for IRQ purposes

And here...

Regards,
Bjorn

>   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>   */
>  struct dpu_enc_phys_init_params {
> @@ -261,6 +266,7 @@ struct dpu_enc_phys_init_params {
>  	enum dpu_enc_split_role split_role;
>  	struct dpu_hw_intf *hw_intf;
>  	struct dpu_hw_wb *hw_wb;
> +	struct mutex *vblank_ctl_lock;
>  	spinlock_t *enc_spinlock;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 25babfe1f001a..dcf1f6a18ad6e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -244,6 +244,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>  		return -EINVAL;
>  	}
>  
> +	mutex_lock(phys_enc->vblank_ctl_lock);
>  	refcount = atomic_read(&phys_enc->vblank_refcount);
>  
>  	/* Slave encoders don't report vblank */
> @@ -275,6 +276,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
>  	}
>  
>  end:
> +	mutex_unlock(phys_enc->vblank_ctl_lock);
>  	if (ret) {
>  		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
>  			  DRMID(phys_enc->parent),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 8e905d7267f9f..87bb49763785d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -364,6 +364,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>  	int ret = 0;
>  	int refcount;
>  
> +	mutex_lock(phys_enc->vblank_ctl_lock);
>  	refcount = atomic_read(&phys_enc->vblank_refcount);
>  
>  	/* Slave encoders don't report vblank */
> @@ -394,6 +395,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>  	}
>  
>  end:
> +	mutex_unlock(phys_enc->vblank_ctl_lock);
>  	if (ret) {
>  		DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
>  			  DRMID(phys_enc->parent),
> -- 
> 2.41.0
> 
> 
