Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E21A71519
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482A810E0C5;
	Wed, 26 Mar 2025 10:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EuSWk+Lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320510E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F2E36A41010;
 Wed, 26 Mar 2025 10:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE926C4CEE2;
 Wed, 26 Mar 2025 10:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742986021;
 bh=L4j3g8wiZqG0wfHlUP7eCw+iP9FoHwcb5XdoYR3/sK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuSWk+LgRI4Q0fjQh1ZNgYzXT3waiXc6XY+XSufexb7hlQJqfTDP3q6gUBBwCsxfS
 Ucb1b/rwdmsAea9ECcp3p/XY3XhBRlE9xfvTT3mkt26ISr10z/BaWUXoWtSBHlfpbk
 gR7M8DKq3b7RQaE3DizEX/xIiG4iu7/t/6EuMVCjJfPga46Om6bpXkDMksy3mtZmfu
 ACU0zj1ps3CbJO8HEwX+WMje1mTsS8aClqwgyQdWXcBYmUxfW2LlWM9ZYjkkCZzbRd
 pDossO/QIZoz5WsW4xOsqcliLAwjrQHW63XqIxxKE4FiQ2B0MCxrHTxxAdC+pyMDht
 rics4MWxsf58w==
Date: Wed, 26 Mar 2025 11:46:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
Message-ID: <Z-PbHiaMNqR0FPbY@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-6-dakr@kernel.org>
 <20250326-loyal-scrupulous-leech-59d44a@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-loyal-scrupulous-leech-59d44a@houat>
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

On Wed, Mar 26, 2025 at 10:24:43AM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 26, 2025 at 12:54:32AM +0100, Danilo Krummrich wrote:
> > Implement the DRM driver `Registration`.
> > 
> > The `Registration` structure is responsible to register and unregister a
> > DRM driver. It makes use of the `Devres` container in order to allow the
> > `Registration` to be owned by devres, such that it is automatically
> > dropped (and the DRM driver unregistered) once the parent device is
> > unbound.
> 
> The code looks correct, but the wording is confusing to me.
> drm_dev_unregister does indeed unregister the device, but it's not freed
> until the last reference is dropped, so it's not really "dropped once
> the parent device is unbound", the reference is, and it's not active
> anymore.

The above wording is related to the Registration structure itself, i.e. the
Registration is dropped, but not the the DRM device itself. However, if the
Registration had the last reference to the DRM device, then of course it's
freed.

> > +impl<T: Driver> Drop for Registration<T> {
> > +    /// Removes the registration from the kernel if it has completed successfully before.
> > +    fn drop(&mut self) {
> > +        // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. The existence of this
> > +        // `Registration` also guarantees the this `drm::Device` is actually registered.
> > +        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
> > +    }
> > +}
> 
> drm_dev_unregister also have an hotplug-aware variant in
> drm_dev_unplug(). However, most devices are hotpluggable, even if only
> through sysfs. So drm_dev_unplug() is generally a better option. Should
> we use it here, and / or should we provide multiple options still?
> 
> Another thing worth mentioning I think is that drm_dev_unplug() works by
> setting a flag, and drivers are expected to check that their access to
> device-bound resources (so registers mapping, clocks, regulators, etc.)
> are still there through drm_dev_enter/drm_dev_exit. It's pretty fragile
> overall, so I wonder if it's something we could abstract away in Rust.

DRM should not have to take care of the lifetime of device resources of the
parent device. This is the responsibility of the driver core abstractions.

At least for the device resources we directly give out to drivers, it has to be,
since otherwise it would mean that the driver core abstraction is unsound.
Drivers could otherwise extend the lifetime of device resources arbitrarily.

For instance, I/O memory is only ever given out by bus abstractions embedded in
a Devres container (e.g. Devres<pci::Bar>). Once the parent device is unbound
the pci::Bar within the Devres container won't be accessible any more and will
be dropped internally. So, that's nothing DRM has to take care of.

However, there are cases where it's better to let subsystem abstractions manage
the lifetime of device resources, (e.g. DMA mappings). The relevant thing is,
that we never hand out device resources to a driver in a way that the driver can
extend their lifetime arbitrarily.

There are also other mechanisms that I plan to encode in the type system of
(bus) devices. With [1] I implemented a generic for (bus specific) devices to
indicate their context (e.g. to indicate whether this reference comes from a bus
callback, in which case we'd be allowed to call some methods without
(additional) synchronization). I want to use this to also let abstractions
indicate whether the device is guaranteed to be bound through the entire
duration of subsequent calls to drivers.

So, there are basically three ways to deal with this:

  1. Use type system encodings where possible, since it can be validated at
     compile time and is zero cost on runtime.
  2. Let specific subsystem abstractions take care of device resource lifetimes.
  3. Wrap device resources directly managed by drivers in a Devres container.

Also note that for Devres, I'm working on patches that will ensure that there is
only one single synchronize_rcu() per device / driver binding, rather than for
every Devres container instance.

[1] https://lore.kernel.org/lkml/20250314160932.100165-1-dakr@kernel.org/
