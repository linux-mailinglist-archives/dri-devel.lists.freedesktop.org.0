Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B166B1AAC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 06:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E7E10E083;
	Thu,  9 Mar 2023 05:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADBB10E083
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 05:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DD45542037;
 Thu,  9 Mar 2023 05:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678339521;
 bh=AqKhfVbrCgFD4lko5eegMh8R3NTuYq179Kx+ape/AUw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Wx2g6hHKeCsXfkUgKO1J8pnackR4HNu+sLnMeFYf24PIEcG3Dr33trh9lN1i7NCYH
 iBXJX4d1fX4S9wXV87qH+AvPl3dzcsbiKtejK806oWJHYyRm1eGW50G8xuSxHfHI90
 OGepcjoxSmmGebCwmACxpon1dVMSfoC3C63+EZv+4Vm3TnKk2IvwKX6Q2qTyJYsz/t
 5+dvsMlkXmq1LOhoNPBODzISgSa4rqkkMhvr0r+Dbc3br4rSjTAL1uL1RdnjAHCiq4
 Yn/+w25IH6X8rrPCfs/hGRb5U4eY46B8GERplcPGPsP0U1EjoPg7u5myHLU5UtvHHY
 zV/fpXAc/uWlA==
Message-ID: <488728fc-ada2-20a3-79be-8109d891a8cb@asahilina.net>
Date: Thu, 9 Mar 2023 14:25:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 06/18] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-6-917ff5bc80a8@asahilina.net>
 <ff51483e-2d72-3a7b-0632-58ea36cc3d8e@igalia.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <ff51483e-2d72-3a7b-0632-58ea36cc3d8e@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Mary <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 rust-for-linux@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, asahi@lists.linux.dev,
 linux-media@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2023 22.38, Maíra Canal wrote:
> On 3/7/23 11:25, Asahi Lina wrote:
>> The DRM shmem helper includes common code useful for drivers which
>> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>> this. Drivers can choose the raw GEM implementation or the shmem layer,
>> depending on their needs.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>   drivers/gpu/drm/Kconfig         |   5 +
>>   rust/bindings/bindings_helper.h |   2 +
>>   rust/helpers.c                  |  67 +++++++
>>   rust/kernel/drm/gem/mod.rs      |   3 +
>>   rust/kernel/drm/gem/shmem.rs    | 381 ++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 458 insertions(+)
>>
> 
> [...]
> 
>> +unsafe extern "C" fn gem_create_object<T: DriverObject>(
>> +    raw_dev: *mut bindings::drm_device,
>> +    size: usize,
>> +) -> *mut bindings::drm_gem_object {
>> +    // SAFETY: GEM ensures the device lives as long as its objects live,
>> +    // so we can conjure up a reference from thin air and never drop it.
>> +    let dev = ManuallyDrop::new(unsafe { device::Device::from_raw(raw_dev) });
>> +
>> +    let inner = match T::new(&*dev, size) {
>> +        Ok(v) => v,
>> +        Err(e) => return e.to_ptr(),
>> +    };
>> +
>> +    let p = unsafe {
>> +        bindings::krealloc(
>> +            core::ptr::null(),
>> +            Object::<T>::SIZE,
>> +            bindings::GFP_KERNEL | bindings::__GFP_ZERO,
>> +        ) as *mut Object<T>
>> +    };
>> +
>> +    if p.is_null() {
>> +        return ENOMEM.to_ptr();
>> +    }
>> +
>> +    // SAFETY: p is valid as long as the alloc succeeded
>> +    unsafe {
>> +        addr_of_mut!((*p).dev).write(dev);
>> +        addr_of_mut!((*p).inner).write(inner);
>> +    }
>> +
>> +    // SAFETY: drm_gem_shmem_object is safe to zero-init, and
>> +    // the rest of Object has been initialized
>> +    let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
>> +
>> +    new.obj.base.funcs = &Object::<T>::VTABLE;
>> +    &mut new.obj.base
>> +}
> 
> It would be nice to allow to set wc inside the gem_create_object callback,
> as some drivers do it so, like v3d, vc4, panfrost, lima...

This is actually a bit tricky to do safely, because we can't just have a
callback that takes the drm_gem_shmem_object instance inside
gem_create_object because it is not fully initialized yet from the point
of view of the gem shmem API. Maybe we could have some sort of temporary
proxy object that only lets you do safe things like set map_wc? Or maybe
the new() callback could return something like a ShmemTemplate<T> type
that contains both the inner data and some miscellaneous fields like the
initial map_wc state?

I think we can also just wait until the first user before we do this
though... the goal of the abstractions is to support the APIs we
actually use. I know you need this for vgem, so please feel free to
implement it as a separate patch! I think it's best if you get credit
for the abstraction changes you need, so we can all work together on the
design so it works for everyone's use cases instead of just having me
make all the decisions ^^ (and it's fine if we have to refactor the APIs!)

~~ Lina
