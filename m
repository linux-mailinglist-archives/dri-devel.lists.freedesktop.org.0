Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C94396B5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 14:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A7A89A35;
	Mon, 25 Oct 2021 12:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E2289A35
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:52:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF14860F22;
 Mon, 25 Oct 2021 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635166354;
 bh=hzcwhkDL3CBQc33Ym3Rph81drL4E7gP6JSF8mSD53Ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ujg9laVlPovWEsNLmo+33wfgDma3MzjiPOcthwAAH8hjWCn3dZrT/LiVkOg9yfmcg
 N627/jaQZYzx6La2p5PpGMMpsZ8mFcW1e2TvhEqTPIcNwNkU/nM0jYTiCPQqL8nWDJ
 WA1Yk+EOMmq7PuehYNSihg5vaBQkN0Jqea4rQzK4=
Date: Mon, 25 Oct 2021 14:52:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YXaokMh09Xdh9KjZ@kroah.com>
References: <20211010124628.17691-1-gregkh@linuxfoundation.org>
 <YXaIx0g/kHEnq8ZN@kroah.com>
 <7328189c-0567-847e-17e9-e2ed4f3a78f4@amd.com>
 <CAO_48GE9C_eOK84iYwvNjkGQRcFQQ8Hn-z70ndOhmF1gbmd5BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO_48GE9C_eOK84iYwvNjkGQRcFQQ8Hn-z70ndOhmF1gbmd5BQ@mail.gmail.com>
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

On Mon, Oct 25, 2021 at 05:43:49PM +0530, Sumit Semwal wrote:
> Hi Greg,
> 
> On Mon, 25 Oct 2021 at 16:29, Christian König <christian.koenig@amd.com> wrote:
> >
> > Am 25.10.21 um 12:36 schrieb Greg Kroah-Hartman:
> > > On Sun, Oct 10, 2021 at 02:46:28PM +0200, Greg Kroah-Hartman wrote:
> > >> In order to better track where in the kernel the dma-buf code is used,
> > >> put the symbols in the namespace DMA_BUF and modify all users of the
> > >> symbols to properly import the namespace to not break the build at the
> > >> same time.
> > >>
> > >> Now the output of modinfo shows the use of these symbols, making it
> > >> easier to watch for users over time:
> > >>
> > >> $ modinfo drivers/misc/fastrpc.ko | grep import
> > >> import_ns:      DMA_BUF
> > >>
> > >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > >> Cc: David Airlie <airlied@linux.ie>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >> Acked-by: Christian König <christian.koenig@amd.com>
> > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > >> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > >> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> ---
> > >> v2: added lots of acks
> > >>      added 2 more drivers that needed the change, as found by Arnd
> > > Ping?  Any ideas on what needs to happen to get this into the tree?
> > >
> > > Or can I take it through my char-misc tree?  I seem to have a bunch of
> > > acks on it by the respective maintainers...
> >
> > I could push that upstream through the drm-misc-next tree if you like,
> > but honestly char-misc sounds like the better approach since this
> > touches a lot of drivers outside of drm as well.
> 
> I agree with Christian here - char-misc might be a better way for this.

Good idea, I'll take it through this tree as it will need to add the
symbol to the habanalabs driver at the same time as it has picked up
support for these symbols in my tree.

thanks,

greg k-h
