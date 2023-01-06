Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE93660610
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17710E8A8;
	Fri,  6 Jan 2023 17:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51FD10E8A8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:56:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id l26so1574620wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pVUlEYDINlUPYfKkqMC10lMZAuOwvbEUS2L1+rBM3s4=;
 b=jW1ooPK4ZGNYfkCCbs8VZCLhm+HKefyngV2Gycy4gS8mwjM201YdV/gAW6fI4yw9Wl
 WjhMOxypjCph+Y+0/I3FALud8BIo2NeSCl0msU7meAmWE1bSJtYkrrFMDAf92DUrpS4v
 4ZNTWg5iWNeT6W/xkrc0j5hWFVXlqSEGZJQUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVUlEYDINlUPYfKkqMC10lMZAuOwvbEUS2L1+rBM3s4=;
 b=7vY+H33IQfxBwTkJTosCqLtdH4JXblwX0tV1/YDs7RDBLZADG4duMJZAwtZ1dCv5Sc
 jZJ4Ab6+QK0O9o6frxKXDN9DwFOR7Si2Aa4QNaZ11VWs+VbHM3RnPobuxtcpMjbLZGr2
 /4R5hIxY0QHL7RN7z9PHkvXLz5CjI+yveDlZPLLcnIJnrZeJQ+KXacT1HMXoqlFu4ctA
 pVt7zIbW2fN+iE/iHm8gaT14sTdUS4lnzdciaUtNZXWeCIMDxo2Tl8Omk368ddmgFoBy
 WivsEs3Qv05h+YRjYRhaiew215vtrxlwaQSOCIMerXBamYEEzg68R7R10mF/HemhKUPi
 H+2Q==
X-Gm-Message-State: AFqh2koyw7EwIXup2uE6kHcIac+um++N9FXwcfvW83I+zzohCNEpmoc6
 RfJ6wQFUbrB5GUbxXx5Tbjv3AQ==
X-Google-Smtp-Source: AMrXdXskLyk+tAsxGir7PsJRo7ijdDU+9YHDq+LkI8flBmteWm7ppRv2LZOFPxZbJTHvnlgQRHSgnQ==
X-Received: by 2002:a05:600c:3ba4:b0:3cf:d428:21d6 with SMTP id
 n36-20020a05600c3ba400b003cfd42821d6mr38617042wms.3.1673027805321; 
 Fri, 06 Jan 2023 09:56:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b003d96bdddd3dsm2626341wmb.15.2023.01.06.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 09:56:44 -0800 (PST)
Date: Fri, 6 Jan 2023 18:56:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2] drm/vkms: reintroduce prepare_fb and cleanup_fb
 functions
