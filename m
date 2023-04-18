Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED56E5C10
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FDD10E6F8;
	Tue, 18 Apr 2023 08:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCAA10E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:32:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f16f792384so5112805e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681806726; x=1684398726;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WLSH8gwfIPleEeUUt5WgJYFcEuj6q3wMvZ3h+Vy7zo=;
 b=DTErbNOZ6G5TtRTr1+Lqoa3G5VNpvbkPZ5Y2ydixzoTjpc+cB5ykDY4fhGum1tkO7W
 vUdDjH4tSMqLMG4ES4s5sI5zyELRrWLUfYP/iJvG4KnD22STeHJl1MgahB2bnOSLoByV
 xW5mxiKTI9dwC4XWOmpDDTJBqpi/nnKIaxl7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806726; x=1684398726;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3WLSH8gwfIPleEeUUt5WgJYFcEuj6q3wMvZ3h+Vy7zo=;
 b=RVnNK4QREzkELrxDgdxal4hB7SXnfvEXUYOztZxE8+KHNYMRJw7obB86B4XOZfNxTk
 B2uaioo8CkG1Wo3VmOHmhePEcx1KKSAt/OcnmfMM/TjgpZFE/FeVaE1DCQEF0nzB8MVe
 3wzkEj/5ES4UsMI5xQfCKXJCcOo/9zySygq5Tes1FZKkqBflaC2T1mft1wPXPrta7rjt
 fdN+vHmp3MKcZExCr6WtRN3pMDU0ZvUZja6vuzzDtXMLHZ+Tp4OyzbNokHOrmA1jWdNG
 7vQ2zkkUqai1JRz0kWvQlX4VMCFELOW3uosVMlT6qnMlsnLh+AS3c8btjDi99tU8eKlt
 7gPg==
X-Gm-Message-State: AAQBX9fgulPVfj0O6dvT0gwgyUTi3qe518Pk20wfznEFtp2hXR2JGloV
 eBz8gCn1AOu+IRQTsXV1qgpmeQ==
X-Google-Smtp-Source: AKy350Zb3S0UjaCxbuQFx+pYjJEjeuZKam0MNlGMGdZ51RvByjcZnxHf0dc3aGErX2sxXyBWXrQ6Vw==
X-Received: by 2002:a05:600c:1e12:b0:3f1:727f:1967 with SMTP id
 ay18-20020a05600c1e1200b003f1727f1967mr5443586wmb.4.1681806726244; 
 Tue, 18 Apr 2023 01:32:06 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003f17848673fsm1806427wmi.27.2023.04.18.01.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 01:32:05 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:32:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Message-ID: <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417113219.1354078-1-suijingfeng@loongson.cn>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 07:32:19PM +0800, Sui Jingfeng wrote:
> The fbdev test of IGT may write after EOF, which lead to out-of-bound
> access for the drm drivers using fbdev-generic. For example, on a x86
> + aspeed bmc card platform, with a 1680x1050 resolution display, running
> fbdev test if IGT will cause the linux kernel hang with the following
> call trace:
> 
>   Oops: 0000 [#1] PREEMPT SMP PTI
>   [IGT] fbdev: starting subtest eof
>   Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>   [IGT] fbdev: starting subtest nullptr
> 
>   RIP: 0010:memcpy_erms+0xa/0x20
>   RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>   RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>   RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>   RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>   R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>   R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>   FS:  0000000000000000(0000) GS:ffff895257380000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>   Call Trace:
>    <TASK>
>    ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>    drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>    process_one_work+0x21f/0x430
>    worker_thread+0x4e/0x3c0
>    ? __pfx_worker_thread+0x10/0x10
>    kthread+0xf4/0x120
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x2c/0x50
>    </TASK>
>   CR2: ffffa17d40e0b000
>   ---[ end trace 0000000000000000 ]---
> 
> The direct reason is that damage rectange computed by
> drm_fb_helper_memory_range_to_clip() does not guaranteed to be in-bound.
> It is already results in workaround code populate to elsewhere. Another
> reason is that exposing a larger buffer size than the actual needed help
> to trigger this bug intrinsic in drm_fb_helper_memory_range_to_clip().
> 
> Others fbdev emulation solutions write to the GEM buffer directly, they
> won't reproduce this bug because the .fb_dirty function callback do not
> being hooked, so no chance is given to drm_fb_helper_memory_range_to_clip()
> to generate a out-of-bound when drm_fb_helper_sys_write() is called.
> 
> This patch break the trigger condition of this bug by shrinking the shadow
> buffer size to sizes->surface_height * buffer->fb->pitches[0].
> 
> Fixes: '8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of GEM
> buffer")'
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 8e5148bf40bb..b057cfbba938 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -94,7 +94,7 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  	fb_helper->buffer = buffer;
>  	fb_helper->fb = buffer->fb;
>  
> -	screen_size = buffer->gem->size;
> +	screen_size = sizes->surface_height * buffer->fb->pitches[0];

So I read core some more and stumbled over drm_fb_helper_deferred_io().
Which has all the code and comments about this, including limiting.

I think it would be clearer if we fix the issue there, instead of passing
limits around in obscure places that then again get broken? The thing is,
Thomas both authored the limit checks in drm_fb_helper_deferred_io() and
the patch which broken them again, so clearly this isn't very obvious. I'm
thinking of something like this:


diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ef4eb8b12766..726dab67c359 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -697,10 +697,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	 * of the screen and account for non-existing scanlines. Hence,
 	 * keep the covered memory area within the screen buffer.
 	 */
-	if (info->screen_size)
-		total_size = info->screen_size;
-	else
-		total_size = info->fix.smem_len;
+	total_size = helper->fb->height * helper->fb->pitches[0];
 	max_off = min(max_off, total_size);
 
 	if (min_off < max_off) {


I think that would make it utmost clear on what we're doing and why.
Otherwise we're just going to re-create the same bug again, like we've
done already :-)
-Daniel

>  	screen_buffer = vzalloc(screen_size);
>  	if (!screen_buffer) {
>  		ret = -ENOMEM;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
