Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D203A5D5FC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 07:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A451410E6D6;
	Wed, 12 Mar 2025 06:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hys5tl6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4C10E6D6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 06:22:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0312A46CD1;
 Wed, 12 Mar 2025 06:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C62C4CEE3;
 Wed, 12 Mar 2025 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1741760530;
 bh=FqdJefIg8ikvVSCYyqCjDW5HTyvdKG0E9EFlXvUwRD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hys5tl6TcN3NXFZTd/T2qyA4+szlFs4nh+KWQwtI02j65jMQplmzT9Ej3ybQVZxjT
 Txv1gVDjBFi0Yw9OKhW/Lv4xOR2YYKlr02X0Yjdo4isAUy5yRfI3j3ncDYdKB3fClr
 ZWGbCKGO8cUHA4THmAWk1BCaBx65TMjHBiDDQSUI=
Date: Wed, 12 Mar 2025 07:22:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Jonathan.Cameron@huawei.com, airlied@gmail.com,
 aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
 bhelgaas@google.com, broonie@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
 lukas@wunner.de, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, simona.vetter@ffwll.ch,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <2025031218-oxidize-backing-e278@gregkh>
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311172054.2903-1-jose.exposito89@gmail.com>
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

On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
> Hi everyone,
> 
> > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > 
> > > 
> > > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > > Hi
> > > > 
> > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > simple to do that in order to get a device to use for resource
> > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > instead as this is NOT a real platform device.
> > > > > > 
> > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > 
> > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > 
> > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > 
> > > > > Thanks for the modification, it seems to work.
> > > > 
> > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > v6.14-rc4 and has struct faux_device.
> > > 
> > > Hi,
> > > 
> > > I was not aware the faux-device was merged, as it is a new feature, I
> > > expected it to reach drm-misc-next on 6.15-rc1.
> > 
> > I added it to Linus's tree just so that DRM could get these changes into
> > their tree now :)
> > 
> > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > then I will submit an updated version of this patch (only trivial conflicts,
> > > but never tested with multiple VKMS devices).
> > > 
> > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > 
> > Great, thanks!
> > 
> > greg k-h
> 
> Testing this patch again as part of some IGT tests I'm working on,
> I noticed that, applying this patch on top of the latest drm-misc-next
> triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> drm_gem_get_pages():
> 
>     if (WARN_ON(!obj->filp))
>             return ERR_PTR(-EINVAL);

I don't see how the faux bus change would have anything to do with a
filp as that's not related as far as I can tell.  But I don't know the
drm layer at all, where does that filp come from?

thanks,

greg k-h
