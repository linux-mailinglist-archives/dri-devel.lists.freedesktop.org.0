Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19965A45BD0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 11:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276D10E8C7;
	Wed, 26 Feb 2025 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x/z/PNKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8010E8B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 10:30:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 52D386129C;
 Wed, 26 Feb 2025 10:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C58C4CEE2;
 Wed, 26 Feb 2025 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740565855;
 bh=kBUtFhM8QF9lXl5OpGbCyIrYvEiAU3LRgYh6moTbcNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x/z/PNKyqA4PfaRNvSey27ZTn7J05bWCh1y6AuSHXaKbsuIZbgCgF5SfXl9GxP2Z7
 065ngG6haLk6ln7TkkSlWws7pfkhzxlXfPzhpjuytZpJR0F//RpCQLnhkfNJrpJhQK
 HRhuiH2KFKxSftKP77aaZn3LBM5y0sTRshzg8quY=
Date: Wed, 26 Feb 2025 11:07:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
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
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <2025022643-scouting-petticoat-492b@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021029-snout-swivel-9a45@gregkh>
 <Z6oPNmRo4XQQVEI8@louis-chauvet-laptop>
 <f1ea30fe-8cb8-41fd-bc85-d511c800e594@suse.de>
 <49cd8502-f11e-4ade-a3a0-b16ce0c6282f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49cd8502-f11e-4ade-a3a0-b16ce0c6282f@bootlin.com>
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

On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> 
> 
> Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > Hi
> > 
> > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > The vkms driver does not need to create a platform device, as there is
> > > > no real platform resources associated it,  it only did so because it was
> > > > simple to do that in order to get a device to use for resource
> > > > management of drm resources.  Change the driver to use the faux device
> > > > instead as this is NOT a real platform device.
> > > > 
> > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > 
> > > Thanks for the modification, it seems to work.
> > 
> > Should this patch be merged through DRM trees? drm-misc-next is at
> > v6.14-rc4 and has struct faux_device.
> 
> Hi,
> 
> I was not aware the faux-device was merged, as it is a new feature, I
> expected it to reach drm-misc-next on 6.15-rc1.

I added it to Linus's tree just so that DRM could get these changes into
their tree now :)

> I plan to merge [1] today/tomorrow (well tested with platform_device), and
> then I will submit an updated version of this patch (only trivial conflicts,
> but never tested with multiple VKMS devices).
> 
> [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/

Great, thanks!

greg k-h
