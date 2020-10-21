Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD17294617
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 02:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E266F46B;
	Wed, 21 Oct 2020 00:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897B46F46B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 00:48:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603241339; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3XFNLBbM72ThQINa/MBg5gJYLpGf8UCxBG+6itIFgOM=;
 b=btr1xse+D+rRiiUQQxKAvjqk46j80u7nJDZLVs4kArPM/zwJINvgnBYGO4zpowoeTshAlwNy
 VdJNAHmn15dRxZwEoPfJ3/+Xrgoo8lGHu7C4SPH1j/yO0jJNBdMg/aOfR/TNIKpFX+uRSpAh
 soVaCFecgxC7sGMo8q0GwX/5RxM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8f855a588858a3047e8a05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 00:48:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9EA6BC43382; Wed, 21 Oct 2020 00:48:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 69F87C433C9;
 Wed, 21 Oct 2020 00:48:24 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 17:48:24 -0700
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/atomic: Drop per-CRTC locks in
 reverse order
In-Reply-To: <20201020222600.264876-1-robdclark@gmail.com>
References: <20201020222600.264876-1-robdclark@gmail.com>
Message-ID: <185473dc6ac6abc9a343db07a1031170@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Rob Clark <robdclark@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-20 15:26, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> lockdep dislikes seeing locks unwound in a non-nested fashion.
> 
> Fixes: 37c2016e3608 ("drm/msm: Fix race condition in msm driver with
> async layer updates")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c |  2 +-
>  drivers/gpu/drm/msm/msm_kms.h    |  4 ++++
>  include/drm/drm_crtc.h           | 10 ++++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c 
> b/drivers/gpu/drm/msm/msm_atomic.c
> index b03d6ab6b19b..6a326761dc4a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -67,7 +67,7 @@ static void unlock_crtcs(struct msm_kms *kms,
> unsigned int crtc_mask)
>  {
>  	struct drm_crtc *crtc;
> 
> -	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +	for_each_crtc_mask_reverse(kms->dev, crtc, crtc_mask)
>  		mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
> b/drivers/gpu/drm/msm/msm_kms.h
> index 8d3e626c9fee..d8151a89e163 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -211,4 +211,8 @@ int dpu_mdss_init(struct drm_device *dev);
>  	drm_for_each_crtc(crtc, dev) \
>  		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> 
> +#define for_each_crtc_mask_reverse(dev, crtc, crtc_mask) \
> +	drm_for_each_crtc_reverse(crtc, dev) \
> +		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> +
>  #endif /* __MSM_KMS_H__ */
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index dfdb04619b0d..25f5958f2882 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1274,4 +1274,14 @@ static inline struct drm_crtc
> *drm_crtc_find(struct drm_device *dev,
>  #define drm_for_each_crtc(crtc, dev) \
>  	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
> 
> +/**
> + * drm_for_each_crtc_reverse - iterate over all CRTCs in reverse order
> + * @crtc: a &struct drm_crtc as the loop cursor
> + * @dev: the &struct drm_device
> + *
> + * Iterate over all CRTCs of @dev.
> + */
> +#define drm_for_each_crtc_reverse(crtc, dev) \
> +	list_for_each_entry_reverse(crtc, &(dev)->mode_config.crtc_list, 
> head)
> +
>  #endif /* __DRM_CRTC_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
