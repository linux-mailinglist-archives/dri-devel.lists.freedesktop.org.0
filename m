Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EE123544
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 19:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD166E0B6;
	Tue, 17 Dec 2019 18:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367D6E077;
 Tue, 17 Dec 2019 18:51:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5B41120037;
 Tue, 17 Dec 2019 19:51:22 +0100 (CET)
Date: Tue, 17 Dec 2019 19:51:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/8] drm/client: convert to drm device based logging
Message-ID: <20191217185120.GA30809@ravnborg.org>
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <20191210123050.8799-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210123050.8799-2-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=_XHZ6cvn94sVE_Ps6v8A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

On Tue, Dec 10, 2019 at 02:30:44PM +0200, Jani Nikula wrote:
> Prefer drm_dbg_kms() and drm_err() over DRM_DEV_DEBUG_KMS() and
> DRM_DEV_ERROR().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_client.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index d9a2e3695525..b031b45aa8ef 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -150,7 +150,7 @@ void drm_client_release(struct drm_client_dev *client)
>  {
>  	struct drm_device *dev = client->dev;
>  
> -	DRM_DEV_DEBUG_KMS(dev->dev, "%s\n", client->name);
> +	drm_dbg_kms(dev, "%s\n", client->name);
>  
>  	drm_client_modeset_free(client);
>  	drm_client_close(client);
> @@ -203,7 +203,7 @@ void drm_client_dev_hotplug(struct drm_device *dev)
>  			continue;
>  
>  		ret = client->funcs->hotplug(client);
> -		DRM_DEV_DEBUG_KMS(dev->dev, "%s: ret=%d\n", client->name, ret);
> +		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>  	}
>  	mutex_unlock(&dev->clientlist_mutex);
>  }
> @@ -223,7 +223,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>  			continue;
>  
>  		ret = client->funcs->restore(client);
> -		DRM_DEV_DEBUG_KMS(dev->dev, "%s: ret=%d\n", client->name, ret);
> +		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>  		if (!ret) /* The first one to return zero gets the privilege to restore */
>  			break;
>  	}
> @@ -351,8 +351,8 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
>  
>  	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
>  	if (ret)
> -		DRM_DEV_ERROR(buffer->client->dev->dev,
> -			      "Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
> +		drm_err(buffer->client->dev,
> +			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
>  
>  	buffer->fb = NULL;
>  }
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
