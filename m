Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C9972C30
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145010E2FE;
	Tue, 10 Sep 2024 08:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jcLdne6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3D910E2FE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1C0D5C018A;
 Tue, 10 Sep 2024 08:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D83C4CEC3;
 Tue, 10 Sep 2024 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725957236;
 bh=7fN2QW4VeStjSZ6oT3iXJeTQYiGdecAGUoenFSAEiog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jcLdne6WlOPXpt9HAXecfWUAErV3zON5CbSWgnYkv0R9ahlM1S8YPgF40RkTRzgBk
 YCBKJP3lIH4IKhla33l+NtemuMfsHVlV90tpIKvZkCCeJTFgHuehMNtnfkytpLds13
 WIValR9lsOsVpJWxdRTixskS/ArntXyaOwnCJqEg=
Date: Tue, 10 Sep 2024 10:33:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Andryuk <jandryuk@gmail.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Message-ID: <2024091033-copilot-autistic-926a@gregkh>
References: <20240910020919.5757-1-jandryuk@gmail.com>
 <Zt_zvt3VXwim_DwS@macbook.local>
 <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
 <Zt__jTESjI7P7Vkj@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zt__jTESjI7P7Vkj@macbook.local>
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

On Tue, Sep 10, 2024 at 10:13:01AM +0200, Roger Pau Monné wrote:
> On Tue, Sep 10, 2024 at 09:29:30AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 10.09.24 um 09:22 schrieb Roger Pau Monné:
> > > On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> > > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > > 
> > > > Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> > > > struct device is NULL since xen-fbfront doesn't assign it and the
> > > > memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> > > > 
> > > > This was exposed by the conversion of fb_is_primary_device() to
> > > > video_is_primary_device() which dropped a NULL check for struct device.
> > > > 
> > > > Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> > > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> > > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > CC: stable@vger.kernel.org
> > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > > > ---
> > > > The other option would be to re-instate the NULL check in
> > > > video_is_primary_device()
> > > I do think this is needed, or at least an explanation.  The commit
> > > message in f178e96de7f0 doesn't mention anything about
> > > video_is_primary_device() not allowing being passed a NULL device
> > > (like it was possible with fb_is_primary_device()).
> > > 
> > > Otherwise callers of video_is_primary_device() would need to be
> > > adjusted to check for device != NULL.
> > 
> > The helper expects a non-NULL pointer. We might want to document this.
> 
> A BUG_ON(!dev); might be enough documentation that the function
> expected a non-NULL dev IMO.

No need for that, don't check for things that will never happen.
