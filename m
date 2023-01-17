Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FD66DA5B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 10:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37810E0BC;
	Tue, 17 Jan 2023 09:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Tue, 17 Jan 2023 09:54:53 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA01210E030;
 Tue, 17 Jan 2023 09:54:53 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 0E2BE28088D7A;
 Tue, 17 Jan 2023 10:44:51 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id EBCD8371AE; Tue, 17 Jan 2023 10:44:40 +0100 (CET)
Date: Tue, 17 Jan 2023 10:44:40 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] drm: Call vga_switcheroo_process_delayed_switch()
 in drm_lastclose
Message-ID: <20230117094440.GA30914@wunner.de>
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112201156.26849-4-tzimmermann@suse.de>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 kherbst@redhat.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 jose.souza@intel.com, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 09:11:56PM +0100, Thomas Zimmermann wrote:
> Several lastclose helpers call vga_switcheroo_process_delayed_switch().
> It's better to call the helper from drm_lastclose() after the kernel
> client's screen has been restored. This way, all drivers can benefit
> without having to implement their own lastclose helper. For drivers
> without vga-switcheroo, vga_switcheroo_process_delayed_switch() does
> nothing.
[...]
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
>  		drm_legacy_dev_reinit(dev);
>  
>  	drm_client_dev_restore(dev);
> +
> +	vga_switcheroo_process_delayed_switch();
>  }

Hm, this looks like a case of midlayer fallacy:

https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html

It is a departure from the opt-in library approach we've had so far.

For switcheroo-aware EDID retrieval, there's a drm_get_edid_switcheroo()
helper.  How about introducing a switcheroo-aware lastclose helper which
drivers can reference?

Thanks,

Lukas
