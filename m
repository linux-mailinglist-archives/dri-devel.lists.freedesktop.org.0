Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AAB07166
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F110E045;
	Wed, 16 Jul 2025 09:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y56dsiQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1710E045
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:16:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 56118A53C55;
 Wed, 16 Jul 2025 09:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEDFC4CEF0;
 Wed, 16 Jul 2025 09:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752657393;
 bh=Hfea+Wf59XZhqO9zfMH1UF/iDdhqNgx3KK5CietkH3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y56dsiQ1PjVkVp1XJED61755uulFZ4+msW57aAe4eHvbg/nbszwlABUifs2B5Bb+8
 Kym9V/L7DI+8IZKY0ud0kFnECSsJpabjgBuXJRe18zsopmP8z9ALihS03C+rVaoqJu
 BtBw3HNu3r8//9sAlIvmBxfsKQIIpVhM/OF5cimw=
Date: Wed, 16 Jul 2025 11:16:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/2] device: rust: rename Device::as_ref() to
 Device::from_raw()
Message-ID: <2025071622-recast-posing-ce98@gregkh>
References: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
 <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
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

On Fri, Jul 11, 2025 at 08:04:37AM +0000, Alice Ryhl wrote:
> The prefix as_* should not be used for a constructor. Constructors
> usually use the prefix from_* instead.
> 
> Some prior art in the stdlib: Box::from_raw, CString::from_raw,
> Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.
> 
> There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
> fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
> SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.
> 
> Link: https://lore.kernel.org/r/aCd8D5IA0RXZvtcv@pollux
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
