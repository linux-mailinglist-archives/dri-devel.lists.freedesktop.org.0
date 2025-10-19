Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09694BEE728
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FE010E1AA;
	Sun, 19 Oct 2025 14:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X0zEXi7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62510E1AA
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:35:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14F0060217;
 Sun, 19 Oct 2025 14:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DD1C4CEE7;
 Sun, 19 Oct 2025 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760884502;
 bh=y7cvxQqQD1a5PHENO82BrDOOIH5qq6OOuxFThXQ36dI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0zEXi7N3qg02EN+vP29+2Xg0tUW8RV04086pk5OctIKpkZsAyHOhF65hE39ixzHd
 uvvrMnkIse3YPY3kk9GECQYSES85PYMYwoyiidT65itCGuc44chhgAmb3gfrE635ld
 J/E3x1hwHAh5ajLFb6x8hV7s09PjKrGAmkgmgSLk=
Date: Sun, 19 Oct 2025 16:34:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
Message-ID: <2025101910-dipper-suburb-1755@gregkh>
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
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

On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
> Replace kmalloc() with kmalloc_array() to correctly
> handle array allocations and benefit from built-in overflow checking[1].
> 
> [1]:https://docs.kernel.org/process/deprecated.html
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 4824f863fdba..290132c24ff9 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *
>  	DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>  		  epd->factored_stage_time);
>  
> -	buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> +	buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);

This isn't an array, so this function change doesn't seem to make much
sense, right?  The size should have already been checked earlier in the
call change to be correct.

thanks,

greg k-h
