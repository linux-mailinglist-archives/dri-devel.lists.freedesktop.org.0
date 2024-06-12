Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029CD904FFE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06C810E05F;
	Wed, 12 Jun 2024 10:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q18QkBM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A910F10E219
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:05:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6B6F9CE20BE;
 Wed, 12 Jun 2024 10:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F7AC3277B;
 Wed, 12 Jun 2024 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1718186705;
 bh=rwlwswTsUbOPcjKbEVBwiyLFy9gLzMMDFBpaP7BrtoE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q18QkBM6/z+MI7D8stSLPt+91ReXH8Esub6dKaYMZ7zkNmv/89F7wHLF5Oizf52J+
 ZiR6ruoducu6nRZE0k3b9c6NsonsZ3aFZDdoq5gPhHCrWS58+4HemB+ljOVDzgwj4j
 zhHv143kPUvirO67sAzF/YirrHmFLKEdvmYrXpJw=
Date: Wed, 12 Jun 2024 12:05:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org, trivial@kernel.org,
 linux-amarula@amarulasolutions.com
Subject: Re: [PATCH v3] devres: Refactor using guards
Message-ID: <2024061221-italicize-slideshow-015f@gregkh>
References: <20240611093710.1066510-1-andrea.calabrese@amarulasolutions.com>
 <81e1972e636a2d81f34de059a24ac27133da4bb0.camel@pengutronix.de>
 <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
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

On Wed, Jun 12, 2024 at 12:00:06PM +0200, Andrea Calabrese wrote:
> Hi Lucas,
> 
> On 12/06/2024 11:26, Lucas Stach wrote:
> > Am Dienstag, dem 11.06.2024 um 11:37 +0200 schrieb Andrea Calabrese:
> > > Code refactoring using the recent guard and scoped_guard macros
> > > for automatic cleanup of the spinlocks. This does not change the
> > > effective behaviour of the kernel, but guarantees a cleaned-up exit from
> > > each lock, automatically avoiding potential deadlocks.
> > > 
> > > Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
> > > 
> > > ---
> > > Changed commit message from V2. Also changed title, shortened the file
> > > name.
> > > 
> > > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > > index 3df0025d12aa..a98720e0cb2b 100644
> > > --- a/drivers/base/devres.c
> > > +++ b/drivers/base/devres.c
> > > @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
> > >   {
> > >   	struct devres_node *node;
> > >   	struct devres_node *tmp;
> > > -	unsigned long flags;
> > >   	if (!fn)
> > >   		return;
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -	list_for_each_entry_safe_reverse(node, tmp,
> > > -			&dev->devres_head, entry) {
> > > +	guard(spinlock)(&dev->devres_lock);
> > This is not equivalent to the current code. You are dropping the
> > _irqsave part of the locking scheme, totally changing the semantics
> > here. This issue is present in multiple places in this patch.
> > 
> > Regards,
> > Lucas
> I don't see where is the issue here, as I am using both guard and
> scoped_guard similarly to how they are used in drivers/gpio/gpiolib-cdev.c,
> which I took as a reference for the usage of the construct. If so, probably
> we may  both be using it wrong.

Look at the difference between calling:
	spin_lock(&lock);
and
	spin_lock_irqsave(&lock, flags);

They are functionally NOT the same.

thanks,

greg k-h
