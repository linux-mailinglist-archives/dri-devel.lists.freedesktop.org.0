Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC24AEFBF1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81110E2C8;
	Tue,  1 Jul 2025 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uU+tgnc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C19510E2C8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:19:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D1E66143F;
 Tue,  1 Jul 2025 14:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98D5C4CEEB;
 Tue,  1 Jul 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751379552;
 bh=I+XyzmgkgF3sY4vsuJM4czwPy5v2atBGAEyAVYeOoqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uU+tgnc6u7fp5B7LrdBVJd6ttVo88zLj6pfOf1NXFHbVOMlaPg0OS+Gj8pygrDLVR
 Mxg6N70tIIctyUkqkaDynKQScQ4UMKnJ7XplSklRkdJAaRYixkSHVLcbSmMppD8C2S
 kwJIyF6NNsIrCie7njhyNsCvp9aou5g1GlDyYELA=
Date: Tue, 1 Jul 2025 16:19:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de,
 riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org,
 thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <2025070126-undercoat-identity-71bd@gregkh>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
 <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
 <4c1aa07f-082a-4ba0-ad3e-14eba02423f2@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c1aa07f-082a-4ba0-ad3e-14eba02423f2@suswa.mountain>
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

On Tue, Jul 01, 2025 at 05:16:07PM +0300, Dan Carpenter wrote:
> On Tue, Jul 01, 2025 at 04:48:45PM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> > > This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> > > leak in fbtft_framebuffer_alloc()").
> > > 
> > > An updated patch has been added as commit 505bffe21233 ("staging:
> > > fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> > > and so reverting the old patch.
> > 
> > Revert has its automatic line, please do not remove it.
> 
> Why?
> 
> I hate the revert format.  It is from when git was invented in 2005.
> It sets you up for failure.  These days we have so many other things
> that we want in patches.
> 
> 1) The subsystem prefix in the subject
> 2) The 12 character hashes
> 3) A proper commit message
> 4) A Fixes tag
> 
> The automated revert commit messages don't have any of that.  It's
> always better to hand write them.

There are tools out there that expect the "traditional" format, so it's
good to keep them if at all possible.

But I agree, for this one it doesn't make sense, just do a fixup patch
on top of the current tree.  It's just a staging driver, not a big deal :)

thanks,

greg k-h
