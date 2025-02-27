Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D3A470A7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 02:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781E710E9F4;
	Thu, 27 Feb 2025 01:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TkDiiZd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5BB10E23C;
 Thu, 27 Feb 2025 01:03:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86DCD61223;
 Thu, 27 Feb 2025 01:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21925C4CED6;
 Thu, 27 Feb 2025 01:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740618212;
 bh=FTPMAncBAzZfObxBDvtwhNrMKEuph+iFW9LdgJdI6ZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkDiiZd0yabeKBUfXZTVFwtg6jdjGZZPQpwod4kGqxUa1vDdFmu3lIrfCD4TN6UX1
 Dd8R07piDH4YyhTXUqPgiTQY210uHXGPVZvttfTy7TTjWZaR2UJEJ/uJ9I1VDqwGz+
 0Ydz8gkdTWJdd8C6mRQp1+4AH+2legHQxpSxJeb4=
Date: Wed, 26 Feb 2025 17:02:23 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <2025022644-fleshed-petite-a944@gregkh>
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226234730.GC39591@nvidia.com>
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

On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> The way misc device works you can't unload the module until all the
> FDs are closed and the misc code directly handles races with opening
> new FDs while modules are unloading. It is quite a different scheme
> than discussed in this thread.

And I would argue that is it the _right_ scheme to be following overall
here.  Removing modules with in-flight devices/drivers is to me is odd,
and only good for developers doing work, not for real systems, right?

Yes, networking did add that functionality to allow modules to be
unloaded with network connections open, and I'm guessing RDMA followed
that, but really, why?

What is the requirement that means that you have to do this for function
pointers?  I can understand the disconnect issue between devices and
drivers and open file handles (or sockets), as that is a normal thing,
but not removing code from the system, that is not normal.

thanks,

greg k-h
