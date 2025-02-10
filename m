Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DDA2F032
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B7410E19D;
	Mon, 10 Feb 2025 14:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zIMpPwX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF5210E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:49:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73CE1A416C1;
 Mon, 10 Feb 2025 14:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1086AC4CED1;
 Mon, 10 Feb 2025 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739198963;
 bh=/6RA5f0SloJlgfutepE42BrzZDcaWwvdcr/ZGQtyrB0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=zIMpPwX1lKzONYFv2pSy7Iw90SJdqC0w25m3jqQpQVX/0WHKOjpYB2M6J31nJSf9s
 dwL57MePPnZZj0zib017epaZ2ywcUsaCrJWOE+Ah8qDU7QF64MyHJTWFL98LB1gLwZ
 3mHo4k9id+g4ttzls6qiyI0ILYKQA2LPDrddCs9Q=
Date: Mon, 10 Feb 2025 15:49:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Robin Murphy <robin.murphy@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <2025021012-outback-greeter-d65c@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021029-snout-swivel-9a45@gregkh>
 <Z6oPNmRo4XQQVEI8@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6oPNmRo4XQQVEI8@louis-chauvet-laptop>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2025 at 03:37:42PM +0100, Louis Chauvet wrote:
> On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > The vkms driver does not need to create a platform device, as there is
> > no real platform resources associated it,  it only did so because it was
> > simple to do that in order to get a device to use for resource
> > management of drm resources.  Change the driver to use the faux device
> > instead as this is NOT a real platform device.
> > 
> > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Thanks for the modification, it seems to work.

Great, thanks for testing!

greg k-h
