Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C2B3A55D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 18:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8CC10EA3A;
	Thu, 28 Aug 2025 16:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emHVLjvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A6F10E0D9;
 Thu, 28 Aug 2025 16:03:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A12F600AA;
 Thu, 28 Aug 2025 16:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56051C4CEEB;
 Thu, 28 Aug 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756396986;
 bh=rqiqE3eHb4MM2q4/saGPmuf1MqrdrB3czVaUZouQEBQ=;
 h=From:To:Cc:Subject:Date:From;
 b=emHVLjvZBw4ozIxk0IIGMzWP1NSQcDfdff1OtDBy8Rputuu6rJqiEVy23IbqYSknK
 BrYQNby3opqZV9Al8KiLPLoSBjRHP4JII/kvTswemJk8q0inM5to+9Uso2r4xO+2he
 ZBQcp6ALBdVGub9fYALRuvy//ywRhiRmWrfqAv63/Gcp880Llsm+Twmy7Gn22nbQSt
 qPgOsT471BW2Z53cbzbiP6pLdnopbOkb4mBtMCAkQNabBCnPZzzv+bD8tjI+QRR6yn
 OU9ZTR0qoCVq2OKZrpXSDGHVDElt8Z79t8DL4m8XIzO1XxujKXoNzlJjwTh+52FalH
 U0njAhNzAwlww==
From: Miguel Ojeda <ojeda@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>
Subject: gpu: nova-core: arm32 build errors
Date: Thu, 28 Aug 2025 18:02:47 +0200
Message-ID: <20250828160247.37492-1-ojeda@kernel.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo et al.,

In Linus' tree and -next, for an arm32 LLVM defconfig plus Rust build, I see:

    error[E0308]: mismatched types
      --> drivers/gpu/nova-core/fb.rs:49:59
       |
    49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
       |                              -----------------------      ^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
       |                              |
       |                              arguments to this method are incorrect
       |
    note: method defined here
      --> drivers/gpu/nova-core/fb/hal.rs:19:8
       |
    19 |     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
       |        ^^^^^^^^^^^^^^^^^^^^^^^
    help: you can convert a `u32` to a `u64`
       |
    49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle().into())?;
       |                                                                            +++++++


    error[E0308]: mismatched types
      --> drivers/gpu/nova-core/fb.rs:65:47
       |
    65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle() {
       |            -------------------------------    ^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
       |            |
       |            expected because this is `u64`
       |
    help: you can convert a `u32` to a `u64`
       |
    65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle().into() {
       |                                                                     +++++++


    error: this arithmetic operation will overflow
       --> drivers/gpu/nova-core/falcon.rs:469:23
        |
    469 |             .set_base((dma_start >> 40) as u16)
        |                       ^^^^^^^^^^^^^^^^^ attempt to shift right by `40_i32`, which would overflow
        |
        = note: `#[deny(arithmetic_overflow)]` on by default

Similar to another one I sent, I hope it helps -- it may be useful to make it
build in 32-bit as a test for those kinds of platforms.

Thanks!

Cheers,
Miguel
