Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23176A91507
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFF010EA51;
	Thu, 17 Apr 2025 07:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1120 seconds by postgrey-1.36 at gabe;
 Wed, 16 Apr 2025 15:41:46 UTC
Received: from animx.eu.org (tn-76-7-174-50.sta.embarqhsd.net [76.7.174.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B51210E0F9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 15:41:46 +0000 (UTC)
Received: from wakko by animx.eu.org with local id 1u54bA-0002oe-I5;
 Wed, 16 Apr 2025 11:22:48 -0400
Date: Wed, 16 Apr 2025 11:22:48 -0400
From: Wakko Warner <wakko@animx.eu.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, ???????????? <afmerlord@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/mgag200: Fix value in <VBLKSTR> register
Message-ID: <Z//LSBwuoc6Hf3zG@animx.eu.org>
References: <20250416083847.51764-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416083847.51764-1-tzimmermann@suse.de>
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

Thomas Zimmermann wrote:
> Fix an off-by-one error when setting the vblanking start in
> <VBLKSTR>. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
> variables for blanking fields") switched the value from
> crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
> from the former. The commit missed to subtract one though.

Applied to 6.14.2.  BMC and external monitor works as expected.

Thank you.

> Reported-by: Wakko Warner <wakko@animx.eu.org>
> Closes: https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/
> Reported-by: ???????????? <afmerlord@gmail.com>
> Closes: https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/
> Closes: https://bbs.archlinux.org/viewtopic.php?id=303819
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fb71658c3117..6067d08aeee3 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>  	vsyncstr = mode->crtc_vsync_start - 1;
>  	vsyncend = mode->crtc_vsync_end - 1;
>  	vtotal = mode->crtc_vtotal - 2;
> -	vblkstr = mode->crtc_vblank_start;
> +	vblkstr = mode->crtc_vblank_start - 1;
>  	vblkend = vtotal + 1;
>  
>  	linecomp = vdispend;
> -- 
> 2.49.0
> 
-- 
 Microsoft has beaten Volkswagen's world record.  Volkswagen only created 22
 million bugs.
