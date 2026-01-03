Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECFCEFDF2
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 11:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595410E125;
	Sat,  3 Jan 2026 10:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8SBg0g4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4110E125;
 Sat,  3 Jan 2026 10:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D092A40D83;
 Sat,  3 Jan 2026 10:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D351AC113D0;
 Sat,  3 Jan 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767435300;
 bh=VJPG6cAxntp719Jx+yOECXPqz1CSvBhPq9ajb2tyTX4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=q8SBg0g495DLKSAVqjx4MtrtLI/KWiCvW4GWkdFlpUw+/KIF7qSVpRVDR62wiZOJp
 BlTgbdL/SAc88Bjz+53B3bzv9S+iRBg4Z/K14olgFfTnZ/fV2UWGTQDd7i92+CK9fQ
 t4lJxSoqZ1ue0A0dey4+5+O0sc78U4lJ9xNYqE7XoFUkeFknWE2i/MpGoozjoAQU1V
 akGoUm+0QeSU2kDSfmyILZx2Vgmmhb3e0AdFzs3hUUAnGxzdbmxhbcPYsL/5SyJUny
 g5mW3D9LQzzyWchTzZ2ccldRVzF5yac7YIzjhioffJ2YaAiRu+GVTA6Z2ryXr0cXTY
 k7LfN5J1ztzAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 11:14:55 +0100
Message-Id: <DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org>
Subject: Re: [PATCH v2 09/10] gpu: nova-core: simplify str_from_null_terminated
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
 <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
In-Reply-To: <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
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

On Sat Jan 3, 2026 at 4:37 AM CET, John Hubbard wrote:
> On 12/15/25 8:27 PM, Alexandre Courbot wrote:
>> The core library's `CStr` has a `from_bytes_until_nul` method that we
>> can leverage to simplify this function.
>>=20
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/util.rs | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.=
rs
>> index 8b2a4b99c55b..2cccbce78c14 100644
>> --- a/drivers/gpu/nova-core/util.rs
>> +++ b/drivers/gpu/nova-core/util.rs
>> @@ -2,15 +2,10 @@
>> =20
>>  /// Converts a null-terminated byte slice to a string, or `None` if the=
 array does not
>>  /// contains any null byte or contains invalid characters.
>> -///
>> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte=
 can be anywhere in the
>> -/// slice, and not only in the last position.
>>  pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>>      use core::ffi::CStr;
>> =20
>> -    bytes
>> -        .iter()
>> -        .position(|&b| b =3D=3D 0)
>> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=3Dnull=
_pos]).ok())
>> +    CStr::from_bytes_until_nul(bytes)
>> +        .ok()
>
> I guess I should have reviewed this patch, before creating my version of =
this.
> I went so far as to delete this file entirely, see if you prefer that, it=
's
> otherwise the same core idea, but with more cleanup. [1]
>
> [1] https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com

Yes, let's remove str_from_null_terminated() entirely.

>>          .and_then(|cstr| cstr.to_str().ok())

Additionally, why do we return an Option here? While an error can only ever=
 happen if
the given slice does not contain any NULL byte, I don't see why we discard =
the
error code.
