Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89193B4098B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7B710E7C0;
	Tue,  2 Sep 2025 15:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F4B810E7C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:47:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16F2153B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:47:21 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86933F694
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:47:29 -0700 (PDT)
Date: Tue, 2 Sep 2025 16:47:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/37] drm/arm/malidp: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <aLcRi3XPs3kuFidQ@e110455-lin.cambridge.arm.com>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-12-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902-drm-no-more-existing-state-v2-12-de98fc5f6d66@kernel.org>
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

On Tue, Sep 02, 2025 at 11:35:11AM +0200, Maxime Ripard wrote:
> The malidp atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> ---
> To: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 87f2e5ee87907403fac5386042bd6f313397ba03..f1a5014bcfa1058072e13f1ad8e84c85f52fb156 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -261,11 +261,11 @@ static const struct drm_plane_funcs malidp_de_plane_funcs = {
>  
>  static int malidp_se_check_scaling(struct malidp_plane *mp,
>  				   struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state =
> -		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +		drm_atomic_get_new_crtc_state(state->state, state->crtc);
>  	struct malidp_crtc_state *mc;
>  	u32 src_w, src_h;
>  	int ret;
>  
>  	if (!crtc_state)
> 
> -- 
> 2.50.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
