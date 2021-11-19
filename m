Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB4456DF8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 12:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8886F6E03C;
	Fri, 19 Nov 2021 11:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74FB6E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 11:08:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6302260F57;
 Fri, 19 Nov 2021 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637320132;
 bh=MGQP/hrtX2By1G+IloWa4tkqTreG55JKH01OWy6ztxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jl02+0R1AL8nkIL4t2IOsnf3pKd35+snNFNW2PajI7tCbE2GtwAF8mOGDoy9o6IcF
 eIxCm1uaMy9pBDDEgvhcVNZyvcxphmaoHoDXZubLU7TWmEuVq10ru6ZgAbvfb5qlAX
 xZF937C0tKlKh6Ig9DI7PajMtcd1ianj0FfwjXCs=
Date: Fri, 19 Nov 2021 12:08:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 3/6] drm: Move nomodeset kernel parameter to the DRM
 subsystem
Message-ID: <YZeFwcuP1cu9MOZu@kroah.com>
References: <20211112133230.1595307-1-javierm@redhat.com>
 <20211112133230.1595307-4-javierm@redhat.com>
 <b63cbd1d-4669-422d-0908-0eec1981caa6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b63cbd1d-4669-422d-0908-0eec1981caa6@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 11:20:13AM +0100, Javier Martinez Canillas wrote:
> [ adding gregkh to Cc list for drivers/video/console ]
> 
> On 11/12/21 14:32, Javier Martinez Canillas wrote:
> > The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
> > but the exported vgacon_text_force() symbol is only used by DRM drivers.
> > 
> > It makes much more sense for the parameter logic to be in the subsystem
> > of the drivers that are making use of it.
> > 
> > Let's move the vgacon_text_force() function and related logic to the DRM
> > subsystem. While doing that, rename it to drm_firmware_drivers_only() and
> > make it return true if "nomodeset" was used and false otherwise. This is
> > a better description of the condition that the drivers are testing for.
> > 
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > ---
> >
> 
> Greg, could I please get your ack for this patch ?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
