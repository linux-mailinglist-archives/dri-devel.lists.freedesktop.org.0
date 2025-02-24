Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E2A41E5A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 13:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273A10E363;
	Mon, 24 Feb 2025 12:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="llLJM4oI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A510E361;
 Mon, 24 Feb 2025 12:07:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A00E611A0;
 Mon, 24 Feb 2025 12:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4B2C4CEE6;
 Mon, 24 Feb 2025 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740398839;
 bh=Lj7AnxrvrJdZGqg0jt9Y26sh/3qsXsYiQTfMs9xf2bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=llLJM4oIRH1SLrvaPQn/ZipABAJlry7z52TN2eJOr3wP5G9JsfqnpscjFGCMEcK0x
 8h6u8Z8F9FO/IrKvQmSInGHVYZyjCA4n8NPAdChcqiW8pamjDLpiYEm/tjc1KD1chO
 gPgq6fG6Butmyj5gzgDdtMxtB+a8bgmhCk+9RG+Ra7a56X29e0UiAVXPW3RYiNi45m
 GKySzUVt2gWhsMERCGpGydGPZc8P0Qu9aivv0nTPC6JCU5JbBR2+BquXhVrMNqw5ve
 0hpKJoEX3QmwYqoMfcgj+WrvP2XJq43S05I2/+KvqbGPfdboYqVmmDHe5UMv7BGhRo
 BxtX0sof8DcyA==
Date: Mon, 24 Feb 2025 13:07:14 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7xg8uArPlr2gQBU@pollux>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com>
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

CC: Gary

On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> This inability to sleep while we are accessing registers seems very
> constraining to me, if not dangerous. It is pretty common to have
> functions intermingle hardware accesses with other operations that might
> sleep, and this constraint means that in such cases the caller would
> need to perform guard lifetime management manually:
> 
>   let bar_guard = bar.try_access()?;
>   /* do something non-sleeping with bar_guard */
>   drop(bar_guard);
> 
>   /* do something that might sleep */
> 
>   let bar_guard = bar.try_access()?;
>   /* do something non-sleeping with bar_guard */
>   drop(bar_guard);
> 
>   ...
> 
> Failure to drop the guard potentially introduces a race condition, which
> will receive no compile-time warning and potentialy not even a runtime
> one unless lockdep is enabled. This problem does not exist with the
> equivalent C code AFAICT, which makes the Rust version actually more
> error-prone and dangerous, the opposite of what we are trying to achieve
> with Rust. Or am I missing something?

Generally you are right, but you have to see it from a different perspective.

What you describe is not an issue that comes from the design of the API, but is
a limitation of Rust in the kernel. People are aware of the issue and with klint
[1] there are solutions for that in the pipeline, see also [2] and [3].

[1] https://rust-for-linux.com/klint
[2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_context.md
[3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/
