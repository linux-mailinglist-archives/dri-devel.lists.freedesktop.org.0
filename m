Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8BAE5EF9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 10:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DA210E51A;
	Tue, 24 Jun 2025 08:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lvutBbAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B7410E21E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 08:20:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACCFE61154;
 Tue, 24 Jun 2025 08:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CC1C4CEE3;
 Tue, 24 Jun 2025 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750753254;
 bh=MT2ajhY7wBsxVe1u0WpkIwXTE93WmbRHqKzUBLSi+Cc=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=lvutBbAfVXmj1ZMHbzOxFilI6BH6zaExqSK5o5j/FEuZtLGxwsaYRltqPRVegyhVM
 ME/N4uiz9VeS0iNejQTO5huO/BsnLQMQshee4k1gtdsr0Iul6GNhiuXkyQrhkn4u7u
 6hJqU5Aflh9wt9xc4e5KdszFH4cIq4Qs+g/o8iaccojclIrjyAXYSavsE2b5y95QBF
 /bdUy8ILbBtLS9Kk42ErF2bG1ta/9Z2+XKyLIGRtLQOypGLuhMDfcdftgXvsqSCW5s
 YDV5iE68DTJaS/HAwSM5iqACPvWFwZCAp2EtN7AzODZNPoA5G5JsFm6Nr4l+wt7j1y
 fT/vdxJb//SHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 10:20:48 +0200
Message-Id: <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
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
In-Reply-To: <20250624083437.1e50d54c@nimda.home>
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

On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
> Should we handle this in the initial implementation or leave it for
> follow-up patches after the core abstraction of ww_mutex has landed?

Since you're writing these abstractions specifically for usage in drm, I
think we should look at the intended use-cases there and then decide on
an API.

So maybe Lyude or Dave can chime in :)

If you (or someone else) have another user for this API that needs it
ASAP, then we can think about merging this and improve it later. But if
we don't have a user, then we shouldn't merge it anyways.

---
Cheers,
Benno
