Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D779E42814D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C56E321;
	Sun, 10 Oct 2021 12:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76A46E323
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:41:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E6AF60D07;
 Sun, 10 Oct 2021 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633869676;
 bh=o7w90LSNRYu3AezcvSR4dAernvfz123PxduSd3YmtCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gdKE04NYiz7YZMW0mlmTDySLzhyqylYJl1Ey/fQ5uY6NRjLA1LKb8FkLbr42QFH1O
 MZRfs6rH8EsH0D7APJCwXc0rodR1l0lA5LBkdgv8x3kTrD5dCy3YZxG55pJGq0yOY1
 Dzmz8hzn6rdhQnh8DGzOo1s9lYByCXmcXLS7Gtno=
Date: Sun, 10 Oct 2021 14:41:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YWLfav3afArnyBFg@kroah.com>
References: <YU8oVDFoeD5YYeDT@kroah.com>
 <18108ec3-550f-be65-7fe6-655444b7f75b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18108ec3-550f-be65-7fe6-655444b7f75b@amd.com>
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

On Mon, Sep 27, 2021 at 12:08:45PM +0200, Christian König wrote:
> Am 25.09.21 um 15:47 schrieb Greg Kroah-Hartman:
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
> 
> Acked-by: Christian König <christian.koenig@amd.com>

Thanks for the ack.

greg k-h
