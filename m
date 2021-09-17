Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B721240FF58
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 20:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816346EE6A;
	Fri, 17 Sep 2021 18:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92A56EE6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 18:27:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631903285; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ehgn3nbxS1ZKthN7E5qnwl/f3AisWEzTHt1QogJw6Vg=;
 b=hhU5S0yjjFoIVAjaOXkRQI08o9S7UFutdhmrP7bo+Nx3+nUXXf4qUxq2JweVAN0WGvFGxJA9
 a4CMLncDxDdICauykcNE/UIP2GHhw4PlKS7tzi5CEUCJr64wqM+pZ+0g/ZsMgxW2ydpEs/a5
 i84HZfT0/bO92Xyn0P+XQLr/tg4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6144de1fc1b30e2f026a3e4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 18:27:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3ECCDC4360C; Fri, 17 Sep 2021 18:27:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 98B03C4338F;
 Fri, 17 Sep 2021 18:27:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Sep 2021 11:27:41 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>
Subject: Re: [RESEND PATCH v6 13/14] drm/atomic: Use debug category printer
 for atomic state printer
In-Reply-To: <20210721175526.22020-14-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-14-sean@poorly.run>
Message-ID: <0a77ede789020d44b8e019f57d4c7469@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-21 10:55, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The atomic state is printed if the DRM_UT_STATE is active, but it's
> printed at INFO level. This patch converts it to use the debug
> category printer so:
> 
> a- it's consistent with other DRM_UT_STATE logging
> b- it's properly routed through drm_trace when introduced
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> Changes in v6:
> -Added to the set
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 7e48d40600ff..7615ded60195 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1322,7 +1322,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	struct drm_out_fence_state *fence_state;
>  	int ret = 0;
>  	unsigned int i, j, num_fences;
> -	struct drm_printer p = drm_info_printer(dev->dev);
> +	struct drm_printer p = drm_debug_category_printer(DRM_UT_STATE,
> "commit_state");
> 
>  	/* disallow for drivers not supporting atomic: */
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
