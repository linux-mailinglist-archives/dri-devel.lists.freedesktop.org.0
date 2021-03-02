Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84C329892
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 10:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691FA89F47;
	Tue,  2 Mar 2021 09:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A726B89F47
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 09:56:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBA8764E56;
 Tue,  2 Mar 2021 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614678980;
 bh=bG3XD02DL4MaCW2XI6leEjvU1W3wPrk7Lzd9ASOAZvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gE5a2K0/Ko05cgGWq2RR9ypqqxknulsWNKb1MLRxvN+hrzShatu8xOAwBwgsS53rG
 AWg0XvjGWV9Nem+Ic7WCw91l9mUafFFhnoW4ro82ENO6sy8Pi/Zd+3s4lfO7Xo4vVY
 g7uVObNi/MindPLHLebzrIVSiCLxLy9O9D/9S6Z4=
Date: Tue, 2 Mar 2021 10:56:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YD4Lwbcb9Q5Wv/Xc@kroah.com>
References: <20210301093127.11028-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301093127.11028-1-tzimmermann@suse.de>
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
Cc: Pavel Machek <pavel@ucw.cz>, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 hdegoede@redhat.com, stern@rowland.harvard.edu,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 10:31:27AM +0100, Thomas Zimmermann wrote:
> USB devices cannot perform DMA and hence have no dma_mask set in their
> device structure. Therefore importing dmabuf into a USB-based driver
> fails, which breaks joining and mirroring of display in X11.
> =

> For USB devices, pick the associated USB controller as attachment device.
> This allows the DRM import helpers to perform the DMA setup. If the DMA
> controller does not support DMA transfers, we're out of luck and cannot
> import. Our current USB-based DRM drivers don't use DMA, so the actual
> DMA device is not important.
> =

> Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> instance of struct drm_driver.
> =

> Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> =

> v6:
> 	* implement workaround in DRM drivers and hold reference to
> 	  DMA device while USB device is in use
> 	* remove dev_is_usb() (Greg)
> 	* collapse USB helper into usb_intf_get_dma_device() (Alan)
> 	* integrate Daniel's TODO statement (Daniel)
> 	* fix typos (Greg)
> v5:
> 	* provide a helper for USB interfaces (Alan)
> 	* add FIXME item to documentation and TODO list (Daniel)
> v4:
> 	* implement workaround with USB helper functions (Greg)
> 	* use struct usb_device->bus->sysdev as DMA device (Takashi)
> v3:
> 	* drop gem_create_object
> 	* use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> v2:
> 	* move fix to importer side (Christian, Daniel)
> 	* update SHMEM and CMA helpers for new PRIME callbacks
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> Tested-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <stable@vger.kernel.org> # v5.10+
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
