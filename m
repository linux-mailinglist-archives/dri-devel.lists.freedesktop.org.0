Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90E805641
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2446210E25B;
	Tue,  5 Dec 2023 13:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10F10E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:42:48 +0000 (UTC)
Message-ID: <f6446751-71a3-4a97-87db-c649673d509f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701783766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbzJBuElDKHNwvMjlj7Qe9OKIqKVQdUCGjkp+yl3S0o=;
 b=k9Dy59XpjUWeLZIPnetcnZCIFoVIfb5omATiy7w001g7TgHl6uJrdG1F38uAtTtz8LXNPd
 PcewreqG+kut2G1icOI2Ob2gOlFxIjXmC6cQYa4/2iY4qvAREXiZKLXyOH76V2MRv4YdVy
 tcBn6xe122E+9+SPRh2PqY1Zfs9V6DE=
Date: Tue, 5 Dec 2023 21:42:40 +0800
MIME-Version: 1.0
Subject: Re: [1/5] drm/atomic: Move the drm_atomic_state field doc inline
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20231204121707.3647961-1-mripard@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
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
> Some fields of drm_atomic_state have been documented in-line, but some
> were documented in the main kerneldoc block before the structure.
>
> Since the former is the preferred option in DRM, let's move all the
> fields to an inline documentation.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Very nice cleanup, but I see a very very tiny concern, see below.

> ---
>   include/drm/drm_atomic.h | 50 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index cf8e1220a4ac..2a08030fcd75 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -347,24 +347,22 @@ struct __drm_private_objs_state {
>   
>   /**
>    * struct drm_atomic_state - the global state object for atomic updates
> - * @ref: count of all references to this state (will not be freed until zero)
> - * @dev: parent DRM device
> - * @async_update: hint for asynchronous plane update
> - * @planes: pointer to array of structures with per-plane data
> - * @crtcs: pointer to array of CRTC pointers
> - * @num_connector: size of the @connectors and @connector_states arrays
> - * @connectors: pointer to array of structures with per-connector data
> - * @num_private_objs: size of the @private_objs array
> - * @private_objs: pointer to array of private object pointers
> - * @acquire_ctx: acquire context for this atomic modeset state update
>    *
>    * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
>    * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
>    * private state structures, drm_atomic_get_private_obj_state().
>    */
>   struct drm_atomic_state {
> +	/**
> +	 * @ref:
> +	 *
> +	 * Count of all references to this update (will not be freed until zero).
> +	 */
>   	struct kref ref;
>   
> +	/**
> +	 * @dev: Parent DRM Device.
> +	 */

Well, I noticed that the first letter of 'Parent' get capitalized.
Do we also need capitalize the reset of documentation to keep consistent?


>   	struct drm_device *dev;
>   
>   	/**
> @@ -388,7 +386,12 @@ struct drm_atomic_state {
>   	 * flag are not allowed.
>   	 */
>   	bool legacy_cursor_update : 1;
> +
> +	/**
> +	 * @async_update: hint for asynchronous plane update
> +	 */
>   	bool async_update : 1;
> +
>   	/**
>   	 * @duplicated:
>   	 *
> @@ -398,13 +401,40 @@ struct drm_atomic_state {
>   	 * states.
>   	 */
>   	bool duplicated : 1;
> +
> +	/**
> +	 * @planes: pointer to array of structures with per-plane data
> +	 */
>   	struct __drm_planes_state *planes;
> +
> +	/**
> +	 * @crtcs: pointer to array of CRTC pointers
> +	 */
>   	struct __drm_crtcs_state *crtcs;
> +
> +	/**
> +	 * @num_connector: size of the @connectors and @connector_states arrays
> +	 */
>   	int num_connector;
> +
> +	/**
> +	 * @connectors: pointer to array of structures with per-connector data
> +	 */
>   	struct __drm_connnectors_state *connectors;
> +
> +	/**
> +	 * @num_private_objs: size of the @private_objs array
> +	 */
>   	int num_private_objs;
> +
> +	/**
> +	 * @private_objs: pointer to array of private object pointers
> +	 */
>   	struct __drm_private_objs_state *private_objs;
>   
> +	/**
> +	 * @acquire_ctx: acquire context for this atomic modeset state update
> +	 */
>   	struct drm_modeset_acquire_ctx *acquire_ctx;
>   
>   	/**
