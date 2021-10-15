Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BB42FEFC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 01:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0F66EE0C;
	Fri, 15 Oct 2021 23:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5246E3F9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 23:44:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634341477; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jJ/9pFPB6gmJ0baQgefAhJuGAxI+QH/7x+kb0x64v+I=;
 b=uKFSAPXahBAYtY2KUo95QUOBH2oHmYi/ElXQTFv+aGJFWuiP7F2Oi4crkTcJxbPm4H73LyJO
 GOwR174c2AGbPStvrjPXi5ZDVxfAS6bnP91LxCJW3cByS3CLFehLVog5ecJm4eLBEZtaHpjf
 MYJSD/nqZSDdrt1qvL/OowTyBC8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 616a1264f3e5b80f1fdd50f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 23:44:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6CA4FC43618; Fri, 15 Oct 2021 23:44:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 909C7C4338F;
 Fri, 15 Oct 2021 23:44:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Oct 2021 16:44:35 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh
 <khsieh@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Only create debugfs for PRIMARY
 minor
In-Reply-To: <20211015231307.1784165-1-bjorn.andersson@linaro.org>
References: <20211015231307.1784165-1-bjorn.andersson@linaro.org>
Message-ID: <48f35ef1f90bc7c23599e98a5c1e2c09@codeaurora.org>
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

On 2021-10-15 16:13, Bjorn Andersson wrote:
> dpu_kms_debugfs_init() and hence dp_debug_get() gets invoked for each
> minor being registered. But dp_debug_get() will allocate a new struct
> dp_debug for each call and this will be associated as dp->debug.
> 
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
> 
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create dp_debug for the PRIMARY minor.
> 

If i understand correctly, today because of this, we get redundant 
debugfs nodes right?

/sys/kernel/debug/dri/<minor_x>/dp_debug
/sys/kernel/debug/dri/<minor_y>/dp_debug

Both of these will hold the same information as they are for the same DP 
controller right?
In that case, this is true even for the other DPU kms information too.

Why not move this check one level up to dpu_kms_debugfs_init?

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3aa67c53dbc0..06773b58bb60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>  #include <linux/component.h>
>  #include <linux/of_irq.h>
>  #include <linux/delay.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_panel.h>
> 
>  #include "msm_drv.h"
> @@ -1463,6 +1464,10 @@ void msm_dp_debugfs_init(struct msm_dp
> *dp_display, struct drm_minor *minor)
>  	dp = container_of(dp_display, struct dp_display_private, dp_display);
>  	dev = &dp->pdev->dev;
> 
> +	/* Only create one set of debugfs per DP instance */
> +	if (minor->type != DRM_MINOR_PRIMARY)
> +		return;
> +
>  	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
>  					dp->link, dp->dp_display.connector,
>  					minor);
