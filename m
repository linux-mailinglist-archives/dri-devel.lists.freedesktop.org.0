Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8AA248D9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 13:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8741210E2E6;
	Sat,  1 Feb 2025 12:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KSmtFYCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C2110E2A4;
 Sat,  1 Feb 2025 12:08:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C567A40A06;
 Sat,  1 Feb 2025 12:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3BC4CED3;
 Sat,  1 Feb 2025 12:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738411726;
 bh=K2TI2jChlFirHpPjPa4bMyuM7luLYyAPORy1s4bA3Qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSmtFYCvzk71QyMtkqn+tsY++LPQvDFQ+IdzaJpejd0lsi0xFfZihT4476GSSb1RV
 mKIBw4IvbS3SJll0wAh0y9DqJAxM7L36SPiztyPaQOIOvghW7N46j6/mdhKhkAAXym
 zGcBSb8FULg3Y0dLf++qJ8SRj1cE42Ef/F6nzUhNyDcLX6noFcKBAAowSsB+ruxMFE
 0HWp5/ZXta7CWnF+U2V7EAbEqsYXFpO9Jhefo/mXlGPE0GzWa8Ui3J8mOJOVBmznZV
 G3R2zJ+KC1HHYT1Va0qG+yDPg0eRxdg5R/S8sOBaUE7axmObjsxW270OM4ZZ+ELbh6
 HEs07R/ZQZQYg==
Date: Sat, 1 Feb 2025 13:08:37 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
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
Message-ID: <Z54OxV15TSvK5I9J@cassiopeiae>
References: <20250131220432.17717-1-dakr@kernel.org>
 <CACO55ttSTGTEV7_OTAGXft0JKV7o2DzSYX89ZWKS_+mZRgjEKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACO55ttSTGTEV7_OTAGXft0JKV7o2DzSYX89ZWKS_+mZRgjEKg@mail.gmail.com>
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

On Sat, Feb 01, 2025 at 09:14:48AM +0100, Karol Herbst wrote:
> On Fri, Jan 31, 2025 at 11:04 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > +impl pci::Driver for NovaCore {
> > +    type IdInfo = ();
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> > +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> > +
> > +        pdev.enable_device_mem()?;
> > +        pdev.set_master();
> > +
> > +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;
> 
> I'm curious about the c_str! macro here. Since rust 1.78 one can do
> c"nova-core" to get a &CStr, is this not available in the r4l project
> yet or other reasons why this can't be used?

The kernel is still using kernel::str::CStr instead of core::ffi::CStr.

> Might make sense to clean
> it up kernel wide (outside this patch set) if it's guaranteed to be
> available.

Indeed, there's already an entry in the R4L issue tracker about this [1].
There's also a patch series [2] addressing it, but it seems that the series
didn't get an update for quite a while.

[1] https://github.com/Rust-for-Linux/linux/issues/1075
[2] https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/
