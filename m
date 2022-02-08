Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855294AD25E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 08:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAFF10E3BC;
	Tue,  8 Feb 2022 07:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AA910E56B;
 Tue,  8 Feb 2022 07:40:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB8E4B80D8B;
 Tue,  8 Feb 2022 07:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38174C004E1;
 Tue,  8 Feb 2022 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644306039;
 bh=hCaoJ9viHY+9jSGZzSXxNK60/DZEM/xN7vZj/9sKfXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QjPNGi2j2Y6pYYNZq4wFMBTpYumZsgXxoGwPppPNbtjBXUorM+gdM6Djm98W4TjHr
 uLW9XzYBtWFjHrwFaLIybU8f7Fx+fnzbIjUsSRSvgZN9yuyWKyidGhLdZcaG/FXlIb
 u9lvxCXvzTTR6lJIoE07Hjd3xDeKhOIi6qa+ROO0=
Date: Tue, 8 Feb 2022 08:40:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dp: Implement oob_hotplug_event()
Message-ID: <YgIecy+W/lGzL6ac@kroah.com>
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
 <20220208044328.588860-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208044328.588860-2-bjorn.andersson@linaro.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 08:43:28PM -0800, Bjorn Andersson wrote:
> The Qualcomm DisplayPort driver contains traces of the necessary
> plumbing to hook up USB HPD, in the form of the dp_hpd module and the
> dp_usbpd_cb struct. Use this as basis for implementing the
> oob_hotplug_event() callback, by amending the dp_hpd module with the
> missing logic.
> 
> Overall the solution is similar to what's done downstream, but upstream
> all the code to disect the HPD notification lives on the calling side of
> drm_connector_oob_hotplug_event().
> 
> drm_connector_oob_hotplug_event() performs the lookup of the
> drm_connector based on fwnode, hence the need to assign the fwnode in
> dp_drm_connector_init().
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_hpd.c     | 19 +++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_hpd.h     |  4 ++++
>  5 files changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21f2091..124a2f794382 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -414,6 +414,13 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>  	return dp_display_process_hpd_high(dp);
>  }
>  
> +void dp_display_oob_hotplug_event(struct msm_dp *dp_display, bool hpd_state)
> +{
> +	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	dp->usbpd->oob_event(dp->usbpd, hpd_state);
> +}
> +
>  static int dp_display_usbpd_disconnect_cb(struct device *dev)
>  {
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> @@ -1251,6 +1258,7 @@ static int dp_display_probe(struct platform_device *pdev)
>  	dp->pdev = pdev;
>  	dp->name = "drm_dp";
>  	dp->dp_display.connector_type = desc->connector_type;
> +	dp->dp_display.dev = &pdev->dev;

You did not properly reference count this pointer you just saved.  What
is to keep that pointer from going away without you knowing about it?

And you already have a pointer to pdev, why save another one here?

>  
>  	rc = dp_init_sub_modules(dp);
>  	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e3adcd578a90..1f856b3bca79 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -11,6 +11,7 @@
>  #include "disp/msm_disp_snapshot.h"
>  
>  struct msm_dp {
> +	struct device *dev;
>  	struct drm_device *drm_dev;
>  	struct device *codec_dev;

So you now have pointers to 3 different devices here?  What does 'dev'
point to that the other ones do not?  This needs to be documented really
well here.

thanks,

greg k-h
