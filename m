Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F57AE6564
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5730E10E591;
	Tue, 24 Jun 2025 12:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qZ+OIKBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDD610E59C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 12:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3B1B5C65C3;
 Tue, 24 Jun 2025 12:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221AAC4CEE3;
 Tue, 24 Jun 2025 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750769325;
 bh=tP4bo0nKPQxjqvAvCgRkhsp1e4XImh4zH8iqxHKFAZc=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=qZ+OIKBLrFvFkfxsR5MIjH2l+GMeUdJ3LvE6in7YKt8ZOlrdvYvTvGdUPiITX+Hci
 IAUAG5FOl960IuncqFsT4sCckdvrwyVGTK3t+hqXliRYnEHYFQdQ6FOXLSAexzegUG
 CkDOi3rib7zM3USAYCGKlx4rPa9QT3sleQhH/wPnIApaJrzDaEoGsNffh5dUlhRo0T
 Q+hC/mnpj8MT7zlckl7TmIBqpamxI+HMgRPCwYn2ORln9cZjxHKRjVzfNiOmij/fvm
 3ztY/gCPEN16LIxzHgZiRBma1oGeGBiIc3rPiUga5y5Xqul22RAcueJSmpl8W3BDw+
 BsacP4oqOPr1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 14:48:39 +0200
Message-Id: <DAURXDWGWEDV.2GZ129VC6IFKF@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Onur" <work@onurozkan.dev>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <aFmKsE_nJkaVMv0T@tardis.local>
 <DAUARTYJ118U.YW38OP8TRVO3@kernel.org> <20250624083437.1e50d54c@nimda.home>
 <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
 <20250624153102.3961f377@nimda.home>
In-Reply-To: <20250624153102.3961f377@nimda.home>
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

On Tue Jun 24, 2025 at 2:31 PM CEST, Onur wrote:
> On Tue, 24 Jun 2025 10:20:48 +0200
> "Benno Lossin" <lossin@kernel.org> wrote:
>
>> On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
>> > Should we handle this in the initial implementation or leave it for
>> > follow-up patches after the core abstraction of ww_mutex has landed?
>>=20
>> Since you're writing these abstractions specifically for usage in
>> drm, I think we should look at the intended use-cases there and then
>> decide on an API.
>>=20
>> So maybe Lyude or Dave can chime in :)
>>=20
>> If you (or someone else) have another user for this API that needs it
>> ASAP, then we can think about merging this and improve it later. But
>> if we don't have a user, then we shouldn't merge it anyways.
>
> I don't think this is urgent, but it might be better to land the basic
> structure first and improve it gradually I think? I would be happy to
> continue working for the improvements as I don't plan to leave it as
> just the initial version.

I don't think we should land the basic API when we don't have a user
in-tree or blessed by the maintainers.

> I worked on the v5 review notes, but if we are going to consider
> designing a different API, then it doesn't make much sense to send a v6
> patch before finishing the design, which requires additional people in
> the topic. That would also mean some of the ongoing review discussion
> would be wasted.

I would just wait for DRM to say something :)

---
Cheers,
Benno
