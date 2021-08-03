Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4A3DF262
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33209883A9;
	Tue,  3 Aug 2021 16:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493436E88A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 16:21:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id dad9e189-f476-11eb-9082-0050568c148b;
 Tue, 03 Aug 2021 16:21:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5F66C194B70;
 Tue,  3 Aug 2021 18:21:45 +0200 (CEST)
Date: Tue, 3 Aug 2021 18:21:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 noralf@tronnes.org, drawat.floss@gmail.com, kraxel@redhat.com,
 hdegoede@redhat.com, sean@poorly.run, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 00/11] Provide offset-adjusted framebuffer mappings
Message-ID: <YQls/oxklkZWqEnD@ravnborg.org>
References: <20210803125928.27780-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803125928.27780-1-tzimmermann@suse.de>
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

Hi Thomas,

On Tue, Aug 03, 2021 at 02:59:17PM +0200, Thomas Zimmermann wrote:
> A framebuffer's offsets field might be non-zero to make the BO data
> start at the specified offset within the BO's memory. Handle this
> case in drm_gem_fb_vmap() and update all callers. So far, many drivers
> ignore the offsets, which can lead to visual artifacts.
> 
> Patch 1 adds an optional argument to drm_gem_fb_vmap() to return the
> offset-adjusted data address for use with shadow-buffered planes.
> 
> Patches 3 and 11 convert gud and vkms, which are the other callers of
> drm_gem_fb_vmap(). For gud, it's just a cleanup. Vkms will handle the
> framebuffer offsets correctly for its input and output framebuffers.
> 
> The other patches convert users of shadow-buffered planes to use the
> data address. After conversion, each driver will use the correct data
> for non-zero offsets.
> 

>   drm/ast: Use offset-adjusted shadow-plane mappings
>   drm/gud: Get offset-adjusted mapping from drm_gem_fb_vmap()
>   drm/hyperv: Use offset-adjusted shadow-plane mappings
>   drm/mgag200: Use offset-adjusted shadow-plane mappings
>   drm/cirrus: Use offset-adjusted shadow-plane mappings
>   drm/gm12u320: Use offset-adjusted shadow-plane mappings
>   drm/simpledrm: Use offset-adjusted shadow-plane mapping
>   drm/udl: Use offset-adjusted shadow-plane mapping
>   drm/vbox: Use offset-adjusted shadow-plane mappings
>   drm/vkms: Use offset-adjusted shadow-plane mappings and output
Everything looked good while reading through the patches.
I cannot say if everything was properly converted but the patches looked
good.

So they are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

There was a few TODO comments visible aboput using the mapping api
properly. I assume this is coming in a later patch set..

	Sam
