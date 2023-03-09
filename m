Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98A6B235B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080F10E7F7;
	Thu,  9 Mar 2023 11:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C8F10E7F7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMHCZo1nfWgGCidWepQEn7H90NLc3gJryuVWslIXuZA=; b=Hm4Ruk+SKwCl9vnxq7JID6VfZ8
 71NIoLHwwm5d071hkjEKwAe506Od8rhBhjdMWZrvpt2PqgDAP3YRnoHbWXAdNHE5EwOkSluUiGVXc
 MSK3vv/KdrYzqfPIR0rzSuqr24FXifCAwO/q/+V+YtavCaueRluBZpdCr+FlMFEyfNj+5Y4J828GX
 MrovSfRm+l2SPuzXfu2ykFXPfPOiMAfa+WJFXFWr9WYZxZNe2u5wF2ARie8l6+lrf9yT063JoT893
 kNHBQ1tAJBZmwaul2iDCfJx/zFv+CMX5Ql8Nwsx9kybCzBZ+O6S+gXJk9zHzoYfraA5CVs3PHyifx
 KAA9gExQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1paEkC-001VgO-Br; Thu, 09 Mar 2023 12:47:36 +0100
Message-ID: <8e091158-7826-1215-e717-081b25f48108@igalia.com>
Date: Thu, 9 Mar 2023 08:47:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 06/18] rust: drm: gem: shmem: Add DRM shmem helper
 abstraction
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
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
 <488728fc-ada2-20a3-79be-8109d891a8cb@asahilina.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <488728fc-ada2-20a3-79be-8109d891a8cb@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 3/9/23 02:25, Asahi Lina wrote:
> On 08/03/2023 22.38, Maíra Canal wrote:
>> On 3/7/23 11:25, Asahi Lina wrote:
>>> The DRM shmem helper includes common code useful for drivers which
>>> allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>>> this. Drivers can choose the raw GEM implementation or the shmem layer,
>>> depending on their needs.
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>    drivers/gpu/drm/Kconfig         |   5 +
>>>    rust/bindings/bindings_helper.h |   2 +
>>>    rust/helpers.c                  |  67 +++++++
>>>    rust/kernel/drm/gem/mod.rs      |   3 +
>>>    rust/kernel/drm/gem/shmem.rs    | 381 ++++++++++++++++++++++++++++++++++++++++
>>>    5 files changed, 458 insertions(+)
>>>
>>
>> [...]
>>
>>> +unsafe extern "C" fn gem_create_object<T: DriverObject>(
>>> +    raw_dev: *mut bindings::drm_device,
>>> +    size: usize,
>>> +) -> *mut bindings::drm_gem_object {
>>> +    // SAFETY: GEM ensures the device lives as long as its objects live,
>>> +    // so we can conjure up a reference from thin air and never drop it.
>>> +    let dev = ManuallyDrop::new(unsafe { device::Device::from_raw(raw_dev) });
>>> +
>>> +    let inner = match T::new(&*dev, size) {
>>> +        Ok(v) => v,
>>> +        Err(e) => return e.to_ptr(),
>>> +    };
>>> +
>>> +    let p = unsafe {
>>> +        bindings::krealloc(
>>> +            core::ptr::null(),
>>> +            Object::<T>::SIZE,
>>> +            bindings::GFP_KERNEL | bindings::__GFP_ZERO,
>>> +        ) as *mut Object<T>
>>> +    };
>>> +
>>> +    if p.is_null() {
>>> +        return ENOMEM.to_ptr();
>>> +    }
>>> +
>>> +    // SAFETY: p is valid as long as the alloc succeeded
>>> +    unsafe {
>>> +        addr_of_mut!((*p).dev).write(dev);
>>> +        addr_of_mut!((*p).inner).write(inner);
>>> +    }
>>> +
>>> +    // SAFETY: drm_gem_shmem_object is safe to zero-init, and
>>> +    // the rest of Object has been initialized
>>> +    let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
>>> +
>>> +    new.obj.base.funcs = &Object::<T>::VTABLE;
>>> +    &mut new.obj.base
>>> +}
>>
>> It would be nice to allow to set wc inside the gem_create_object callback,
>> as some drivers do it so, like v3d, vc4, panfrost, lima...
> 
> This is actually a bit tricky to do safely, because we can't just have a
> callback that takes the drm_gem_shmem_object instance inside
> gem_create_object because it is not fully initialized yet from the point
> of view of the gem shmem API. Maybe we could have some sort of temporary
> proxy object that only lets you do safe things like set map_wc? Or maybe
> the new() callback could return something like a ShmemTemplate<T> type
> that contains both the inner data and some miscellaneous fields like the
> initial map_wc state?

I see that most drivers use this hook to set map_wc and set funcs. What
are your thoughts on something like this?

Best Regards,
- Maíra Canal

 From 61f23f4a39028c9d34d3df58d7640bfcd64e9af9 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Date: Thu, 9 Mar 2023 08:24:09 -0300
Subject: [PATCH] rust: drm: gem: shmem: Set map_wc on gem_create_object
  callback
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some drivers use the gem_create_object callback to define the mapping of
the object write-combined (map_wc). Currently, the DRM Rust abstractions
doesn't allow such operation. So, add a method to the DriverObject trait
to allow drivers to set map_wc on the gem_create_object callback. By
default, the method returns false, which is the shmem default value.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
  rust/kernel/drm/gem/shmem.rs | 7 +++++++
  1 file changed, 7 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 8f17eba0be99..a7f33b66f60a 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -24,6 +24,11 @@ use gem::BaseObject;
  pub trait DriverObject: gem::BaseDriverObject<Object<Self>> {
      /// Parent `Driver` for this object.
      type Driver: drv::Driver;
+
+    /// Define the map object write-combined
+    fn set_wc() -> bool {
+        false
+    }
  }

  // FIXME: This is terrible and I don't know how to avoid it
@@ -110,6 +115,8 @@ unsafe extern "C" fn gem_create_object<T: DriverObject>(
      let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };

      new.obj.base.funcs = &Object::<T>::VTABLE;
+    new.obj.map_wc = <T>::set_wc();
+
      &mut new.obj.base
  }

> 
> I think we can also just wait until the first user before we do this
> though... the goal of the abstractions is to support the APIs we
> actually use. I know you need this for vgem, so please feel free to
> implement it as a separate patch! I think it's best if you get credit
> for the abstraction changes you need, so we can all work together on the
> design so it works for everyone's use cases instead of just having me
> make all the decisions ^^ (and it's fine if we have to refactor the APIs!)
> 
> ~~ Lina
