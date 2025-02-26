Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642DA4520D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 02:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3CA10E828;
	Wed, 26 Feb 2025 01:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p11TR35k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8922D10E1F9;
 Wed, 26 Feb 2025 01:17:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 174A2611FD;
 Wed, 26 Feb 2025 01:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B45C4CEDD;
 Wed, 26 Feb 2025 01:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740532624;
 bh=/7QHcznAJAo2yO+ZPSdY6irpP6OfrWikh/lcuG95OFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p11TR35kWUbmfwGxMqGmTqthyQsbWbW+CFGBtI5o/Ob8QMYY1UnP4MtYbTKTKEsgH
 FDFsOntZsdBX+turZ9wTl0d7BkacQd12/dVNgMLSEEN3gR7PnN708BO79xgfKX7xcF
 NaDUpeRCaupQBQ5LxeXT8g733HGkQLnoeWp/vVaI8Op1fNZp3N7licTuG71KCl+UHG
 GYJrZHgyb1ZLvbHXTe2fqHiZBXVKL+hLpdg6EibLqVp8VJuQP/+x1BE4jNP97570D4
 KSCdGtnoxJZM89fuGrkrgS8Dl3yEE7vr6/zkF7fFe0qnwwkTW4qkWX5hEU7BhnBWf0
 VaX+E7EGN3F1g==
Date: Wed, 26 Feb 2025 02:16:58 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z75riltJo0WvOsS5@cassiopeiae>
References: <Z7xg8uArPlr2gQBU@pollux> <Z7xh5bEyh_MII4WV@pollux>
 <20250224184502.GA1599486@joelnvbox> <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226004916.GB4959@nvidia.com>
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

On Tue, Feb 25, 2025 at 08:49:16PM -0400, Jason Gunthorpe wrote:
> I'm pointing out the fundamental different in approachs. The typical
> widely used pattern results in __device_release_driver() completing
> with no concurrent driver code running.

Typically yes, but there are exceptions, such as DRM.

> 
> DRM achieves this, in part, by using drm_dev_unplug().

No, DRM can have concurrent driver code running, which is why drm_dev_enter()
returns whether the device is unplugged already, such that subsequent
operations, (e.g. I/O) can be omitted.

> 
> The Rust approach ends up with __device_release_driver() completing
> and leaving driver code still running in other threads.

No, this has nothing to do with Rust device / driver or I/O abstractions.

It entirely depends on the driver you implement. If you register a DRM device,
then yes, there may be concurrent driver code running after
__device_release_driver() completes. But this is specific to the DRM
implementation, *not* to Rust.

Again, the reason a pci::Bar needs to be revocable in Rust is that we can't have
the driver potentially keep the pci::Bar alive (or even access it) after the
device is unbound.

A driver can also be unbound without the module being removed, and if the driver
would be able to keep the pci::Bar alive, it would mean that the resource region
is not freed and the MMIO mapping is not unmapped, because the resource region
and the MMIO mapping is bound to the lifetime of the pci::Bar object. This would
not be acceptable for a Rust driver.

That this also comes in handy for subsystems like DRM, where we could have
attempts to access to the pci::Bar object after the device is unbound by design,
can be seen as a nice side effect.
