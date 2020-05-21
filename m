Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702EF1DD91B
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 23:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572536E20F;
	Thu, 21 May 2020 21:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138896E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 21:09:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A1330804A3;
 Thu, 21 May 2020 23:09:25 +0200 (CEST)
Date: Thu, 21 May 2020 23:09:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
Message-ID: <20200521210924.GA1056842@ravnborg.org>
References: <20200521204647.2578479-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521204647.2578479-1-lyude@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=pm5h8qfB858e3dYQ7kEA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 21, 2020 at 04:46:47PM -0400, Lyude Paul wrote:
> On some architectures like ppc64le and aarch64, compiling with
> -Wformat=1 will throw the following warnings:
> 
>   In file included from drivers/gpu/drm/drm_vblank.c:33:
>   drivers/gpu/drm/drm_vblank.c: In function 'drm_update_vblank_count':
>   drivers/gpu/drm/drm_vblank.c:273:16: warning: format '%llu' expects
>   argument of type 'long long unsigned int', but argument 4 has type
>   'long int' [-Wformat=]
>     DRM_DEBUG_VBL("updating vblank count on crtc %u:"
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ./include/drm/drm_print.h:407:22: note: in definition of macro
>   'DRM_DEBUG_VBL'
>     drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
>                         ^~~
>   drivers/gpu/drm/drm_vblank.c:274:22: note: format string is defined here
>            " current=%llu, diff=%u, hw=%u hw_last=%u\n",
>                      ~~~^
>                      %lu
> 
> So, fix that with a typecast.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index acb3c3f65b579..1a96db2dd16fa 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -342,7 +342,7 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
>  
>  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
>  		      " current=%llu, diff=%u, hw=%u hw_last=%u\n",
> -		      pipe, atomic64_read(&vblank->count), diff,
> +		      pipe, (unsigned long long)atomic64_read(&vblank->count), diff,
>  		      cur_vblank, vblank->last);

While touching this you could consider introducing drm_dbg_vbl().
An maybe as a follow-up patch replace all logging in this file with the drm_* variants.

	Sam

>  
>  	if (diff == 0) {
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
