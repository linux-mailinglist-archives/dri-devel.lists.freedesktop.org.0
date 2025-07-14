Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D237B03F98
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 15:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1CB10E48B;
	Mon, 14 Jul 2025 13:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eB6jqWJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC5410E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:21:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9FDEB61460;
 Mon, 14 Jul 2025 13:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA92C4CEED;
 Mon, 14 Jul 2025 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752499265;
 bh=e7cqCMIVwiyT8RzReLiQL/MIid2RLe+DaHtAHYAcb2o=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=eB6jqWJr8t2Q9Jb220i5BDpkArwX6oTF2Mk56a9D7QpZVUDiPi/UM4Lu8aIUqqtqI
 ggfF7nseoLaP9ckNVAc0hCBcynBG5ryhu1l21ilE6a7Ij7dzlctm6ByzKDPfnBQz+9
 2IUtQdmkgmP6eVQOb4HsxssFA4V9Vj8LtLBVLHsP9HXZxd0vE1l3yWS4NmSjo0yLkd
 1+B7piqJKFBSvAWvFkITGF3vwGhF9jUkepPaKWpuc4+jgxG8LOJXsRm+S3QIIj7p+k
 IHvfxcZAeNyo/avWCHy9d6PwUan3wcy9ckGo4eKXVe+6x66jT86R1XIm4+xLbnzE9k
 V4ra4+sOp1b2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 15:20:58 +0200
Message-Id: <DBBT50VYG8EJ.1Y54CR9X8SQ80@kernel.org>
Subject: Re: [PATCH v2 1/2] device: rust: rename Device::as_ref() to
 Device::from_raw()
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Peter Zijlstra"
 <peterz@infradead.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
 <20250711-device-as-ref-v2-1-1b16ab6402d7@google.com>
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

On Fri Jul 11, 2025 at 10:04 AM CEST, Alice Ryhl wrote:
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

FUJITA, Thomas, Peter: Unless there are any concerns, I'll pick this one up
soon.
