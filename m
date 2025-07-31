Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED326B17646
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 20:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77510E2BD;
	Thu, 31 Jul 2025 18:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k7owTnz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FBC10E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 18:55:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 616555C516B;
 Thu, 31 Jul 2025 18:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DC9C4CEEF;
 Thu, 31 Jul 2025 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753988104;
 bh=vC0up9mvz0CmJrrIDWMSSAZYXkJKsZyV1kdx/W9KPl0=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=k7owTnz75QduSHc122BpHqgkZ6NhAz/LIbitVyMTJs/uCDk5a4DsvewuJAgai6fSH
 3pOhA6v5OYoiT832vSh0Z6IiTBtsv+fOLtIfXJv+isBCh5nN8DdcLlGSyDea1i4DHo
 tOQISqmfqqLormBxCXV7IYtz6Qehd4pX8ADZLAKUT8ibvQpEijPBE4aOQHkMhhSh1O
 hF0oK2GMf5vErKcFducOA0QslSKlFYf7xsdRahkH/nXkkvW7o2QHwUQwicV+ajzqzD
 ZvXRCULca4u87GlxxoAJUhtbg8X9/CnqVnergAeExj4d+YZj0KnHDcCrZJ7U8ytHR6
 971xau/s0ViMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Jul 2025 20:54:58 +0200
Message-Id: <DBQGW0NIQJRX.MU0QD5GMFJYM@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: drm: remove pin annotations from drm::Device
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
X-Mailer: aerc 0.20.1
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-4-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-4-dakr@kernel.org>
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

On Thu Jul 31, 2025 at 5:48 PM CEST, Danilo Krummrich wrote:
> The #[pin_data] and #[pin] annotations are not necessary for
> drm::Device, since we don't use any pin-init macros, but only
> __pinned_init() on the impl PinInit<T::Data, Error> argument of
> drm::Device::new().

But you're still pinning `Device`, right?

> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/drm/device.rs | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index d19410deaf6c..d0a9528121f1 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -54,10 +54,8 @@ macro_rules! drm_legacy_fields {
>  ///
>  /// `self.dev` is a valid instance of a `struct device`.
>  #[repr(C)]
> -#[pin_data]
>  pub struct Device<T: drm::Driver> {
>      dev: Opaque<bindings::drm_device>,
> -    #[pin]
>      data: T::Data,

Looking at this code again, I also noticed that it was wrong before this
patch: `Device<T>` implemented `Unpin` if `T::Data` did which is most
likely wrong (or is `drm_device` not address sensitive?).

So good to see that fixed, thanks!

---
Cheers,
Benno

>  }
> =20

