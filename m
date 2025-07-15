Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18030B054D9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DA710E553;
	Tue, 15 Jul 2025 08:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eGWM78GN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2FC10E553
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:27:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0CD95C433A;
 Tue, 15 Jul 2025 08:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BADC4CEE3;
 Tue, 15 Jul 2025 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752568070;
 bh=y3xFDIGFBDQ7/2ZnpboVuHHoy99yqCXaJ44aZphq0Jw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=eGWM78GNXV7hk+5EcCroUVyNEdLqVqqYOj5L/Q0Wlw/lPp/gVYhpXOmbo1JakPY4G
 kCvv5s6BIEriJWxl+r8WuFvGfeI9/ZxWss3qzTNV3aA7ODM4jsq8u0sC9QNv39vwwY
 dDk7mTXRbNrM5egbBIK0JK+4WZg0xB+GTj9a1Q5mvvYrCJL5nCfQ81N2Wi2Sdd23Oz
 EbeGa/RdI8CMzmHQp6BbvUSRbm9inhtJ0g3gOAMJNXwlc92HcB0zYikZN/Qv6BjXs2
 cXXwH45Cm2Q/88kIVyq+KIcnAQST7Uj+2YgLtRonc/mXofzgphPemqkQTBxjRhxAeT
 Fe0WazcCb+5uw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 10:27:45 +0200
Message-Id: <DBCHJ2HTJMQS.175D313DV5Q7Q@kernel.org>
Subject: Re: [PATCH v2 0/2] Add Opaque::cast_from
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
In-Reply-To: <20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com>
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

On Tue Jun 24, 2025 at 5:27 PM CEST, Alice Ryhl wrote:
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
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

For the series,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

For the DRM parts,

Acked-by: Danilo Krummrich <dakr@kernel.org>
