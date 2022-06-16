Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93954EB6D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 22:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AB810EAE8;
	Thu, 16 Jun 2022 20:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6370D10E590;
 Thu, 16 Jun 2022 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655412181; x=1686948181;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+pvXpGgCvGMLklfAcFFyeylmCVs7Y2BlrR5HvOXQd8s=;
 b=AAE/GqD7jgFLYNHG6ZlBilnDcJl1ytAApfpbziZTNr+VSyIHLDdJQj57
 sCfYAeDL24XgoQc0asRguEdJw5CX9H2X+xk928mkLKt61+Gp0xUDF8ifN
 usQJTWLaPCvvQbhyE3fTdWKhRbFgB21J2xgtC7LUJHwsd61oR+CUrk6vD g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 13:43:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:43:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 13:43:00 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 13:42:57 -0700
Message-ID: <2217f2a6-c94c-0efe-a58c-ddae015f6d49@quicinc.com>
Date: Thu, 16 Jun 2022 13:42:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/3] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
 <20220507170922.1723712-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507170922.1723712-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/2022 10:09 AM, Dmitry Baryshkov wrote:
> Handling the array of CRTC duplicate the struct msm_drm_private
> duplicates a list of CRTCs in the drm_device. Drop it and use the

There seem to be two duplicates in the commit text :)

So this should just be "handling the array of CRTCs duplicates a list of
of CRTCs in the drm_device.

> existing list for CRTC enumeration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Intialize the index variable in msm_drm_init() / event thread
>    initialization.
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c            | 29 ++++++++++++------------
>   drivers/gpu/drm/msm/msm_drv.h            |  3 +--
>   5 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..c84859fb2d9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -808,7 +808,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   			ret = PTR_ERR(crtc);
>   			return ret;
>   		}
> -		priv->crtcs[priv->num_crtcs++] = crtc;
> +		priv->num_crtcs++;
>   	}
>   
>   	/* All CRTCs are compatible with all encoders */
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index fb48c8c19ec3..7449c1693e45 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -337,7 +337,7 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
>   			goto fail;
>   		}
>   
> -		priv->crtcs[priv->num_crtcs++] = crtc;
> +		priv->num_crtcs++;
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3d5621a68f85..36808990f840 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -497,7 +497,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
>   			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
>   			goto fail;
>   		}
> -		priv->crtcs[priv->num_crtcs++] = crtc;
> +		priv->num_crtcs++;
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4a3dda23e3e0..db676a142ac1 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -144,7 +144,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   
>   struct msm_vblank_work {
>   	struct work_struct work;
> -	int crtc_id;
> +	struct drm_crtc *crtc;
>   	bool enable;
>   	struct msm_drm_private *priv;
>   };
> @@ -157,15 +157,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
>   	struct msm_kms *kms = priv->kms;
>   
>   	if (vbl_work->enable)
> -		kms->funcs->enable_vblank(kms, priv->crtcs[vbl_work->crtc_id]);
> +		kms->funcs->enable_vblank(kms, vbl_work->crtc);
>   	else
> -		kms->funcs->disable_vblank(kms,	priv->crtcs[vbl_work->crtc_id]);
> +		kms->funcs->disable_vblank(kms,	vbl_work->crtc);
>   
>   	kfree(vbl_work);
>   }
>   
>   static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
> -					int crtc_id, bool enable)
> +					struct drm_crtc *crtc, bool enable)
>   {
>   	struct msm_vblank_work *vbl_work;
>   
> @@ -175,7 +175,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>   
>   	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
>   
> -	vbl_work->crtc_id = crtc_id;
> +	vbl_work->crtc = crtc;
>   	vbl_work->enable = enable;
>   	vbl_work->priv = priv;
>   
> @@ -349,6 +349,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev;
>   	struct msm_kms *kms;
> +	struct drm_crtc *crtc;
>   	int ret, i;
>   
>   	if (drm_firmware_drivers_only())
> @@ -422,12 +423,14 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	ddev->mode_config.funcs = &mode_config_funcs;
>   	ddev->mode_config.helper_private = &mode_config_helper_funcs;
>   
> -	for (i = 0; i < priv->num_crtcs; i++) {
> +	drm_for_each_crtc(crtc, ddev) {
> +		i = drm_crtc_index(crtc);
> +
>   		/* initialize event thread */
> -		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> +		priv->event_thread[i].crtc = crtc;
>   		priv->event_thread[i].dev = ddev;

Do we really need 'i' here?
Can't we just do priv->event_thread[drm_crtc_index(crtc)]?

>   		priv->event_thread[i].worker = kthread_create_worker(0,
> -			"crtc_event:%d", priv->event_thread[i].crtc_id);
> +			"crtc_event:%d", priv->event_thread[i].crtc->base.id);
>   		if (IS_ERR(priv->event_thread[i].worker)) {
>   			ret = PTR_ERR(priv->event_thread[i].worker);
>   			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> @@ -558,25 +561,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>   int msm_crtc_enable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = crtc->index;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   	if (!kms)
>   		return -ENXIO;
> -	drm_dbg_vbl(dev, "crtc=%u", pipe);
> -	return vblank_ctrl_queue_work(priv, pipe, true);
> +	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
> +	return vblank_ctrl_queue_work(priv, crtc, true);
>   }
>   
>   void msm_crtc_disable_vblank(struct drm_crtc *crtc)
>   {
>   	struct drm_device *dev = crtc->dev;
> -	unsigned int pipe = crtc->index;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   	if (!kms)
>   		return;
> -	drm_dbg_vbl(dev, "crtc=%u", pipe);
> -	vblank_ctrl_queue_work(priv, pipe, false);
> +	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
> +	vblank_ctrl_queue_work(priv, crtc, false);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index fdbaad53eb84..2ba57c575e13 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -102,7 +102,7 @@ struct msm_display_topology {
>   /* Commit/Event thread specific structure */
>   struct msm_drm_thread {
>   	struct drm_device *dev;
> -	unsigned int crtc_id;
> +	struct drm_crtc *crtc;
>   	struct kthread_worker *worker;
>   };
>   
> @@ -178,7 +178,6 @@ struct msm_drm_private {
>   	struct workqueue_struct *wq;
>   
>   	unsigned int num_crtcs;
> -	struct drm_crtc *crtcs[MAX_CRTCS];
>   
>   	struct msm_drm_thread event_thread[MAX_CRTCS];
>   
