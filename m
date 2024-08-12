Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC894EC7A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CCD10E1C8;
	Mon, 12 Aug 2024 12:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kwP+vKsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A510E1C7;
 Mon, 12 Aug 2024 12:11:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 82ED2CE0B8D;
 Mon, 12 Aug 2024 12:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037C7C4AF0D;
 Mon, 12 Aug 2024 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723464693;
 bh=Yr8egeQ29zXrnH06n0xymM+MYV3YphQLGJxZDkqaY0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kwP+vKsF3TcAgbO5n03MQvAG3YnMdZEVYZnDugOQdrADvdyWDRhEBr5fte7thpNg8
 iMJuOjbAgRanB3osvSG8DYnUZ67zRBN9qNIGdBkp3Mr6eQjWM+6VcEgT5U+5fGh95p
 ptKRzBFH1H38HipP74JN7SxMJD82m0A+DfL1GjY1ZNm9ffIYhqls/xsOLEOg6UjKvu
 cvVxFULPNFKO25LgthiIitWudscBUXFfDSmZw/dUsq8eLGREUk6CxMwJQHuuFv5tj+
 B/mvpklPWWBjiDLqQz4kj9Lt6Y2Fg8Dynd3wtR3uagzltk3zFnc3+UOQslrbue8LSp
 1/XjwsxmBNsiQ==
Message-ID: <a5529e33-e954-4dfc-9940-c31de6494e58@kernel.org>
Date: Mon, 12 Aug 2024 14:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/nouveau: Do not set struct
 drm_mode_config_funcs.output_poll_changed
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-5-tzimmermann@suse.de>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240812083000.337744-5-tzimmermann@suse.de>
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

On 8/12/24 10:28 AM, Thomas Zimmermann wrote:
> The output_poll_changed hook was only necessary before in-kernel
> DRM clients existed, but is now obsolete. The client code handles
> display hotplugging internally.
> 
> v2:
> - fix commit description
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c   | 1 -
>   drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e4c8ce6dd40a..eed579a6c858 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2648,7 +2648,6 @@ nv50_disp_atomic_state_alloc(struct drm_device *dev)
>   static const struct drm_mode_config_funcs
>   nv50_disp_func = {
>   	.fb_create = nouveau_user_framebuffer_create,
> -	.output_poll_changed = drm_fb_helper_output_poll_changed,
>   	.atomic_check = nv50_disp_atomic_check,
>   	.atomic_commit = nv50_disp_atomic_commit,
>   	.atomic_state_alloc = nv50_disp_atomic_state_alloc,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 8a87e9697a42..e2fd561cd23f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -391,7 +391,6 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>   
>   static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
>   	.fb_create = nouveau_user_framebuffer_create,
> -	.output_poll_changed = drm_fb_helper_output_poll_changed,
>   };
>   
>   
