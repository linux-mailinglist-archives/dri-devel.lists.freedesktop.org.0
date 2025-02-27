Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FAA486A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F9710EB53;
	Thu, 27 Feb 2025 17:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QeXhWU9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F93B10EB53;
 Thu, 27 Feb 2025 17:32:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E0F65C2784;
 Thu, 27 Feb 2025 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27526C4CEDD;
 Thu, 27 Feb 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740677541;
 bh=ZF9S4DgsXojdfwe8fyj+o1u2upec991trSXQ85ErxyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QeXhWU9tdT1xqO+/pAOx7GfponmkwTQKFnO5Gb4eSyOf1P2H9bcbKQ9U0kKL9Ppu2
 4KOCZl+UK7UIVCCHUMUzH452/mHiXadW2aa1wU5YrFFqXrsGWlLCcXydeHCPjk4IXL
 MSA9DTTNaBPsSjja8HR24z+tJZoSND3XA6QHvH4X9+EbDQtePCa6e6P10HUqmcXsDX
 H00mllT4FUfyYMWeXXerbKdY2tkbs1ZZ1RlcAC//aMUK6uJv5pqrpKQEVu7X8I5pHL
 5oHRfkZS9Ivc2P7osQ0Fl+8iB8DoIjH4xGeEdX4CgBHsBChMsm9uj1qr5Rdt8fZrqx
 jtYlHBn5PPSaQ==
Date: Thu, 27 Feb 2025 18:32:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8ChnwPC0UwM8xBe@cassiopeiae>
References: <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CY7fqbtbO4v1jv@Mac.home>
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

On Thu, Feb 27, 2025 at 08:55:09AM -0800, Boqun Feng wrote:
> On Thu, Feb 27, 2025 at 12:17:33PM -0400, Jason Gunthorpe wrote:
> 
> > I still wonder why you couldn't also have these reliable reference
> > counts rooted on the device driver instead of only on the module.
> > 
> 
> You could put reliable reference counts anywhere you want, as long as it
> reflects the resource dependencies.

Right, as I explained in a different reply, the signature for PCI driver probe()
looks like this:

	fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>>

The returned Pin<KBox<Self>> has the lifetime of the driver being bound to the
device.

Which means a driver can bind things to this lifetime. But, it isn't forced to,
it can also put things into an Arc and share it with the rest of the world.

If something is crucial to be bound to the lifetime of a driver being bound to a
device (i.e. device resources), you have to expose it as Devres<T>.

Subsequently, you can put the Devres<T> in an Arc and do whatever you want, the
result will still be that T is dropped once the device is unbound.
