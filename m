Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D7D4000D3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6996E89B;
	Fri,  3 Sep 2021 13:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45006E89B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFA2460E77;
 Fri,  3 Sep 2021 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630677345;
 bh=TIbAWhTZGeVzB0CS+6tdg41yfnyaP30d8USQVO4qjVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wMZ2jbXBjk8UtWa32Me7qCGlPU2DPxDL+hN8pL+IOeAfrGSJvARtZ3NLQtfgAFufG
 ksoyincXUqW4wAkUe6P3tECH2ckwHS3WdzcB9K9vJPApOKB1HDMGFFtlSBEFWxBNbe
 8G15ASSQuqxJuC6B7zEIzGhabX/8ClUrnSewou6I=
Date: Fri, 3 Sep 2021 15:55:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: stable@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 George Kennedy <george.kennedy@oracle.com>,
 syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Dhaval Giani <dhaval.giani@oracle.com>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4.19] fbmem: add margin check to fb_check_caps()
Message-ID: <YTIpXrJmJTasAGJU@kroah.com>
References: <20210902061048.1703559-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902061048.1703559-1-mudongliangabcd@gmail.com>
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

On Thu, Sep 02, 2021 at 02:10:48PM +0800, Dongliang Mu wrote:
> [ Upstream commit a49145acfb975d921464b84fe00279f99827d816 ]
> 
> A fb_ioctl() FBIOPUT_VSCREENINFO call with invalid xres setting
> or yres setting in struct fb_var_screeninfo will result in a
> KASAN: vmalloc-out-of-bounds failure in bitfill_aligned() as
> the margins are being cleared. The margins are cleared in
> chunks and if the xres setting or yres setting is a value of
> zero upto the chunk size, the failure will occur.
> 
> Add a margin check to validate xres and yres settings.
> 
> Note that, this patch needs special handling to backport it to linux
> kernel 4.19, 4.14, 4.9, 4.4.

Looks like this is already in the 4.4.283, 4.9.282, 4.14.246, and
4.19.206 kernel releases.  Can you check them to verify that it matches
your backport as well?

thanks,

greg k-h
