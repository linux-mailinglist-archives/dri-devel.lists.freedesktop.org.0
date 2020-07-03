Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E2213466
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 08:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B593E6E8C9;
	Fri,  3 Jul 2020 06:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8F6E8C9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 06:44:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2CEBA2002A;
 Fri,  3 Jul 2020 08:44:46 +0200 (CEST)
Date: Fri, 3 Jul 2020 08:44:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/14] drm/ast: Managed modesetting
Message-ID: <20200703064444.GB1690637@ravnborg.org>
References: <20200702115029.5281-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=umm4-mi5Eqtp8Z9NpjwA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Thu, Jul 02, 2020 at 01:50:15PM +0200, Thomas Zimmermann wrote:
> This is the first patchset to convert ast to use managed interfaces. These
> patches address modesetting. I expect that there will be at least one more
> set of patches for memory management and one for device structures.
> 
> Patches 1 to 11 tackle HW cursor handling. The overall point is to get
> cursor support out of the plane functions and put the code into helpers.
> There are quite a few improvements that make cursors easier and faster to
> use. Patch 10 converts cursors to managed release.
> 
> With cursors out of the way, modesetting initialization is much more
> simple. Patches 12 to 14 put all related code next to each other and
> switch to managed initialization.
> 
> The patchset was tested on AST2100 hardware.
> 
> v2:
> 	* use to_ast_private() instead of
> 	  struct drm_device.dev_private (Sam)
> 
> Thomas Zimmermann (14):
>   drm/ast: Move cursor functions to ast_cursor.c
>   drm/ast: Pass struct ast_private instance to cursor init/fini
>     functions
>   drm/ast: Move cursor fb pinning and mapping into helper
>   drm/ast: Update cursor image and checksum from same function
>   drm/ast: Move cursor pageflip into helper
>   drm/ast: Replace ast_cursor_move() with ast_cursor_show()
>   drm/ast: Don't enable HW cursors twice during atomic update
>   drm/ast: Add helper to hide cursor
>   drm/ast: Keep cursor HW BOs mapped
>   drm/ast: Managed cursor release
>   drm/ast: Init cursors before creating modesetting structures
>   drm/ast: Replace struct ast_crtc with struct drm_crtc
>   drm/ast: Use managed mode-config init
>   drm/ast: Initialize mode setting in ast_mode_config_init()
I have browsed the patch-set. Nothing jumped at me but then
most of the bo handling I do not understand.

Feel free to add:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
to all patches.

But I hope someone else that knows this better could jump in and
take a look too.

	Sam

> 
>  drivers/gpu/drm/ast/Makefile     |   3 +-
>  drivers/gpu/drm/ast/ast_cursor.c | 289 +++++++++++++++++++++++++++
>  drivers/gpu/drm/ast/ast_drv.h    |  19 +-
>  drivers/gpu/drm/ast/ast_main.c   |  35 +---
>  drivers/gpu/drm/ast/ast_mode.c   | 322 ++++++-------------------------
>  5 files changed, 359 insertions(+), 309 deletions(-)
>  create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
> 
> --
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
