Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD537B02A12
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79A10E27F;
	Sat, 12 Jul 2025 08:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RHKpRx3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D795610E13F;
 Sat, 12 Jul 2025 08:27:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 85BB3452D1;
 Sat, 12 Jul 2025 08:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1293C4CEEF;
 Sat, 12 Jul 2025 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752308828;
 bh=sAt6M/6dVGn+429g9VocZGFb50raWZLPION4ReTbBao=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=RHKpRx3XEbhUDq7hq1Yk8ORjJPPCCwPE2SbwiU7gs28q9YLhlUzZA6c6zd6ZbCyia
 sx+3JwHM75ViVOcGejPt2C+0owpMCEWMIfqScxQQsRlphT5dNWUYD/+A38GVpQZrSu
 PN6fnBkBhnxwU+gKtph+hOhourhad+6LuHrFqIClfTha4UQLii9VSmzbDIS3iNJp5T
 stU79tCWpSBwwvJeb99n0arV+6ywZn2NS1iXZQEAvK8usEQJUOwQARrPi3R/Z+AmOk
 GnAevKKsk7kwDUpp5JGOPeUSgeCKTF6AHTDLl0rD9OdR/rDsawbUNP8whC8ZWNzc1i
 54kW8pDVSyorQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Jul 2025 10:27:00 +0200
Message-Id: <DB9XMV1NE9F5.20SGV690NJ9DY@kernel.org>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>
Subject: Re: [PATCH 0/9] rust: use `kernel::{fmt,prelude::fmt!}`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Jens Axboe" <axboe@kernel.dk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <davidgow@google.com>, "Rae Moar" <rmoar@google.com>
X-Mailer: aerc 0.20.1
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
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

On Wed Jul 9, 2025 at 9:59 PM CEST, Tamir Duberstein wrote:
> This is series 2a/5 of the migration to `core::ffi::CStr`[0].
> 20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.
>
> This series depends on the prior series[0] and is intended to go through
> the rust tree to reduce the number of release cycles required to
> complete the work.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).
>
> [0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (9):
>       gpu: nova-core: use `kernel::{fmt,prelude::fmt!}`
>       rust: alloc: use `kernel::{fmt,prelude::fmt!}`
>       rust: block: use `kernel::{fmt,prelude::fmt!}`
>       rust: device: use `kernel::{fmt,prelude::fmt!}`
>       rust: file: use `kernel::{fmt,prelude::fmt!}`
>       rust: kunit: use `kernel::{fmt,prelude::fmt!}`
>       rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
>       rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
>       rust: sync: use `kernel::{fmt,prelude::fmt!}`
>
>  drivers/block/rnull.rs               | 2 +-
>  drivers/gpu/nova-core/gpu.rs         | 3 +--
>  drivers/gpu/nova-core/regs/macros.rs | 6 +++---
>  rust/kernel/alloc/kbox.rs            | 2 +-
>  rust/kernel/alloc/kvec.rs            | 2 +-
>  rust/kernel/alloc/kvec/errors.rs     | 2 +-
>  rust/kernel/block/mq.rs              | 2 +-
>  rust/kernel/block/mq/gen_disk.rs     | 2 +-
>  rust/kernel/block/mq/raw_writer.rs   | 3 +--
>  rust/kernel/device.rs                | 6 +++---
>  rust/kernel/fs/file.rs               | 5 +++--
>  rust/kernel/init.rs                  | 4 ++--
>  rust/kernel/kunit.rs                 | 8 ++++----
>  rust/kernel/seq_file.rs              | 6 +++---
>  rust/kernel/sync/arc.rs              | 3 +--
>  scripts/rustdoc_test_gen.rs          | 2 +-
>  16 files changed, 28 insertions(+), 30 deletions(-)

For the entire series:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
