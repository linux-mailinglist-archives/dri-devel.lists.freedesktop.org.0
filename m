Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D130B1E5D1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 11:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C5510E1CA;
	Fri,  8 Aug 2025 09:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X8Wk8yjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE88510E1CA;
 Fri,  8 Aug 2025 09:44:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DBCCAA55B43;
 Fri,  8 Aug 2025 09:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34FFC4CEF0;
 Fri,  8 Aug 2025 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754646273;
 bh=1ZJ4ldKCI69qLoYIh53Dk0H49HJT6go1Z5K0fsK0RZ4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X8Wk8yjsDVhHaE+xDTYwLqOPyG3wua/VBoVf9vdxy9oBl1IMu5AJ8JzSVtypG5WB+
 0p7ejSOBEWIF1xbm8CbTz4nWhFT/d/a4173pcy8rAJ4Bg4PHOxvJnAb7VUGHQYBpgP
 5LlPLtJ81G39HmPGI8VnPhVcIFYMqM6SD5oSaSSu9uV7J5s6Ic+UnC/I+8NomGuZ44
 vtwJ8gsijjJqqpBx0zq+pE8iPnFON6RS+GAywviYw9iN5ed2DD/ecS06xQUsIF8keF
 9AkDCrMacaon6Ui/LmmO0gq/wSrRDaX+g3k5+yGPY0QGYpMtknXxOeC3yyBg3TFUrY
 Lz4xdRAQY4P6g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Jens
 Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar
 <rmoar@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v2 3/8] rust: block: use `kernel::{fmt,prelude::fmt!}`
In-Reply-To: <20250719-core-cstr-fanout-1-v2-3-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
 <gRsj-X3HsgPY0RHRFi_436uiCVwsW6_foevaDuyAYA05QfuGKU-LNQcofLAG8W-PBuuU1cZtSvkcI7gijo5vVw==@protonmail.internalid>
 <20250719-core-cstr-fanout-1-v2-3-1ab5ba189c6e@gmail.com>
Date: Fri, 08 Aug 2025 11:43:11 +0200
Message-ID: <87ikiy5ets.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

"Tamir Duberstein" <tamird@gmail.com> writes:

> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


