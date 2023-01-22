Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32154677173
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 19:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAD810E1A0;
	Sun, 22 Jan 2023 18:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CD310E1A0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674411742; bh=G6basNI+cGfC3xf2QmqV9FLtY71hlHZTIWWsWpMT/pM=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=PazcGRFEVIta7DGoklCdlfbcG2S3U8rRiPyX/AmibmfakRtwaFrIrrW1bMWhndlI+
 nhqSWO4GCuU/3wseipVVnDO1qsfWb7yAfLMStrsJBmOBOJ5V+u/N1yhjtRUFpeuo9w
 GVRhLKdK3CWIa/TxHLDqopeWgdZa5Pnr26/HbJsc=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 22 Jan 2023 19:22:22 +0100 (CET)
X-EA-Auth: ZtbcX1FW5ED5yK7LT+dHFriGQz9zsqlbyX7i7c9N7iM/uItxpVrHWwbTtEzTmgnsj0wwMaV/LaCjZM1pl2bILMhmhIA4NKLL
Date: Sun, 22 Jan 2023 23:52:18 +0530
From: Deepak R Varma <drv@mailo.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sti: Avoid full proxy f_ops for sti debug attributes
Message-ID: <Y81+2gAtmPW2n0gS@ubun2204.myguest.virtualbox.org>
References: <Y73IdsbXhB5aUrkP@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y73IdsbXhB5aUrkP@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 01:50:06AM +0530, Deepak R Varma wrote:
> Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> function adds the overhead of introducing a proxy file operation
> functions to wrap the original read/write inside file removal protection
> functions. This adds significant overhead in terms of introducing and
> managing the proxy factory file operations structure and function
> wrapping at runtime.
> As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> with debugfs_create_file_unsafe() is suggested to be used instead.  The
> DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> debugfs_file_put() wrappers to protect the original read and write
> function calls for the debug attributes. There is no need for any
> runtime proxy file operations to be managed by the debugfs core.
> Following coccicheck make command helped identify this change:
> 
> make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note: Change cross compile tested using stm32_defconfig for arm

Hello,
Is there a feedback/comment on this patch proposal please? Let me know if I
should resend it.

Thank you,
./drv

> 
>  drivers/gpu/drm/sti/sti_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index ef6a4e63198f..c9be82043638 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -67,8 +67,8 @@ static int sti_drm_fps_set(void *data, u64 val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(sti_drm_fps_fops,
> -			sti_drm_fps_get, sti_drm_fps_set, "%llu\n");
> +DEFINE_DEBUGFS_ATTRIBUTE(sti_drm_fps_fops,
> +			 sti_drm_fps_get, sti_drm_fps_set, "%llu\n");
>  
>  static int sti_drm_fps_dbg_show(struct seq_file *s, void *data)
>  {
> @@ -97,8 +97,8 @@ static void sti_drm_dbg_init(struct drm_minor *minor)
>  				 ARRAY_SIZE(sti_drm_dbg_list),
>  				 minor->debugfs_root, minor);
>  
> -	debugfs_create_file("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
> -			    minor->dev, &sti_drm_fps_fops);
> +	debugfs_create_file_unsafe("fps_show", S_IRUGO | S_IWUSR, minor->debugfs_root,
> +				   minor->dev, &sti_drm_fps_fops);
>  
>  	DRM_INFO("%s: debugfs installed\n", DRIVER_NAME);
>  }
> -- 
> 2.34.1
> 
> 
> 


