Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABFC10FA6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 20:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF6110E558;
	Mon, 27 Oct 2025 19:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tw6IvwQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D7210E552;
 Mon, 27 Oct 2025 19:28:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 334B961FE8;
 Mon, 27 Oct 2025 19:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC92DC4CEF1;
 Mon, 27 Oct 2025 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761593291;
 bh=mEn8TJATXk1tz9tGLRPYHPHeXgwksh2Kb5KZxPPolWk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=tw6IvwQzmD6dYwYnVSFb/aYd1E87zUZ5c1HSqHGuVhjyX94xKCZ4BeLSAXYr7SZW9
 zc9gJur4jQ46Dy9Ml1fHpklJ6vjZNSBG1wziev3FvZPUACkLcHgsuDDnrDrQfiEF7G
 9CI7y6R2YryeCqsvaFCJOmUTn0qnoXQNshG47ilhWRd9bXV7Qm0gBwnf8ZEODH0wp6
 HDm8hjNoSEKY9O9GkHfbBq7q7qOS4UZbF1prymxsTsEvDeo6Y3677FYVSOwRPw+rIN
 RKtTon5ikS7MfjgKfP8Gq9RW3gbzZVYseq8rbIYnxaBFUo9uLxl8djumfmseBXXmNW
 Lw+Ubom2a0vug==
Message-ID: <4ec735c2-d0cc-43ad-8184-b30359c8d570@kernel.org>
Date: Mon, 27 Oct 2025 20:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
From: Danilo Krummrich <dakr@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
 <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
 <10945c03-8642-4c19-b0ed-ffb20c075291@kernel.org>
Content-Language: en-US
In-Reply-To: <10945c03-8642-4c19-b0ed-ffb20c075291@kernel.org>
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

On 10/27/25 8:23 PM, Danilo Krummrich wrote:
> On 10/27/25 8:09 PM, Joel Fernandes wrote:
>> Why not just implement `From` and `Into` for the types missing it then, with
>> adequate comments about why such conversions are Ok for the kernel, instead of
>> introducing a new trait? This is exactly what `From`/`Into` is for right?
> 
> https://doc.rust-lang.org/reference/items/implementations.html#r-items.impl.trait.orphan-rule.intro

(Sorry, I didn't mean to send the link without additional comment.)

We can't do this due to the orphan rule, but even if we could I think a separate
trait indicating the reason for the conversions to be valid is a good thing.

- Danilo
