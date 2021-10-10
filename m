Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3ED428154
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B70089E32;
	Sun, 10 Oct 2021 12:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328589E32
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:42:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B05F460ED4;
 Sun, 10 Oct 2021 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633869771;
 bh=O7+5G/8cFVwXN7V725JU1cD+Zpxq8xjRo6+pVgVOhVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKz0pNq6Q5iZWuMfYjmKpkYC6U1u8MqDXXtyM2G3UYzLsZwYdHxjqBCt73FHxQjxl
 fwduLn+5AolNU04rqGAYFqA9hryGjofjrwdLF4l8JlE3lM1KUw7iRNiM8KYAv5xwoe
 dlbU/oPC2mMgXrqGbHG/3AzeBdfnZZptl/mL78EU=
Date: Sun, 10 Oct 2021 14:42:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YWLfyDSZmNogcU5m@kroah.com>
References: <YU8oVDFoeD5YYeDT@kroah.com>
 <CAO_48GG-ygn6ox0JUM89qEO9BG662pBU5KKjx2R+T2ftCs75_Q@mail.gmail.com>
 <CADnq5_O1GNteyrrYfVHMN9CpRx5gt+Bvtr1uahR7DsSbw04TTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_O1GNteyrrYfVHMN9CpRx5gt+Bvtr1uahR7DsSbw04TTQ@mail.gmail.com>
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

On Mon, Sep 27, 2021 at 11:00:14AM -0400, Alex Deucher wrote:
> On Mon, Sep 27, 2021 at 7:15 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
> >
> > Hello Greg,
> >
> > Thanks for the patch!
> >
> > On Sat, 25 Sept 2021 at 19:17, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >>
> >> In order to better track where in the kernel the dma-buf code is used,
> >> put the symbols in the namespace DMA_BUF and modify all users of the
> >> symbols to properly import the namespace to not break the build at the
> >> same time.
> >>
> >> Now the output of modinfo shows the use of these symbols, making it
> >> easier to watch for users over time:
> >>
> >> $ modinfo drivers/misc/fastrpc.ko | grep import
> >> import_ns:      DMA_BUF
> >>
> >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >> Cc: "Christian König" <christian.koenig@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> >
> > With the addition of the 2 misses found by Arnd, please feel free to add my
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> 
> Same here.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Thanks both of you for your acks.

greg k-h
