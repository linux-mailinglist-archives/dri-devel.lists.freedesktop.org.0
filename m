Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5D72E0CA8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 16:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F256A6E3F7;
	Tue, 22 Dec 2020 15:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A969C6E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608650800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M34ihcQIgl2uBvdtI2eLaQPEje/5BH6xiNgzRU0ua+I=;
 b=BmxRRQ+szp+8wfAbhPrfLM66f/a7edr6wc9an9/OvZqUySGiijgzS7C7YKpTS5V7UUSyvz
 f+quJ62V2QuaLRsbuGxX9Beg9f9nTRR4NI1i1OgVyRAWH+BDUyGbKUXIpQj6ODpXgM2kF6
 mXaNndS2zYnOvJRNSbdh9dQXy9DVMjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-VA1_zpJrM-isDBU9vNciDw-1; Tue, 22 Dec 2020 10:26:36 -0500
X-MC-Unique: VA1_zpJrM-isDBU9vNciDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D613802B40;
 Tue, 22 Dec 2020 15:26:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E28F10016F4;
 Tue, 22 Dec 2020 15:26:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2A0311AB8; Tue, 22 Dec 2020 16:26:32 +0100 (CET)
Date: Tue, 22 Dec 2020 16:26:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: gpu: drm: virtio: fix dependency of
 DRM_VIRTIO_GPU on VIRTIO
Message-ID: <20201222152632.eiyi5a46ekdafhyc@sirius.home.kraxel.org>
References: <20201204131221.2827-1-info@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204131221.2827-1-info@metux.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 02:12:21PM +0100, Enrico Weigelt, metux IT consult wrote:
> VIRTIO itself has no dependencies and therefore can easily be just
> select'ed, instead of depending on it. The current depends on causes
> any others trying to select VIRTIO to fail like this:
> 
>    drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
>    drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
>    drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
>    drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
>    drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
>    drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
>    drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
>    drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
>    drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
>    drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
>    drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
> 
> It seems that having both 'depends on' as well as 'select' on the same symbol
> sends us into big trouble, and Kconfig can't break up the circular dependency
> (note that in the tested configuration, neither I2C, FB or DRM are enabled at
> all). Perhaps we could consider this a bug in Kconfig, but the trouble can
> easily be circumvented by changing 'depends on' into 'select'.
> 
> DRM_VIRTIO_GPU also depends on VIRTIO_MENU, so even after this change, that
> option will only show up if the user already enabled virtio in the config.
> 
> This change didn't cause any changes in the .config after menuconfig run,
> so we should be completely safe here.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
