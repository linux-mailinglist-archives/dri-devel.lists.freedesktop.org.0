Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96158185D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADD695A3C;
	Tue, 26 Jul 2022 17:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AADE95A4A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:28:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D531E6102A;
 Tue, 26 Jul 2022 17:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6B4C433D6;
 Tue, 26 Jul 2022 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658856517;
 bh=DsScutZIz1MNvNNB0Ko1mzB8/LACNL/bmE2DKVLrRSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdVXFsR2CIQsANBRRHFcX/QANHnj71RMk7Y/7SZlrGDxDPJ+pOFL17/9NDp5idEZs
 lgihZVog4u7ar39ouw/Tz8eYl5gOGtBZwVsV0y2EbmGdWR16rqQwVlYps00X8jO0fX
 Jdyg0hEiJjTzE0jcx3VSJjV4W47Ojcd/qnOpM+TU=
Date: Tue, 26 Jul 2022 19:28:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] component: try_module_get() to prevent unloading while
 in use
Message-ID: <YuAkQtik4ud6xw8L@kroah.com>
References: <20220725160859.1274472-1-rf@opensource.cirrus.com>
 <Yt7cT66p0Bn+aXn5@kroah.com>
 <4165774b-2b96-83d1-67eb-f7c49dd8041e@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4165774b-2b96-83d1-67eb-f7c49dd8041e@opensource.cirrus.com>
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
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 11:32:28AM +0100, Richard Fitzgerald wrote:
> On 25/07/2022 19:09, Greg KH wrote:
> > On Mon, Jul 25, 2022 at 05:08:59PM +0100, Richard Fitzgerald wrote:
> > > Call try_module_get() on a component before attempting to call its
> > > bind() function, to ensure that a loadable module cannot be
> > > unloaded while we are executing its bind().
> > 
> > How can bind be called while the module is unloaded?
> > 
> 
> I didn't say it could. What I said is "unloaded while we are executing
> its bind()". Maybe that's already guaranteed to be safe somehow. It's
> actually the problem below that I was trying to fix but placing the
> try_module_get() before the bind() rather than after bind() seemed a
> trivial extra safety.

It should be safe, bind() can't race with module remove as the driver
core locks will handle this.

> > > If the bind is successful the module_put() is called only after it
> > > has been unbound. This ensures that the module cannot be unloaded
> > > while it is in use as an aggregate device.
> > 
> > That's almost never the correct thing to do, what problem is this
> > solving?
> > 
> 
> What I see is that when a loadable module has been made part of an
> aggregate it is still possible to rmmod'd it.
> 
> An alternative workaround would be for the parent to softdep to every
> driver that _might_ provide the aggregated components. Softdeps aren't
> unusual (we use it in some drivers that are directly related but don't
> directly link into each other). But to me this feels like a hack when
> used with the component framework - isn't the idea that the parent
> doesn't know (or doesn't need to know) which drivers will be aggregated?
> Wouldn't it be better that when a component driver is bound into an
> aggregate its module is automatically marked in-use?
> 
> If there's a better way to mark the module in-use while is it bound
> into an aggregate, let me know and I'll look at implementing it.

No module references should be incremented if a device is bound to a
driver, that's the old (1990's) way of thinking.  If a module wants to
be unloaded, let it, and clean up everything that it was
controlling/talking to before the module remove is finished.

That's the way all busses should be working, you don't increment a
module count when a driver binds to a device, otherwise how would you
unload a module that was being used at all?

So just remove the components controlled by the module properly when it
is removed and all should be good.

Do you have example code in the kernel tree today that does not properly
do this?  Why not just fix that instead?

thanks,

greg k-h
