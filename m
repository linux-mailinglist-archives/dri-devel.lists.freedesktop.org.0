Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC2CF2FA7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9110E0B7;
	Mon,  5 Jan 2026 10:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f7gJE84s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6947510E0B7;
 Mon,  5 Jan 2026 10:29:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2146C44362;
 Mon,  5 Jan 2026 10:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B15C19421;
 Mon,  5 Jan 2026 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767608949;
 bh=ZY10t/C1aiDKwdd1UbY3puinOltwLYQ1DyXZdChX+ug=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=f7gJE84sdtUUggDQ6srNOAJXkMbLkp28Q6mNDcNb0vpVKgqPcYsnsnTzkd9HzE+rb
 4ZSP7GnvOwkflwE4x3Tws5bT/cNPyyBbgUjMSFdCM5WGYL8Ux6lWHu/qrgDHDuurRt
 Vy1ZwD2hccrT3IkU82BsPuSBxFuPH9h71DV+Bru5YojRSTwh/rgxXc5DGAVguhZU+S
 H7h7KAUqxvCL34c8RkVyBYj0C2yQ6APQq+lGUwC4TLD7866U1bCVpCUKM5rW47FXIE
 1NkzUbSapRsCwYAAaBlZMXwulxaMv+VtPm+JtPb7B8yHMa5816z3vYh5dgSx+xx+nb
 urldBqXzJPkzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 11:29:04 +0100
Message-Id: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
In-Reply-To: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
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

On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>> Add a derive macro that implements kernel::fmt::Display for enums.
>> The macro outputs the exact variant name as written, preserving case.
>>
>> This supports all enum variant types: unit, tuple, and struct variants.
>> For variants with data, only the variant name is displayed.
>
> I don't think we should be adding this. Display is designed for
> user-facing output and so it should always be carefully designed and no
> automation should exist for it.

In general I agree, but simple stringification of an enum variant for a Dis=
play
implementation is a very common use-case and it seems pretty unfortunate to=
 have
to fall back to either do the below (especially if there are a lot of enum
variants) or having to go the declarative path of doing something as in [1]=
.

Especially in combination with things like FromPrimitive and ToPrimitive it=
 gets
us rid of the cases where we need such declarative macro mess.

Eventually, drivers will most likely implement their own proc macro for thi=
s or
repeat the declarative macro pattern over and over again.

Maybe we should just pick a more specific name for such a derive macro than
macros::Display.

Maybe something along the lines of macros::EnumVariantDisplay? We could als=
o
have an optional argument indicating whether it should be converted to lowe=
r /
upper case.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/nova-core/gpu.rs#n25
