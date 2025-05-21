Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED8ABEE0F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CFF10E6C6;
	Wed, 21 May 2025 08:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JOF9PUkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E3310E6C6;
 Wed, 21 May 2025 08:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE6FE443D9;
 Wed, 21 May 2025 08:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00873C4CEE4;
 Wed, 21 May 2025 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747816640;
 bh=vHs0uFXE4QDWJyTB2uO5NgtTvDkhWOmq0wYfhjspCDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOF9PUknCG3XoxV5ePcPOdk+//R8CCQdYie0iZpzXV9MI8mwqXJiisyPEfgZ5UbxN
 GyG/z+L6of5ZHzq4P9yJCLudMmVhuzFD8DHgXnixz5aJ0KyNYlhZt+EZAXTkHj76o1
 o1pDTYiv8VAAkd+OclJ2Mqidu/qzBW7p6cDSGegP6wvun74nrcTJhqSwegsF098jvU
 yvOzCfxkO6bZCTSoFVbCl7ngiZr+jzN9sIej5xoYo7974GCsTZ/mVs8SPYJpQsCvMv
 yBdxP7RLYSfPnTPmhXnIe0aYj3/mRM9ZaxzvdnpXgGXCti8TrDXaovXCEpEy1P4qdg
 uvwm6TjHcdDlw==
Date: Wed, 21 May 2025 10:37:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 08/20] gpu: nova-core: allow register aliases
Message-ID: <aC2Quag3HYN70D8p@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-8-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-8-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:45:03PM +0900, Alexandre Courbot wrote:
> Some registers (notably scratch registers) don't have a definitive
> purpose, but need to be interpreted differently depending on context.
> 
> Expand the register!() macro to support a syntax indicating that a
> register type should be at the same offset as another one, but under a
> different name, and with different fields and documentation.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/regs/macros.rs | 40 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> index 7cd013f3c90bbd8ca437d4072cae8f11d7946fcd..64dda1d4d93d3c7022ef02b6f6fb81b58e90dd44 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -71,6 +71,20 @@
>  /// pr_info!("CPU CTL: {:#x}", cpuctl);
>  /// cpuctl.set_start(true).write(&bar, CPU_BASE);
>  /// ```
> +///
> +/// It is also possible to create a alias register by using the `=> PARENT` syntax. This is useful
> +/// for cases where a register's interpretation depends on the context:
> +///
> +/// ```no_run
> +/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
> +///    31:0     value as u32, "Raw value";
> +///
> +/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {

NIT: I'd put the arrow the other way around, i.e. SCRATCH_0_BOOT_STATUS is
derived from SCRATCH_0, not the other way around.
