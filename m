Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFE1EFBD9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FB16E92B;
	Fri,  5 Jun 2020 14:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F06E92B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 14:50:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 482EA8050B;
 Fri,  5 Jun 2020 16:50:41 +0200 (CEST)
Date: Fri, 5 Jun 2020 16:50:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/14] drm/mgag200: Use managed interfaces for auto-cleanup
Message-ID: <20200605145039.GE204352@ravnborg.org>
References: <20200605135803.19811-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=xcGwryNYkNJKYVGtu1UA:9
 a=ws7rAwUjGMybu8BN:21 a=efSoKNM3MlFlI9Vo:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Fri, Jun 05, 2020 at 03:57:49PM +0200, Thomas Zimmermann wrote:
> This patchset cleans up mgag200 device initialization, embeds the
> DRM device instance in struct mga_device and finally converts device
> initialization to managed interfaces.
> 
> Patches 1 and 2 are actually unrelated. Both remove artifacts that got
> lost from earlier patch series. We're fixing this before introducing new
> changes.
> 
> Patches 3 to 7 cleanup the memory management code and convert it to
> managed. Specifically, all MM code is being moved into a the same file.
> That makes it more obvious what's going on and will allow for further
> cleanups later on.
> 
> Modesetting is already cleaned up automatically, so there's nothing
> to do here.
> 
> With modesetting and MM done, patches 8 to 14 convert the device
> initialization to managed interfaces. The allocation is split among
> several functions and we move it to the same place in patches 11 and
> 12. That is also a good opportunity to embed the DRM device instance
> in struct mga_device in patch 13. Patch 14 adds managed release of the
> device structure.
> 
> Tested on Matrox G200SE HW.
> 
> Thomas Zimmermann (14):
>   drm/mgag200: Remove declaration of mgag200_mmap() from header file
>   drm/mgag200: Remove mgag200_cursor.c
>   drm/mgag200: Use pcim_enable_device()
>   drm/mgag200: Rename mgag200_ttm.c to mgag200_mm.c
>   drm/mgag200: Lookup VRAM PCI BAR start and length only once
>   drm/mgag200: Merge VRAM setup into MM initialization
>   drm/mgag200: Switch to managed MM
>   drm/mgag200: Separate DRM and PCI functionality from each other
>   drm/mgag200: Prefix global names in mgag200_drv.c with mgag200_
>   drm/mgag200: Move device init and cleanup to mgag200_drv.c
>   drm/mgag200: Separate device initialization into allocation
>   drm/mgag200: Allocate device structures in mgag200_driver_load()
>   drm/mgag200: Embed instance of struct drm_device in struct mga_device
>   drm/mgag200: Use managed device initialization

Looked through all patches.
A few triggered some small comments. With the comments addressed all
patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

My comments can, if any chenges are required, be addressed when
applying. No need for a next round.

	Sam



> 
>  drivers/gpu/drm/mgag200/Makefile              |   3 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c      | 319 ------------------
>  drivers/gpu/drm/mgag200/mgag200_drv.c         | 161 ++++++---
>  drivers/gpu/drm/mgag200/mgag200_drv.h         |  11 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c        | 155 ---------
>  .../mgag200/{mgag200_ttm.c => mgag200_mm.c}   |  99 ++++--
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |  12 +-
>  7 files changed, 195 insertions(+), 565 deletions(-)
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_main.c
>  rename drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} (51%)
> 
> --
> 2.26.2
> 
> 
> Thomas Zimmermann (14):
>   drm/mgag200: Remove declaration of mgag200_mmap() from header file
>   drm/mgag200: Remove mgag200_cursor.c
>   drm/mgag200: Use pcim_enable_device()
>   drm/mgag200: Rename mgag200_ttm.c to mgag200_mm.c
>   drm/mgag200: Lookup VRAM PCI BAR start and length only once
>   drm/mgag200: Merge VRAM setup into MM initialization
>   drm/mgag200: Switch to managed MM
>   drm/mgag200: Separate DRM and PCI functionality from each other
>   drm/mgag200: Prefix global names in mgag200_drv.c with mgag200_
>   drm/mgag200: Move device init and cleanup to mgag200_drv.c
>   drm/mgag200: Separate device initialization into allocation
>   drm/mgag200: Allocate device structures in mgag200_driver_load()
>   drm/mgag200: Embed instance of struct drm_device in struct mga_device
>   drm/mgag200: Use managed device initialization
> 
>  drivers/gpu/drm/mgag200/Makefile              |   3 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c      | 319 ------------------
>  drivers/gpu/drm/mgag200/mgag200_drv.c         | 161 ++++++---
>  drivers/gpu/drm/mgag200/mgag200_drv.h         |  11 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c        | 155 ---------
>  .../mgag200/{mgag200_ttm.c => mgag200_mm.c}   |  99 ++++--
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |  12 +-
>  7 files changed, 195 insertions(+), 565 deletions(-)
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_main.c
>  rename drivers/gpu/drm/mgag200/{mgag200_ttm.c => mgag200_mm.c} (51%)
> 
> --
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
