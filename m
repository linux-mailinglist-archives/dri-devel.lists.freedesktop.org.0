Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CE9F3695
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488D110E6FD;
	Mon, 16 Dec 2024 16:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MSLioiM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED82410E70A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:50:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D55840004;
 Mon, 16 Dec 2024 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734367846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lTytGv3WQcBnidhebGgtCZuLrG7i4GACKz2UZcaQGQ0=;
 b=MSLioiM6Hdj5HCpPeZdFR6vg+rQWmvXd8ekLs8bYjyds4PiIgkoznw45E7m9SZHCpH09ev
 bc8ByB+Jc374cf9141dHB8zcnBdY44cf3bll/AG5A9bIudKjQVCcnctTTPbBHWVEXW9N2P
 cpimBYGo2kfdQx1mD6Jasgf2KKbNCCfjlAzlMJ4DZNhVD3IzP7P5satP9U5oBtBILgZb7e
 /AP7tyCLNuyHV7/Kb2nQ/VfoOnc2qwPz1Sjh/TaZv8Mldfny8a/gl3HxgGtH1RK89V5Le+
 38RkYE7tXFxpwU+y2RQzblDAFcIzx8/QVygDLyEug/HbxfoMK6VqPsqrw5Eh2Q==
Date: Mon, 16 Dec 2024 17:50:44 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 4/4] drm/connector: warn when cleaning up a
 refcounted connector
Message-ID: <Z2BaZDDwnQo4ppS0@louis-chauvet-laptop>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
 <20241216-drm-small-improvements-v3-4-78bbc95ac776@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-drm-small-improvements-v3-4-78bbc95ac776@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 16/12/24 - 17:40, Luca Ceresoli wrote:
> Calling drm_connector_cleanup() should only be done via the free_cb =>
> .destroy path, which cleans up the struct drm_connector only when the
> refcount drops to zero.
> 
> A cleanup done with a refcount higher than 0 can result from buggy code,
> e.g. by doing cleanup directly in the drivers teardown code. Serious
> trouble can happen if this happens, so warn about it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index fc35f47e2849ed6786d6223ac9c69e1c359fc648..e0bf9c490af43055de4caaee1580a4befbd608c5 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -624,6 +624,12 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode, *t;
>  
> +	/*
> +	 * Cleanup must happen when the last ref is put, via the
> +	 * drm_connector_free() callback.
> +	 */
> +	WARN_ON(drm_mode_object_read_refcount(&connector->base) != 0);
> +
>  	/* The connector should have been removed from userspace long before
>  	 * it is finally destroyed.
>  	 */
> 
> -- 
> 2.34.1
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
