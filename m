Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C846F5AA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 22:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6018410E370;
	Thu,  9 Dec 2021 21:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3B210E370;
 Thu,  9 Dec 2021 21:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639084316; x=1670620316;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bxqcNgelakS2Sn/VK9ZIj3BlsM3fX3wAeAOn9QccZzU=;
 b=I6x+kFgJc3G3vjAFsOVrV6QGmEVmRNaqhD53dytFW11YCjr3gpx3SPzR
 rKaYYtYkIfoSNFrsUjhYB8gYX7LIhN3dwBn/eBLfnXf9uMBTAb6V3jMoG
 QVjfnYSZvLp0vU/6J5Ss+X49uEQCIRel55rT4XZPhkSNIBWJZf8FIp9sl o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Dec 2021 13:11:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 13:11:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 13:11:54 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 13:11:52 -0800
Message-ID: <ebb421f7-2f6f-4cd8-3faa-3e2dd4561fc9@quicinc.com>
Date: Thu, 9 Dec 2021 13:11:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 6/8] drm/msm/dpu: stop manually removing
 debugfs files for the DPU CRTC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-7-dmitry.baryshkov@linaro.org>
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
> DRM code handles removing all debugfs recursively. Drop CRTC-specific
> code to perform that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  3 ---
>   2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d290809d59bd..9899f7424131 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1424,15 +1424,16 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
>   static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct dentry *debugfs_root;
>   
> -	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
> +	debugfs_root = debugfs_create_dir(dpu_crtc->name,
>   			crtc->dev->primary->debugfs_root);
>   
>   	debugfs_create_file("status", 0400,
> -			dpu_crtc->debugfs_root,
> +			debugfs_root,
>   			dpu_crtc, &_dpu_debugfs_status_fops);
>   	debugfs_create_file("state", 0600,
> -			dpu_crtc->debugfs_root,
> +			debugfs_root,
>   			&dpu_crtc->base,
>   			&dpu_crtc_debugfs_state_fops);
>   
> @@ -1450,13 +1451,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
>   	return _dpu_crtc_init_debugfs(crtc);
>   }
>   
> -static void dpu_crtc_early_unregister(struct drm_crtc *crtc)
> -{
> -	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> -
> -	debugfs_remove_recursive(dpu_crtc->debugfs_root);
> -}
> -
>   static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.set_config = drm_atomic_helper_set_config,
>   	.destroy = dpu_crtc_destroy,
> @@ -1465,7 +1459,6 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.atomic_duplicate_state = dpu_crtc_duplicate_state,
>   	.atomic_destroy_state = dpu_crtc_destroy_state,
>   	.late_register = dpu_crtc_late_register,
> -	.early_unregister = dpu_crtc_early_unregister,
>   	.verify_crc_source = dpu_crtc_verify_crc_source,
>   	.set_crc_source = dpu_crtc_set_crc_source,
>   	.enable_vblank  = msm_crtc_enable_vblank,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 4328e133d71c..b8785c394fcc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -129,7 +129,6 @@ struct dpu_crtc_frame_event {
>    * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
>    * @property_info : Opaque structure for generic property support
>    * @property_defaults : Array of default values for generic property support
> - * @debugfs_root  : Parent of debugfs node
>    * @vblank_cb_count : count of vblank callback since last reset
>    * @play_count    : frame count between crtc enable and disable
>    * @vblank_cb_time  : ktime at vblank count reset
> @@ -160,8 +159,6 @@ struct dpu_crtc {
>   	struct drm_pending_vblank_event *event;
>   	u32 vsync_count;
>   
> -	struct dentry *debugfs_root;
> -
>   	u32 vblank_cb_count;
>   	u64 play_count;
>   	ktime_t vblank_cb_time;
> 
