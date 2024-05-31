Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77228D5C06
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 09:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62DB14A042;
	Fri, 31 May 2024 07:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJo+7ljg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F231614A042;
 Fri, 31 May 2024 07:50:51 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7024df1b183so10842b3a.3; 
 Fri, 31 May 2024 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717141851; x=1717746651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=r2XdzJ6IzRamTT3nhFH8XeJzlNSkKuRVnD58Iktcp0o=;
 b=PJo+7ljgDuPo9xXHjFPU4UaUUBxup0jn8gpHop+pneojV5A02ndCi6L+whfcCx9VKO
 huB6LchRy77yhAKT8/1RfshnRp2GWYK67D8NLrOVAiD6qo6Zq4BCLdypwlkloUZxsUrg
 Ft+4i16QmCY1bgmWYZCutNo/dLo2NT1x43lVZ09/6ZzAQc73zbKjfhw3VStA9yMsbjaZ
 BnLjt6xXxqkZp1Ll/fKT/HHrQFtimezvJzZdlpOK9T8BEzLB+dj7j+r2Aivk3men5qhG
 0XPnCUtfMgcDpFyXnnyU3yIQLc5idSE/mdnfg27/a0KZd+XeN7Yg8KM4vY8e6GriU8gd
 oKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717141851; x=1717746651;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r2XdzJ6IzRamTT3nhFH8XeJzlNSkKuRVnD58Iktcp0o=;
 b=UAOCN8SzPsIuRnDUjJfx7kIwdzASc7AVS7//0JzqIX52Q7rvq4QzqgOHae+UrR3Hnf
 DTW231L8Xvre56/bRbGfqf4Tt24BMSkrT2lxZxBkAZBZp647ypKhNekxCMiJidJrkWqd
 +Jr+VD2nXtssUfwytnSaUJtx64A+O/TtvCBQL/XvTOcWGuuU3eoDJt4zS0vORr9TLY+C
 tDQhp/yDwUb/bNCMfMzRmENEZwDYCPbiPo/luunSwVUuUpW40dTCjbWtbjNgbKbyj4C8
 cxU1/hJCSJm6M0PBblGIHLnEXyERrESm1OAiKYdlyWfc0RZ35ORCXY8HM0gI7Zi5Z8G6
 DOxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvMbDOf65EOT/4t7lQaHNLigofhbCpmtNcrwRp3dLMOeYPAmQqtCuEXwX8YJ1gGZUK2QDlw6+Q6XEaxWKkM2xQOj4bTd5LnkogkhQ1/vbbMCueN57bQV9FsJrJZZi05yKlTmkXrs6TH4as5E8KfQ==
X-Gm-Message-State: AOJu0Yy8UjP2qEhfwLwaZ0lJP4zEz6ckQ3GeHV1cdRYm2lz6BbBFngY3
 MF4+q1R3GaGAvMbllXsdY9P5eN26sqMP2JhBO9okdMNx6IrajyLy
X-Google-Smtp-Source: AGHT+IFmoHx1DOu6EUaKr3kPXbJU6PasPLBG1RJBIrbPUKjR0PqfUbfRMbaW6z2DR6/UwsxA+97g9w==
X-Received: by 2002:a05:6a21:3394:b0:1ae:42aa:7f1 with SMTP id
 adf61e73a8af0-1b26f13949emr1469445637.2.1717141851145; 
 Fri, 31 May 2024 00:50:51 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70242aea177sm856082b3a.110.2024.05.31.00.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 00:50:50 -0700 (PDT)
Date: Fri, 31 May 2024 16:50:32 +0900 (JST)
Message-Id: <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: fujita.tomonori@gmail.com, gregkh@linuxfoundation.org,
 wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Zlgg_Q5y3Q99Ts1s@pollux>
References: <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
 <Zlgg_Q5y3Q99Ts1s@pollux>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

On Thu, 30 May 2024 08:47:25 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

>> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
>> >> >> device object of C's PHY device during the probe callback. The driver
>> >> >> creates a Rust device object to wrap the C pointer to the C's device
>> >> >> object and passes it to the firmware abstractions. The firmware
>> >> >> abstractions gets the C's pointer from the Rust object and calls C's
>> >> >> function to load firmware, returns the result.
>> >> >> 
>> >> >> You have concerns about the simple code like the following?
>> >> >> 
>> >> >> 
>> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
>> >> >> new file mode 100644
>> >> >> index 000000000000..6144437984a9
>> >> >> --- /dev/null
>> >> >> +++ b/rust/kernel/device.rs
>> >> >> @@ -0,0 +1,30 @@
>> >> >> +// SPDX-License-Identifier: GPL-2.0
>> >> >> +
>> >> >> +//! Generic devices that are part of the kernel's driver model.
>> >> >> +//!
>> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> >> >> +
>> >> >> +use crate::types::Opaque;
>> >> >> +
>> >> >> +#[repr(transparent)]
>> >> >> +pub struct Device(Opaque<bindings::device>);
>> >> >> +
>> >> >> +impl Device {
>> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
>> >> >> +    ///
>> >> >> +    /// # Safety
>> >> >> +    ///
>> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
>> >> > 
>> >> > If the following rust code does what this comment says, then sure, I'm
>> >> > ok with it for now if it helps you all out with stuff like the firmware
>> >> > interface for the phy rust code.
>> >> 
>> >> Great, thanks a lot!
>> >> 
>> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
>> >> for the firmware abstractions?
>> > 
>> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
>> > directly? AFAICS, we'd only need the following fix:
>> > 
>> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
>> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
>> > 
>> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
>> 
>> The difference is that your patch touches the reference count of a
>> struct device. My patch doesn't.
>> 
>> The following part in your patch allows the rust code to freely play
>> with the reference count of a struct device. Your Rust drm driver
>> interact with the reference count in a different way than C's drm
>> drivers if I understand correctly. I'm not sure that Greg will be
>> convinenced with that approach.
> 
> I don't see how this is different than what we do in C. If you (for whatever
> reason) want to keep a pointer to a struct device you should make sure to
> increase the reference count of this device, such that it can't get freed for
> the time being.
> 
> This is a 1:1 representation of that and conceptually identical.

A drm driver does such? If a drm driver allocates two types of
driver-specific data and keep a pointer to the pci device, then the
driver calls get_device() twice to increase the reference count of the
pci's device?

At the very least, network device drivers don't. a driver doesn't play
with the reference count. The network subsystem does. And, the network
subsystem doesn't care about how many pointers to a pci device a
driver keeps.

With the patch [1], a driver plays with the reference count of a
device and directly calls get/put_device. It's a different than C
drivers for me (not sure about drm subsystem though).

But I might be misunderstanding that Greg isn't convinced with this
reference count thing. We need to wait for his response.


>> +// SAFETY: Instances of `Device` are always ref-counted.
>> +unsafe impl crate::types::AlwaysRefCounted for Device {
>> +    fn inc_ref(&self) {
>> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
>> +        unsafe { bindings::get_device(self.as_raw()) };
>> +    }
>> +
>> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
>> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
>> +    }
>> +}
>> 
>> The following comments give the impression that Rust abstractions
>> wrongly interact with the reference count; callers check out the
>> reference counter. Nobody should do that.
> 
> No, saying that the caller must ensure that the device "has a non-zero reference
> count" is a perfectly valid requirement.
> 
> It doensn't mean that the calling code has to peek the actual reference count,
> but it means that it must be ensured that while we try to increase the reference
> count it can't drop to zero unexpectedly.

Yeah, the same requirements but expressed differently.

But again, I might be misunderstanding. Greg might have a different reason.

> Your patch, as a subset of this one, has the same requirements as listed below.
> 
>> 
>> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
>> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
>> 
>> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
>> +    /// the entire duration when the returned reference exists.
>> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
>> +        // SAFETY: Guaranteed by the safety requirements of the function.
>> +        unsafe { &*ptr.cast() }
>> +    }
>> 
> 
> 
