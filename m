Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D4A8835B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE0010E128;
	Mon, 14 Apr 2025 13:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADA910E5F7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:55:17 +0000 (UTC)
Date: Mon, 14 Apr 2025 09:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744638912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/MdT/GT22lhEdP4LBdu35R2s9GJelO01gNuCCRQDT4=;
 b=Rn3zdGMOJ2Aq03sA0vAX3WocF09ITQjWxjHVhumGNPfeH4iPJ4hgq9jBrCfq1WkAza+4JT
 iMUIHPlrqTFLeHT9ZoAHyzSp6YO299mtSrXTZGiz/3FlI+VZr60+Xkte/0sKFdfwWn7QFG
 9aGM2mOH+0HjDPfsUZkJ/9ieQ9jlAxHB5gFi/qmqrCm1rnsjJ8ODQ0xShwg59N1dMQwqzm
 2mG5VYKHDriupJbobqzyYB335jbp5gu0BHFCY2Ur2HaiFZFyABx/ipitsi0a7M6Y/+JzXl
 YexETBaB0/i+Rgwu3TZRMiiTjr6SF242bZJqbTgc5JW5jrwE1UCyBEynU8Ky3w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/8] rust: drm: ioctl: Add DRM ioctl abstraction
Message-ID: <Z_0Ts6Tj6NeaDBo0@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-3-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-3-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

+/// `user_callback` should have the following prototype:
+///
+/// ```ignore
+/// fn foo(device: &kernel::drm::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::File<Self::File>,
+/// )

Needs to be `-> Result<u32>`, please update

> +                            // SAFETY: This is just the ioctl argument, which hopefully has the
> +                            // right type (we've done our best checking the size).

"hopefully" in a SAFETY comment raises eyebrows!

The argument has the right type /by definition/ once we know the ioctl
name and the size. If userspace passes the wrong type, that's not our
problem - we're still doing the right cast from the perspective of the
kernel. It's up to the driver to reject bogus values.

Maybe something like

    SAFETY: The ioctl argument has size _IOC_SIZE(cmd), which we
    asserted above matches the size of this type, and all bit patterns of
    UAPI structs must be valid.

This also documents the actual safety invariant we're relying on (that
all bit patterns must be valid... which is "obvious" for correct uapis
but not true for eg repr(Rust)!)

> +                                Ok(i) => i.try_into()
> +                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),

It would be great if we could statically guarantee that the types will
fit to avoid this error path (i.e. static assert that the handler
returns Result<u32> and sizeof(u32) <= sizeof(ffi:c_int)). But I don't
know how to do that in Rust so no action required unless you have a
better idea ;)

---

Anyway, with those two comments updated, this patch is

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks!
