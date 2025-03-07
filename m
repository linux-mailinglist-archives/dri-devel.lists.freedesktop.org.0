Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63938A56BBB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562610EBCE;
	Fri,  7 Mar 2025 15:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rEDTa4tF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4FF10E31B;
 Fri,  7 Mar 2025 15:19:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC24BA45746;
 Fri,  7 Mar 2025 15:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676F2C4CEE7;
 Fri,  7 Mar 2025 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1741360774;
 bh=segi232KmrexYad75hk2+4+LsAxjj931hFv+eA6sXTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEDTa4tFmzGkVEBT8/wN5XbDIOQwdpmNXz1XE9GAMIirUhfDM+cmAJ8EmVWvu9/6O
 8eY3Nez6DTvGyXuPHGHIyXXXKKAeaK/T6sTsLxb2UzJBoVuKFC3ezmVGEiKIoSK9iA
 MOEf9htTB+jL7j+4ew23goe3H/wRvGg1L3SX20Ao=
Date: Fri, 7 Mar 2025 16:19:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <2025030749-pulp-juniper-c35e@gregkh>
References: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <2025030753-celtic-quarry-1799@gregkh>
 <20250307144629.GN354511@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307144629.GN354511@nvidia.com>
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

On Fri, Mar 07, 2025 at 10:46:29AM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 07, 2025 at 03:00:09PM +0100, Greg KH wrote:
> > On Fri, Mar 07, 2025 at 08:32:55AM -0400, Jason Gunthorpe wrote:
> > > On Fri, Mar 07, 2025 at 11:28:37AM +0100, Simona Vetter wrote:
> > > 
> > > > > I wouldn't say it is wrong. It is still the correct thing to do, and
> > > > > following down the normal cleanup paths is a good way to ensure the
> > > > > special case doesn't have bugs. The primary difference is you want to
> > > > > understand the device is dead and stop waiting on it faster. Drivers
> > > > > need to consider these things anyhow if they want resiliency against
> > > > > device crashes, PCI link wobbles and so on that don't involve
> > > > > remove().
> > > > 
> > > > Might need to revisit that discussion, but Greg didn't like when we asked
> > > > for a pci helper to check whether the device is physically gone (at least
> > > > per the driver model). Hacking that in drivers is doable, but feels
> > > > icky.
> > > 
> > > I think Greg is right here, the driver model has less knowledge than
> > > the driver if the device is alive.
> > 
> > That's not why I don't want this.  Think about this sequence:
> > 	if (!device_is_gone(dev)) {
> > 		// do something
> > 	}
> > right after you check it, the value can change. 
> 
> Oh, I imagined this would latch off. For instance if you hotunplug a
> PCI struct device then that struct device will be destroyed
> eventually.

That is true.

> If in the meantime a PCI device is re-discovered at the
> same BDF it would have to wait until the prior one is sufficiently
> destroyed before creating a new struct device and getting plugged in.

I think we just create a new one and away you go!  :)

Just like other busses, if PCI can't handle this at the core hotplug
layer (i.e. by giving up new resources to new devices) then the bus core
for it should handle this type of locking scheme as really, that feels
wrong.  A new device is a new device, should have nothing to do with any
old previous one ever plugged in.

> > Handle the real cases, like you are are saying here, and then all should
> > be ok.
> 
> Yes, if you handle physical device unplug, PCI device unplug, and PCI
> device failure recovery then you cover all the actual production use
> cases. That is already so comprehesive and hard that driver writers
> will be overjoyed with the result anyhow :)

Kernel programming is hard, let's go shopping :)

greg k-h
