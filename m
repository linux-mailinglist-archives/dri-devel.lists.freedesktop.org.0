Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26DAD1322A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA54210E3E7;
	Mon, 12 Jan 2026 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ruDhEWxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29A010E3E7;
 Mon, 12 Jan 2026 14:31:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C66544E4207F;
 Mon, 12 Jan 2026 14:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C06A606FA;
 Mon, 12 Jan 2026 14:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0028103C8CD8; Mon, 12 Jan 2026 15:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768228275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=eKWrsut8lnAqhMRfW6JJHMf1IUOdcYaVD+yV2vSIjtI=;
 b=ruDhEWxOcA0/Wx2P1Sxf3of98HvE5oz0+6zK661X2QCtjrTJtyY1HReq2ofpOWHzF0fJqi
 mGowF4iCFq5CJLPSbgXNkoHAhJk817hkHomAa8CDSj1Gl3wZj86v46qyeq2K8JR30KJQ/o
 IU4ThquLIInzcjwHrdQ+qphH7r5fbZ9zW8uhRYKTW45px2kX74e+irgrzob5fsE5wmcqrk
 eu8cYXHJ8TQl9ykJpk6TqG9Gpre1DiBiR+pJ7z0xk27H/BOhsC+sGHqMvj93y3xuU+fg6v
 uKivhbYk5RX78vfSqrNxi/PyZtTEJnH516H1HX6+75Sq0SZIkE0/hyMxnmnASw==
Message-ID: <13d1eb34-dfdf-4d5e-b1a8-10819289d8dc@bootlin.com>
Date: Mon, 12 Jan 2026 15:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] drm/vkms: Fix color pipeline enum name leak
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
 <20260109081728.478844-4-chaitanya.kumar.borah@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260109081728.478844-4-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 1/9/26 09:17, Chaitanya Kumar Borah wrote:
> vkms_initialize_colorops() allocates enum names for color pipelines,
> which are copied by drm_property_create_enum(). The temporary strings
> were not freed, resulting in a memory leak.
> 
> Allocate enum names only after successful pipeline construction and
> free them on all exit paths
> 
> Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/vkms_colorop.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 5c3ffc78aea0..d03a1f2e9c41 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -37,7 +37,6 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   
>   	list->type = ops[i]->base.id;
> -	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
>   
>   	i++;
>   
> @@ -88,6 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	drm_colorop_set_next_property(ops[i - 1], ops[i]);
>   
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
> +
>   	return 0;
>   
>   cleanup:
> @@ -103,18 +104,18 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   int vkms_initialize_colorops(struct drm_plane *plane)
>   {
> -	struct drm_prop_enum_list pipeline;
> -	int ret;
> +	struct drm_prop_enum_list pipeline = {};
> +	int ret = 0;
>   
>   	/* Add color pipeline */
>   	ret = vkms_initialize_color_pipeline(plane, &pipeline);
>   	if (ret)
> -		return ret;
> +		goto out;
>   
>   	/* Create COLOR_PIPELINE property and attach */
>   	ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
> -	if (ret)
> -		return ret;
>   
> -	return 0;
> +	kfree(pipeline.name);
> +out:
> +	return ret;
>   }

