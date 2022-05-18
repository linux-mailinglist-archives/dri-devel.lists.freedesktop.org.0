Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1652C297
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 20:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415B10E4B8;
	Wed, 18 May 2022 18:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C675E10E4B8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 18:51:59 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0E1E01F900;
 Wed, 18 May 2022 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652899918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSNUzJxKkk6nSD1uYTkzh+6avrgkicsBUIFVHExJeX8=;
 b=vebJZ0MGi+IoMTE31S8Dq9G6sII+N9X5nBhJS9Ta97YV9otdzGs5bUNf3mji6kGs5aXbV2
 SCrp6GknWiGxPPMKCVAaSVQvEiGdoGfgDTNhokUn+0g2Xe/emg5kstrqyBuFIwDGQRGMBi
 G1MQNvs47U2dHDBECYCu5/Lssa19HTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652899918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSNUzJxKkk6nSD1uYTkzh+6avrgkicsBUIFVHExJeX8=;
 b=8HQ6aHtRY73/FP7pF9MCZzot27QGE/kAHvc6f+zaTin1t0xFWYzczbrcjTYaG7gAYOuTXb
 ImdTkJ4RbaIjdbCQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C5CC22C141;
 Wed, 18 May 2022 18:51:57 +0000 (UTC)
Date: Wed, 18 May 2022 20:51:56 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
Message-ID: <20220518185156.GJ163591@kunlun.suse.cz>
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518183006.14548-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, mpe@ellerman.id.au,
 deller@gmx.de, linuxppc-dev@lists.ozlabs.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Wed, May 18, 2022 at 08:30:06PM +0200, Thomas Zimmermann wrote:
> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
> 
> Similar functionality is already provided by fbdev's offb driver,
> which is insufficient for modern userspace. The old driver includes
> support for BootX device tree, which can be found on old 32-bit
> PowerPC Macintosh systems. If these are still in use, the
> functionality can be added to ofdrm or implemented in a new
> driver. As with simepldrm, the fbdev driver cannot be selected is
> ofdrm is already enabled.
> 
> Two noteable points about the driver:
> 
>  * Reading the framebuffer aperture from the device tree is not
> reliable on all systems. Ofdrm takes the heuristics and a comment
> from offb to pick the correct range.
> 
>  * No resource management may be tied to the underlying PCI device.
> Otherwise the handover to the native driver will fail with a resource
> conflict. PCI management is therefore done as part of the platform
> device's cleanup.
> 
> The driver has been tested on qemu's ppc64le emulation. The device
> hand-over has been tested with bochs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/gpu/drm/tiny/Kconfig  |  12 +
>  drivers/gpu/drm/tiny/Makefile |   1 +
>  drivers/gpu/drm/tiny/ofdrm.c  | 748 ++++++++++++++++++++++++++++++++++
>  drivers/video/fbdev/Kconfig   |   1 +
>  5 files changed, 763 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43d833273ae9..090cbe1aa5e3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6395,6 +6395,7 @@ L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/drm_aperture.c
> +F:	drivers/gpu/drm/tiny/ofdrm.c
>  F:	drivers/gpu/drm/tiny/simpledrm.c
>  F:	include/drm/drm_aperture.h
>  
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 627d637a1e7e..0bc54af42e7f 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -51,6 +51,18 @@ config DRM_GM12U320
>  	 This is a KMS driver for projectors which use the GM12U320 chipset
>  	 for video transfer over USB2/3, such as the Acer C120 mini projector.
>  
> +config DRM_OFDRM
> +	tristate "Open Firmware display driver"
> +	depends on DRM && MMU && PPC

Does this build with !PCI?

The driver uses some PCI functions, so it might possibly break with
randconfig. I don't think there are practical !PCI PPC configurations.

Thanks

Michal
