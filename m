Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9E71FFFB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B716510E65C;
	Fri,  2 Jun 2023 11:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A4310E65C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:05:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECCF6E0;
 Fri,  2 Jun 2023 13:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685703879;
 bh=8Ej7wcIutR5WCUQ1LWvTNh+N/cYkKVA3SIv/HoFFDlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MfhvjUXKPe2VCQbcUOwdFnE4mo/ngKUA+QS3gaJ5DF+7tM2RBeGdr1s5W5pHcoGlz
 hfQZh978Az3ng2eu6b1D61scH2Eqj5wbHi6Eu2ead3TFCpY/9OrI/Ug4UhQLiI3YvT
 pNcBJuLkhItb3L8VRA0nMxzOiNHRz2+Vv/JELdMQ=
Date: Fri, 2 Jun 2023 14:04:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/3] drm: Remove references to removed transitional helpers
Message-ID: <20230602110459.GC26944@pendragon.ideasonboard.com>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <14e091fc522aa63a3e33bda1016e5fa946d47d18.1685696114.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14e091fc522aa63a3e33bda1016e5fa946d47d18.1685696114.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Jun 02, 2023 at 11:11:35AM +0200, Geert Uytterhoeven wrote:
> The transitional helpers were removed a long time ago, but some
> references stuck.  Remove them.
> 
> Fixes: 21ebe615c16994f3 ("drm: Remove transitional helpers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> It doesn't look like the drm_encoder_helper_funcs were ever used by the
> transitional plane helpers?
> ---
>  drivers/gpu/drm/drm_plane_helper.c       |  8 ----
>  include/drm/drm_crtc.h                   |  5 ---
>  include/drm/drm_modeset_helper_vtables.h | 48 +++++++++++-------------
>  3 files changed, 21 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c91e454eba097942..be45bdb58d849653 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -51,14 +51,6 @@
>   * planes, and newly merged drivers must not rely upon these transitional
>   * helpers.
>   *

The first paragraph starts with "This helper library has two parts.". As
you're dropping the mention of the second part, I think you should
rework the first paragraph too.

> - * The second part also implements transitional helpers which allow drivers to
> - * gradually switch to the atomic helper infrastructure for plane updates. Once
> - * that switch is complete drivers shouldn't use these any longer, instead using
> - * the proper legacy implementations for update and disable plane hooks provided
> - * by the atomic helpers.
> - *
> - * Again drivers are strongly urged to switch to the new interfaces.
> - *
>   * The plane helpers share the function table structures with other helpers,
>   * specifically also the atomic helpers. See &struct drm_plane_helper_funcs for
>   * the details.
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8e1cbc75143ef216..8b48a1974da3143c 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -77,11 +77,6 @@ struct drm_plane_helper_funcs;
>   * intended to indicate whether a full modeset is needed, rather than strictly
>   * describing what has changed in a commit. See also:
>   * drm_atomic_crtc_needs_modeset()
> - *
> - * WARNING: Transitional helpers (like drm_helper_crtc_mode_set() or
> - * drm_helper_crtc_mode_set_base()) do not maintain many of the derived control
> - * state like @plane_mask so drivers not converted over to atomic helpers should
> - * not rely on these being accurate!
>   */
>  struct drm_crtc_state {
>  	/** @crtc: backpointer to the CRTC */
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 965faf082a6d1acb..e3c3ac615909474b 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -59,8 +59,8 @@ enum mode_set_atomic {
>  /**
>   * struct drm_crtc_helper_funcs - helper operations for CRTCs
>   *
> - * These hooks are used by the legacy CRTC helpers, the transitional plane
> - * helpers and the new atomic modesetting helpers.
> + * These hooks are used by the legacy CRTC helpers and the new atomic
> + * modesetting helpers.
>   */
>  struct drm_crtc_helper_funcs {
>  	/**
> @@ -216,9 +216,7 @@ struct drm_crtc_helper_funcs {
>  	 *
>  	 * This callback is used to update the display mode of a CRTC without
>  	 * changing anything of the primary plane configuration. This fits the
> -	 * requirement of atomic and hence is used by the atomic helpers. It is
> -	 * also used by the transitional plane helpers to implement a
> -	 * @mode_set hook in drm_helper_crtc_mode_set().
> +	 * requirement of atomic and hence is used by the atomic helpers.
>  	 *
>  	 * Note that the display pipe is completely off when this function is
>  	 * called. Atomic drivers which need hardware to be running before they
> @@ -333,8 +331,8 @@ struct drm_crtc_helper_funcs {
>  	 * all updated. Again the recommendation is to just call check helpers
>  	 * until a maximal configuration is reached.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -373,8 +371,8 @@ struct drm_crtc_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*atomic_begin)(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state);
> @@ -397,8 +395,8 @@ struct drm_crtc_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*atomic_flush)(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state);
> @@ -507,8 +505,8 @@ static inline void drm_crtc_helper_add(struct drm_crtc *crtc,
>  /**
>   * struct drm_encoder_helper_funcs - helper operations for encoders
>   *
> - * These hooks are used by the legacy CRTC helpers, the transitional plane
> - * helpers and the new atomic modesetting helpers.
> + * These hooks are used by the legacy CRTC helpers and the new atomic
> + * modesetting helpers.
>   */
>  struct drm_encoder_helper_funcs {
>  	/**
> @@ -1185,8 +1183,7 @@ static inline void drm_connector_helper_add(struct drm_connector *connector,
>  /**
>   * struct drm_plane_helper_funcs - helper operations for planes
>   *
> - * These functions are used by the atomic helpers and by the transitional plane
> - * helpers.
> + * These functions are used by the atomic helpers.
>   */
>  struct drm_plane_helper_funcs {
>  	/**
> @@ -1221,9 +1218,8 @@ struct drm_plane_helper_funcs {
>  	 * The helpers will call @cleanup_fb with matching arguments for every
>  	 * successful call to this hook.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional. See @begin_fb_access
> -	 * for preparing per-commit resources.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional. See @begin_fb_access for preparing per-commit resources.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -1240,8 +1236,8 @@ struct drm_plane_helper_funcs {
>  	 * This hook is called to clean up any resources allocated for the given
>  	 * framebuffer and plane configuration in @prepare_fb.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 */
>  	void (*cleanup_fb)(struct drm_plane *plane,
>  			   struct drm_plane_state *old_state);
> @@ -1295,8 +1291,8 @@ struct drm_plane_helper_funcs {
>  	 * all updated. Again the recommendation is to just call check helpers
>  	 * until a maximal configuration is reached.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -1326,8 +1322,7 @@ struct drm_plane_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional.
> +	 * This callback is used by the atomic modeset helpers, but it is optional.
>  	 */
>  	void (*atomic_update)(struct drm_plane *plane,
>  			      struct drm_atomic_state *state);
> @@ -1376,9 +1371,8 @@ struct drm_plane_helper_funcs {
>  	 * has picked. See drm_atomic_helper_commit_planes() for a discussion of
>  	 * the tradeoffs and variants of plane commit helpers.
>  	 *
> -	 * This callback is used by the atomic modeset helpers and by the
> -	 * transitional plane helpers, but it is optional. It's intended to
> -	 * reverse the effects of @atomic_enable.
> +	 * This callback is used by the atomic modeset helpers, but it is
> +	 * optional. It's intended to reverse the effects of @atomic_enable.
>  	 */
>  	void (*atomic_disable)(struct drm_plane *plane,
>  			       struct drm_atomic_state *state);

-- 
Regards,

Laurent Pinchart
