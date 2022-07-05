Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F776568022
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 09:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D16112382;
	Wed,  6 Jul 2022 07:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91CA14B8BF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 16:03:21 +0000 (UTC)
Received: from arch-x1c3 (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net
 [82.24.248.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EDBAE6601638;
 Tue,  5 Jul 2022 17:03:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657037000;
 bh=PuRJwgghVrWRSi/gz8l232C34f7rDIf/ZjkluxP+eIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEjgCRzIRvo/SASMqeO8WsKm+7F5oUsdSCkNRG4IVKyViQojd/IVCpa3j+mgQwjFy
 +nVxTkIJN0x5pF2HDziGELT5nZnQMTa0tn4Kw1tGzc3Q5RsdPO6W3Hdbuf6NmGM2Zs
 G4M8sky9c1kPnwfzELGHUss/BFz/cn4Jx99+y/SuK7z5m7a6SNAtK/o1t+n/7Z3+Ah
 2Jt55TVfcCFZZ9Ixn9FkQ/9gco+pQl6g+oppgXtjsv9jcgX/cD4BhlsBxWwCeucd3u
 MJmGTWvrVXSKZTWfICAFNzNn0nd5TzSE2WAK6H9n7LGJdOtgDeI9IQTWl1BhBxtEmp
 H601x76Bo6RJQ==
Date: Tue, 5 Jul 2022 17:03:16 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Message-ID: <YsRgxDYyU/jpF1MV@arch-x1c3>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
X-Mailman-Approved-At: Wed, 06 Jul 2022 07:41:40 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/07/05, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Also note that pci is not the only virtio transport we have.
> > 
> > The VirtIO indeed has other transports, but only PCI is really supported
> > in case of the VirtIO-GPU in kernel and in Qemu/crosvm, AFAICT. Hence
> > only the PCI transport was tested.
> 
> qemu -M microvm \
>   -global virtio-mmio.force-legacy=false \
>   -device virtio-gpu-device
> 
> Gives you a functional virtio-gpu device on virtio-mmio.
> 
> aarch64 virt machines support both pci and mmio too.
> s390x has virtio-gpu-ccw ...
> 

As the last person who was there - the problem is indeed when using
virtio on top of mmio. If that's no longer supported by the kernel then
the hacky code-path can be dropped.

Even in that case, I would suggest keeping it a separate commit.

HTH
Emil
