Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB9231153
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 20:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50C6E226;
	Tue, 28 Jul 2020 18:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAC36E226
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 18:10:17 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8E31B20032;
 Tue, 28 Jul 2020 20:10:15 +0200 (CEST)
Date: Tue, 28 Jul 2020 20:10:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/13] drm/ast: Convert to managed initialization
Message-ID: <20200728181014.GE1114934@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=eUHSAhIiOE0y8qXsivgA:9 a=X5xXI9eioqIVaYD0:21 a=wMNijA9QX2g1taFi:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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

On Tue, Jul 28, 2020 at 09:44:12AM +0200, Thomas Zimmermann wrote:
> This is the final patchset for converting ast to managed initialization.
> 
> Patches #1 to #4 address I2C helpers. The structures are being stored
> in struct ast_connector. The initialization and cleanups is being converted
> to managed release helpers.
> 
> Patches #5 to #10 address modesetting and device structures. All are
> being embedded into struct ast_private. With struct ast_private being
> a subclass of struct drm_device, patch #10 switches ast to DRM's managed-
> allocation helpers.
> 
> Patches #11 and #12 address firmware memory that ast allocates
> internally.
> 
> Finally, patch #13 removes ast's destroy function in favor of managed
> release helpers.
> 
> Tested on AST 2100 HW.
> 
> Thomas Zimmermann (13):
>   drm/ast: Move I2C code within ast_mode.c
>   drm/ast: Test if I2C support has been initialized
>   drm/ast: Embed I2C fields in struct ast_connector
>   drm/ast: Managed release of I2C adapter
>   drm/ast: Embed CRTC and connector in struct ast_private
>   drm/ast: Separate DRM driver from PCI code
>   drm/ast: Replace driver load/unload functions with device
>     create/destroy
>   drm/ast: Replace struct_drm_device.dev_private with to_ast_private()
>   drm/ast: Don't use ast->dev if dev is available
>   drm/ast: Embed struct drm_device in struct ast_private
>   drm/ast: Managed release of ast firmware
>   drm/ast: Manage release of firmware backup memory
>   drm/ast: Managed device release

A few nits posted to a few patches.
Patch 1-11 are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I did not look at 12 and did not follow all the changes in 13.
Not that I found 13 faulty - just lost track and -ENOTIME

	Sam

> 
>  drivers/gpu/drm/ast/ast_cursor.c |   8 +-
>  drivers/gpu/drm/ast/ast_dp501.c  |  23 ++-
>  drivers/gpu/drm/ast/ast_drv.c    |  82 ++++----
>  drivers/gpu/drm/ast/ast_drv.h    |  43 +++--
>  drivers/gpu/drm/ast/ast_main.c   |  74 ++++----
>  drivers/gpu/drm/ast/ast_mm.c     |   2 +-
>  drivers/gpu/drm/ast/ast_mode.c   | 310 ++++++++++++++-----------------
>  drivers/gpu/drm/ast/ast_post.c   |   6 +-
>  8 files changed, 263 insertions(+), 285 deletions(-)
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
