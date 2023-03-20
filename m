Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0246C08BD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 02:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6B810E169;
	Mon, 20 Mar 2023 01:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 623 seconds by postgrey-1.36 at gabe;
 Mon, 20 Mar 2023 01:57:39 UTC
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867F210E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 01:57:39 +0000 (UTC)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by lithium.sammserver.com (Postfix) with ESMTPS id 2F39031181CC;
 Mon, 20 Mar 2023 02:47:14 +0100 (CET)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
 by mail.sammserver.com (Postfix) with ESMTP id CD23635E3C;
 Mon, 20 Mar 2023 02:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
 t=1679276833; bh=pC4qvrrK/n9fka/sqI1Yp3RNW0hirkEvh7yvqE7rqXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hf+5u2neIxkqhJimC7+VGAmEA0gmSS8+wRYjRLD9BP/IPlSJxpTxfm51f/UShFr/5
 Ru5sw9BozbNptmpJ0PSWO69lqI/QEssU8jgn3NEZlJPg1Ir9mBQSbaQXQB4vq/vr3Z
 ZzrwbcI9LgqIK/7suVlk0rGRW9KRG7kRJz8ScxOs=
MIME-Version: 1.0
Date: Mon, 20 Mar 2023 01:47:13 +0000
From: =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
In-Reply-To: <20220718072322.8927-8-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
 <20220718072322.8927-8-tzimmermann@suse.de>
Message-ID: <9f682c15a5484b4a94f63e20d41f67d0@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 maxime@cerno.tech, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
> index f42a0d8bc211..101e13c2cf41 100644
> --- a/drivers/video/aperture.c
> +++ b/drivers/video/aperture.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/sysfb.h>
>  #include <linux/types.h>
>  #include <linux/vgaarb.h>
> 
> @@ -286,7 +287,20 @@ int 
> aperture_remove_conflicting_devices(resource_size_t base, 
> resource_size_t si
>  #if IS_REACHABLE(CONFIG_FB)
>  	struct apertures_struct *a;
>  	int ret;
> +#endif
> +
> +	/*
> +	 * If a driver asked to unregister a platform device registered by
> +	 * sysfb, then can be assumed that this is a driver for a display
> +	 * that is set up by the system firmware and has a generic driver.
> +	 *
> +	 * Drivers for devices that don't have a generic driver will never
> +	 * ask for this, so let's assume that a real driver for the display
> +	 * was already probed and prevent sysfb to register devices later.
> +	 */
> +	sysfb_disable();

This call to sysfb_disable() has been causing trouble with regard to
VFIO. VFIO has been calling aperture_remove_conflicting_pci_devices to
get rid of any console drivers (d173780620792c) using the device in
question, but now even unrelated drivers are getting killed. Example
situation:

Machine has two GPUs and uses efifb for the console. Efifb registers
with the aperture system the efi framebuffer region, which is covered
by a BAR resource of GPU 1. VFIO grabs GPU 2 and calls
aperture_remove_conflicting_pci_devices(GPU 2). GPU 2 has no overlap
with the efifb on GPU1 but the efifb is killed regardless due to
the unconditional call to sysfb_disable(). The console switches
to dummy and locks up from the user perspective.
This seems unnecessary, as the device is unrelated.

I do not quite understand the comment justifying the call.

Some discussions with workarounds:
https://old.reddit.com/r/VFIO/comments/11qei4t/framebuffer_doesnt_work_anymore_after_passthrough/
https://bbs.archlinux.org/viewtopic.php?id=280512


Thanks,
Samuel
