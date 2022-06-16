Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E64954EA12
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E10B89260;
	Thu, 16 Jun 2022 19:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2078411A536
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:23:30 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 1v5RovI1qEhCQ1v5RofLi0; Thu, 16 Jun 2022 21:23:28 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 16 Jun 2022 21:23:28 +0200
X-ME-IP: 90.11.190.129
Message-ID: <29bce31d-f186-ae41-e154-e7451d185bae@wanadoo.fr>
Date: Thu, 16 Jun 2022 21:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/connector: Remove usage of the deprecated
 ida_simple_xxx API
Content-Language: fr
To: Bo Liu <liubo03@inspur.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
References: <20220616051829.4071-1-liubo03@inspur.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220616051829.4071-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 16/06/2022 à 07:18, Bo Liu a écrit :
> Use ida_alloc_xxx()/ida_free() instead of
> ida_simple_get()/ida_simple_remove().
> The latter is deprecated and more verbose.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>   drivers/gpu/drm/drm_connector.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..e3484b115ae6 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -250,7 +250,7 @@ int drm_connector_init(struct drm_device *dev,
>   	connector->funcs = funcs;
>   
>   	/* connector index is used with 32bit bitmasks */
> -	ret = ida_simple_get(&config->connector_ida, 0, 32, GFP_KERNEL);
> +	ret = ida_alloc_max(&config->connector_ida, 31, GFP_KERNEL);
>   	if (ret < 0) {
>   		DRM_DEBUG_KMS("Failed to allocate %s connector index: %d\n",
>   			      drm_connector_enum_list[connector_type].name,
> @@ -262,7 +262,7 @@ int drm_connector_init(struct drm_device *dev,
>   
>   	connector->connector_type = connector_type;
>   	connector->connector_type_id =
> -		ida_simple_get(connector_ida, 1, 0, GFP_KERNEL);
> +		ida_alloc_min(connector_ida, 1, GFP_KERNEL);
>   	if (connector->connector_type_id < 0) {
>   		ret = connector->connector_type_id;
>   		goto out_put_id;
> @@ -322,10 +322,10 @@ int drm_connector_init(struct drm_device *dev,
>   	connector->debugfs_entry = NULL;
>   out_put_type_id:
>   	if (ret)
> -		ida_simple_remove(connector_ida, connector->connector_type_id);
> +		ida_free(connector_ida, connector->connector_type_id);
>   out_put_id:
>   	if (ret)
> -		ida_simple_remove(&config->connector_ida, connector->index);
> +		ida_free(&config->connector_ida, connector->index);
>   out_put:
>   	if (ret)
>   		drm_mode_object_unregister(dev, &connector->base);
> @@ -479,10 +479,10 @@ void drm_connector_cleanup(struct drm_connector *connector)
>   	list_for_each_entry_safe(mode, t, &connector->modes, head)
>   		drm_mode_remove(connector, mode);
>   
> -	ida_simple_remove(&drm_connector_enum_list[connector->connector_type].ida,
> +	ida_free(&drm_connector_enum_list[connector->connector_type].ida,
>   			  connector->connector_type_id);

Hi,

Nitpick: the code should be aligned with "&drm_connector_enum_list" now

>   
> -	ida_simple_remove(&dev->mode_config.connector_ida,
> +	ida_free(&dev->mode_config.connector_ida,
>   			  connector->index);

Same here, but I guess that it fits one one line now.

>   
>   	kfree(connector->display_info.bus_formats);

