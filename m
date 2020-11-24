Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD72C338B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 22:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E18789F71;
	Tue, 24 Nov 2020 21:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD7F89ECB;
 Tue, 24 Nov 2020 21:49:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C44342001F;
 Tue, 24 Nov 2020 22:49:42 +0100 (CET)
Date: Tue, 24 Nov 2020 22:49:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/15] drm: Move struct drm_device.pdev to legacy
Message-ID: <20201124214941.GD93095@ravnborg.org>
References: <20201124113824.19994-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124113824.19994-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=4J4RqmOIUAWq8pQtltYA:9
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

Nice clean-up series - quite an effort to move one member to deprecated!

I have read through most of the patches. I left a few notes in my
replies but nothing buggy. Just nitpicks.


On Tue, Nov 24, 2020 at 12:38:09PM +0100, Thomas Zimmermann wrote:
> The pdev field in struct drm_device points to a PCI device structure and
> goes back to UMS-only days when all DRM drivers where for PCI devices.
> Meanwhile we also support USB, SPI and platform devices. Each of those
> uses the generic device stored in struct drm_device.dev.
> 
> To reduce duplications and remove the special case of PCI, this patchset
> converts all modesetting drivers from pdev to dev and makes pdev a field
> for legacy UMS drivers.
> 
> For PCI devices, the pointer in struct drm_device.dev can be upcasted to
> struct pci_device; or tested for PCI with dev_is_pci(). In several places
> the code can use the dev field directly.
> 
> After converting all drivers and the DRM core, the pdev fields becomes
> only relevant for legacy drivers. In a later patchset, we may want to
> convert these as well and remove pdev entirely.
> 
> The patchset touches many files, but the individual changes are mostly
> trivial. I suggest to merge each driver's patch through the respective
> tree and later the rest through drm-misc-next.
> 
> Thomas Zimmermann (15):
>   drm/amdgpu: Remove references to struct drm_device.pdev
>   drm/ast: Remove references to struct drm_device.pdev
>   drm/bochs: Remove references to struct drm_device.pdev
>   drm/cirrus: Remove references to struct drm_device.pdev
>   drm/gma500: Remove references to struct drm_device.pdev
>   drm/hibmc: Remove references to struct drm_device.pdev
>   drm/mgag200: Remove references to struct drm_device.pdev
>   drm/qxl: Remove references to struct drm_device.pdev
>   drm/vboxvideo: Remove references to struct drm_device.pdev
>   drm/virtgpu: Remove references to struct drm_device.pdev
>   drm/vmwgfx: Remove references to struct drm_device.pdev
>   drm: Upcast struct drm_device.dev to struct pci_device; replace pdev
All above are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

>   drm/nouveau: Remove references to struct drm_device.pdev
I lost my confidence in my reading of this code.

>   drm/i915: Remove references to struct drm_device.pdev
>   drm/radeon: Remove references to struct drm_device.pdev
I did not look at these at all. I hope someone else find time to do so.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
