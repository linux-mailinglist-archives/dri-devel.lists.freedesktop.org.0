Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970546F59A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 22:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095E610E2F9;
	Thu,  9 Dec 2021 21:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD33310E2F9;
 Thu,  9 Dec 2021 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639084201; x=1670620201;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rcug5uSlXbopzbAcjZO7NNHIVRfMktSazlLTvwyab+E=;
 b=fVw12caEryVTBpu8XOlh3DRxTmYQhlpdRgPTr9lbLKxKxFcomMSGbff+
 EEoj58Jar5sfhoMTGXvaflS+SUJBmwzX7NfTSEwrd8KenBUWj3WI2wpEp
 yRTOksZc7+mYJf9Oa0rgQm6af4goHeSVtwMW7n1QFArBMcORpJ5rpu4tF 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Dec 2021 13:10:00 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 13:09:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 13:09:50 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 13:09:47 -0800
Message-ID: <2e24295c-d595-ad65-5fa8-db27ef86a5e4@quicinc.com>
Date: Thu, 9 Dec 2021 13:09:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 1/8] drm/msm/dpu: move disable_danger out
 of plane subdir
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
> The disable_danger debugfs file is not related to a single plane.
> Instead it is used by all registered planes. Move it from plane subtree
> to the global subtree next to danger_status and safe_status files,
> so that the new file supplements them.
> 
the danger_safe itself is a per-plane feature as each SSPP can be 
controlled individually.

In todays code, yes we do it for all the active planes together.
Since this is the same behavior

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 70 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 74 +----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ++
>   3 files changed, 77 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6c457c419412..259d438bc6e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -101,6 +101,73 @@ static int dpu_debugfs_safe_stats_show(struct seq_file *s, void *v)
>   }
>   DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_safe_stats);
>   
> +static ssize_t _dpu_plane_danger_read(struct file *file,
> +			char __user *buff, size_t count, loff_t *ppos)
> +{
> +	struct dpu_kms *kms = file->private_data;
> +	int len;
> +	char buf[40];
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
> +
> +	return simple_read_from_buffer(buff, count, ppos, buf, len);
> +}
> +
> +static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool enable)
> +{
> +	struct drm_plane *plane;
> +
> +	drm_for_each_plane(plane, kms->dev) {
> +		if (plane->fb && plane->state) {
> +			dpu_plane_danger_signal_ctrl(plane, enable);
> +			DPU_DEBUG("plane:%d img:%dx%d ",
> +				plane->base.id, plane->fb->width,
> +				plane->fb->height);
> +			DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
> +				plane->state->src_x >> 16,
> +				plane->state->src_y >> 16,
> +				plane->state->src_w >> 16,
> +				plane->state->src_h >> 16,
> +				plane->state->crtc_x, plane->state->crtc_y,
> +				plane->state->crtc_w, plane->state->crtc_h);
> +		} else {
> +			DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
> +		}
> +	}
> +}
> +
> +static ssize_t _dpu_plane_danger_write(struct file *file,
> +		    const char __user *user_buf, size_t count, loff_t *ppos)
> +{
> +	struct dpu_kms *kms = file->private_data;
> +	int disable_panic;
> +	int ret;
> +
> +	ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
> +	if (ret)
> +		return ret;
> +
> +	if (disable_panic) {
> +		/* Disable panic signal for all active pipes */
> +		DPU_DEBUG("Disabling danger:\n");
> +		_dpu_plane_set_danger_state(kms, false);
> +		kms->has_danger_ctrl = false;
> +	} else {
> +		/* Enable panic signal for all active pipes */
> +		DPU_DEBUG("Enabling danger:\n");
> +		kms->has_danger_ctrl = true;
> +		_dpu_plane_set_danger_state(kms, true);
> +	}
> +
> +	return count;
> +}
> +
> +static const struct file_operations dpu_plane_danger_enable = {
> +	.open = simple_open,
> +	.read = _dpu_plane_danger_read,
> +	.write = _dpu_plane_danger_write,
> +};
> +
>   static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
>   		struct dentry *parent)
>   {
> @@ -110,6 +177,9 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
>   			dpu_kms, &dpu_debugfs_danger_stats_fops);
>   	debugfs_create_file("safe_status", 0600, entry,
>   			dpu_kms, &dpu_debugfs_safe_stats_fops);
> +	debugfs_create_file("disable_danger", 0600, entry,
> +			dpu_kms, &dpu_plane_danger_enable);
> +
>   }
>   
>   static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca190d92f0d5..6ea4db061c9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1350,7 +1350,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> -static void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
> +void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> @@ -1363,73 +1363,6 @@ static void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   
> -static ssize_t _dpu_plane_danger_read(struct file *file,
> -			char __user *buff, size_t count, loff_t *ppos)
> -{
> -	struct dpu_kms *kms = file->private_data;
> -	int len;
> -	char buf[40];
> -
> -	len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
> -
> -	return simple_read_from_buffer(buff, count, ppos, buf, len);
> -}
> -
> -static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool enable)
> -{
> -	struct drm_plane *plane;
> -
> -	drm_for_each_plane(plane, kms->dev) {
> -		if (plane->fb && plane->state) {
> -			dpu_plane_danger_signal_ctrl(plane, enable);
> -			DPU_DEBUG("plane:%d img:%dx%d ",
> -				plane->base.id, plane->fb->width,
> -				plane->fb->height);
> -			DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
> -				plane->state->src_x >> 16,
> -				plane->state->src_y >> 16,
> -				plane->state->src_w >> 16,
> -				plane->state->src_h >> 16,
> -				plane->state->crtc_x, plane->state->crtc_y,
> -				plane->state->crtc_w, plane->state->crtc_h);
> -		} else {
> -			DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
> -		}
> -	}
> -}
> -
> -static ssize_t _dpu_plane_danger_write(struct file *file,
> -		    const char __user *user_buf, size_t count, loff_t *ppos)
> -{
> -	struct dpu_kms *kms = file->private_data;
> -	int disable_panic;
> -	int ret;
> -
> -	ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
> -	if (ret)
> -		return ret;
> -
> -	if (disable_panic) {
> -		/* Disable panic signal for all active pipes */
> -		DPU_DEBUG("Disabling danger:\n");
> -		_dpu_plane_set_danger_state(kms, false);
> -		kms->has_danger_ctrl = false;
> -	} else {
> -		/* Enable panic signal for all active pipes */
> -		DPU_DEBUG("Enabling danger:\n");
> -		kms->has_danger_ctrl = true;
> -		_dpu_plane_set_danger_state(kms, true);
> -	}
> -
> -	return count;
> -}
> -
> -static const struct file_operations dpu_plane_danger_enable = {
> -	.open = simple_open,
> -	.read = _dpu_plane_danger_read,
> -	.write = _dpu_plane_danger_write,
> -};
> -
>   static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> @@ -1498,11 +1431,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   			pdpu->debugfs_root,
>   			(u32 *) &sblk->danger_vblank);
>   
> -	debugfs_create_file("disable_danger",
> -			0600,
> -			pdpu->debugfs_root,
> -			kms, &dpu_plane_danger_enable);
> -
>   	return 0;
>   }
>   #else
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 52792526e904..7667b1f81bd4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -132,4 +132,10 @@ void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
>   int dpu_plane_color_fill(struct drm_plane *plane,
>   		uint32_t color, uint32_t alpha);
>   
> +#ifdef CONFIG_DEBUG_FS
> +void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
> +#else
> +static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
> +#endif
> +
>   #endif /* _DPU_PLANE_H_ */
> 
