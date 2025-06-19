Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C12AE06C8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399010E02E;
	Thu, 19 Jun 2025 13:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fqWIl7Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7175110E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:17:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F79A4ACFF;
 Thu, 19 Jun 2025 13:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20516C4CEF9;
 Thu, 19 Jun 2025 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750339056;
 bh=c2E3iqwtJvWel7zGv2Rkd8QZeSAwVWBNqMuO8Ypqgbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fqWIl7Ui2f9PfoGFnlRECL5UBz3jsK02cR9Iyx0tHSUb7w+9SQ0hEXtKqcvVCxJha
 Em1swrU2q9N+m20xaH03XT32lVstljh60Py2hXsRb6IlpV9BAKzcVEUxv68jEiZo3J
 wwhnVpN1HRf8rTf5I8uZHBirWazU4rKFpaBd+eBoT47ea1ocxCFRhzYqs5n7QgJIBS
 a/DuHKsxi8KswMEg+CLug9YV4vZWj+mvxayynpJJAt1eQF3aAA3Gki/AUFi5ExOJwR
 zNNzI/e8lBN1afOG4Pbx4RD6RE/DBWF63g6RVqM1q/S1fqA/fvuj3OJZaz+I+eeIzC
 0yA0vcGyApVHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 15:17:31 +0200
Message-Id: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Beata Michalska"
 <beata.michalska@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <aliceryhl@google.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
X-Mailer: aerc 0.20.1
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
In-Reply-To: <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
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

On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> Hi Benno,
>
>> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
>>=20
>> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
>>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>>>> index 445639404fb7..12b296131672 100644
>>>> --- a/rust/kernel/drm/ioctl.rs
>>>> +++ b/rust/kernel/drm/ioctl.rs
>>>> @@ -139,7 +139,7 @@ pub mod internal {
>>>>                             // asserted above matches the size of this=
 type, and all bit patterns of
>>>>                             // UAPI structs must be valid.
>>>>                             let data =3D unsafe {
>>>> -                                &*(raw_data as *const $crate::types::=
Opaque<$crate::uapi::$struct>)
>>>> +                                &mut *(raw_data as *mut $crate::uapi:=
:$struct)
>>>=20
>>> I think we have to document the guarantees we rely on to create this mu=
table
>>> reference.
>>=20
>> If the C side is using pointers to read/write the value concurrently,
>> this is wrong, it needs to be wrapped in Opaque.
>>=20
>> ---
>> Cheers,
>> Benno
>
> How can this happen, exactly? Can you provide an example that corroborate=
s it?

I don't have the context on this, I only saw a raw pointer being turned
into a mutable reference and that's only possible if there are no shared
or other exclusive references for the duration of its existence and no
raw pointers are being used to access the value.

---
Cheers,
Benno

> The general pattern for drivers is to fill an uapi type and then wait on =
an
> ioctl. The kernel then copies that using copy_from_user, so we're safe fr=
om
> that perspective (i.e.: from the perspective of concurrent access from
> userspace).
>
> In kernelspace, we usually extract arguments from the uapi types to then
> dictate further processing inside drivers. In what way are these shared w=
ith
> "the C side" ?
>
> If the result of this discussion is that we agree that this Opaque is not
> needed, then we definitely need this patch, because using Opaque<T> compl=
icates
> all ioctls implementations by making it harder to get to the inner T in t=
he
> first place. We would have to needlessly add a lot of unsafe blocks for d=
rivers
> that wouldn't otherwise be there.
>
>
> -- Daniel

