Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9DA248E5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 13:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E612510E074;
	Sat,  1 Feb 2025 12:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e4YFI8tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDA588E45;
 Sat,  1 Feb 2025 12:12:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 063F65C39E1;
 Sat,  1 Feb 2025 12:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FF6C4CED3;
 Sat,  1 Feb 2025 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738411963;
 bh=zqN7AakLlbtVefgeIf3wADi+hbc/wJ/4nlqzKX2S6xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4YFI8tv35vRm6FBikSeoD+z0U2PU15duxLPkIK9EeJSbci27jlSwjE5KnnOTmmVC
 67vmY76tlJ1UcdOGKbybLY1VmJ+uFS2QLF1S6lltNYOh+Jw96Wkl3bshnWNlZOKUq6
 2mDrZnDz+PH2imYaLfPrIkI9UaOjTQ4/Aq+2KlIJyzvEeyNMG64OxqGXKCa/A8jGco
 CZLuw9bjSOw+NPGL3u/h8fuTdi56vb4WHQmkPwhHaQE1bze8vx53qiI3qe6nziogXw
 1LzJX2WnjAX8bHWaIbo3yTREe2k4fVKzZj+KKbMt+ikTE6dj9u8PNU3pH/mziZJwos
 Z3/Tzyqf6WS9Q==
Date: Sat, 1 Feb 2025 13:12:35 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <greg@kroah.com>
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
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <Z54PsyY-fNRBwJQ4@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2025020151-leverage-unadorned-fb05@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020151-leverage-unadorned-fb05@gregkh>
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

On Sat, Feb 01, 2025 at 09:33:28AM +0100, Greg KH wrote:
> On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > +impl Gpu {
> > +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> > +        let spec = GpuSpec::new(&bar)?;
> > +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> > +
> > +        dev_info!(
> > +            pdev.as_ref(),
> > +            "NVIDIA {:?} ({:#x})",
> > +            spec.chipset,
> > +            spec.boot0
> > +        );
> 
> When drivers work properly, they should be quiet, so can you move this
> to dev_dbg()?

Sure, the only reason I made this dev_info!() is because, as an initial
skeleton, the driver isn't doing anything else for now. So, I thought it would
be nice to have some sign of life.

Of course, the intention was to remove this, once there's any other sign of
life.
