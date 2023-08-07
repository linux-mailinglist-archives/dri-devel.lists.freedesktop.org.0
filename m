Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAB772C24
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079710E323;
	Mon,  7 Aug 2023 17:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E938210E325
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lDAtql43AAbJtOQLFLAqq+Gs08y+qbnSbrHK3c7+KLE=;
 b=OSl/233UZALcWg96Nt9FDmZMas6I1gls3OBfeYM8N0FJbYt9MAyCd2sy9xGUMZzFVS7tb35JyihRF
 5md5fIVmWIZjsE4KyTu3ehsITVoXE5007y7DzHamm5NoZvPHyHtRjdSaguky3opRfZibSiMilmApme
 V3Xr6WrKYJLFLPvmqSh43Aqd8gz+f/rhRd5ZjDf5+8U2CUNmqYwylaKQYoPgr/p0eLggK6MLjfkfez
 ABWlHGo0VOhrUNtIo/Odg+9tAXmQxcL4Egl7LeJLsfhPbZzMdvx8ZLA85Y1Ior3ahiHUBCofYG9DzE
 VufWdUWysbYm4pxGUkxrNPPWdGla4yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lDAtql43AAbJtOQLFLAqq+Gs08y+qbnSbrHK3c7+KLE=;
 b=vYBIR9fd/ri6y3/5P7Ydot2zWcn6nb5cCGlCqXKgmKS9l41oFwEqu8kJtuSoqPip3eenRl9lyyuf8
 r+0MVoOCw==
X-HalOne-ID: 618b718a-3545-11ee-8817-55333ba73462
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 618b718a-3545-11ee-8817-55333ba73462;
 Mon, 07 Aug 2023 17:11:02 +0000 (UTC)
Date: Mon, 7 Aug 2023 19:11:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/11] fbdev/sbus: Initializers for struct fb_ops
Message-ID: <20230807171101.GB281773@ravnborg.org>
References: <20230806120926.5368-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230806120926.5368-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, sparclinux@vger.kernel.org,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Sun, Aug 06, 2023 at 01:58:51PM +0200, Thomas Zimmermann wrote:
> Add initializer macros for struct fb_ops of drivers that operate
> on SBUS-based framebuffers. Also add a Kconfig token to select the
> correct dependencies.
> 
> All drivers for SBUS-based framebuffers use the regular helpers
> for framebuffers in I/O memory (fb_io_*() and cfb_*()). Each driver
> provides its own implementation of mmap and ioctls around common
> helpers from sbuslib.o. Patches 1 to 3 clean up the code a bit and
> add a initializer macros that set up struct fb_ops correctly.
> 
> Patches 4 to 11 convert the drivers. Each patch slightly renames
> the driver's mmap and ioctl functions so that it matches the name
> pattern of sbuslib.o.
> 
> Like the other fbdev initializer macros, the SBUS helpers are
> easily grep-able. In a later patch, they can be left to empty values
> if the rsp. functionality, such as file I/O or console, has been
> disabled.
> 
> There are no functional changes. The helpers set the defaults that
> the drivers already use. The fb_io_*() functions that the initializer
> macro sets are the defaults if struct fb_ops.fb_read or .fb_write are
> NULL. After all drivers have been updated to set them explicitly, the
> defaults can be dropped and the functions can be made optional.

I have looked thought it all and it looks good.
I throw it after my sparc32 build setup - also OK.

cg6 and ffb uses their own imageblit and friends, but this is nicely
handled in the patches.
I also like how you managed to handle the compat case.

All are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
