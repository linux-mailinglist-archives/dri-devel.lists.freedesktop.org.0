Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9285AE6B39
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1469E10E5D4;
	Tue, 24 Jun 2025 15:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofeVI+uj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409BE10E5DB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 422D3A51D55;
 Tue, 24 Jun 2025 15:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2217C4CEE3;
 Tue, 24 Jun 2025 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750779357;
 bh=DRqR9Ha0k6DhcalVMjKRWy3O1Lm+9xUHZDW7jOei0Fo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ofeVI+uj2dSV/VDxHIE7DmfHk6a3Vn6RVzy/r4ULxwKxonRlyO3NmJCxyFD6c6Zmx
 SyqIL4swhkECFnBB95XAG9vzTnXKucT0gsBr4nnvEvdAl0dtSfQKNfAnGP2JcbEvOF
 texjyI5j7AWhj6/OZFvmLkufc7T4Am8Qw1VtyrgBYRNYOsL6rYX+7asBaA+H30lMUT
 PopeCbtGCfvA5FVgoOsH4/dm3Kb16riklga42G6svKkbsidGUwJYqIWbgJaMjw3ZMY
 s7ooUrPiI/yrL90yRbLosWJg1WYBYOQa6mOPKg23qXsMuLvZ03h38vDy04UfDAlPeY
 XunsuQR1DiNig==
Message-ID: <9ccd25dc-d642-4fcd-8dbb-ae221fa97556@kernel.org>
Date: Tue, 24 Jun 2025 17:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/24/25 5:27 PM, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::cast_from that
> wraps a raw pointer in Opaque without changing the inner type. Also
> rename raw_get() to cast_into() for naming consistency.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
