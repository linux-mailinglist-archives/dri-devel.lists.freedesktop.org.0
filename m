Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A22A295F9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E82810E38E;
	Wed,  5 Feb 2025 16:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kdrczVAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329E410E396;
 Wed,  5 Feb 2025 16:10:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E4C15C6C70;
 Wed,  5 Feb 2025 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B45C4CED1;
 Wed,  5 Feb 2025 16:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738771852;
 bh=ImZ/l/99sI+3iifnDXr8jZw00Dl/R1qh0lxcrzFqNhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kdrczVAzsDMnZeoCyMdOwHLTKriaztL8DjPls05K+qiB5YPdMGzwPaO6msSBpIJ4U
 nKmGvZbaX1wFVQsJfUp0I6YxlRIKY5cpVq/GNY4bqQJkQPq/w12Qlw+ZQi8lRHDr8G
 BOBBWcQIM+ObyoHy0MWjeddIVnRc2s/IxfGUtDsFu6y+IfYGLGHrMO3Q61dL259w9V
 zdeGwMB+sZf2+WeVcByhiNVWHgsqUAhNdZvpXsxsFDj3PA2y2032sLLETBOCzXX68S
 HdaYG50ATuGzWDMTNTizMEII+fyQSFRxWzIw5ks2Vex92iohJzyNrjPRZCpBL2UfEc
 soi79DcKy0NCQ==
Date: Wed, 5 Feb 2025 17:10:44 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6ONhNOAtfWsKIRg@cassiopeiae>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205155646.00003c2f@nvidia.com>
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

On Wed, Feb 05, 2025 at 03:56:46PM +0200, Zhi Wang wrote:
> On Tue,  4 Feb 2025 20:03:12 +0100
> Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > +
> > +Generic register abstraction
> > +----------------------------
> > +
> > +Work out how register constants and structures can be automatically generated
> > +through generalized macros.
> > +
> > +Example:
> > +
> > +.. code-block:: rust
> > +
> > +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> > +	   MINOR_REVISION(3:0, RO),
> > +	   MAJOR_REVISION(7:4, RO),
> > +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> > +	])
> > +
> 
> I think it is better not to tie this to pci::Bar and its operations. It
> would be better to have a intermediate container as the macro param. The
> container holds the register region vaddr pointer, size, read/write traits.

I think for this particular example we want to tie it to the pci::Bar on way or
the other.

But yes, the idea would be that any `dyn Io` works.

> The macro expands it from there, thus, we can also use this on firmware
> memory structures, e.g. GSP WPR2 info.
> 
> Probably we are looking for a even more generic solution/type for deferring
> a structure in the vaddr and generating the the accessing methods
> accordingly. It might also be useful later in GSP message queue
> manipulation, ELF header extraction, page table manipulation? (to avoid
> ambitious unsafe statements in the rust driver)

I think it's hard to predict to what extend we can (or want to) generalize this.
But I think those are good thoughts that should be considered working on this.

If you come up with a few lines to broaden the scope, I'm happy to add them to
this section.

> 
> > +This could expand to something like:
> > +
> > +.. code-block:: rust
> > +
> > +	const BOOT0_OFFSET: usize = 0x00000000;
> > +	const BOOT0_MINOR_REVISION_SHIFT: u8 = 0;
> > +	const BOOT0_MINOR_REVISION_MASK: u32 = 0x0000000f;
> > +	const BOOT0_MAJOR_REVISION_SHIFT: u8 = 4;
> > +	const BOOT0_MAJOR_REVISION_MASK: u32 = 0x000000f0;
> > +	const BOOT0_REVISION_SHIFT: u8 = BOOT0_MINOR_REVISION_SHIFT;
> > +	const BOOT0_REVISION_MASK: u32 = BOOT0_MINOR_REVISION_MASK | BOOT0_MAJOR_REVISION_MASK;
> > +
> > +	struct Boot0(u32);
> > +
> > +	impl Boot0 {
> > +	   #[inline]
> > +	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
> > +	      Self(bar.readl(BOOT0_OFFSET))
> > +	   }
> > +
> > +	   #[inline]
> > +	   fn minor_revision(&self) -> u32 {
> > +	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
> > +	   }
> > +
> > +	   #[inline]
> > +	   fn major_revision(&self) -> u32 {
> > +	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
> > +	   }
> > +
> > +	   #[inline]
> > +	   fn revision(&self) -> u32 {
> > +	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
> > +	   }
> > +	}
> > +
> > +Usage:
> > +
> > +.. code-block:: rust
> > +
> > +	let bar = bar.try_access().ok_or(ENXIO)?;
> > +
> > +	let boot0 = Boot0::read(&bar);
> > +	pr_info!("Revision: {}\n", boot0.revision());
> > +
> > +| Complexity: Advanced
> > +
> > +Delay / Sleep abstractions
> > +--------------------------
> 
> ...
> 
> > +
> > +VRAM memory allocator
> > +---------------------
> > +
> > +Investigate options for a VRAM memory allocator.
> > +
> > +Some possible options:
> > +  - Rust abstractions for
> > +    - RB tree (interval tree) / drm_mm
> > +    - maple_tree
> > +  - native Rust collections
> > +
> > +| Complexity: Advanced
> > +
> 
> I am leaning towards having the abstractions at a high level APIs, e.g.
> wrapping drm_mm and possibly the rust side can choose the backend type of
> drm_mm if it really needs a different type of data structure other
> than default supported by drm_mm. If we need more type of data structures,
> we can extend drm_mm in C side. That can save us some efforts.

