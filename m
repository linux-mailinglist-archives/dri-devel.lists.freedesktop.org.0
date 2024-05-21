Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CE8CBB5C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 08:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5010E37A;
	Wed, 22 May 2024 06:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlKyqGEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61310E358;
 Tue, 21 May 2024 23:53:53 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6f44e47238fso34843b3a.1; 
 Tue, 21 May 2024 16:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716335633; x=1716940433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=3DaQiKjnAD9KHri/cIxiGqQpOy5cgH7zfvkMt74Lem4=;
 b=IlKyqGEQc/WJbKHJVD5GxXjd8lIGQJUp0r7xR/cUUP4OvOUpEVpzaFrcNwjji97uC4
 EGxFFQOuesIz5/VK2JM9h1qRTwTbrLNA3RuAKHKf/tIr1KTKoOMiV75FaEI7/A9GRaAO
 Yb6x7JkquG3sT/B3J2ii06DM7JKGnvNfSnp3NC7cXaAR2vB3Swrm4UIFvfc60GM0OM2F
 hHBHRfqCIXO/LtkxtJhTf+1cd7XVUF8G/J94d7Z10anuOYbUCq26bEJk//ZjAR1uSvim
 F+YiSqJe1KP4pxT7rHlUb0xvM0iYTnVkHwgBVokswikuKA6JuRNBtj1cQzak284Fff0g
 MuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716335633; x=1716940433;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3DaQiKjnAD9KHri/cIxiGqQpOy5cgH7zfvkMt74Lem4=;
 b=YlQNKrDcWGsvRIsrg/s6ManwLlZOI/SAI92ycIaOP9KyMzDlYda0igV3h8TpTUH6lw
 pmZvVAX5o+3ylj/oK3meurFaPPre6eQC0gPJe5eOGadGG7ML0kusmct58Q1MZggt1RUv
 c2FxANiR3PMmb4k+hKqtq3iYYtvvRBXucFLwOt/Yg4RRMwOayWfoL7Ql7obsLgmkmdH2
 n/KWRjOM2ZD3wxKnMRDfGnunPQrwJum+mRe5bwTyY7JSfwSR7dW7MAZHoAsGKmSe4och
 rsF0UTOONq90s+LYKxxHi63tdrz5ZK47sZB6rm2579o7hxuOjFov4WCmL9KMpkD9taCA
 cOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVST+FxL4OrgvYDpzlGlMufpdyCY4vk/JdeudUQpyhDDsjL/O/9Nxa+riAgvGrRF8VOfWE9jYscENGdVTBbvhkl/sNajf5a81sFfioFRwY6C/7IzSBz1sSwDqx7bfoBispZkW/DT1M5bPq1eivQtA==
X-Gm-Message-State: AOJu0YzCiURfNEe62BJW45ePyHeo1cDxivkZaozkxzTtRjYwkYnlSFLN
 h8kF/BpBwBH7wYpH8vFKvp7AmoJL27UoROiLKsklXGuTVpeFuT7d
X-Google-Smtp-Source: AGHT+IEOOeLZlnYhzFqWE1WSa9IQ7YVO/q2usBXpvoQ8sXnxMguFBGZNx49vZsh8HCbkbAEl+ckjRg==
X-Received: by 2002:a05:6a00:2d87:b0:6f4:d050:4113 with SMTP id
 d2e1a72fcca58-6f6d61e2faamr425621b3a.3.1716335633096; 
 Tue, 21 May 2024 16:53:53 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2a828acsm21266408b3a.49.2024.05.21.16.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 16:53:52 -0700 (PDT)
Date: Wed, 22 May 2024 08:53:34 +0900 (JST)
Message-Id: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20240520172422.181763-4-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 May 2024 06:31:03 +0000
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

Hi,
Thanks for working on the firmware API!

On Mon, 20 May 2024 19:24:19 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Add an abstraction around the kernels firmware API to request firmware
> images. The abstraction provides functions to access the firmware
> buffer and / or copy it to a new buffer allocated with a given allocator
> backend.
> 
> The firmware is released once the abstraction is dropped.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 rust/kernel/firmware.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index b245db8d5a87..e4ffc47da5ec 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -14,6 +14,7 @@
>  #include <kunit/test.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
> +#include <linux/firmware.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
>  #include <linux/pci.h>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> new file mode 100644
> index 000000000000..700504fb3c9c
> --- /dev/null
> +++ b/rust/kernel/firmware.rs
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Firmware abstraction
> +//!
> +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> +
> +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> +
> +/// Abstraction around a C firmware struct.
> +///
> +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> +/// firmware is released once [`Firmware`] is dropped.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> +/// driver_load_firmware(fw.data());
> +/// ```
> +pub struct Firmware(Opaque<*const bindings::firmware>);

Wrapping a raw pointer is not the intended use of Qpaque type?
