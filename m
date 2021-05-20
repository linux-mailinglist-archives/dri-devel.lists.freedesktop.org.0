Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A338B0A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBAD6E1A8;
	Thu, 20 May 2021 13:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E76E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 13:58:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C24D60FF3;
 Thu, 20 May 2021 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621519107;
 bh=9Z9KtTy2XJzfMy3Np+yfMnnpZx1rqHwlJ+eViM6aKGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zzZKKHy8Rvb2U6+fIVhMVR4d5FQY3bliHouy3pSAQ81rdLSMQgPZMcZUsRyciMnB5
 ZbBk+zb+O85Z8nqUfoyYz6XrYMRXjrvGIt6tKvhYx8g0KCsREhI4GBhbgxJ1HtDdSt
 fCZrWgZP/7jZ9IhI2OGk+7Au4bnWZ387ujj8o7iI=
Date: Thu, 20 May 2021 15:58:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH] video: hgafb: correctly handle card detect failure
 during probe
Message-ID: <YKZrAVk85IjNYVHs@kroah.com>
References: <20210516192714.25823-1-mail@anirudhrb.com>
 <YKZm17dj4R1c2ns/@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKZm17dj4R1c2ns/@anirudhrb.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, fero@drama.obuda.kando.hu,
 kernel test robot <oliver.sang@intel.com>, stable <stable@vger.kernel.org>,
 linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 07:10:39PM +0530, Anirudh Rayabharam wrote:
> On Mon, May 17, 2021 at 12:57:14AM +0530, Anirudh Rayabharam wrote:
> > The return value of hga_card_detect() is not properly handled causing
> > the probe to succeed even though hga_card_detect() failed. Since probe
> > succeeds, hgafb_open() can be called which will end up operating on an
> > unmapped hga_vram. This results in an out-of-bounds access as reported
> > by kernel test robot [1].
> > 
> > To fix this, correctly detect failure of hga_card_detect() by checking
> > for a non-zero error code.
> > 
> > [1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/
> > 
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")
> 
> Greg, this is one of the UMN fixes we did. So, do you want to take this
> patch into your tree?

Yes, will queue it up in a few days after Linus takes the current pull
request I sent him for this.

thanks,

greg k-h
