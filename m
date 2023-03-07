Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D56AE245
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FAE10E08E;
	Tue,  7 Mar 2023 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917210E06D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C88A5419B4;
 Tue,  7 Mar 2023 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199200;
 bh=Zh472oEns45I3auQGGAub96i2Eo0aX5dy5UEbHNgwh8=;
 h=From:Subject:Date:To:Cc;
 b=Vr3HugTVzjYPu/pscvNRhlL5lDvANsIW7+6JUGgYTsF4Qdxeeb7rTxlLX6CPVIXS+
 2MqSZ5I01M4mSekqQKwrWhM7yPlf+vr2RH0WXZScRYpON6RaceIg3qk4UNNe9deANr
 2+ZsmhxR0zZUJwLgkyojr5otnQDfvNMlgBZZ5OZunPaupldjzvgtOt42uYCXhjOzMj
 Gnxfzc8oJHj/C6lPBK/+TNg9Rh44yC5UrH9fvuV1JS6h69yXclTWTnJNs226OWyUma
 THD23ESxIHbaa54QkLaQTKpAc4hoqAQ4PLsoqwDEcsuS9/7H2xnJOOKdJv5WAvPzHr
 YPgcse123OZ0w==
From: Asahi Lina <lina@asahilina.net>
Subject: [PATCH RFC 00/18] Rust DRM subsystem abstractions (& preview AGX
 driver)
Date: Tue, 07 Mar 2023 23:25:25 +0900
Message-Id: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVJB2QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDYwNz3aLS4hLdlKJc3STTxDTjZKNEy1RTUyWg8qTE4lTdpKLEvOQMkIb
 0glJ9sDKgMEi6oCg1LbMCbFO0UpCbs1JsbS0A1/N9534AAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=13772;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=Zh472oEns45I3auQGGAub96i2Eo0aX5dy5UEbHNgwh8=;
 b=0m1ZfeAnDyAmGhfyfYHyLLSd6Ka7nJJcraf46q+s5n2YSyjiuBak+v+E2PFMfn/FGBjRFXPjk
 +j7SWAkA/gWDAK5gPcxNtorKB2jh1ZRsEQVlZUWKUllYpZCgT1gFp3x
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone!

This is my first take on the Rust abstractions for the DRM
subsystem. It includes the abstractions themselves, some minor
prerequisite changes to the C side, as well as the drm-asahi GPU driver
(for reference on how the abstractions are used, but not necessarily
intended to land together).

These patches apply on top of the tree at [1], which is based on
6.3-rc1 with a large number of Rust abstraction/support commits added on
top. Most of these are not prerequisites for the DRM abstractions
themselves, but rather only of the driver.

* #1-12 introduce the abstractions, module by module, with minor C
  changes before the dependent abstraction.
  * Patch 10 is a little addition to drm_sched that I ended up needing,
    but I can pull it out of the abstraction into its own patch if
    needed.
* #13-14 add a minor feature to drm/gem and its abstraction used
  by the driver.
* #15-16 introduce the (unstable) asahi UAPI. This is obviously not
  ready for merge yet, but comments are welcome!
* #17 adds a Rust helper macro to handle GPU core/firmware differences.
  This probably belongs in the driver at this point, but right now it
  has to live in rust/macros since there is no mechanism for per-driver
  proc macros.
* #18 adds the driver proper, in one big commit, for reference purposes.

I've been working since mid last year on an Apple AGX GPU driver for
Linux, using the (at the time) out-of-tree Rust support. As part of this
effort, I've been writing safe Rust abstractions for portions of the DRM
subsystem.

Now that Rust itself is upstream, I'd like to get all the abstractions
upstreamed so we can eventually get the driver upstreamed!

These abstractions have been used by the driver since our release in
December [2], in a simpler synchronous-submission form:

* drm::ioctl
* drm::device
* drm::drv
* drm::file
* drm::{gem, gem::shmem}
* drm::mm

This series adds these too, which are used by the explicit sync refactor
of the driver (the version in this series):

* drm::syncobj
* drm::sched
* dma_fence

The major dependencies for the DRM abstractions themselves are:

