Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D923214691
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 16:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680976E0C5;
	Sat,  4 Jul 2020 14:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52076E0C5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 14:52:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0FB1380512;
 Sat,  4 Jul 2020 16:52:14 +0200 (CEST)
Date: Sat, 4 Jul 2020 16:52:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200704145212.GA791554@ravnborg.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
 <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
 <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
 <20200704134115.GA755192@ravnborg.org>
 <1d19833f-2977-a12f-f3a9-ef0d509ef366@ilande.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d19833f-2977-a12f-f3a9-ef0d509ef366@ilande.co.uk>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=3GLR1-XzZKwA:10 a=e5mUnYsNAAAA:8
 a=Nss-hjO5630hpDDf15kA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark.

On Sat, Jul 04, 2020 at 03:16:47PM +0100, Mark Cave-Ayland wrote:
> On 04/07/2020 14:41, Sam Ravnborg wrote:
> 
> > I think what is happening is that the bochs driver request a shadow copy
> > for the frambuffer. And with the change to fbops we now use the cfb_
> > functions to write to the shadow framebuffer - which is not in any IO
> > space. So this does not work.
> > 
> > So maybe all we need is the fix in drm_fb_helper_dirty_blit_real().
> > If you try to undo the change so fbops is set to &drm_fbdev_fb_ops,
> > but keep the fix in drm_fb_helper_dirty_blit_real() how does it then
> > behave?
> 
> Bingo! I just tried that and the framebuffer is now working under qemu-system-sparc64
> again - thank you so much for the help! From what you said I guess
> drm_fb_helper_dirty_blit_real() is responsible syncing the shadow copy?
> 
> Below is the current working diff based upon your previous one: it certainly feels
> like the difference in memcpy() behaviour should be hidden away in fb_memcpy_tofb()
> or similar.

From your feedback so far I thnk the minimal fix would be like this:

> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> .. static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>         size_t len = (clip->x2 - clip->x1) * cpp;
>         unsigned int y;
> 
>         for (y = clip->y1; y < clip->y2; y++) {
> -               memcpy(dst, src, len);
> +               fb_memcpy_tofb(dst, src, len);
>                 src += fb->pitches[0];
>                 dst += fb->pitches[0];
>         }

(Hand edited, patch s not a valid syntax)

But I need feedback from someone that know all this a bit better
to judge if this is an OK change.
For once - this will only work with shadow buffers.

	Sam



> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6c3ef49b46b3..dce9adf7d189 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -865,6 +865,15 @@ struct drm_mode_config {
>          */
>         bool prefer_shadow_fbdev;
> 
> +       /**
> +        * @use_cfb_for_fbdev:
> +        *
> +        * Use cfb variants of drm_fb_helper_cfb_{fillrect,copyarea,imageblit}
> +        * The cfb variants are required when the CPU do not allow direct
> +        * access to the framebuffer (for example sparc64)
> +        */
> +       bool use_cfb_for_fbdev;
> +
>         /**
>          * @quirk_addfb_prefer_xbgr_30bpp:
>          *
> 
> > I did not find time to follow your instructions to test this myself with
> > qemu - sorry.
> 
> No worries, I do appreciate that as a maintainer it can be hard to fit these things
> around life, family, job etc.
> 
> 
> ATB,
> 
> Mark.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
