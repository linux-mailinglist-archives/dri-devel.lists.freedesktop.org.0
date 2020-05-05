Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D381C5D99
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53D189F07;
	Tue,  5 May 2020 16:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635BA89F07
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:31:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5CC90804B9;
 Tue,  5 May 2020 18:31:01 +0200 (CEST)
Date: Tue, 5 May 2020 18:30:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] drm/mgag200: Embed DRM device in struct mga_device
Message-ID: <20200505163059.GA5082@ravnborg.org>
References: <20200505095649.25814-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=rlxZBRk7VnPCS96vd50A:9 a=CjuIK1q_8ugA:10
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, May 05, 2020 at 11:56:44AM +0200, Thomas Zimmermann wrote:
> After receiving reviews on the conversion of mgag200 to atomic mode
> setting, I thought it would make sense to embed the DRM device in
> struct mga_device first. Several comments in the atomic-conversion
> reviews refer to that.
I would have preferred that this was on top of at least some of the
existing patches, as they are tested by at least one other person
and reveiwed too (at least some of them, but maybe only by me).

Anyway, now you did it like this and Daniel has reviewed so let's
move on from here.

	Sam
> 
> Patches 1 to 3 do some cleanups and preparation work. Patch 4 changes
> the the init functions to allocate struct mga_device before struct
> drm_device. Patch 5 does the conversion.
> 
> I did not switch over struct mga_device to the new managed release
> code. I found that this justifies another round of cleanup patches,
> which I did not want to put into this patchset.
> 
> The patches were tested on mgag200 hardware.
> 
> Thomas Zimmermann (5):
>   drm/mgag200: Convert struct drm_device to struct mga_device with macro
>   drm/mgag200: Integrate init function into load function
>   drm/mgag200: Remove several references to struct mga_device.dev
>   drm/mgag200: Init and finalize devices in mgag200_device_{init,fini}()
>   drm/mgag200: Embed DRM device instance in struct mga_device
> 
>  drivers/gpu/drm/mgag200/mgag200_cursor.c |  10 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c    |  29 +++---
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |   8 +-
>  drivers/gpu/drm/mgag200/mgag200_i2c.c    |  10 +-
>  drivers/gpu/drm/mgag200/mgag200_main.c   | 114 +++++++++++------------
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |  35 +++----
>  drivers/gpu/drm/mgag200/mgag200_ttm.c    |   4 +-
>  7 files changed, 101 insertions(+), 109 deletions(-)
> 
> --
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