* [3] rust: error: Add missing wrappers to convert to/from kernel error codes
* [4] rust: Miscellaneous macro improvements
* [5] rust: Add a Sealed trait
* [6] rust: device: Add a minimal RawDevice trait
* [7] rust: Enable the new_uninit feature for kernel and driver crates
* [8] rust: ioctl: Add ioctl number manipulation functions
* [9] rust: sync: Arc: Any downcasting and assume_init()
*     rust: Add `container_of` and `offset_of` macros
*     kernel::sync::mutex and dependencies

Most of these (the ones with links) have already been submitted, and I
expect all of them to land for 6.4 (the mutex one will likely be last,
since there is some refactoring that will happen over the current state
to make it more ergonomic to use). The mutex dep is only necessary for
drm::mm and dma_fence, and transitively drm::syncobj and drm::sched.

Things work! We've had most of the abstractions in production edge
kernels with the driver, and the new explicit sync stuff has passed
quite a few torture tests (this is how we found the drm_sched issue,
patch 11).

The abstractions are intended to be safe (safety review very welcome!).
While writing them, I tried to avoid making any changes to the C side
unless absolutely necessary. I understand that it will probably make
sense to adjust the C side to make some things easier, but I wanted to
start from this as a baseline.

Known issues:

- The existing Rust integration does not currently allow building
  abstractions as modules, so the Rust abstractions are only available
  for DRM components that are built in. I added some extra Kconfig
  symbols to deal with this, so a driver built as a module can depende
  on having those built in. This should go away in the future (but may
  not be ready in time for submission... I understand this probably
  shouldn't be a blocker though?).

- DRM relies heavily on the "subclassing" pattern for driver objects,
  and this doesn't map well to Rust. I tried several approaches for
  various bits, so we can see how they work out. In particular, whether
  wrapper types should pretend to be smart pointers and Deref to their
  inner driver-specific types, and whether they should be marked as
  method receivers (Yuck, internal rustc implementation hacks! But
  Arc<T> already does the same thing and it makes usage in
  driver-implemented callbacks as `self` possible) are things I'd love
  to discuss ^^.

- Only what I need for my driver is implemented (plus a small amount of
  obvious extras where better API completeness makes sense). I think the
  general idea with Rust abstractions is that we add things as they
  become necessary.

- The plain GEM vs. GEM-shmem duality ended up with quite a hairy type
  hierarchy. I'd love to figure out how to make this simpler...

- drm::mm ends up requiring a built-in mutex in the abstraction, instead
  of delegating that to the user with the usual Rust mutability rules.
  This is because nodes can be dropped at any time, and those operations
  need to be synchronized. We could try to avoid forbidding those drops
  or mark the node type !Send, but that would make it a lot less
  ergonomic to use...

I'm looking for feedback on the abstractions of all kinds, so we can
move towards an upstreamable version. Optimistically, I'd love to get
this upstream for 6.5, and the driver for 6.6.

Please feel free to ask any questions about the Rust bits, since I know
a lot of this is new to many of the C folks!

This is a fairly complete driver for Apple AGX G13 and G14 series GPUs.

The driver today supports the Apple M1, M1 Pro, M1 Max, M1 Ultra, and M2
SoCs, across two firmware revisions each. It has an explicit sync UAPI
heavily inspired by the upcoming Intel Xe UAPI, designed with Vulkan
support in mind. On the Mesa side we currently have a Gallium driver
that is mostly already upstream (missing the UAPI bits mostly) and
passes the dEQP GLES2/EGL tests, with most of GLES3.0 passing in
downstream work-in-progress branches. This is a reverse engineered
community driver (we have no hardware documentation of any kind, other
than some hints from aspects shared with PowerVR).

While developing the driver, I tried to make use of Rust's safety and
lifetime features to provide not just CPU-side safety, but also
partial firmware-ABI safety. Thanks to this, it has turned out to be
a very stable driver even though GPU firmware crashes are fatal (no
restart capability, need to reboot!) and the FW/driver interface is a
huge mess of unsafe shared memory structures with complex pointer
chains. There are over 70 ABI types and 3000+ lines of firmware ABI type
definitions that vary between firmware builds and GPU cores...

In a simpler blocking-submission form, it has been shipping in Asahi
Linux edge kernels since December [2], with lots of users and zero (!)
reported oopses (and only a couple reports of GPU firmware crashes,
though that issue should now be fixed). It has survived OOM scenarios
(Rust makes error cleanup easy!), UAPI-level fuzzing, countless broken
Mesa builds, uptimes of 40+ days, and more.

The explicit sync refactor significantly increases performance (and
potential problems), but this version has survived a lot of torture
with dEQP/piglit tests and some manual corner case testing.

In other words, Rust works! ^^

There are some design notes on the driver and further links at [10].

[1] https://github.com/AsahiLinux/linux.git drm-rfc-base-20230307
[2] https://asahilinux.org/2022/12/gpu-drivers-now-in-asahi-linux/
[3] https://lore.kernel.org/rust-for-linux/20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net/T/
[4] https://lore.kernel.org/rust-for-linux/20230224-rust-macros-v1-0-b39fae46e102@asahilina.net/T/
[5] https://lore.kernel.org/rust-for-linux/20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net/T/#m515bad2cff7f5a46f55897e6b73c6c2f1fb2c638
[6] https://lore.kernel.org/rust-for-linux/20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net/T/#m4c64e390c43b3ff1b8470fc8b37eaf87f6e12c94
[7] https://lore.kernel.org/rust-for-linux/CQV7ZNT6LMXI.1XG4YXSH8I7JK@vincent-arch/T/
[8] https://lore.kernel.org/rust-for-linux/61f734d6-1497-755f-3632-3f261b890846@asahilina.net/T/
[9] https://lore.kernel.org/rust-for-linux/20230224-rust-arc-v1-0-568eea613a41@asahilina.net/T/
[10] https://github.com/AsahiLinux/docs/wiki/SW:AGX-driver-notes

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
Asahi Lina (18):
      rust: drm: ioctl: Add DRM ioctl abstraction
      rust: drm: Add Device and Driver abstractions
      rust: drm: file: Add File abstraction
      rust: drm: gem: Add GEM object abstraction
      drm/gem-shmem: Export VM ops functions
      rust: drm: gem: shmem: Add DRM shmem helper abstraction
      rust: drm: mm: Add DRM MM Range Allocator abstraction
      rust: dma_fence: Add DMA Fence abstraction
      rust: drm: syncobj: Add DRM Sync Object abstraction
      drm/scheduler: Add can_run_job callback
      drm/scheduler: Clean up jobs when the scheduler is torn down
      rust: drm: sched: Add GPU scheduler abstraction
      drm/gem: Add a flag to control whether objects can be exported
      rust: drm: gem: Add set_exportable() method
      drm/asahi: Add the Asahi driver UAPI [DO NOT MERGE]
      rust: bindings: Bind the Asahi DRM UAPI
      rust: macros: Add versions macro
      drm/asahi: Add the Asahi driver for Apple AGX GPUs
 drivers/gpu/drm/Kconfig                |   19 +
 drivers/gpu/drm/Makefile               |    1 +
 drivers/gpu/drm/asahi/Kconfig          |   35 +
 drivers/gpu/drm/asahi/Makefile         |    3 +
 drivers/gpu/drm/asahi/alloc.rs         | 1046 ++++++++++++++++++++++++++
 drivers/gpu/drm/asahi/asahi.rs         |   53 ++
 drivers/gpu/drm/asahi/buffer.rs        |  694 ++++++++++++++++++
 drivers/gpu/drm/asahi/channel.rs       |  542 ++++++++++++++
 drivers/gpu/drm/asahi/debug.rs         |  129 ++++
 drivers/gpu/drm/asahi/driver.rs        |  166 +++++
 drivers/gpu/drm/asahi/event.rs         |  229 ++++++
 drivers/gpu/drm/asahi/file.rs          |  718 ++++++++++++++++++
 drivers/gpu/drm/asahi/float.rs         |  381 ++++++++++
 drivers/gpu/drm/asahi/fw/buffer.rs     |  170 +++++
 drivers/gpu/drm/asahi/fw/channels.rs   |  385 ++++++++++
 drivers/gpu/drm/asahi/fw/compute.rs    |  107 +++
 drivers/gpu/drm/asahi/fw/event.rs      |  100 +++
 drivers/gpu/drm/asahi/fw/fragment.rs   |  276 +++++++
 drivers/gpu/drm/asahi/fw/initdata.rs   | 1264 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/asahi/fw/job.rs        |   56 ++
 drivers/gpu/drm/asahi/fw/microseq.rs   |  384 ++++++++++
 drivers/gpu/drm/asahi/fw/mod.rs        |   15 +
 drivers/gpu/drm/asahi/fw/types.rs      |  233 ++++++
 drivers/gpu/drm/asahi/fw/vertex.rs     |  177 +++++
 drivers/gpu/drm/asahi/fw/workqueue.rs  |  168 +++++
 drivers/gpu/drm/asahi/gem.rs           |  301 ++++++++
 drivers/gpu/drm/asahi/gpu.rs           | 1088 +++++++++++++++++++++++++++
 drivers/gpu/drm/asahi/hw/mod.rs        |  522 +++++++++++++
 drivers/gpu/drm/asahi/hw/t600x.rs      |  140 ++++
 drivers/gpu/drm/asahi/hw/t8103.rs      |   80 ++
 drivers/gpu/drm/asahi/hw/t8112.rs      |   82 +++
 drivers/gpu/drm/asahi/initdata.rs      |  777 ++++++++++++++++++++
 drivers/gpu/drm/asahi/mem.rs           |  133 ++++
 drivers/gpu/drm/asahi/microseq.rs      |   61 ++
 drivers/gpu/drm/asahi/mmu.rs           | 1249 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/asahi/object.rs        |  704 ++++++++++++++++++
 drivers/gpu/drm/asahi/place.rs         |  343 +++++++++
 drivers/gpu/drm/asahi/queue/common.rs  |   52 ++
 drivers/gpu/drm/asahi/queue/compute.rs |  371 ++++++++++
 drivers/gpu/drm/asahi/queue/mod.rs     |  725 ++++++++++++++++++
 drivers/gpu/drm/asahi/queue/render.rs  | 1173 +++++++++++++++++++++++++++++
 drivers/gpu/drm/asahi/regs.rs          |  387 ++++++++++
 drivers/gpu/drm/asahi/slotalloc.rs     |  292 ++++++++
 drivers/gpu/drm/asahi/util.rs          |   44 ++
 drivers/gpu/drm/asahi/workqueue.rs     |  880 ++++++++++++++++++++++
 drivers/gpu/drm/drm_gem.c              |    1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c |    9 +-
 drivers/gpu/drm/drm_prime.c            |    5 +
 drivers/gpu/drm/scheduler/sched_main.c |   37 +-
 include/drm/drm_gem.h                  |    8 +
 include/drm/drm_gem_shmem_helper.h     |    3 +
 include/drm/gpu_scheduler.h            |    8 +
 include/uapi/drm/asahi_drm.h           |  556 ++++++++++++++
 rust/bindings/bindings_helper.h        |   14 +
 rust/helpers.c                         |  168 +++++
 rust/kernel/dma_fence.rs               |  532 ++++++++++++++
 rust/kernel/drm/device.rs              |   76 ++
 rust/kernel/drm/drv.rs                 |  342 +++++++++
 rust/kernel/drm/file.rs                |  113 +++
 rust/kernel/drm/gem/mod.rs             |  384 ++++++++++
 rust/kernel/drm/gem/shmem.rs           |  381 ++++++++++
 rust/kernel/drm/ioctl.rs               |  147 ++++
 rust/kernel/drm/mm.rs                  |  309 ++++++++
 rust/kernel/drm/mod.rs                 |   13 +
 rust/kernel/drm/sched.rs               |  358 +++++++++
 rust/kernel/drm/syncobj.rs             |   77 ++
 rust/kernel/lib.rs                     |    4 +
 rust/macros/lib.rs                     |    7 +
 rust/macros/versions.rs                |  267 +++++++
 69 files changed, 20569 insertions(+), 5 deletions(-)
---
base-commit: c9eb15274c9861026682a6b3e645891fccf88e07
change-id: 20230307-rust-drm-b5af3c2a9e55

Thank you,
~~ Lina

