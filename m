Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06159805690
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6C10E538;
	Tue,  5 Dec 2023 13:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FFA10E538
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:52:51 +0000 (UTC)
Message-ID: <9093d8df-7384-403b-852e-216c8d5f9bc0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701784370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdFTxtUsnQum3d6y4e+iVRPfWBurPXGYYAwG58jrDHI=;
 b=vV6RsQGpnpr/Rd3Uv5LyhA5Kg/DlheZ72JEvm8cJ/9x32xKi11wJykBFtY+eNKRLjJdup3
 W9xjYft+xAOt0jt+5E4FNUc88PTuC+bYDqvlYMGANN2XxqjhUDNtcrb4F5MS+pImmm0PRF
 nMi4n9L2x/dedgTU8tE/T0RxfzhTLI0=
Date: Tue, 5 Dec 2023 21:52:44 +0800
MIME-Version: 1.0
Subject: Re: [3/5] drm/atomic: Rework the object doc a bit
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231204121707.3647961-3-mripard@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231204121707.3647961-3-mripard@kernel.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/12/4 20:17, Maxime Ripard wrote:
> The doc for the planes, crtcs, connectors and private_objs fields
> mention that they are pointers to an array of structures with
> per-$OBJECT data.
>
> While these fields are indeed pointers to an array, each item of that
> array contain a pointer to the object structure affected by the update,
> and its old and new state. There's no per-object data there.
>
> Let's rephrase those fields a bit to better match the current situation.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

> ---
>   include/drm/drm_atomic.h | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 13cecdc1257d..914574b58ae7 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -403,12 +403,18 @@ struct drm_atomic_state {
>   	bool duplicated : 1;
>   
>   	/**
> -	 * @planes: pointer to array of structures with per-plane data
> +	 * @planes:
> +	 *
> +	 * Pointer to array of @drm_plane and @drm_plane_state part of this
> +	 * update.
>   	 */
>   	struct __drm_planes_state *planes;
>   
>   	/**
> -	 * @crtcs: pointer to array of CRTC pointers
> +	 * @crtcs:
> +	 *
> +	 * Pointer to array of @drm_crtc and @drm_crtc_state part of this
> +	 * update.
>   	 */
>   	struct __drm_crtcs_state *crtcs;
>   
> @@ -418,7 +424,10 @@ struct drm_atomic_state {
>   	int num_connector;
>   
>   	/**
> -	 * @connectors: pointer to array of structures with per-connector data
> +	 * @connectors:
> +	 *
> +	 * Pointer to array of @drm_connector and @drm_connector_state part of
> +	 * this update.
>   	 */
>   	struct __drm_connnectors_state *connectors;
>   
> @@ -428,7 +437,10 @@ struct drm_atomic_state {
>   	int num_private_objs;
>   
>   	/**
> -	 * @private_objs: pointer to array of private object pointers
> +	 * @private_objs:
> +	 *
> +	 * Pointer to array of @drm_private_obj and @drm_private_obj_state part
> +	 * of this update.
>   	 */
>   	struct __drm_private_objs_state *private_objs;
>   
