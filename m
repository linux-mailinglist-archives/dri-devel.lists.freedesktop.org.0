Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045341AA16
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 09:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72D6E0DA;
	Tue, 28 Sep 2021 07:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA206E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 07:51:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9409760F4B;
 Tue, 28 Sep 2021 07:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632815465;
 bh=G1ViAjdA/G2dcjMEDMQdQby/GLDRcGsYdwynsKMsnKk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=oOqd8qGX3jSdpA7FXe0FcknkS8/OJxthL/6ruCuf469jklDKFKnsddSAim2oUap5u
 O1uTcCXrC6XT6eTXp5slvt2LDfBvtPYQwBE9hnA6tsus300Ted25NfOAnOPJRESpie
 KhTXQsuaGKCsCdl8UmsPBK/CiFghAPoRgCZeZvoM=
Date: Tue, 28 Sep 2021 09:51:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YVLJZwNwY4UimfzL@kroah.com>
References: <YU8oVDFoeD5YYeDT@kroah.com> <YVLE4b/nG5/qCOJN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVLE4b/nG5/qCOJN@phenom.ffwll.local>
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

On Tue, Sep 28, 2021 at 09:31:45AM +0200, Daniel Vetter wrote:
> On Sat, Sep 25, 2021 at 03:47:00PM +0200, Greg Kroah-Hartman wrote:
> > In order to better track where in the kernel the dma-buf code is used,
> > put the symbols in the namespace DMA_BUF and modify all users of the
> > symbols to properly import the namespace to not break the build at the
> > same time.
> > 
> > Now the output of modinfo shows the use of these symbols, making it
> > easier to watch for users over time:
> > 
> > $ modinfo drivers/misc/fastrpc.ko | grep import
> > import_ns:      DMA_BUF
> > 
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > 
> > The topic of dma-buf came up in the Maintainer's summit yesterday, and
> > one comment was to put the symbols in their own module namespace, to
> > make it easier to notice and track who was using them.  This patch does
> > so, and finds some "interesting" users of the api already in the tree.
> 
> Yeah, the interesting ones is why I added the dma-buf wildcard match a
> while ago.  Since that landed I don't think anything escaped. Should we
> perhaps also add
> 
> K: MODULE_IMPORT_NS(DMA_BUF);
> 
> to the dma-buf MAINATINERS entry? Entirely untested, also no idea whether
> there's not a better way to match for module namespaces. Either way:

I don't know if that would really work, if anything, just make the
MAINTAINERS file harder to maintain :)

> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for the review, I'll send out a v2 later today...

greg k-h
