Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE16D9CFD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FDF10EC31;
	Thu,  6 Apr 2023 16:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4F910EC31
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:05:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0BE7942529;
 Thu,  6 Apr 2023 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680797107;
 bh=W0GosPfDacdVDq1FAyzUHCQaB9zv6PQPmS1vLdHnKQA=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=iAfV7p0T+1eaS8GrScZ1pOIMzHRYAc/lPATW7AAtA9h+sKU5BiWtfPkREufz1HKGs
 289tD5z3EqWeQmT+Wi/W9zW5tx+pe0yU8FSO9ZwIrl/efPjomrdN9ofSf0GkhDPVq4
 312c42FtGS43DfHFW3X0m20AvxpuXRHDtE/5LITrVWvAFfqRP076xWGv+NNPrEjuGY
 5EqW1gBzsw/dAMJFDLBabsvNmBNiKgqTIQUF1s2xQGm1EtvNzVn6gBy8RWTXRkVcYY
 kSl6RWXG4ypNZ22578cjGOjOaKw9GT2aqWVhytUD/H22QtntuZHq0Mg1Rh0bdJvg9t
 BQAqcMsvvJInA==
Message-ID: <d2615710-28c3-2bbb-e0b5-b87eb8d1aa8f@asahilina.net>
Date: Fri, 7 Apr 2023 01:04:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 09/18] rust: drm: syncobj: Add DRM Sync Object
 abstraction
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-9-917ff5bc80a8@asahilina.net>
 <ZC1qn/VCVpudivh9@phenom.ffwll.local>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ZC1qn/VCVpudivh9@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 05/04/2023 21.33, Daniel Vetter wrote:
