Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FFA2E421
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 07:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC7F10E181;
	Mon, 10 Feb 2025 06:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VCB7sw5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3417410E0AD;
 Mon, 10 Feb 2025 06:25:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E643F5C01DF;
 Mon, 10 Feb 2025 06:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90853C4CED1;
 Mon, 10 Feb 2025 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739168703;
 bh=fSEh8wAH74tf2Pgk9r76wl/MA4PVpqat9Ab0u7aTfV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCB7sw5XNiMlm/DHUR77DE//9H7W9gAlGdrTtVwC32UQD74Y/pIw0hroZHzHzozTS
 ju9CU/kNR469twGAnJ8HRT16YZ8doAnhjqGpdgFfEujoQITAId9UD7m+o6+PFlrv2Z
 weL+yFZzFWgUIBbEmeAN0BHB1GpJIxXLmE7t5jsg=
Date: Mon, 10 Feb 2025 07:24:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpu: nova-core: add initial driver stub
Message-ID: <2025021011-dangling-retrain-f61e@gregkh>
References: <20250209173048.17398-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209173048.17398-1-dakr@kernel.org>
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

On Sun, Feb 09, 2025 at 06:30:24PM +0100, Danilo Krummrich wrote:
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n

Tiny nit, if you happen to respin this, "default n" is always the
default, so there's never a need to specify it.

> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
> +        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let request = |name_| {
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))

How does this match up with the MODULE_FIRMWARE() aliases that end up in
a kernel module so that the tools know to add the firmware to the system
in the proper place (i.e. initramfs or something like that)?

I always thought you needed to individually list the firmware files, or
does the rust implementation now somehow handle that in a programatic
way from strings like this?

thanks,

greg k-h
