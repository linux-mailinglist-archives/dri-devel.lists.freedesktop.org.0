Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA234393D7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 12:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3889CF5;
	Mon, 25 Oct 2021 10:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C3189CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 10:36:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 830AE61073;
 Mon, 25 Oct 2021 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635158218;
 bh=/lbtMJGnAzJmGzzqeIS0JbaBPvwFTXO7FSkV6cdmOik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McbOZC4g1Y+GVHZxJnABiZtutL1Xnv7LoYgCZCQt8Lh5VIjChzuMxDRbp3GbBPz2x
 7DD8o/NGPtChMoj9FIFp/KUuP9R7SHIEUyK+VZsVUMqp8Zq2aJQ1okSLsTUziI1Bw4
 CXiQrJypbtEsVkscro3PFVsqEHc6FJRqgQHH7JYQ=
Date: Mon, 25 Oct 2021 12:36:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xinhui.Pan@amd.com
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YXaIx0g/kHEnq8ZN@kroah.com>
References: <20211010124628.17691-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211010124628.17691-1-gregkh@linuxfoundation.org>
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

On Sun, Oct 10, 2021 at 02:46:28PM +0200, Greg Kroah-Hartman wrote:
> In order to better track where in the kernel the dma-buf code is used,
> put the symbols in the namespace DMA_BUF and modify all users of the
> symbols to properly import the namespace to not break the build at the
> same time.
> 
> Now the output of modinfo shows the use of these symbols, making it
> easier to watch for users over time:
> 
> $ modinfo drivers/misc/fastrpc.ko | grep import
> import_ns:      DMA_BUF
> 
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Christian König <christian.koenig@amd.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: added lots of acks
>     added 2 more drivers that needed the change, as found by Arnd

Ping?  Any ideas on what needs to happen to get this into the tree?

Or can I take it through my char-misc tree?  I seem to have a bunch of
acks on it by the respective maintainers...

thanks,

greg k-h
