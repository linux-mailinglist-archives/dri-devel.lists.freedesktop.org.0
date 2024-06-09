Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193BE901482
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 07:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C165510E04F;
	Sun,  9 Jun 2024 05:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="MKTLYKrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Sun, 09 Jun 2024 05:21:52 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381C410E04F;
 Sun,  9 Jun 2024 05:21:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id BF26342617;
 Sun,  9 Jun 2024 05:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1717910167;
 bh=Q1UPsINbFsF/krHvhKS9VhOJNdX4dv8c3DHiOLZvWI4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MKTLYKrOSsm/45Zu8zlMpg5cHCCmtUYs78RXDFx+vbnpC2vwRmE6sX9PpFFsV2ck3
 cYE2oMwAkWRzkzrraGCNNombTT/oB7o0lBw5GrSrzRdSiOqiA+8INQHGce+tmOrLAp
 PBQ+tx3uAUELizkifvD7TFXoGUVge95JggmnhYG6qYeMJ7Qf56ZXAEx5tSzpU9QIJO
 yd2/RXSyP8q3zcici48sSQXRWYiL9qqjB7yJz9ARtiqpZnMBlR1jlj5FW99UAbnJFu
 pwKqmNSXjZzsO2th3PcGvuP3qtK2EAqWBMQiu+JmkOS92IZDwCCRQ2YQ3c1qh/U9tt
 0ILhGRf4fJSgA==
Message-ID: <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
Date: Sun, 9 Jun 2024 14:15:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
To: Rob Herring <robh@kernel.org>, Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20240521212333.GA731457-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 5/22/24 6:23 AM, Rob Herring wrote:
> On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>
>> Add abstractions for DRM drivers and devices. These go together in one
>> commit since both are fairly tightly coupled types.
>>
>> A few things have been stubbed out, to be implemented as further bits of
>> the DRM subsystem are introduced.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>  rust/bindings/bindings_helper.h |   2 +
>>  rust/kernel/drm/device.rs       |  87 +++++++++
>>  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
>>  rust/kernel/drm/mod.rs          |   2 +
>>  4 files changed, 409 insertions(+)
>>  create mode 100644 rust/kernel/drm/device.rs
>>  create mode 100644 rust/kernel/drm/drv.rs
> 
> [...]
> 
>> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
>> new file mode 100644
>> index 000000000000..5dd8f3f8df7c
>> --- /dev/null
>> +++ b/rust/kernel/drm/drv.rs
>> @@ -0,0 +1,318 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +
>> +//! DRM driver core.
>> +//!
>> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
>> +
>> +use crate::{
>> +    alloc::flags::*,
>> +    bindings, device, drm,
>> +    error::code::*,
>> +    error::{Error, Result},
>> +    prelude::*,
>> +    private::Sealed,
>> +    str::CStr,
>> +    types::{ARef, ForeignOwnable},
>> +    ThisModule,
>> +};
>> +use core::{
>> +    marker::{PhantomData, PhantomPinned},
>> +    pin::Pin,
>> +};
>> +use macros::vtable;
>> +
>> +/// Driver use the GEM memory manager. This should be set for all modern drivers.
>> +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
>> +/// Driver supports mode setting interfaces (KMS).
>> +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
>> +/// Driver supports dedicated render nodes.
>> +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
>> +/// Driver supports the full atomic modesetting userspace API.
>> +///
>> +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
>> +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
>> +/// should not set this flag.
>> +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
>> +/// Driver supports DRM sync objects for explicit synchronization of command submission.
>> +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
>> +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
>> +/// submission.
>> +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> 
> This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> I suppose some are legacy which won't be needed any time soon if ever. 
> Not sure if you intend for this to be complete, or you are just adding 
> what you are using? Only FEAT_GEM is used by nova ATM.
> 

This was developed before DRIVER_GEM_GPUVA existed ^^

I have this in my branch since I'm using the GPUVA manager now. Danilo,
what tree are you using for this submission? It would be good to
coordinate this and try to keep the WIP branches from diverging too much...

That said, I don't think there's reason to support all features unless
we expect new drivers to actually use them. The goal of the abstractions
is to serve the drivers that will use them, and to evolve together with
them and any newer drivers, not to attempt to be feature-complete from
the get go (it's very difficult to evaluate an abstraction if it has no
users!). In general my approach when writing them was to abstract what I
need and add "obvious" extra trivial features that didn't require much
thought even if I wasn't using them, but otherwise not attempt to
comprehensively cover everything.

~~ Lina
