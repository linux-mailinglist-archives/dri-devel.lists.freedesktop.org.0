Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E5A45102
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 00:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DC710E16E;
	Tue, 25 Feb 2025 23:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WIugjpVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1310E16E;
 Tue, 25 Feb 2025 23:45:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD3E75C4CCF;
 Tue, 25 Feb 2025 23:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F2CC4CEDD;
 Tue, 25 Feb 2025 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740527151;
 bh=uz+tadVAdTb7AZ+aJWh9/fa1TwcRYK6fdtNwn3BIO0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WIugjpVayFWN0SmzcJZYQ2eNpVbvNoGTaYgthH0q1kR5S7JXiWZqk8BDfHpJic2wU
 +yD4iDnlUZ19xYylMr2BjRNbiBUK7wvus6vJrs70eG9/UAbpl1DaqEP7pbKwRjtDUE
 yudyFIZSdFVODKD7+3F8wW9phL8RbflZgUMy++M+6hXb07BDgtrCDdtV3yNf4cyTcW
 TMQh8tgNVQvCo85EWlewElkymYcIYCWGkWq+pZ5IZR8/SjYaP1jmcnOs6zUAifnp5A
 inZZI8VivYmCSjo4wU+taV7PF8w+N/0WqK0o66D/E/pCJ6RL0V8+KNAntAeEY2j7v9
 H/6P0m/m817IQ==
Date: Wed, 26 Feb 2025 00:45:45 +0100
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
Message-ID: <Z75WKSRlUVEqpysJ@cassiopeiae>
References: <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225225756.GA4959@nvidia.com>
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

On Tue, Feb 25, 2025 at 06:57:56PM -0400, Jason Gunthorpe wrote:
> The common driver shutdown process in the kernel, that is well tested
> and copied, makes the driver single threaded during the remove()
> callback.

All devres callbacks run in the same callchain, __device_release_driver() first
calls remove() and then all the devres callbacks, where we revoke the pci::Bar,
by which gets dropped and hence the bar is unmapped and resource regions are
free. It's not different to C drivers. Except that in C you don't lose access to
the void pointer that still points to the (unmapped) MMIO address.
