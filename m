Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D90EA249DD
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 16:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A529610E301;
	Sat,  1 Feb 2025 15:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EJCX1Mk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA010E301;
 Sat,  1 Feb 2025 15:31:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB8ADA40B4D;
 Sat,  1 Feb 2025 15:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2E4C4CED3;
 Sat,  1 Feb 2025 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738423898;
 bh=BCfoSKNCnyed4pGlqcdaf/sT4JZcLQJ9eWwjsd1k3T0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJCX1Mk8Dmq3aAPY4D3MLsUfCbOAuj9/BvP9obN70pVWwM2hP4YWJT5GdnL1yqzIf
 +JqQapEUi7XJMu2D6/JKuAkjwJZt4Xc0h1SypS2W0gMHdnwGXCzPPcWchY5M7FK3wr
 vrNfYgwSmRTLDS8HR3fd/72TByCC1aIeSHDGlWPU=
Date: Sat, 1 Feb 2025 16:31:34 +0100
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
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
Message-ID: <2025020115-siesta-regress-96ef@gregkh>
References: <20250131220432.17717-1-dakr@kernel.org>
 <2025020151-leverage-unadorned-fb05@gregkh>
 <Z54PsyY-fNRBwJQ4@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z54PsyY-fNRBwJQ4@cassiopeiae>
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

On Sat, Feb 01, 2025 at 01:12:35PM +0100, Danilo Krummrich wrote:
> On Sat, Feb 01, 2025 at 09:33:28AM +0100, Greg KH wrote:
> > On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
> > > +impl Gpu {
> > > +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
> > > +        let spec = GpuSpec::new(&bar)?;
> > > +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> > > +
> > > +        dev_info!(
> > > +            pdev.as_ref(),
> > > +            "NVIDIA {:?} ({:#x})",
> > > +            spec.chipset,
> > > +            spec.boot0
> > > +        );
> > 
> > When drivers work properly, they should be quiet, so can you move this
> > to dev_dbg()?
> 
> Sure, the only reason I made this dev_info!() is because, as an initial
> skeleton, the driver isn't doing anything else for now. So, I thought it would
> be nice to have some sign of life.
> 
> Of course, the intention was to remove this, once there's any other sign of
> life.

Ok, that's fine, just a constant reminder I send everyone for new
drivers when I see this happen :)