I think we have to work out the advantages and disadvantages and see if there
are any opportunities for synergies.

For instance, in case we end up with separate VMM management in nova-core and
nova-drm, there might be synergies for the other options.

> 
> > +Instance Memory
> > +---------------
> > +
> > +Implement support for instmem (bar2) used to store page tables.
> > +
> > +| Complexity: Intermediate
> > +| Contact: Dave Airlie
> > +
> > +GPU System Processor (GSP)
> > +==========================
> 
> ...
> 
> > +
> > +External APIs
> > +=============
> > +
> > +nova-core base API
> > +------------------
> > +
> > +Work out the common pieces of the API to connect 2nd level drivers, i.e. vGPU
> > +manager and nova-drm.
> > +
> > +| Complexity: Advanced
> > +
> > +vGPU manager API
> > +----------------
> > +
> > +Work out the API parts required by the vGPU manager, which are not covered by
> > +the base API.
> > +
> > +| Complexity: Advanced
> > +
> > +nova-core C API
> > +---------------
> > +
> > +Implement a C wrapper for the APIs required by the vGPU manager driver.
> > +
> > +| Complexity: Intermediate
> 
> Thanks for calling this out.
> 
> I believe the "vGPU manager API" is not a standalone task, as many of the
> required APIs will intersect with other components in nova-core.
> 
> As one of nova-core’s users, vGPU represents the simplest use case to get
> started with, offering significant value to both nova-core and its users
> in the near term.
> 
> I was thinking that if we could align with the folks on making vGPU +
> nova-core our initial short-term goal, it would be beneficial for
> nova-drm's development, since the APIs required for nova-drm are a
> superset of those needed for vGPU.

I think it is common understanding to have nova-core + vGPU as a first
milestone.

However, I think that we should also put some effort into the nova-drm side of
things to not miss out on potential design contraints on both ends, nova-core
<-> nova-drm as well as nova-drm <-> DRM core, since there are also other
upcoming Rust DRM drivers.

> 
> It would be valuable for us to be involved in key areas related to vGPU,
> including:
> 
> - Task review
> - Design discussions
> - Unit testing

I'm a bit confused about who specifically is meant with "we", "the folks" and
"us" in your statements above.

But of course everyone is welcome to be involved into the aspects mentioned
above and the project in general. :-)

> 
> Additionally, we are working on a vGPU requirements document that will
> outline the complete API needs for vGPU beyond those already covered in
> the RFC patches. Hope that will be published soon.

I think this will be very useful for nova project!

> 
> > +
> > +Testing
> > +=======
> > +
> > +CI pipeline
> > +-----------
> > +
> > +Investigate option for continuous integration testing.
> > +
> > +This can go from as simple as running KUnit tests over running (graphics) CTS to
> > +booting up (multiple) guest VMs to test VFIO use-cases.
> > +
> > +It might also be worth to consider the introduction of a new test suite directly
> > +sitting on top of the uAPI for more targeted testing and debugging. There may be
> > +options for collaboration / shared code with the Mesa project.
> > +
> > +| Complexity: Advanced
> > diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
> > new file mode 100644
> > index 000000000000..28a959f51c2c
> > --- /dev/null
> > +++ b/Documentation/gpu/nova/guidelines.rst
> > @@ -0,0 +1,73 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> 
> I think this will develop into a maintainer handbook in the future which
> reflects maintainer's requirements, thoughts, tips...maybe we can make it
> explicit? I think it is rules of book that we agree to follow.
> 
> A similar one can be found here.
> https://lore.kernel.org/kvm/20230411171651.1067966-1-seanjc@google.com/

Yes, that's the idea. Is there anything additional you'd like to see added for
this initial commit?

> 
> > +==========
> > +Guidelines
> > +==========
> > +
> > +This document describes the general project guidelines that apply to nova-core
> > +and nova-drm.
> > +
> > +Language
> > +========
> > +
> > +The Nova project uses the Rust programming language. In this context, the
> > +following rules apply.
> > +
> > +- Unless technically necessary otherwise (e.g. uAPI), any driver code is written
> > +  in Rust.
> > +
> > +- Direct FFI calls to C kernel APIs must be avoided; instead C kernel APIs
> > +  should be accessed through shared Rust abstractions.
> > +
> > +- Unless technically necessary, unsafe Rust code must be avoided. In case of
> > +  technical necessity, unsafe code should be isolated in a separate component
> > +  providing a safe API for other driver code to use.
> 
> Also need to comment why the unsafe is the last possible approach to go.
> the last thing we want to see is "unsafe" flying here and there in a rust
> driver. :)

You mean adding an explanation as for why to avoid "unsafe"? I thought it's
probably rather obvious.

But I'm also fine adding an explanation, suggestions?
