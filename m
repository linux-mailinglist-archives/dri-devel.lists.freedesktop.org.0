Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE0885616
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 09:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880CC10E3B6;
	Thu, 21 Mar 2024 08:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="w5lDLQJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0730710E3B5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 08:56:55 +0000 (UTC)
Message-ID: <d2f5824a-9497-4562-8ed8-8ab30b12f25e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711011414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHibGXeHKScccf7ZHIayi/MjwPVJSHqORtzgWO79FeM=;
 b=w5lDLQJoekdi15RiXw86n7ritEr/VpBdrantd6r/7lJRZICzjRqFiZ9K5LfA7pJVMKwFeW
 9kJ4xqzZJ8IDR+zRwqq1ckTiNKIEMw4Ko8MHsw297KNEhwT5XIV3EF1J4yfsNZa/YcBoLa
 u7inyNYhjHXryH5HVrd7UihENBOIiFA=
Date: Thu, 21 Mar 2024 16:56:47 +0800
MIME-Version: 1.0
Subject: Re: [v5,12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-13-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240320093738.6341-13-tzimmermann@suse.de>
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
> Implement polling for VGA and SIL164 connectors. Set the flag
> DRM_CONNECTOR_POLL_DISCONNECT for each to detect the removal of the
> monitor cable. Implement struct drm_connector_helper_funcs.detect_ctx
> for each type of connector by testing for EDID data.
>
> The helper drm_connector_helper_detect_ctx() implements .detect_ctx()
> on top of the connector's DDC channel. The function can be used by
> other drivers as companion to drm_connector_helper_get_modes().
>
> v5:
> - share implementation in drm_connector_helper_detect_ctx() (Maxime)
> - test for DDC presence with drm_probe_ddc() (Maxime, Jani)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Yeah, previously, drm/ast only poll for the connected status.
Once connected, it never disconnected. This is fine for single
display pipe. But for two display pipes case, hot-plug is a core
functionality and absolutely necessary requirements.

Now that drm/ast becomes better than before:

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/ast/ast_mode.c     |  6 ++++--
>   drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++++++++++++
>   include/drm/drm_probe_helper.h     |  3 +++
>   3 files changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 71cc681d6188f..a42a0956c51de 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1346,6 +1346,7 @@ static int ast_crtc_init(struct drm_device *dev)
>   
>   static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
>   	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_vga_connector_funcs = {
> @@ -1379,7 +1380,7 @@ static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
>   
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
>   	return 0;
>   }
> @@ -1414,6 +1415,7 @@ static int ast_vga_output_init(struct ast_device *ast)
>   
>   static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
>   	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> @@ -1447,7 +1449,7 @@ static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connecto
>   	connector->interlace_allowed = 0;
>   	connector->doublescan_allowed = 0;
>   
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 4d60cc810b577..b06dcc6c614e8 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -1272,3 +1272,32 @@ int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
>   	return i;
>   }
>   EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
> +
> +/**
> + * drm_connector_helper_detect_ctx - Read EDID and detect connector status.
> + * @connector: The connector
> + * @ctx: Acquire context
> + * @force: Perform screen-destructive operations, if necessary
> + *
> + * Detects the connector status by reading the EDID using drm_probe_ddc(),
> + * which requires connector->ddc to be set. Returns connector_status_connected
> + * on success or connector_status_disconnected on failure.
> + *
> + * Returns:
> + * The connector status as defined by enum drm_connector_status.
> + */
> +int drm_connector_helper_detect_ctx(struct drm_connector *connector,
> +				    struct drm_modeset_acquire_ctx *ctx,
> +				    bool force)
> +{
> +	struct i2c_adapter *ddc = connector->ddc;
> +
> +	if (!ddc)
> +		return connector_status_unknown;
> +
> +	if (drm_probe_ddc(ddc))
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
> +}
> +EXPORT_SYMBOL(drm_connector_helper_detect_ctx);
> diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
> index 62741a88796bb..031b044528c89 100644
> --- a/include/drm/drm_probe_helper.h
> +++ b/include/drm/drm_probe_helper.h
> @@ -37,4 +37,7 @@ int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
>   int drm_connector_helper_get_modes(struct drm_connector *connector);
>   int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
>   
> +int drm_connector_helper_detect_ctx(struct drm_connector *connector,
> +				    struct drm_modeset_acquire_ctx *ctx,
> +				    bool force);
>   #endif

-- 
Best regards,
Sui

