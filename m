Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB216EA14
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE26EB33;
	Tue, 25 Feb 2020 15:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A816EB31
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 15:28:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6A8DF294F57;
 Tue, 25 Feb 2020 15:28:37 +0000 (GMT)
Date: Tue, 25 Feb 2020 16:28:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v7 05/54] drm/bridge: Fix atomic state ops documentation
Message-ID: <20200225162835.3974a852@collabora.com>
In-Reply-To: <20200222150106.22919-6-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
 <20200222150106.22919-6-laurent.pinchart@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 22 Feb 2020 17:00:17 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> The drm_bridge_funcs atomic_state_duplicate and atomic_state_destroy
> operations are erroneously documented as having a default implementation
> if not implemented in bridge drivers. This isn't correct, fix the
> documentation.

Oops, looks like a leftover from a previous version. Thanks for fixing
that.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/drm/drm_bridge.h | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 999faaaab9a1..38de129d5947 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -349,9 +349,11 @@ struct drm_bridge_funcs {
>  	 * Duplicate the current bridge state object (which is guaranteed to be
>  	 * non-NULL).
>  	 *
> -	 * The atomic_duplicate_state() hook is optional. When not implemented
> -	 * the core allocates a drm_bridge_state object and calls
> -	 * __drm_atomic_helper_bridge_duplicate_state() to initialize it.
> +	 * The atomic_duplicate_state hook is mandatory if the bridge
> +	 * implements any of the atomic hooks, and should be left unassigned
> +	 * otherwise. For bridges that don't subclass &drm_bridge_state, the
> +	 * drm_atomic_helper_bridge_duplicate_state() helper function shall be
> +	 * used to implement this hook.
>  	 *
>  	 * RETURNS:
>  	 * A valid drm_bridge_state object or NULL if the allocation fails.
> @@ -364,8 +366,11 @@ struct drm_bridge_funcs {
>  	 * Destroy a bridge state object previously allocated by
>  	 * &drm_bridge_funcs.atomic_duplicate_state().
>  	 *
> -	 * The atomic_destroy_state hook is optional. When not implemented the
> -	 * core calls kfree() on the state.
> +	 * The atomic_destroy_state hook is mandatory if the bridge implements
> +	 * any of the atomic hooks, and should be left unassigned otherwise.
> +	 * For bridges that don't subclass &drm_bridge_state, the
> +	 * drm_atomic_helper_bridge_destroy_state() helper function shall be
> +	 * used to implement this hook.
>  	 */
>  	void (*atomic_destroy_state)(struct drm_bridge *bridge,
>  				     struct drm_bridge_state *state);
> @@ -474,7 +479,10 @@ struct drm_bridge_funcs {
>  	 * This function is called at attach time.
>  	 *
>  	 * The atomic_reset hook is mandatory if the bridge implements any of
> -	 * the atomic hooks, and should be left unassigned otherwise.
> +	 * the atomic hooks, and should be left unassigned otherwise. For
> +	 * bridges that don't subclass &drm_bridge_state, the
> +	 * drm_atomic_helper_bridge_reset() helper function shall be used to
> +	 * implement this hook.
>  	 *
>  	 * Note that the atomic_reset() semantics is not exactly matching the
>  	 * reset() semantics found on other components (connector, plane, ...).

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
