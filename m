Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452185A6C2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 16:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF06A10E3DD;
	Mon, 19 Feb 2024 15:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="onEMj+ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8310E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 15:02:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3349660DED;
 Mon, 19 Feb 2024 15:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0611C433F1;
 Mon, 19 Feb 2024 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708354934;
 bh=rLJTGIJL4PehKGlrZU7auEkJi81q+N3ek1Fb//6b2lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onEMj+iiSDkatOTkAQmMp147ZZR5yupKFlcfK1mqOwtUu6bAHjeXimLFyOsoIEnot
 dW1x3BaY8y6lJxZ2RcKU7dNy8BvgIKE+iEMuXhwN3fgS7hq5iYwBXMeJJtCpfIw6uj
 /53G5OInSS5NmMpmaoPhSVRQNCVYb16Wk3DCBYzmj05L9eCHoe58+a5ZYAU9eHabTL
 zhemj43OVZjL7J/CB1blxdEGsTH05gZCbRF0vIkg8e5p00ss0wZkSqCiIa0qXOEs+F
 OUVWliCKfqWJGoxb1DwmCLspBGTZLwfI5+DNxy8cBFUVqu4oBlOuD0DCxci2MuIy7v
 WlDM2s9I8pLGw==
Date: Mon, 19 Feb 2024 15:02:09 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <20240219150209.GB10170@google.com>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240215121326.GL9758@aspen.lan>
 <288a480c-74e9-49dd-a58d-294792771ea6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <288a480c-74e9-49dd-a58d-294792771ea6@suse.de>
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

On Thu, 15 Feb 2024, Thomas Zimmermann wrote:

> Hi
> 
> Am 15.02.24 um 13:13 schrieb Daniel Thompson:
> > On Mon, Feb 12, 2024 at 05:16:33PM +0100, Thomas Zimmermann wrote:
> > > Backlight drivers implement struct backlight_ops.check_fb, which
> > > uses struct fb_info in its interface. Replace the callback with one
> > > the does not use fb_info.
> > > 
> > > In DRM, we have several drivers that implement backlight support. By
> > > including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> > > At the same time, fbdev is deprecated for new drivers and likely to
> > > be replaced on many systems.
> > > 
> > > This patchset is part of a larger effort to implement the backlight
> > > code without depending on fbdev.
> > > 
> > > Patch 1 makes the backlight core match backlight and framebuffer
> > > devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> > > drivers and remove unnecessary implementations of check_fb. Finally,
> > > patch 10 replaces the check_fb hook with controls_device, which
> > > uses the framebuffer's Linux device instead of the framebuffer.
> > I won't reply individually but I also took a look at the patches for
> > the combo devices and it all looked good to me from a backlight
> > point of view.
> > 
> > However I don't want to drop Reviewed-by: on them since it risks those
> > bit being mistaken for an ack and merged ahead of the patch 1...
> 
> Thanks for reviewing. Unless someone objects, my intention is to merge
> everything via the drm-misc, so all patches should go in at once. I do have
> a lot more patches that untangle backlight and fbdev almost completely, but
> most of these changes are in the actual graphics drivers rather than the
> backlight core code. So hopefully everything can go through the DRM tree; or
> maybe the fbdev tree.

This is only acceptable if the maintainers of those trees can provide me
with a pull-request to a succinct (_only_ these patches) immutable
branch.  If this is not possible, then I should like to merge the set
through the Backlight tree and I can provide everyone else with said PR.

-- 
Lee Jones [李琼斯]
