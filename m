Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17DAFC52E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 10:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D010E152;
	Tue,  8 Jul 2025 08:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ijbFb4kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C27B10E152
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 08:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 30CCC61471;
 Tue,  8 Jul 2025 08:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EDEC4CEED;
 Tue,  8 Jul 2025 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751962499;
 bh=SPNT0DiGS8PGJDpF7qZQ/FP0xlliIFg7X5Aiozh5qx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijbFb4kxqyuW9MMXBwMHCH70yzRdOpzwdTQHC2zTOjMjfQzGRRlHptd0me+4t3AdC
 QdEm/yLussmfkV4oouKVZlF7z86ForCJ+/FsrwxXRy9bon87hR4drefmVTAIZO1d5Z
 JR188eyBI4xWzJYSQQxlPnu080jLAL4wa2J21EHs=
Date: Tue, 8 Jul 2025 10:14:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5] drm/vgem/vgem_drv convert to use faux_device
Message-ID: <2025070850-tiger-fabric-bc74@gregkh>
References: <2025070114-iron-shiny-b92e@gregkh>
 <42d0f819-87ae-44d0-a9c5-ae4fa91b1227@suse.de>
 <2025070231-prism-unlatch-e99e@gregkh>
 <2f27e1f2-5c55-43a7-b204-575eb88da168@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f27e1f2-5c55-43a7-b204-575eb88da168@suse.de>
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

On Mon, Jul 07, 2025 at 03:52:32PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.07.25 um 09:49 schrieb Greg Kroah-Hartman:
> > On Wed, Jul 02, 2025 at 09:36:40AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 01.07.25 um 12:51 schrieb Greg Kroah-Hartman:
> > > > The vgem driver does not need to create a platform device, as there is
> > > > no real platform resources associated it,  it only did so because it was
> > > > simple to do that in order to get a device to use for resource
> > > > management of drm resources.  Change the driver to use the faux device
> > > > instead as this is NOT a real platform device.
> > > > 
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > > v5: - rebased against 6.16-rc4 and resent as it seems to have been lost
> > > Not lost, but thanks for the update. This patch and the one for vkms depend
> > > on "drm/gem-shmem: Do not map s/g table by default". [1] It'll land soon and
> > > the faux_device updates soon after.
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > [1] https://patchwork.freedesktop.org/series/150968/
> > Great, thanks for letting me know.
> 
> This patch and the one for vkms have been merged into DRM trees. They should
> show up in upstream in one of the next merge windows.

Wonderful, thank you!
