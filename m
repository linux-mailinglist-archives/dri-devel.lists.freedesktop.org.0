Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63711C05F29
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FE610EA25;
	Fri, 24 Oct 2025 11:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j6AcFzS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7766510EA25
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:29:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso1403688f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761305349; x=1761910149; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9xMJQfYM2b5QJELS93NnB9DkzeOAVYdK40Nq6yQs7Sw=;
 b=j6AcFzS/E8pmFl8GQ/Pk+nJwOBzIBhQcC9F9wQpNXAYShCCTVSOSfcK3TfsawUcA14
 3u3BdLgoCZdZxVMY+LJNn+1k9hkN+jPVdTkTh7huxora/FkLdpmkEQKIaNU/ez48ma7l
 uZwVipned+G2NvZ2KkXZJmN3OCw/2XOyubnfKiDLftrsM3zSmp4vB9dlUSj4RHSXgC8C
 oRPqi5SQmgd3avYfCRqcCQLBHNbJgtI0I4i0raCN2iPdGhIXH3uBOV66XNliPnZseFa+
 xzjKsELgTLwwKPf75ZCZxyQgyANWyJ/u/qGeZ2U0qc8yZvRox5QDXmKVUm9XpsyVZxpN
 ej9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305349; x=1761910149;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xMJQfYM2b5QJELS93NnB9DkzeOAVYdK40Nq6yQs7Sw=;
 b=jj/GvgQVyi2d8C97cxKAvGEvcsrp6CxROew98UkonAJqiWNFriGHmL9pLHi9Oj+lWY
 QWG1vwj67HynjGg94OoH+TzyJBzm5t3F+P2aFY/ZhDMBVXZJojd5wp1KqcAPWYukG1Fx
 zTDwa/8tV2A2id0yWGHv3nEPBo3UdD8twlAXVb3eSTUaZY/bnEyzWlc5XOAoFaKh0+8e
 LBWFuOXF00Y90UQOB8GHSAfaDFcVx5eh7pMepFiT4PL2w2XrMvGfFzLmZEo2B/li6qEj
 kwXh6V2qUOz7NdJG9VLspaMdcvJ9W+oyXv6aPQhhkQNMQ4FE80Ifg9mG3Sf3y/BS52yj
 xwuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtKd+/AhpcDyi7A5nNDLOK2Abco+GwOOoWWwKx9vkGfp4a5Y6sdOynw2IFbCltqtWY9ibJlvy+IgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEPcR6GhhGiGqbKDSphuPz7fbWV3L9gqOUXVe9smcIt6fEJIEO
 1u2VmWBKPCNyPgyLu3WkLSrZK0y9P0MWZbMC1u40zTytCbtTxCgeIyyW
X-Gm-Gg: ASbGncvPK0AwpEvVavvYGKCPeEP8FDk2jNj4OguNkfRWey5x+GuzW6b547KOEhtJq4g
 0wy6reNUtIeG8k2PsjU5Krwmng2cyPgmqpp2xRlS1h5ZqtOc/RdumnUuq/rZfJz6a3PPB0YvQLa
 9IuWqHwGN1lnIxjQMhXjcqE16HsJ9UkL8RpfO6RLupBEMpIM3edw7Mm7X/FUsi8zoRSdWGDZHDz
 Bw4OzJRU43147J2Nvc9WE6/tjjoY4YaSpxbS7y9L2hyflgaghuAsH/7gIZ0M8mt/6pIKrs5QgFs
 dYjM+o8mZYy0vQ6+cu/1eR1XVDXnI+BrxGEi8ziqBcgrkhSbEx753RQ+iHpp2uhkZlj8X27J0Vn
 bO8/Tfjo2u/Mve+S/Zo8yYdKBg9lzUW3NdZXWogMR9AUbzQ73MVagIcmzM16GudBFoKx+NaPifi
 Tz6ExV+qs0nQ==
X-Google-Smtp-Source: AGHT+IEWS4OWz+EwzEUPz27QJ0JvgqtX6/43yqFialI1Uz7fDpRCKIWzIgPESbtf0+fCYUefY/LGGQ==
X-Received: by 2002:a5d:5d87:0:b0:3ec:8c8:7b79 with SMTP id
 ffacd0b85a97d-4299075d0d3mr1818638f8f.61.1761305348844; 
 Fri, 24 Oct 2025 04:29:08 -0700 (PDT)