> On Tue, Mar 07, 2023 at 11:25:34PM +0900, Asahi Lina wrote:
>> DRM Sync Objects are a container for a DMA fence, and can be waited on
>> signaled, exported, and imported from userspace. Add a Rust abstraction
>> so Rust DRM drivers can support this functionality.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>   rust/bindings/bindings_helper.h |  1 +
>>   rust/helpers.c                  | 19 ++++++++++
>>   rust/kernel/drm/mod.rs          |  1 +
>>   rust/kernel/drm/syncobj.rs      | 77 +++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 98 insertions(+)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index 705af292a5b4..b6696011f3a4 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -12,6 +12,7 @@
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>>   #include <drm/drm_ioctl.h>
>> +#include <drm/drm_syncobj.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>>   #include <linux/dma-fence.h>
>> diff --git a/rust/helpers.c b/rust/helpers.c
>> index 8e906a7a7d8a..11965b1e2f4e 100644
>> --- a/rust/helpers.c
>> +++ b/rust/helpers.c
>> @@ -20,6 +20,7 @@
>>   
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>> +#include <drm/drm_syncobj.h>
>>   #include <linux/bug.h>
>>   #include <linux/build_bug.h>
>>   #include <linux/device.h>
>> @@ -461,6 +462,24 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
>>   }
>>   EXPORT_SYMBOL_GPL(rust_helper_drm_vma_node_offset_addr);
>>   
>> +void rust_helper_drm_syncobj_get(struct drm_syncobj *obj)
>> +{
>> +	drm_syncobj_get(obj);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_get);
>> +
>> +void rust_helper_drm_syncobj_put(struct drm_syncobj *obj)
>> +{
>> +	drm_syncobj_put(obj);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_put);
>> +
>> +struct dma_fence *rust_helper_drm_syncobj_fence_get(struct drm_syncobj *syncobj)
>> +{
>> +	return drm_syncobj_fence_get(syncobj);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_drm_syncobj_fence_get);
>> +
>>   #ifdef CONFIG_DRM_GEM_SHMEM_HELPER
>>   
>>   void rust_helper_drm_gem_shmem_object_free(struct drm_gem_object *obj)
>> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
>> index 73fab2dee3af..dae98826edfd 100644
>> --- a/rust/kernel/drm/mod.rs
>> +++ b/rust/kernel/drm/mod.rs
>> @@ -8,3 +8,4 @@ pub mod file;
>>   pub mod gem;
>>   pub mod ioctl;
>>   pub mod mm;
>> +pub mod syncobj;
>> diff --git a/rust/kernel/drm/syncobj.rs b/rust/kernel/drm/syncobj.rs
>> new file mode 100644
>> index 000000000000..10eed05eb27a
>> --- /dev/null
>> +++ b/rust/kernel/drm/syncobj.rs
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +//! DRM Sync Objects
>> +//!
>> +//! C header: [`include/linux/drm/drm_syncobj.h`](../../../../include/linux/drm/drm_syncobj.h)
>> +
>> +use crate::{bindings, dma_fence::*, drm, error::Result, prelude::*};
>> +
>> +/// A DRM Sync Object
>> +///
>> +/// # Invariants
>> +/// ptr is a valid pointer to a drm_syncobj and we own a reference to it.
>> +pub struct SyncObj {
>> +    ptr: *mut bindings::drm_syncobj,
>> +}
>> +
>> +impl SyncObj {
>> +    /// Looks up a sync object by its handle for a given `File`.
>> +    pub fn lookup_handle(file: &impl drm::file::GenericFile, handle: u32) -> Result<SyncObj> {
>> +        // SAFETY: The arguments are all valid per the type invariants.
>> +        let ptr = unsafe { bindings::drm_syncobj_find(file.raw() as *mut _, handle) };
> 
> Just an aside, but the semantics of this are nasty: You're not allowed to
> hold any locks while calling this. We have runtime checks for that (if you
> enable lockdep), but I don't see any way to encode that on the rust side
> and check it at compile time :-/

Oof, yeah, that's not possible today. Maybe in the future though, it's 
similar to the execution context stuff...

> 
>> +
>> +        if ptr.is_null() {
>> +            Err(ENOENT)
>> +        } else {
>> +            Ok(SyncObj { ptr })
>> +        }
>> +    }
>> +
>> +    /// Returns the DMA fence associated with this sync object, if any.
>> +    pub fn fence_get(&self) -> Option<Fence> {
>> +        let fence = unsafe { bindings::drm_syncobj_fence_get(self.ptr) };
>> +        if fence.is_null() {
>> +            None
>> +        } else {
>> +            // SAFETY: The pointer is non-NULL and drm_syncobj_fence_get acquired an
>> +            // additional reference.
>> +            Some(unsafe { Fence::from_raw(fence) })
>> +        }
>> +    }
>> +
>> +    /// Replaces the DMA fence with a new one, or removes it if fence is None.
>> +    pub fn replace_fence(&self, fence: Option<&Fence>) {
>> +        unsafe {
>> +            bindings::drm_syncobj_replace_fence(
>> +                self.ptr,
>> +                fence.map_or(core::ptr::null_mut(), |a| a.raw()),
>> +            )
>> +        };
>> +    }
>> +
>> +    /// Adds a new timeline point to the syncobj.
>> +    pub fn add_point(&self, chain: FenceChain, fence: &Fence, point: u64) {
>> +        // SAFETY: All arguments should be valid per the respective type invariants.
>> +        // This takes over the FenceChain ownership.
>> +        unsafe { bindings::drm_syncobj_add_point(self.ptr, chain.into_raw(), fence.raw(), point) };
>> +    }
>> +}
>> +
>> +impl Drop for SyncObj {
>> +    fn drop(&mut self) {
>> +        // SAFETY: We own a reference to this syncobj.
>> +        unsafe { bindings::drm_syncobj_put(self.ptr) };
>> +    }
>> +}
>> +
>> +impl Clone for SyncObj {
>> +    fn clone(&self) -> Self {
>> +        // SAFETY: `ptr` is valid per the type invariant and we own a reference to it.
>> +        unsafe { bindings::drm_syncobj_get(self.ptr) };
> 
> So yeah syncobj are refcounted because they're shareable uapi objects (you
> can pass them around as fd), but that really should be entirely the
> subsystems business, not for drivers.
> 
> This is kinda like drm_file, which is also refcounted (by virtue of
> hanging of struct file), but the refcounting is entirely handled by the
> vfs and all drivers get is a borrowed reference, which nicely bounds the
> lifetime to the callback (which is usually an ioctl handler). I think we
> want the same semantics for syncobj, because if a driver is hanging onto a
> syncobj for longer than the ioctl. If my rust understanding is right we'd
> get that by dropping Clone here and relying on lookup_handle only being
> able to return stuff that's bound by the drm_file?

Yeah, that should work! Lifetimes are perfect for this kind of stuff. I 
need to test it out and see what the right way to do it is (lifetime 
parameter or actual reference straight into the drm_syncobj) and see how 
it fits into the driver but I don't see why it wouldn't work, since I 
don't hold onto sync objects for longer than the ioctl. Might just need 
some minor refactoring since the current driver ioctl code wasn't 
written with lifetimes in mind ^^

> People are talking about drivers holding onto syncobj for longer, but I'm
> still not sold on the idea that this is any good and doesn't just bend the
> dma_fence and syncobj rules a bit too much over the breaking point. For
> kernel drivers it really should be just a different way to lookup and
> return dma_fence from the ioctl, pretty much matching what you could also
> do with sync_file (but since syncobj provides generic compat ioctl to
> convert to/from sync_file drivders only need to handle syncobj).

Yeah, if you think restricting the API for this on the Rust side makes 
sense it works for me! I'm all for not abstracting features that aren't 
considered particularly useful/safe/a good idea.

> -Daniel
> 
> 
>> +        SyncObj { ptr: self.ptr }
>> +    }
>> +}
>> +
>> +// SAFETY: drm_syncobj operations are internally locked.
>> +unsafe impl Sync for SyncObj {}
>> +unsafe impl Send for SyncObj {}
>>
>> -- 
>> 2.35.1
>>
> 

~~ Lina

