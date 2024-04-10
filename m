Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E080B89F1EA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056B2113310;
	Wed, 10 Apr 2024 12:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zq+68F9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848D11330D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712751620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cel5ZmITuDP3vWOl8ABhZazAGBaRSOIRfdOLwBjUvqM=;
 b=Zq+68F9o0EPToQsms03H2DOtJXP8OyDBbZzimvNG+ecx5Xpoxdmfg4wOivv6bBLNJiHAAr
 XRxXHl/K9xSgsDVsmanUPHMzfonf/sANnqDBW7vF8/+UteOm0wDDna3yYpIogH8bkHgfTp
 4dU2aeZv60Mk+S/eYbSnf03j1mpVttM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Gm3-soV9N6SGccmEnF_6Ig-1; Wed, 10 Apr 2024 08:20:19 -0400
X-MC-Unique: Gm3-soV9N6SGccmEnF_6Ig-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-343d6732721so3014210f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 05:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712751618; x=1713356418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cel5ZmITuDP3vWOl8ABhZazAGBaRSOIRfdOLwBjUvqM=;
 b=QAAbizuLQsVqPEX9pTdI1ua0Aoah9BBknYgyvEK6fYLkLdS5txmJXIepEXOJKdqMs8
 6hzm9JqTYj1hYLpHOSfV3vbUGOiVRgeVFJruUgcjR6R/uUhWgQo58WkPV223C6MviwWM
 mcATQspS6bW6spA8PEU9CkjsWdyhwm/OF66P3STcyow//MEqH/2OekcTBycNdnVkHdbP
 SG2vCc0Y3WBuwD1L47SOxDz7neuVHdlN5bDNHZpxTeI/1mFjt5DP4sZToupq4MOmYEqY
 c7pLnw2x0d2cIKjYs5s1pIVnfcGli7BUFEwbzRraFdGQuaGuGgy4jT6kr+ZMzf/AAUde
 jrwA==
X-Gm-Message-State: AOJu0Yw3/7u94ESfDwgT0cqP6WezNaF7uFhsK/h0+IVS8MNvl656SybD
 TYPZ/0lgJBjYodVX6A+jOmLCp4m0yXdVQqvals5X2NCWOiFisChALBTYeNQgQm86Rpg+FGyaDiF
 r/RAhThXqheUYXsF4PBC3I+I70CtEkRXMYUjEWQga0WSSLx9KIC85Fvl8T2HCSem4qg==
X-Received: by 2002:a5d:6404:0:b0:345:be70:191c with SMTP id
 z4-20020a5d6404000000b00345be70191cmr2223531wru.37.1712751618020; 
 Wed, 10 Apr 2024 05:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQAc375vc3zXkRBJ/KDp/bKUw/bbM2VY6Ep27eYlC5n4ckGDuIde6Tl8Rdm5STuJzDN4EJIw==
X-Received: by 2002:a5d:6404:0:b0:345:be70:191c with SMTP id
 z4-20020a5d6404000000b00345be70191cmr2223516wru.37.1712751617635; 
 Wed, 10 Apr 2024 05:20:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b00343300a4eb8sm13584588wro.49.2024.04.10.05.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 05:20:17 -0700 (PDT)
Message-ID: <fde1448c-f412-41b1-9cc4-53ecc6e6edac@redhat.com>
Date: Wed, 10 Apr 2024 14:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ast: Define struct ast_ddc in ast_ddc.c
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20240403103325.30457-1-tzimmermann@suse.de>
 <20240403103325.30457-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240403103325.30457-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks for the patch, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

On 03/04/2024 12:31, Thomas Zimmermann wrote:
> Move the definition of struct ast_ddc to ast_ddc.c and return the i2c
> adapter from ast_ddc_create(). Update callers accordingly. Avoids
> including Linux i2c header files, except where required. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_ddc.c  | 14 ++++++++++++--
>   drivers/gpu/drm/ast/ast_ddc.h  | 13 ++-----------
>   drivers/gpu/drm/ast/ast_mode.c |  8 ++++----
>   3 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
> index 4df52aeba4f7e..29cf5d157f344 100644
> --- a/drivers/gpu/drm/ast/ast_ddc.c
> +++ b/drivers/gpu/drm/ast/ast_ddc.c
> @@ -21,12 +21,22 @@
>    * of the Software.
>    */
>   
> +#include <linux/i2c-algo-bit.h>
> +#include <linux/i2c.h>
> +
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   
>   #include "ast_ddc.h"
>   #include "ast_drv.h"
>   
> +struct ast_ddc {
> +	struct ast_device *ast;
> +
> +	struct i2c_algo_bit_data bit;
> +	struct i2c_adapter adapter;
> +};
> +
>   static void ast_ddc_algo_bit_data_setsda(void *data, int state)
>   {
>   	struct ast_ddc *ddc = data;
> @@ -132,7 +142,7 @@ static void ast_ddc_release(struct drm_device *dev, void *res)
>   	i2c_del_adapter(&ddc->adapter);
>   }
>   
> -struct ast_ddc *ast_ddc_create(struct ast_device *ast)
> +struct i2c_adapter *ast_ddc_create(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
>   	struct ast_ddc *ddc;
> @@ -173,5 +183,5 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> -	return ddc;
> +	return &ddc->adapter;
>   }
> diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
> index 08f3994e09ccd..85c93edc9ae12 100644
> --- a/drivers/gpu/drm/ast/ast_ddc.h
> +++ b/drivers/gpu/drm/ast/ast_ddc.h
> @@ -3,18 +3,9 @@
>   #ifndef __AST_DDC_H__
>   #define __AST_DDC_H__
>   
> -#include <linux/i2c.h>
> -#include <linux/i2c-algo-bit.h>
> -
>   struct ast_device;
> +struct i2c_adapter;
>   
> -struct ast_ddc {
> -	struct ast_device *ast;
> -
> -	struct i2c_adapter adapter;
> -	struct i2c_algo_bit_data bit;
> -};
> -
> -struct ast_ddc *ast_ddc_create(struct ast_device *ast);
> +struct i2c_adapter *ast_ddc_create(struct ast_device *ast);
>   
>   #endif
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index bb9b66aba9ee9..ae21d89b899c8 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1360,7 +1360,7 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
>   static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> -	struct ast_ddc *ddc;
> +	struct i2c_adapter *ddc;
>   	int ret;
>   
>   	ddc = ast_ddc_create(ast);
> @@ -1371,7 +1371,7 @@ static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *
>   	}
>   
>   	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
> -					  DRM_MODE_CONNECTOR_VGA, &ddc->adapter);
> +					  DRM_MODE_CONNECTOR_VGA, ddc);
>   	if (ret)
>   		return ret;
>   
> @@ -1429,7 +1429,7 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
>   static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> -	struct ast_ddc *ddc;
> +	struct i2c_adapter *ddc;
>   	int ret;
>   
>   	ddc = ast_ddc_create(ast);
> @@ -1440,7 +1440,7 @@ static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connecto
>   	}
>   
>   	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
> -					  DRM_MODE_CONNECTOR_DVII, &ddc->adapter);
> +					  DRM_MODE_CONNECTOR_DVII, ddc);
>   	if (ret)
>   		return ret;
>   

