Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5926BA149
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 22:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0CF10E2A8;
	Tue, 14 Mar 2023 21:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A8910E2A8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 21:16:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 32DDDCE1762;
 Tue, 14 Mar 2023 21:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4271C433EF;
 Tue, 14 Mar 2023 21:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678828577;
 bh=P0BB6QmxpoAvCexozzH0fk0INeWmHyvrfOtOLNWxBPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/kk+kNnUbArLMPZr5tXtQImlb/sGMD7JDqK6VecRRKBnZVvYlb+Q20ApWEkvOXg6
 H66zACOIaJMjIDK7+Ka2JcdkYDmZt1RosKfskXCxRB0q2qWNxGrr2hGM03+8GpErhi
 sHSoi+OZiDixK+rUR0N2y31tF51gRJfclZJb8XfypJe4Kx9dvZeFYEy1xhoKvASwsf
 o/vTnTPYKqoL5TRZ2Uit8ZZ+OGYsClM6DDsdjPkpEkd0QKjcanL9btO84Z9x0HIj2V
 073PiKkyGnj+BuxYEddGb2S3mTLVcz5pJayT1addPBjutcAJFEV4rogdROTXWUtRUS
 bTLrIySlis0MQ==
Date: Tue, 14 Mar 2023 14:16:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
Message-ID: <20230314211615.GA3351584@dev-arch.thelio-3990X>
References: <20230314211445.1363828-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314211445.1363828-1-zack@kde.org>
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
Cc: banackm@vmware.com, krastevm@vmware.com, dri-devel@lists.freedesktop.org,
 iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 05:14:45PM -0400, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> The src/dst_pitch got mixed up during the rework of the function, make
> sure the offset's refer to the correct one.
> 
> Spotted by clang:
> Clang warns (or errors with CONFIG_WERROR):
> 
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:509:29: error: variable 'dst_pitch' is uninitialized when used here [-Werror,-Wuninitialized]
>           src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
>                                      ^~~~~~~~~
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:492:26: note: initialize the variable 'dst_pitch' to silence this warning
>           s32 src_pitch, dst_pitch;
>                                   ^
>                                    = 0
>   1 error generated.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1811
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Dave Airlie <airlied@gmail.com>
> Fixes: 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the quick response and patch!

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index d79a6eccfaa4..ba0c0e12cfe9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -506,11 +506,11 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
>  	/* Assume we are blitting from Guest (bo) to Host (display_srf) */
>  	src_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
>  	src_bo = &stdu->display_srf->res.guest_memory_bo->tbo;
> -	src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
> +	src_offset = ddirty->top * src_pitch + ddirty->left * stdu->cpp;
>  
>  	dst_pitch = ddirty->pitch;
>  	dst_bo = &ddirty->buf->tbo;
> -	dst_offset = ddirty->fb_top * src_pitch + ddirty->fb_left * stdu->cpp;
> +	dst_offset = ddirty->fb_top * dst_pitch + ddirty->fb_left * stdu->cpp;
>  
>  	(void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
>  			       src_bo, src_offset, src_pitch,
> -- 
> 2.38.1
> 
