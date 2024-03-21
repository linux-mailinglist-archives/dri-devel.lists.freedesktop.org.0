Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10711885621
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E3510E3B4;
	Thu, 21 Mar 2024 09:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="os0OZ59W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B834A10E3B4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 09:00:48 +0000 (UTC)
Message-ID: <0860e0b9-1218-412c-92d3-6999f2983266@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711011646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu5RH7C4EPsQ+Nhrz4/ZU04rjcTgUwdOa5fLQKA1Gvw=;
 b=os0OZ59WNCG8+IBZgtzelnMU7AKa0xmmmadh+ObgrtF9RtJoIPNqQfYxmpDhDoPCgh8RyM
 qDx5FTMxHcXfAQGKT+218/HQiR0fgZU6Zk2O96pqoW1hM8w5Xoog/80bidUkof/7FXb2xS
 gzDRZyrABqXER8FPCMRlQGBBYC7HxHU=
Date: Thu, 21 Mar 2024 17:00:39 +0800
MIME-Version: 1.0
Subject: Re: [v5,13/13] drm/ast: Automatically clean up poll helper
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-14-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-14-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/20 17:34, Thomas Zimmermann wrote:
> Automatically clean up the conncetor-poll thread as part of the DRM
> device release. The new helper drmm_kms_helper_poll_init() provides
> a shared implementation for all drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Nice feature!

It seems that drm/loongson forget to calldrm_kms_helper_poll_fini() on driver leave, Opps.


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>



> ---
>   drivers/gpu/drm/ast/ast_mode.c     |  4 +++-
>   drivers/gpu/drm/drm_probe_helper.c | 27 +++++++++++++++++++++++++++
>   include/drm/drm_probe_helper.h     |  2 ++
>   3 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index a42a0956c51de..7e56a77bed635 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1905,7 +1905,9 @@ int ast_mode_config_init(struct ast_device *ast)
>   
>   	drm_mode_config_reset(dev);
>   
> -	drm_kms_helper_poll_init(dev);
> +	ret = drmm_kms_helper_poll_init(dev);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index b06dcc6c614e8..a39c98ceac68a 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -37,6 +37,7 @@
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -944,6 +945,32 @@ void drm_kms_helper_poll_fini(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>   
> +static void drm_kms_helper_poll_init_release(struct drm_device *dev, void *res)
> +{
> +	drm_kms_helper_poll_fini(dev);
> +}
> +
> +/**
> + * devm_drm_kms_helper_poll_init - initialize and enable output polling
> + * @dev: drm_device
> + *
> + * This function initializes and then also enables output polling support for
> + * @dev similar to drm_kms_helper_poll_init(). Polling will automatically be
> + * cleaned up when the DRM device goes away.
> + *
> + * See drm_kms_helper_poll_init() for more information.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drmm_kms_helper_poll_init(struct drm_device *dev)
> +{
> +	drm_kms_helper_poll_init(dev);
> +
> +	return drmm_add_action_or_reset(dev, drm_kms_helper_poll_init_release, dev);
> +}
> +EXPORT_SYMBOL(drmm_kms_helper_poll_init);
> +
>   static bool check_connector_changed(struct drm_connector *connector)
>   {
>   	struct drm_device *dev = connector->dev;
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 031b044528c89..9925cff749296 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -16,6 +16,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector
>   int drm_helper_probe_detect(struct drm_connector *connector,
>   			    struct drm_modeset_acquire_ctx *ctx,
>   			    bool force);
> +
> +int drmm_kms_helper_poll_init(struct drm_device *dev);
>   void drm_kms_helper_poll_init(struct drm_device *dev);
>   void drm_kms_helper_poll_fini(struct drm_device *dev);
>   bool drm_helper_hpd_irq_event(struct drm_device *dev);

-- 
Best regards,
Sui

