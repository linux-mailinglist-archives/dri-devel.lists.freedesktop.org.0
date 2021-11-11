Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448D44D5F6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586B16E9ED;
	Thu, 11 Nov 2021 11:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873D6EA54
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:39:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E3F36124C;
 Thu, 11 Nov 2021 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636630771;
 bh=2xTzG56gxhhXwiS95ih42dEn74qDB8279alohU9qlZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vUcqJOU5W38ALz3lDjdbG/DdJhLZ3gujNbRImBlGflvjYe0GBBpvVnrgF3p9Xs4L5
 v28EJY4P4bYReLU2siXGRc4BjsM+26u90QTmMzeqAyDfMCUg8qZHlKsiwpg2kTS4uv
 R8ogjLcrEx0QOAuG1RfK7Na50FtQKTB07Tcq8VmM=
Date: Thu, 11 Nov 2021 12:39:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
Message-ID: <YY0A8LOVhs5JbMXW@kroah.com>
References: <20211111111120.1344613-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111111120.1344613-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 12:11:20PM +0100, Javier Martinez Canillas wrote:
> The efifb and simplefb drivers just render to a pre-allocated frame buffer
> and rely on the display hardware being initialized before the kernel boots.
> 
> But if another driver already probed correctly and registered a fbdev, the
> generic drivers shouldn't be probed since an actual driver for the display
> hardware is already present.
> 
> This is more likely to occur after commit d391c5827107 ("drivers/firmware:
> move x86 Generic System Framebuffers support") since the "efi-framebuffer"
> and "simple-framebuffer" platform devices are registered at a later time.
> 
> Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
> Changes in v2:
> - Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
> - Add a comment explaining why the probe fails earlier (Daniel Vetter).
> - Add a Fixes: tag for stable to pick the fix (Daniel Vetter).

That does not mean that it will make it into the stable tree.  Please
read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

thanks,

greg k-h