Received: from fedora ([37.29.213.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4369b33sm144041215e9.14.2025.10.24.04.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:29:08 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:29:05 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/vkms: Fix use after frees on error paths
Message-ID: <aPtjAcNP3fuRNBs5@fedora>
References: <aPtfy2jCI_kb3Df7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPtfy2jCI_kb3Df7@stanley.mountain>
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

On Fri, Oct 24, 2025 at 02:15:23PM +0300, Dan Carpenter wrote:
> These error paths free a pointer and then dereference it on the next line
> to get the error code.  Save the error code first and then free the
> memory.
> 
> Fixes: 3e4d5b30d2b2 ("drm/vkms: Allow to configure multiple CRTCs via configfs")
> Fixes: 2f1734ba271b ("drm/vkms: Allow to configure multiple planes via configfs")
> Fixes: 67d8cf92e13e ("drm/vkms: Allow to configure multiple encoders via configfs")
> Fixes: 272acbca96a3 ("drm/vkms: Allow to configure multiple connectors via configfs")
> Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via configfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for fixing this:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..506666e21c91 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -204,6 +204,7 @@ static struct config_group *make_crtc_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_crtc *crtc;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -219,8 +220,9 @@ static struct config_group *make_crtc_group(struct config_group *group,
>  
>  		crtc->config = vkms_config_create_crtc(dev->config);
>  		if (IS_ERR(crtc->config)) {
> +			ret = PTR_ERR(crtc->config);
>  			kfree(crtc);
> -			return ERR_CAST(crtc->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
> @@ -358,6 +360,7 @@ static struct config_group *make_plane_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_plane *plane;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -373,8 +376,9 @@ static struct config_group *make_plane_group(struct config_group *group,
>  
>  		plane->config = vkms_config_create_plane(dev->config);
>  		if (IS_ERR(plane->config)) {
> +			ret = PTR_ERR(plane->config);
>  			kfree(plane);
> -			return ERR_CAST(plane->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
> @@ -472,6 +476,7 @@ static struct config_group *make_encoder_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_encoder *encoder;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -487,8 +492,9 @@ static struct config_group *make_encoder_group(struct config_group *group,
>  
>  		encoder->config = vkms_config_create_encoder(dev->config);
>  		if (IS_ERR(encoder->config)) {
> +			ret = PTR_ERR(encoder->config);
>  			kfree(encoder);
> -			return ERR_CAST(encoder->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&encoder->group, name,
> @@ -637,6 +643,7 @@ static struct config_group *make_connector_group(struct config_group *group,
>  {
>  	struct vkms_configfs_device *dev;
>  	struct vkms_configfs_connector *connector;
> +	int ret;
>  
>  	dev = child_group_to_vkms_configfs_device(group);
>  
> @@ -652,8 +659,9 @@ static struct config_group *make_connector_group(struct config_group *group,
>  
>  		connector->config = vkms_config_create_connector(dev->config);
>  		if (IS_ERR(connector->config)) {
> +			ret = PTR_ERR(connector->config);
>  			kfree(connector);
> -			return ERR_CAST(connector->config);
> +			return ERR_PTR(ret);
>  		}
>  
>  		config_group_init_type_name(&connector->group, name,
> @@ -756,6 +764,7 @@ static struct config_group *make_device_group(struct config_group *group,
>  					      const char *name)
>  {
>  	struct vkms_configfs_device *dev;
> +	int ret;
>  
>  	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
>  		return ERR_PTR(-EINVAL);
> @@ -766,8 +775,9 @@ static struct config_group *make_device_group(struct config_group *group,
>  
>  	dev->config = vkms_config_create(name);
>  	if (IS_ERR(dev->config)) {
> +		ret = PTR_ERR(dev->config);
>  		kfree(dev);
> -		return ERR_CAST(dev->config);
> +		return ERR_PTR(ret);
>  	}
>  
>  	config_group_init_type_name(&dev->group, name, &device_item_type);
> -- 
> 2.51.0
> 
