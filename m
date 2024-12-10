Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20629EA416
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F010E04D;
	Tue, 10 Dec 2024 01:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="naPQb9EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5DF10E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:08:22 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401fb9fa03so1350562e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733792901; x=1734397701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NYIU0x1F0X5vDbNZBSV6aS5bWwBkPV0Ut8+9pSrSb6A=;
 b=naPQb9EK0FTl6PXpWTN2qCav2S8jk/euS3/b9MUieKeJoHnxRoFeDS6PrYwMAk/mbV
 Y5ahFghIcZNO1eVB9/v3V6g6cjgoDz5eN/bnmT6FTXazZ8k6opOiZs6o4EkiW8eZ7Kut
 FDWJm5ZDr5wuioIpdbgNHKVEdv8+J04f0AWOMmrceQV9Em91GxbNxdAx+dhjL0QPTD0t
 Z5r6PjalFBwT5tfdWBQ0lRYXnIwcqxeUIMiT7HxslLtOXAsDBMeyiNjcVtip6zKxOE7B
 XHo7/jbIYHjBWVySWo6zc5aGYqCy7ipl1V+grPDRW5UDKsxNuYs2zAnmqO0mk3Sq7shH
 n6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733792901; x=1734397701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYIU0x1F0X5vDbNZBSV6aS5bWwBkPV0Ut8+9pSrSb6A=;
 b=XCmknhmrvjwtbtLpPBd/1UVMh8VUbP4kBLkaoI4iND+O5twgEGfeJatYExcBTPZj9D
 w1oFGbfI431aGtuMG6P9yyQprig5O+wt24ek8vEync08w9oGOoOSbRNPRfVlJuvqrQbb
 RQGl71jOsuwF5md8216b3Sx72X41P5a4bcD1pQo6RjxET2MdO22tvE5Ji9kSTzMpB4xU
 74TOxmFd7WRQCBmwQgzdMlKjTIyJehDVztbKAWi98Gw1InF2VX9AWqDKGSSKTWsOU/mw
 YHmZ4ADeaRCdFsA+POehzXPB+nHuoPd+kFtBQmz1NuV/ZJfLcX2BOrYNN+hKKT8aA1Q0
 gw3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXeerpgFCZHi0iVdy1v0Cj92KCN0qBmE4p/SuOFC2eZD8+dJf98Q3MFkqRU6U8jS90TbKKIJemypk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6NBzWwIrZWzW1a5UTr5/YWlMeMreIW4sd6pmEBvGNurCZj2JA
 1GjGETDD+jBkRUD3MyvRkbwXoncpN76CojmDMfz2KICSMZFRTJLc5o/Q9oM3gEI=
X-Gm-Gg: ASbGncsKrFbBorTL8qBJQLYOExpF59ZyBEN5wPw2gZIq6oKC0bNzcjc7mBClzUZvJ6g
 EsrEc7DXVBNrOuisOBjCtxr5UE6coirb/VprPSO7LsH+Oh21yyYKKCHQYCR31LcAwxxY8hS8EFR
 02np+qC+t4hHEiMd7+00fFHyL2Nm2FVjXs3xAzi9WsNIJNm6d6oMYIXxbDrJchZqRG9BxOkStlR
 PxiJqpI9RTh/avjdXGEkU6ZQe2i1nhbMWPBrxk8Vxgvwl0E+G4OsYShZaIcW2h54iGdrIEcjsB4
 YhMqvgc9Y7sjhU1LmtoAxpqfZWtCOxGpBQ==
X-Google-Smtp-Source: AGHT+IERcWHuH6fbZ1xEEAsxNxRCjKgZMrQp9JNEl00w9VagOlGQ26UNCBzBvV7KmpLmeH4h96niYA==
X-Received: by 2002:a05:6512:2350:b0:53f:a16f:67d5 with SMTP id
 2adb3069b0e04-540251ecd9cmr484297e87.16.1733792900776; 
 Mon, 09 Dec 2024 17:08:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53fe77cd213sm804997e87.36.2024.12.09.17.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 17:08:19 -0800 (PST)
Date: Tue, 10 Dec 2024 03:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 bliang@analogixsemi.com, 
 qwen@analogixsemi.com, treapking@google.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
Message-ID: <fy6zvkdidz2srerfq5bshgcshps2wfa4syxwndwesgxcej66ws@nf5svlpkeodh>
References: <20241209064632.1705578-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209064632.1705578-1-xji@analogixsemi.com>
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

On Mon, Dec 09, 2024 at 02:46:32PM +0800, Xin Ji wrote:
> When user enabled HDCP feature, upper layer will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
> 
> However once HDCP content turn to  DRM_MODE_CONTENT_PROTECTION_ENABLED
> upper layer will not update the HDCP content to
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.

What is "upper layer"? Is it a kernel or a userspace?

From drm_hdcp_update_content_protection() documentation:

No uevent for DESIRED->UNDESIRED or ENABLED->UNDESIRED,
as userspace is triggering such state change and kernel performs it without
fail.This function update the new state of the property into the connector's
state and generate an uevent to notify the userspace.


> 
> So when user dynamic change the display resolution, anx7625 driver must
> call drm_hdcp_update_content_protection() to update HDCP content to
> DRM_MODE_CONTENT_PROTECTION_UNDESIRED in bridge interface
> .atomic_disable().

Why?

> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a2675b121fe4..a75f519ddcb8 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
>  				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
>  }
>  
> +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
> +{
> +	struct device *dev = ctx->dev;
> +
> +	if (!ctx->connector)
> +		return;
> +
> +	anx7625_hdcp_disable(ctx);
> +
> +	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +	drm_hdcp_update_content_protection(ctx->connector,
> +					   ctx->hdcp_cp);
> +
> +	dev_dbg(dev, "update CP to UNDESIRE\n");
> +}
> +
>  static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>  {
>  	u8 bcap;
> @@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
>  			dev_err(dev, "current CP is not ENABLED\n");
>  			return -EINVAL;
>  		}
> -		anx7625_hdcp_disable(ctx);
> -		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> -		drm_hdcp_update_content_protection(ctx->connector,
> -						   ctx->hdcp_cp);
> -		dev_dbg(dev, "update CP to UNDESIRE\n");
> +
> +		anx7625_hdcp_disable_and_update_cp(ctx);

No. atomic_check() MAY NOT perform any changes to the hardware. It might
be just a probe from userspace to check if the mode or a particular
option can be set in a particular way. There is no guarantee that
userspace will even try to commit it.

>  	}
>  
>  	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> @@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
>  
>  	dev_dbg(dev, "drm atomic disable\n");
>  
> +	anx7625_hdcp_disable_and_update_cp(ctx);
> +
>  	ctx->connector = NULL;
>  	anx7625_dp_stop(ctx);
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
