Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4D6AE4D5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE57710E586;
	Tue,  7 Mar 2023 15:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB0B10E58A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S/GRqk3YGMUri3X2GMvTfD9C6AMJhY+Iwb0CAG3dS+8=; b=dR+aCNSTGOVgRf5dumaPu489Xy
 tbDe/0XI4jsnTyAjymPM69Qob5JUPUta+FptlFezAEm1fZL9POPQqeaROY+9LWp9dVBFVHQ4bTXrm
 5NlpIPUEEj3r//QkBndNdTLXP4LDiM6/uHCiucTfZGXjzYa858NFMkHAvJ7/4cGHOP9CEu55uYIie
 +gU1ekppajOQIYsxsjpE2z9m2ndnnrFcnrEUKhAHsvXZgLNYGB4mQLN8KUskb1dUYi9e6ZfMnkuUB
 gWEb0hMyhZ3cjv2XP+Gin6387IQzi+Z8grafdGA/WuW4U/8veQwWNMDQLLQVMRf/+Y1sjhv8I679e
 CGMTijSQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pZZJ6-007s1R-GE; Tue, 07 Mar 2023 16:32:52 +0100
Message-ID: <c047e11f-33d0-6af4-21c3-adb384b68d8b@igalia.com>
Date: Tue, 7 Mar 2023 12:32:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
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
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
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

On 3/7/23 11:25, Asahi Lina wrote:
> DRM drivers need to be able to declare which driver-specific ioctls they
> support. This abstraction adds the required types and a helper macro to
> generate the ioctl definition inside the DRM driver.
> 
> Note that this macro is not usable until further bits of the
> abstraction are in place (but it will not fail to compile on its own, if
> not called).
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>   drivers/gpu/drm/Kconfig         |   7 ++
>   rust/bindings/bindings_helper.h |   2 +
>   rust/kernel/drm/ioctl.rs        | 147 ++++++++++++++++++++++++++++++++++++++++
>   rust/kernel/drm/mod.rs          |   5 ++
>   rust/kernel/lib.rs              |   2 +
>   5 files changed, 163 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dc0f94f02a82..dab8f0f9aa96 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -27,6 +27,13 @@ menuconfig DRM
>   	  details.  You should also select and configure AGP
>   	  (/dev/agpgart) support if it is available for your platform.
>   

[...]

> +
> +/// Declare the DRM ioctls for a driver.
> +///
> +/// Each entry in the list should have the form:
> +///
> +/// `(ioctl_number, argument_type, flags, user_callback),`
> +///
> +/// `argument_type` is the type name within the `bindings` crate.
> +/// `user_callback` should have the following prototype:
> +///
> +/// ```
> +/// fn foo(device: &kernel::drm::device::Device<Self>,
> +///        data: &mut bindings::argument_type,
> +///        file: &kernel::drm::file::File<Self::File>,
> +/// )
> +/// ```
> +/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::declare_drm_ioctls! {
> +///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
> +/// }
> +/// ```
> +///
> +#[macro_export]
> +macro_rules! declare_drm_ioctls {
> +    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
> +        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
> +            const _:() = {
> +                let i: u32 = $crate::bindings::DRM_COMMAND_BASE;
> +                // Assert that all the IOCTLs are in the right order and there are no gaps,
> +                // and that the sizeof of the specified type is correct.

I believe that not necessarily the IOCTLs need to be in the right order and
with no gaps. For example, armada_drm.h has a gap in between 0x00 and
0x02 and exynos_drm.h also have gaps. Moreover, some drivers, like vgem and
virtgpu, start their IOCTLs with 0x01.

Best Regards,
- Maíra Canal

> +                $(
> +                    let cmd: u32 = $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd);
> +                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
> +                    ::core::assert!(core::mem::size_of::<$crate::bindings::$struct>() == $crate::ioctl::_IOC_SIZE(cmd));
> +                    let i: u32 = i + 1;
> +                )*
> +            };
> +
> +            let ioctls = &[$(
> +                $crate::bindings::drm_ioctl_desc {
> +                    cmd: $crate::macros::concat_idents!($crate::bindings::DRM_IOCTL_, $cmd) as u32,
> +                    func: {
> +                        #[allow(non_snake_case)]
> +                        unsafe extern "C" fn $cmd(
> +                                raw_dev: *mut $crate::bindings::drm_device,
> +                                raw_data: *mut ::core::ffi::c_void,
> +                                raw_file_priv: *mut $crate::bindings::drm_file,
> +                        ) -> core::ffi::c_int {
> +                            // SAFETY: We never drop this, and the DRM core ensures the device lives
> +                            // while callbacks are being called.
> +                            //
> +                            // FIXME: Currently there is nothing enforcing that the types of the
> +                            // dev/file match the current driver these ioctls are being declared
> +                            // for, and it's not clear how to enforce this within the type system.
> +                            let dev = ::core::mem::ManuallyDrop::new(unsafe {
> +                                $crate::drm::device::Device::from_raw(raw_dev)
> +                            });
> +                            // SAFETY: This is just the ioctl argument, which hopefully has the right type
> +                            // (we've done our best checking the size).
> +                            let data = unsafe { &mut *(raw_data as *mut $crate::bindings::$struct) };
> +                            // SAFETY: This is just the DRM file structure
> +                            let file = unsafe { $crate::drm::file::File::from_raw(raw_file_priv) };
> +
> +                            match $func(&*dev, data, &file) {
> +                                Err(e) => e.to_kernel_errno(),
> +                                Ok(i) => i.try_into().unwrap_or(ERANGE.to_kernel_errno()),
> +                            }
> +                        }
> +                        Some($cmd)
> +                    },
> +                    flags: $flags,
> +                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
> +                }
> +            ),*];
> +            ioctls
> +        };
> +    };
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> new file mode 100644
> index 000000000000..9ec6d7cbcaf3
> --- /dev/null
> +++ b/rust/kernel/drm/mod.rs
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM subsystem abstractions.
> +
> +pub mod ioctl;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7903490816bf..cb23d24c6718 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,8 @@ mod build_assert;
>   pub mod delay;
>   pub mod device;
>   pub mod driver;
> +#[cfg(CONFIG_RUST_DRM)]
> +pub mod drm;
>   pub mod error;
>   pub mod io_buffer;
>   pub mod io_mem;
> 
