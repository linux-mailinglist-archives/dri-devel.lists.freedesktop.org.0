Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4114AF0D1E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A5610E314;
	Wed,  2 Jul 2025 07:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JwfaaxaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489A510E313
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:49:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD0E2460D3;
 Wed,  2 Jul 2025 07:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E25EC4CEED;
 Wed,  2 Jul 2025 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751442582;
 bh=wy550aMf/ggOmgv9shdxFZ8ZWBU/2PB5ickG7CwT+gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwfaaxaVFOEG5TmQSld/9GytBDSDU8SMAbd3HXEQ0LcElKxFWMH1doHgOPDF6y6pj
 1TTujYFZ/6TEIgqkkW9sH6MC7Gl6igUH22GFc1lrhTWnfNJOTK25PzXVx++MjGt3uA
 hJJ5lK6VdfuVQmzxOZrrrdukpJsTGannISNyIzO8=
Date: Wed, 2 Jul 2025 09:49:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v5] drm/vgem/vgem_drv convert to use faux_device
Message-ID: <2025070231-prism-unlatch-e99e@gregkh>
References: <2025070114-iron-shiny-b92e@gregkh>
 <42d0f819-87ae-44d0-a9c5-ae4fa91b1227@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42d0f819-87ae-44d0-a9c5-ae4fa91b1227@suse.de>
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

On Wed, Jul 02, 2025 at 09:36:40AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 01.07.25 um 12:51 schrieb Greg Kroah-Hartman:
> > The vgem driver does not need to create a platform device, as there is
> > no real platform resources associated it,  it only did so because it was
> > simple to do that in order to get a device to use for resource
> > management of drm resources.  Change the driver to use the faux device
> > instead as this is NOT a real platform device.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v5: - rebased against 6.16-rc4 and resent as it seems to have been lost
> 
> Not lost, but thanks for the update. This patch and the one for vkms depend
> on "drm/gem-shmem: Do not map s/g table by default". [1] It'll land soon and
> the faux_device updates soon after.
> 
> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/series/150968/

Great, thanks for letting me know.

greg k-h
