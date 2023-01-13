Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B886669B70
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E7210EA17;
	Fri, 13 Jan 2023 15:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926E910EA17
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=9nxrAsQY2PeQ4MXXNC3R0wE1duNvKF2P8eV7y4rujYQ=;
 b=o0a8G7JSJ9fG/2mIDU1uY5Eo6rlrgUYHr3yGYNmOWgHj65KESRjS6s48gMqbRW/OTxsGu+ieWO16r
 r8twAlWDca7XQONdqn9rYarbtz6vBWkgWX5bfS53I+X7Jpo3GJSkV3JSwhHsXv7xrr5M2C0oimzRr/
 TPmoMICvDRMW9Y3TN/1JRNzs6t8TbURPgPVj6WE3jLyp9SmjRL1XbEWo5CLl0Gq+FVp4G+OBKUQvIT
 9695n4Bjx96J+tyzNRLo5LeGwWt2GCMQYXXeuSWgGsqBh0+EaziDXBM2Yt4Vgv3BRbQqGdD2DbozZo
 ZH4xylJAcn5J97X9uU5mv+37irL87Mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=9nxrAsQY2PeQ4MXXNC3R0wE1duNvKF2P8eV7y4rujYQ=;
 b=Ha7donqEXTQHNG4hyCTSJ3Tuoq8AJSUpuNofkJhwnvnzpAx9+WMt0D0d9aKNPELTplQjkcBI4xsFc
 Yhmq8izBw==
X-HalOne-ID: 385d7175-9354-11ed-b099-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 385d7175-9354-11ed-b099-cde5ad41a1dd;
 Fri, 13 Jan 2023 15:09:07 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:09:05 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/10] drm: Include <linux/backlight.h> where needed
Message-ID: <Y8F0EW3rVPiuzciK@ravnborg.org>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111130206.29974-2-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,
On Wed, Jan 11, 2023 at 02:01:57PM +0100, Thomas Zimmermann wrote:
> Include <linux/backlight.h> in source files that need it. Some of
> DRM's source code gets the backlight header via drm_crtc_helper.h
> and <linux/fb.h>, which can leed to unnecessary recompilation. If
> possible, do not include drm_crtc_helper.h any longer.
Are you planning a clean-up of drm_crtc_helper.h later?
With a handful of forward it could losse all includes.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Christian König <christian.koenig@amd.com> # amd
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
>  drivers/gpu/drm/gma500/backlight.c                | 2 ++
>  drivers/gpu/drm/radeon/radeon_acpi.c              | 2 +-
>  4 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 57b5e11446c6..f29c1d0ad4c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/pci.h>
>  #include <linux/acpi.h>
> +#include <linux/backlight.h>
>  #include <linux/slab.h>
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
> @@ -31,7 +32,6 @@
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include "amdgpu.h"
>  #include "amdgpu_pm.h"
>  #include "amdgpu_display.h"
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1b7f20a9d4ae..55a845eb0c6d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -67,6 +67,7 @@
>  #include "ivsrcid/ivsrcid_vislands30.h"
>  
>  #include "i2caux_interface.h"
> +#include <linux/backlight.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/types.h>
> diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
> index 577a4987b193..8711a7a5b8da 100644
> --- a/drivers/gpu/drm/gma500/backlight.c
> +++ b/drivers/gpu/drm/gma500/backlight.c
> @@ -7,6 +7,8 @@
>   * Authors: Eric Knopp
>   */
>  
> +#include <linux/backlight.h>
> +
>  #include <acpi/video.h>
>  
>  #include "psb_drv.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
> index b603c0b77075..5771d1fcb073 100644
> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> @@ -22,6 +22,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/backlight.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/power_supply.h>
> @@ -30,7 +31,6 @@
>  #include <acpi/acpi_bus.h>
>  #include <acpi/video.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "atom.h"
> -- 
> 2.39.0
