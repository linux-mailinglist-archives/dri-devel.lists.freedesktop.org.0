Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589BC314C6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA5E10E261;
	Tue,  4 Nov 2025 13:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j877KRJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510FB10E261;
 Tue,  4 Nov 2025 13:49:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C076941AA4;
 Tue,  4 Nov 2025 13:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47203C16AAE;
 Tue,  4 Nov 2025 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762264186;
 bh=qAe+WnKRhyi7M2hgYxlX4ON4RtjRVE5CgSMyQVRb7Do=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j877KRJbTrKeV32q1oEbIyDisS+qk+QRihArO5A2jdhVnNaVT1SsmLeR67MMCsyPI
 iJLwzKKR0+oWOerzl7ZV1rp6OkMR+LM5FH3PconG4wL1tSJTaNRtF7wyVuYx4iiFLV
 AmN34SEmK2OlyRjoJR3KwxPzeQVDtKrhcRk5pRWBsio6a+zU2x0YZdivy836nm44vC
 iWtwpW+kRataeuMXBXOSQcT0wncfkLqh5beI1snwT8ucbO3xVy18XbaciYbNP+U1FB
 xTNvix2BJm8eYYj7TljUHFAI8CTqlsQFBFOm3eLGeg5y4F3ZpBvbg2biUu++H38gSI
 eq1R6jjtTVzPQ==
Message-ID: <daf3f3e9-19f8-4055-8964-a3ffba97e1ca@kernel.org>
Date: Tue, 4 Nov 2025 14:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/1/25 4:51 AM, Alexandre Courbot wrote:
> I am wondering whether `CList` serves an actual purpose beyond providing
> ` CListIter` to iterate on... Would it make sense to merge both types
> into a single one that implements `Iterator`?

I think eventually we will have a bunch of iterator types, e.g for
list_for_each_entry_{safe,reverse,continue}() etc. (see also [1]).

Hence, CList has to provide a couple of methods providing different iterator types.

[1] https://lore.kernel.org/lkml/DDVYV1VT441A.11L5C11F8R7C9@kernel.org/