Message-ID: <Y7hg2g51DVvTtjvE@phenom.ffwll.local>
References: <20230106115759.213710-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230106115759.213710-1-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 08:57:59AM -0300, Maíra Canal wrote:
> With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
> end}_fb_access with vmap"), the behavior of the shadow-plane helpers
> changed and the vunmap is now performed at the end of
> the current pageflip, instead of the end of the following pageflip.
> 
> By performing the vunmap at the end of the current pageflip, invalid
> memory is accessed by the vkms during the plane composition, as the data
> is being unmapped before being used, as reported by the following
> warning:
> 
>  [  275.866047] BUG: unable to handle page fault for address: ffffb382814e8002
>  [  275.866055] #PF: supervisor read access in kernel mode
>  [  275.866058] #PF: error_code(0x0000) - not-present page
>  [  275.866061] PGD 1000067 P4D 1000067 PUD 110a067 PMD 46e3067 PTE 0
>  [  275.866066] Oops: 0000 [#1] PREEMPT SMP PTI
>  [  275.866070] CPU: 2 PID: 49 Comm: kworker/u8:2 Not tainted 6.1.0-rc6-00018-gb357e7ac1b73-dirty #54
>  [  275.866074] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
>  [  275.866076] Workqueue: vkms_composer vkms_composer_worker [vkms]
>  [  275.866084] RIP: 0010:XRGB8888_to_argb_u16+0x5c/0xa0 [vkms]
>  [  275.866092] Code: bf 56 0a 0f af 56 70 48 8b 76 28 01 ca 49 83 f8 02
>  41 b9 01 00 00 00 4d 0f 43 c8 48 01 f2 48 83 c2 02 31 f6 66 c7 04 f0 ff
>  ff <0f> b6 0c b2 89 cf c1 e7 08 09 cf 66 89 7c f0 02 0f b6 4c b2 ff 89
>  [  275.866095] RSP: 0018:ffffb382801b7db0 EFLAGS: 00010246
>  [  275.866098] RAX: ffff896336ace000 RBX: ffff896310e293c0 RCX: 0000000000000000
>  [  275.866101] RDX: ffffb382814e8002 RSI: 0000000000000000 RDI: ffffb382801b7de8
>  [  275.866103] RBP: 0000000000001400 R08: 0000000000000280 R09: 0000000000000280
>  [  275.866105] R10: 0000000000000010 R11: ffffffffc011d990 R12: ffff896302a1ece0
>  [  275.866107] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000080008001
>  [  275.866109] FS:  0000000000000000(0000) GS:ffff89637dd00000(0000) knlGS:0000000000000000
>  [  275.866112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  [  275.866114] CR2: ffffb382814e8002 CR3: 0000000003bb4000 CR4: 00000000000006e0
>  [  275.866120] Call Trace:
>  [  275.866123]  <TASK>
>  [  275.866124]  compose_active_planes+0x1c4/0x380 [vkms]
>  [  275.866132]  vkms_composer_worker+0x9f/0x130 [vkms]
>  [  275.866139]  process_one_work+0x1c0/0x370
>  [  275.866160]  worker_thread+0x221/0x410
>  [  275.866164]  ? worker_clr_flags+0x50/0x50
>  [  275.866167]  kthread+0xe1/0x100
>  [  275.866172]  ? kthread_blkcg+0x30/0x30
>  [  275.866176]  ret_from_fork+0x22/0x30
>  [  275.866181]  </TASK>
>  [  275.866182] Modules linked in: vkms
>  [  275.866186] CR2: ffffb382814e8002
>  [  275.866191] ---[ end trace 0000000000000000 ]---
> 
> Therefore, introduce again prepare_fb and cleanup_fb functions to the
> vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
> Let shadow-plane helpers prepare the plane's FB").
> 
> Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

btw for stuff that fixes regression, pls also cc everyone involved in that
old patch.

$ dim fixes 359c6649cd9a

should give you a good idea. This way reviewers can learn a bit more where
they missed something :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com/T/
> 
> - Add kernel oops to the commit description (Melissa Wen).
> - s/introduce/reintroduce/ in the title (Melissa Wen).
> - Add Thomas's Acked-by.
> 
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index c3a845220e10..b3f8a115cc23 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
> 	return 0;
>  }
> 
> +static int vkms_prepare_fb(struct drm_plane *plane,
> +			   struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb = state->fb;
> +	int ret;
> +
> +	if (!fb)
> +		return 0;
> +
> +	shadow_plane_state = to_drm_shadow_plane_state(state);
> +
> +	ret = drm_gem_plane_helper_prepare_fb(plane, state);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
> +}
> +
> +static void vkms_cleanup_fb(struct drm_plane *plane,
> +			    struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb = state->fb;
> +
> +	if (!fb)
> +		return;
> +
> +	shadow_plane_state = to_drm_shadow_plane_state(state);
> +
> +	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> +}
> +
>  static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
> 	.atomic_update		= vkms_plane_atomic_update,
> 	.atomic_check		= vkms_plane_atomic_check,
> -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.prepare_fb		= vkms_prepare_fb,
> +	.cleanup_fb		= vkms_cleanup_fb,
>  };
> 
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> --
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
