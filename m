Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE4551796
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D3B10EAED;
	Mon, 20 Jun 2022 11:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F1010EAED
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655725396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxxbDgrZTkB0Cli5g9D86lOEWrOx+awHmsQv7IEefYA=;
 b=RQmvL/l1/s4qIzm7aoLe5ZejUIoRyvpKNlYHDZ7wk+Ox6K0NO7+dan7yu3/WSb3cGw2t8o
 W/8lJ2wFaVtbCG1uBrPyzJxIKTvkJR3Yo90FeY7IkFStbcRmxWSCZDNX82PZXZq5snudz0
 VuRjW5Q6ZG9PQq1AToCJ0Swgp9Eh8Hg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-VVSse7XPPOGJ2WLDtRaIRw-1; Mon, 20 Jun 2022 07:43:13 -0400
X-MC-Unique: VVSse7XPPOGJ2WLDtRaIRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8248529AB3E2;
 Mon, 20 Jun 2022 11:43:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 804E01415109;
 Mon, 20 Jun 2022 11:43:09 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] Improve vfio-pci primary GPU assignment behavior
To: Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f0bdd9b1-16af-8069-65dd-9e90c8f4a6ac@redhat.com>
Date: Mon, 20 Jun 2022 13:43:08 +0200
MIME-Version: 1.0
In-Reply-To: <165541020563.1955826.16350888595945658159.stgit@omen>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/16/22 22:38, Alex Williamson wrote:
> When assigning a primary graphics device to VM through vfio-pci device
> assignment, users often prevent binding of the native PCI graphics
> driver to avoid device initialization conflicts, however firmware
> console drivers may still be attached to the device which can often be
> cumbersome to manually unbind or exclude via cmdline options.
> 
> This series proposes to move the DRM aperture helpers out to
> drivers/video/ to make it more accessible to drivers like vfio-pci,
> which have neither dependencies on DRM code nor a struct drm_driver
> to present to existing interfaces.  vfio-pci can then trivially call
> into the aperture helpers to remove conflicting drivers, rather than
> open coding it ourselves as was proposed with a new symbol export in
> v1 of this series[1].
> 
> Thanks to Thomas for splitting out the aperture code with new
> documentation.
> 
> Thomas had proposed this going through the vfio tree with appropriate
> stakeholder acks, that's fine with me, but I'm also open to it going
> through the DRM tree given that the vfio-pci-core change is even more
> trivial now and the bulk of the changes are DRM/video paths.  Thanks,
> 
> Alex
> 
> [1]https://lore.kernel.org/all/165453797543.3592816.6381793341352595461.stgit@omen/
> 
> ---
> 
> Alex Williamson (1):
>       vfio/pci: Remove console drivers
> 
> Thomas Zimmermann (1):
>       drm: Implement DRM aperture helpers under video/
> 
> 
>  Documentation/driver-api/aperture.rst |  13 +
>  Documentation/driver-api/index.rst    |   1 +
>  drivers/gpu/drm/drm_aperture.c        | 174 +------------
>  drivers/gpu/drm/tiny/Kconfig          |   1 +
>  drivers/vfio/pci/vfio_pci_core.c      |   5 +
>  drivers/video/Kconfig                 |   6 +
>  drivers/video/Makefile                |   2 +
>  drivers/video/aperture.c              | 340 ++++++++++++++++++++++++++
>  drivers/video/console/Kconfig         |   1 +
>  drivers/video/fbdev/Kconfig           |   7 +-
>  include/linux/aperture.h              |  56 +++++
>  11 files changed, 440 insertions(+), 166 deletions(-)
>  create mode 100644 Documentation/driver-api/aperture.rst
>  create mode 100644 drivers/video/aperture.c
>  create mode 100644 include/linux/aperture.h
> 

series
Tested-by: Laszlo Ersek <lersek@redhat.com>

(on top of Fedora's 5.18.5-100.fc35.x86_64)

Thanks,
Laszlo

