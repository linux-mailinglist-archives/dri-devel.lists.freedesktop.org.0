Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4418F3D0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 12:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330FE89AAE;
	Mon, 23 Mar 2020 11:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B2789AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 11:37:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40C172072D;
 Mon, 23 Mar 2020 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584963448;
 bh=Qvwdz8ilRZsCc6m4V1drguRDObDE7BaSWVLZcfchPxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDQDVC84TdvDgm8Yp4vynCgeBAz6qkIsJyMp4y6tkStNL9WlwK/con7SNvepYz+O7
 LKn/lf+cKyg3+AirXdzLWCQnfNlXXUF0JF9f14TRpJ//Ma610xkNa6WfCHyWl3b+Hz
 pVbtSWsDiApFIZ2kuB9HQQauBID5XBMiYWylvG5g=
Date: Mon, 23 Mar 2020 12:37:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/vram-helper: remove unneeded #if defined/endif guards.
Message-ID: <20200323113726.GA663867@kroah.com>
References: <20200323112802.228214-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323112802.228214-1-wambui.karugax@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 02:28:02PM +0300, Wambui Karuga wrote:
> Remove unneeded #if/#endif guards for checking whether the
> CONFIG_DEBUG_FS option is set or not. If the option is not set, the
> compiler optimizes the functions making the guards
> unnecessary.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 76506bedac11..b3201a70cbfc 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1018,7 +1018,6 @@ static struct ttm_bo_driver bo_driver = {
>   * struct drm_vram_mm
>   */
>  
> -#if defined(CONFIG_DEBUG_FS)
>  static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
>  {
>  	struct drm_info_node *node = (struct drm_info_node *) m->private;
> @@ -1035,7 +1034,6 @@ static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
>  static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
>  	{ "vram-mm", drm_vram_mm_debugfs, 0, NULL },
>  };
> -#endif
>  
>  /**
>   * drm_vram_mm_debugfs_init() - Register VRAM MM debugfs file.
> @@ -1045,11 +1043,9 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
>   */
>  void drm_vram_mm_debugfs_init(struct drm_minor *minor)
>  {
> -#if defined(CONFIG_DEBUG_FS)
>  	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
>  				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
>  				 minor->debugfs_root, minor);
> -#endif
>  }
>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>  
> -- 
> 2.25.1

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
