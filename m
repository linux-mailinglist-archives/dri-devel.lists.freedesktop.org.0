Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE562223CE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D44D6EC60;
	Thu, 16 Jul 2020 13:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1246EC60
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 13:24:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D2BFE804E5;
 Thu, 16 Jul 2020 15:24:34 +0200 (CEST)
Date: Thu, 16 Jul 2020 15:24:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/6] drm/ast: Managed MM
Message-ID: <20200716132433.GA1928081@ravnborg.org>
References: <20200716125353.31512-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716125353.31512-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=AkiBU_o9-egO8Ui1FuYA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Thu, Jul 16, 2020 at 02:53:47PM +0200, Thomas Zimmermann wrote:
> This is the second patchset for converting ast to managed DRM interfaces.
> This one addresses memory management. There will be another, final round
> of patches for converting DRM device structures as well.
> 
> Patch #1 introduces managed initialization for VRAM MM. Other drivers
> using the VRAM helpers should be converted to this at some point.
> 
> Patches #2 to #4 do some preparation that make ast look slightly nicer.
> 
> Patch #5 fixes a long-standing bug that I found as part of the rework.
> Posting the GPU requires information about the installed DRAM. So the DRAM
> detection has to run before the GPU-posting code. This got reversed by a
> fix in v4.11. The patch restores the original correct order of these
> operations. As the GPU is usually posted by the VGA BIOS, the problem might
> not have shown up in practice.
> 
> With all the cleanups in place, patch #6 switches memory management to
> mnaged interfaces.
> 
> Tested on AST2100 HW.
> 
> v2:
> 	* reworked managed VRAM MM; new interface name, returns errno
> 	  code, improved documentation (Sam)
> 
> Thomas Zimmermann (6):
>   drm/vram-helper: Managed vram helpers
>   drm/ast: Rename ast_ttm.c to ast_mm.c
>   drm/ast: Use managed VRAM-helper initialization
>   drm/ast: Move VRAM size detection to ast_mm.c
>   drm/ast: Initialize DRAM type before posting GPU
>   drm/ast: Use managed MM initialization

Series looks good now. All patches are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam
> 
>  drivers/gpu/drm/ast/Makefile                |  2 +-
>  drivers/gpu/drm/ast/ast_drv.h               |  2 -
>  drivers/gpu/drm/ast/ast_main.c              | 45 ++---------
>  drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} | 77 ++++++++++++++-----
>  drivers/gpu/drm/drm_gem_vram_helper.c       | 84 ++++++++++++---------
>  include/drm/drm_gem_vram_helper.h           |  3 +
>  6 files changed, 115 insertions(+), 98 deletions(-)
>  rename drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} (63%)
> 
> --
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
