Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1767A8A2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 03:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08AE10E0D6;
	Wed, 25 Jan 2023 02:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7C10E0D6;
 Wed, 25 Jan 2023 02:14:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30P1x6Fn018882; Wed, 25 Jan 2023 02:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=beeUc3L325L62rg/eyV+j2jJLJ37S7CXlhuOe5vf3Ig=;
 b=Ft4Pf0YoMt+ZJjRqG6qihN99VnS1c1c0+LQWT+EBfwwwLo/C314U99nD485mUycBP9Bl
 F0CENgZfkxx4a9TP8tKnvlCMY4Z3mGdvxhgfm8ywOrg6E1vjFGOiYgZ/VehkoIH4SoNf
 6Z/ZkAq4VL5Po9eY135hx+lUTVu8p7CGHOa51D1Jvo//Cl7iBHdA4kSSuWD7/Bqai6PD
 YOAfPD63aP0npFqTecRQ5EagmKInhSxK7SAQpTBdpe2q/I+r5uqOQAeRwzfUgAGWj6in
 WI7XL6mx69cIo2v1SPuo83usYHwfqfU8sIEqqASsuSBt/g/BzSRX4NH7yPJZ+fyatG5O CA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3najkh910b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 02:14:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30P2EXtn005482
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 02:14:33 GMT
Received: from [10.110.33.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 18:14:32 -0800
Message-ID: <37cf7080-8c4c-556c-a97c-ef0b0db1db11@quicinc.com>
Date: Tue, 24 Jan 2023 18:14:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 4/4] drm/msm: stop storing the array of CRTCs in struct
 msm_drm_private
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220617233328.1143665-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: edqadOcfJMtzd_vGuvQeHHln6gfe87dI
X-Proofpoint-GUID: edqadOcfJMtzd_vGuvQeHHln6gfe87dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250015
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



On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
> The array of CRTC in the struct msm_drm_private duplicates a list of
> CRTCs in the drm_device. Drop it and use the existing list for CRTC
> enumeration.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
>   drivers/gpu/drm/msm/msm_drv.h            |  3 +-
>   5 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e23e2552e802..e79f0a8817ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -806,7 +806,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
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
> index 1aab6bf86278..567e77dae43b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -149,7 +149,7 @@ static void msm_irq_uninstall(struct drm_device *dev)
>   
>   struct msm_vblank_work {
>   	struct work_struct work;
> -	int crtc_id;
> +	struct drm_crtc *crtc;
>   	bool enable;
>   	struct msm_drm_private *priv;
>   };
> @@ -162,15 +162,15 @@ static void vblank_ctrl_worker(struct work_struct *work)
>   	struct msm_kms *kms = priv->kms;
>   

Is there any chance of vbl_work->crtc becoming NULL before this gets 
executed?

So do we need to protect this like

if (vbl_work->enable && vbl_work->crtc)

Because the layers below this dont seem to have NULL protection.


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
> @@ -180,7 +180,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
>   
>   	INIT_WORK(&vbl_work->work, vblank_ctrl_worker);
>   
> -	vbl_work->crtc_id = crtc_id;
> +	vbl_work->crtc = crtc;
>   	vbl_work->enable = enable;
>   	vbl_work->priv = priv;
>   
> @@ -354,7 +354,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	struct msm_drm_private *priv = dev_get_drvdata(dev);
>   	struct drm_device *ddev;
>   	struct msm_kms *kms;
> -	int ret, i;
> +	struct drm_crtc *crtc;
> +	int ret;
>   
>   	if (drm_firmware_drivers_only())
>   		return -ENODEV;
> @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	ddev->mode_config.funcs = &mode_config_funcs;
>   	ddev->mode_config.helper_private = &mode_config_helper_funcs;
>   
> -	for (i = 0; i < priv->num_crtcs; i++) {
> +	drm_for_each_crtc(crtc, ddev) {
> +		struct msm_drm_thread *ev_thread;
> +
>   		/* initialize event thread */
> -		priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> -		priv->event_thread[i].dev = ddev;
> -		priv->event_thread[i].worker = kthread_create_worker(0,
> -			"crtc_event:%d", priv->event_thread[i].crtc_id);
> -		if (IS_ERR(priv->event_thread[i].worker)) {
> -			ret = PTR_ERR(priv->event_thread[i].worker);
> +		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> +		ev_thread->crtc = crtc;
> +		ev_thread->dev = ddev;
> +		ev_thread->worker = kthread_create_worker(0,
> +			"crtc_event:%d", ev_thread->crtc->base.id);

Please correct me if wrong.

Today, other than just populating the name for the worker is the 
ev_thread->crtc used anywhere?

If so, can we just drop crtc from msm_drm_thread and while creating the 
worker just use kthread_create_worker(0, "crtc_event:%d", crtc->base.id);

> +		if (IS_ERR(ev_thread->worker)) {
> +			ret = PTR_ERR(ev_thread->worker);
>   			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> -			priv->event_thread[i].worker = NULL;
> +			ev_thread->worker = NULL;
>   			goto err_msm_uninit;
>   		}
>   
> -		sched_set_fifo(priv->event_thread[i].worker->task);
> +		sched_set_fifo(ev_thread->worker->task);
>   	}
>   
>   	ret = drm_vblank_init(ddev, priv->num_crtcs);
> @@ -563,25 +567,23 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
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
> index 08388d742d65..0e98b6f161df 100644
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
