Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84341B3FACF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2479F10E0DC;
	Tue,  2 Sep 2025 09:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jQ1HPc5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DE110E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:39:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BC22160202;
 Tue,  2 Sep 2025 09:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AB1C4CEED;
 Tue,  2 Sep 2025 09:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805983;
 bh=AtrQM0U2OrQ0BaeGwkcgJOYNLEnZes18MFYgWagFsV8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jQ1HPc5rGyg2ZgGd86P/LHjXxdSNwba6kbM43uAYHSILmw/LIF0kBUtdsdvuP8Nl1
 U8lOQEdUS9bZf1xicaQD3oYZuiIxkrUQ77J6ib6WERQsSZEP1tuyzG6FUiUqZRXQ+v
 Lw/wi7k7H40w03vHJ1JbDhNKsWPBHnMdKbj7OE8qSDfmXcMCnWBBJJlJFZ8hKTRdZ+
 nDjfxrnbstWGe4PXVA0UROqMPCOC0BCYz0tFxuH9RY2Uo1umewIWNhW2fEXGChguW8
 Qz+W3n/X0KJepij3pSdg9iEwthjy2VOZYTN98kuWEqr5KDY+EkZt9SHtc0rEBgaeZD
 99DCgwT8u6Kdw==
Message-ID: <94da1fac-9dd1-4fbd-97aa-477f8e6e759c@kernel.org>
Date: Tue, 2 Sep 2025 11:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/37] drm/vboxvideo: Switch to
 drm_atomic_get_new_crtc_state()
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-30-de98fc5f6d66@kernel.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250902-drm-no-more-existing-state-v2-30-de98fc5f6d66@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 2-Sep-25 11:35 AM, Maxime Ripard wrote:
> The vboxvideo atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> To: Hans de Goede <hansg@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 9ff3bade979577df0bc2e6e9653b3fb8fd486062..aa0dded595b6e00a9aa2027b36ca11711ccc0439 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -260,12 +260,12 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>  									   plane);
>  	struct drm_crtc_state *crtc_state = NULL;
>  
>  	if (new_state->crtc) {
> -		crtc_state = drm_atomic_get_existing_crtc_state(state,
> -								new_state->crtc);
> +		crtc_state = drm_atomic_get_new_crtc_state(state,
> +							   new_state->crtc);
>  		if (WARN_ON(!crtc_state))
>  			return -EINVAL;
>  	}
>  
>  	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
> @@ -342,12 +342,12 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
>  	u32 width = new_state->crtc_w;
>  	u32 height = new_state->crtc_h;
>  	int ret;
>  
>  	if (new_state->crtc) {
> -		crtc_state = drm_atomic_get_existing_crtc_state(state,
> -								new_state->crtc);
> +		crtc_state = drm_atomic_get_new_crtc_state(state,
> +							   new_state->crtc);
>  		if (WARN_ON(!crtc_state))
>  			return -EINVAL;
>  	}
>  
>  	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
> 

