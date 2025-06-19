Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E54AE0301
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 13:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9B10EA05;
	Thu, 19 Jun 2025 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RCHt64R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A67710EA05
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 11:01:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4EDA54A205;
 Thu, 19 Jun 2025 11:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563FDC4CEEA;
 Thu, 19 Jun 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750330881;
 bh=QrTbq1gC7rkfhVdqmMkNAd0Xgm8URhDFN46HIJPT/dY=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=RCHt64R3U0CO/MnZbnnpOQgDE0TAGVSCXx1Y4/h/7hMUp9g5451byBD2ePeT4XtIq
 5nC8+6JgIZ01Mu0k45EYGi2o/1huaHwf2+Zr9XL7HBIfj4ikPs5PXC5t6oU9Yo36PU
 ntg1TivIH/sZ/hwxD5nlWI3x6FlCTgdN2d34ym9S1GUNMvTchItAZe243XNuE8VPqq
 Sgu4tyz0evtT2zJRTT8i5fTVoJQnoMftvZp1q9FIgD9HQ07OfD+UkmKm8K6jNdEAg8
 YUuC43Epk49kuHOOFGuG2mKn9hrZNyqcp5YI7UXpQoN5M5qCd/iTWeqZQvUE7A5Jxz
 03dosavRXfQ1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 13:01:16 +0200
Message-Id: <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Beata Michalska"
 <beata.michalska@arm.com>
X-Mailer: aerc 0.20.1
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
In-Reply-To: <aFPsjIFIC1J2qtdc@pollux>
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

On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>> index 445639404fb7..12b296131672 100644
>> --- a/rust/kernel/drm/ioctl.rs
>> +++ b/rust/kernel/drm/ioctl.rs
>> @@ -139,7 +139,7 @@ pub mod internal {
>>                              // asserted above matches the size of this =
type, and all bit patterns of
>>                              // UAPI structs must be valid.
>>                              let data =3D unsafe {
>> -                                &*(raw_data as *const $crate::types::Op=
aque<$crate::uapi::$struct>)
>> +                                &mut *(raw_data as *mut $crate::uapi::$=
struct)
>
> I think we have to document the guarantees we rely on to create this muta=
ble
> reference.

If the C side is using pointers to read/write the value concurrently,
this is wrong, it needs to be wrapped in Opaque.

---
Cheers,
Benno
