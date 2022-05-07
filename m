Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB151E87C
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 18:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400B811386A;
	Sat,  7 May 2022 16:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25B911386A;
 Sat,  7 May 2022 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651940454; x=1683476454;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/b/+Mr0B5Zhv55WA58zICS5As/BFDYSFtkZY5yJGamg=;
 b=UixN1AFN8MeOLGvrqaiLL+TB9ZKks7ETnE5LieEwm/7bJdsh7xL42NMO
 v+xJC9UMJ4Ee3J4LOZdwyWpBXEndsRNKhJo2o2IHL9kr9NnGeNj+fKc+J
 HkqWEXr1a6pa2cLHGg/t55aJwpHIQ0IATmFXkgXmt32RhPYLv4EXqHvhr
 yqUEdotwEKqcCYFKdQyY4LMndS2NO+z3mczr6mwD7t2ysAzEPcqpygAY1
 Kn99vyi5meB1xcNdtio0sZ7AftorPZcgyU3heezy0MypgT5WqcUpBwnJ/
 SbLw4OCKHPEtcjAqzfA5xuBAfZpcjlIg3xb4x43c0E6J1aUzzaRUDlHNJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10340"; a="256218871"
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; d="scan'208";a="256218871"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 09:20:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; d="scan'208";a="586552379"
Received: from hmendezc-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.138.85])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 09:20:54 -0700
Date: Sat, 7 May 2022 09:20:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] fbdev: efifb: Fix a use-after-free due early fb_info
 cleanup
Message-ID: <20220507162053.auo2idd5twvnxatj@ldmartin-desk2>
References: <20220506132225.588379-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506132225.588379-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 06, 2022 at 03:22:25PM +0200, Javier Martinez Canillas wrote:
>Commit d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather
>than .remove") attempted to fix a use-after-free error due driver freeing
>the fb_info in the .remove handler instead of doing it in .fb_destroy.
>
>But ironically that change introduced yet another use-after-free since the
>fb_info was still used after the free.
>
>This should fix for good by freeing the fb_info at the end of the handler.
>
>Fixes: d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove")

are these patches going through any CI before being applied? Maybe would
be a good idea to cc intel-gfx mailing list on these fixes to have Intel
CI to pick them up for some tests?

pushed to drm-misc-fixes where the previous patch was applied.

thanks
LUcas De Marchi

>Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Reported-by: Andrzej Hajda <andrzej.hajda@intel.com>
>Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>---
>
> drivers/video/fbdev/efifb.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
>index cfa3dc0b4eee..b3d5f884c544 100644
>--- a/drivers/video/fbdev/efifb.c
>+++ b/drivers/video/fbdev/efifb.c
>@@ -259,12 +259,12 @@ static void efifb_destroy(struct fb_info *info)
> 			memunmap(info->screen_base);
> 	}
>
>-	framebuffer_release(info);
>-
> 	if (request_mem_succeeded)
> 		release_mem_region(info->apertures->ranges[0].base,
> 				   info->apertures->ranges[0].size);
> 	fb_dealloc_cmap(&info->cmap);
>+
>+	framebuffer_release(info);
> }
>
> static const struct fb_ops efifb_ops = {
>-- 
>2.35.1
>
