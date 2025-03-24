Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B48A6DDF4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB11510E3BD;
	Mon, 24 Mar 2025 15:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="GZsM9Zg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A806D10E371
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 15:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742829269; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DYRmkZx9sE5SMUtqUFXomoskrRBYFm5JMsDAWIZo4Ejci7i01WOdacT04at6YteccWNxRns6/H95QfR6VXVpMU7M5WUEBqrBSWIGaxerQUwpx43UVBQ8rRlGR+Z5YfaeCKRQ8uZBIslK7W8GD5Wr/8Hfk5WR0X+NimgTtRseeIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742829269;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fHt+ZqVcnPeLawl8u8AoaiJHBPS3Pj33Q76eBWyxJ+s=; 
 b=KZ78gsDm7M2o0QViQ1buJ2pfuQpBJYHqUHMH0WyuawozVRQCZf0cx3hjLhIHi86CmNj5xR5UvYfnxMYftXCRbdQQnpvSgt3tJCVbWaKRGxI65DnsQLWB7ChG/2Kd8PxjsGX5VOlImqJXMOO0cbm8Ud/q26lYjOW+arG7YwFRFKM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742829269; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=fHt+ZqVcnPeLawl8u8AoaiJHBPS3Pj33Q76eBWyxJ+s=;
 b=GZsM9Zg54rb5m8k9Cz7SJyU4/2HmbRUF1IHkxJirez16A4oImVoQDumo7KHrvYeq
 k/6KvoVnhxuHiuE04fFyD2AlMfWfKoKoSph/x0aVFhypeo8q++Ksm6IqiHeSQHmEcoj
 6cc/YjawHx2JuvivwRYCMfFGzsskWbmQIAftVG+c=
Received: by mx.zohomail.com with SMTPS id 174282926674419.243781813271767;
 Mon, 24 Mar 2025 08:14:26 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/2] Add a Rust GPUVM abstraction
Date: Mon, 24 Mar 2025 12:13:53 -0300
Message-Id: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALF24WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMD3fSC0rJcXSPLFONUA3MjszRjEyWg2oKi1LTMCrA50bG1tQDGoJV
 YVwAAAA==
X-Change-ID: 20250320-gpuvm-29d3e0726f34
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

Changes from v0:
  This version changes how `LockedGpuVm` operates. The previous code assumed
that the interval tree would be protected if all the associated GEM's resvs
were locked, but this is completely unrelated. In fact, this initial version
only aims to support the core VA range management feature of GPUVM, and not any
of the "convenience" functions like "exec_lock()" and friends, so this function
was removed accordingly.
  
  LockedGpuVm is now produced by a call to GpuVm::lock(). This takes a generic
guard type to signal that the driver-specific locks have been acquired in order
to protect the VMs tree, and hence its view of the address space. This approach
is somewhat similar to CondVar, but also incurs in the same pitfall: it is up
to the caller to give meaning to the guard by ensuring that it actually
protects against concurrent access to the VM. Maybe this is a good candidate to
the upcoming "Pitfall" docs section?

  Note that LockedGpuVm::obj was removed. I'm not really sure why this field
was there in the first place, but callers should indicate the object through
the sm_map() and sm_unmap() APIs instead.

  I am not sure why GpuVm::inner uses UnsafeCell, though. I did not touch this
so that we can first discuss whether UnsafeCell is really needed.

  The docs were also updated. Care was taken to reuse the C documentation as
much as possible.

  Itemized changes: 

- Rebased on top of nova-drm
  - Use `srctree` in the docs
  - Add docs as appropriate and remove #[allow(missing_docs)]
  - Remove `impl DriverGpuVa for ()`. Drivers can to that themselves, if they want.
  - Added #[inline] to getters, as Rust cannot inline across crates otherwise (unless this changed recently?)
  - Exposed `drm_gpuva_op_unmap::keep`.
  - Removed `pub(super)` from unsafe fns meant to be called from the C code. 
  - Added "# Safety" blocks to the above.
  - Removed `exec_lock_gem_object()`.
  - Removed `exec_lock()`
  - Removed `LockedGpuVm::vm_exec`. This initial version does not support `exec` calls at all.
  - By the same token, removed `LockedGpuVm::drop()`
  - Removed `LockedGpuVm::obj`. This object has to be passed explicitly.

---
Asahi Lina (2):
      rust: helpers: Add bindings/wrappers for dma_resv
      rust: drm: Add GPUVM abstraction

 rust/bindings/bindings_helper.h |   5 +-
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm_gpuvm.c        |  29 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm.rs        | 790 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 6 files changed, 840 insertions(+), 1 deletion(-)
---
base-commit: e7de41cc4b01dd5500a0c2533c64bdb3f5360567
change-id: 20250320-gpuvm-29d3e0726f34

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

