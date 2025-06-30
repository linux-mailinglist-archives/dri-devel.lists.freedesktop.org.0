Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8795AEE56E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 19:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFE010E057;
	Mon, 30 Jun 2025 17:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DOsbfGRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8A310E057
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 17:16:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93EBFA4EF4D;
 Mon, 30 Jun 2025 17:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A0C4CEE3;
 Mon, 30 Jun 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751303801;
 bh=o46b+qzEeO5R+D3GfcJjy0xzYMzH4gfbKZTrdNsCCQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOsbfGRdjmqBhSjcurza6/J672t3KpGEeR9L9vM56lWHXo6AndByMKkYi2RXmzMuH
 1leVCf3j5rj9rWhkqKfISe8yIXBjosIT1yPIwxCywADlK33B1GrdabVqESroC2qwp3
 O1peHe2k3f9xco2dbJZPvfqFJqkE/uOKUQFOXvcY=
Date: Mon, 30 Jun 2025 19:16:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <2025063022-chump-pointless-6580@gregkh>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
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

On Sun, Jun 29, 2025 at 08:10:11PM +0530, Abdun Nihaal wrote:
> The error handling in fbtft_framebuffer_alloc() mixes managed allocation
> and plain allocation, and performs error handling in an order different
> from the order in fbtft_framebuffer_release().
> 
> Fix them by moving vmem allocation closer to where it is used, and using
> plain kzalloc() for txbuf allocation.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---
> v2->v3: 
> - Remove the if check before kfree of txbuf.buf, because it is zero
>   initialized on allocation, and kfree is NULL aware.

This patch does not apply to my tree, can you rebase and resend?

thanks,

greg k-h
