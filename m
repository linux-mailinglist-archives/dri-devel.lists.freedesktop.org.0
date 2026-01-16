Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B840D323E6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE0B10E8A9;
	Fri, 16 Jan 2026 14:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LDX1l3F/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274610E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768572007; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bLiQLj7XAZz7gZWqRd7A9ueSyyF+pIL2jia1lHEhdiuybP06XRBKDvJeTiB9/rFS7lANeLcXd+ezVtMFdqQMYn1pQ5s19WnpV0JGoGdlLx8x/le0HGS0oO1faGXq6Uzzf8bH8JjZ5JyTPDgSQsc7unc2oYv7Sf7dIaeX+VDwUWI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768572007;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nV6t9dP529iRTpOgseILMS7reXIydZJXQKP41jzKjrI=; 
 b=ZDhLCvfCv++BVcIkT422NRhM4MrNi/RUJj4aoQXtpHSgJ+yhmwUqyGIUbwp/pWQRQuuxA/iQOuO46RYvke7FEnktHrENpqPJ7eXWGHxd7va0dOJvn9uq7XImsKJtqxv21ETCZ6WpbFLfKzffOAJMGkDlE2BDkZu0GfQszmUtgxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768572007; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=nV6t9dP529iRTpOgseILMS7reXIydZJXQKP41jzKjrI=;
 b=LDX1l3F/cejc0BXnEdpDJ6UjS8PgAiZdrhVzKDWjD3KUG+tI+LIoWZ2Dh55GF86i
 kjGq3aicqRqwk6Z97r1IUALyzaKP0lYSwg612RSR6uzbHFn0VToAVS/Wd3jP2TEpqKt
 jgmmi9CUOjCWm1RTirxjml80i1fle9qfqLPv/wh0=
Received: by mx.zohomail.com with SMTPS id 1768572005245379.4413591038924;
 Fri, 16 Jan 2026 06:00:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <cc73ce51-39c1-4f2d-8bcb-99fd220fd34c@de.bosch.com>
Date: Fri, 16 Jan 2026 10:59:48 -0300
Cc: Dirk Behme <dirk.behme@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9B69FEC-0A99-4F2C-AA59-59B8C34B4E4E@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <cc73ce51-39c1-4f2d-8bcb-99fd220fd34c@de.bosch.com>
To: Dirk Behme <Dirk.Behme@de.bosch.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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


>>>=20
>>> Is there any reason why you replace the UPPERCASE register names =
with
>>> CamelCase ones?
>>>=20
>>> I was under the impression that we want to use UPPERCASE for =
register
>>> names. Like in nova
>>>=20
>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpu/nova-core/regs.rs
>> Not really. UPPERCASE for non-const items will trigger the linter. =
The Nova
>> people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
>> discussions, their registers are automatically generated from some =
internal
>> docs.
>> We have only a few, we can simply convert them to CamelCase.
>=20
>=20
> I'm under the impression that we define the "future RFL register!() =
style standard" here.
>=20
> So we want to make the CamelCase the default? And nova is the =
exception?

I=E2=80=99m not sure I would say this. It=E2=80=99s just that you would =
hit this lint
[0]. If UPPER_CASE was the =E2=80=9Cdefault", we would have to have the =
#[allow] on
every driver.=20

>=20
> I'm fine with that. Just want to make sure we talked about it :)
>=20
>=20
> ....
>>>> pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>>>> pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>>>> pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>>>>=20
>>>> -pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>>>> +register!(McuControl @ 0x700, "Controls the execution state of the =
MCU subsystem" {
>>>> +    1:0     req as u32, "Request state change";
>>>> +});
>>>=20
>>>=20
>>> Any reason why req is a u32 and not a u8? Same for some other =
places.
>> I tend to default to u32/i32 in general, as that=E2=80=99s usually =
the native machine integer type.
>> All we get from smaller types is a spam of `into()`, `from()` and =
their `try_`
>> equivalents. When stored in a struct, they usually do not save space =
due to
>> padding that is usually inserted to fix the alignment for the type. =
IMHO not
>> worth it unless it really matters. Correct me if I'm wrong, but it =
doesn't seem
>> to be the case here.
>=20
>=20
> Wouldn't using u8 prevent any accidental access to 31:8 ?

The macro is doing the appropriate masking according to the bit ranges =
you pass
in (i.e.: 31:8), not according to the type (u8 or u32), i.e.:

        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =3D=
 $lo..=3D$hi; <------
        const [<$field:upper _MASK>]: $storage =3D {
            // Generate mask for shifting
            match ::core::mem::size_of::<$storage>() {
                1 =3D> ::kernel::bits::genmask_u8($lo..=3D$hi) as =
$storage,
                2 =3D> ::kernel::bits::genmask_u16($lo..=3D$hi) as =
$storage,
                4 =3D> ::kernel::bits::genmask_u32($lo..=3D$hi) as =
$storage,
                8 =3D> ::kernel::bits::genmask_u64($lo..=3D$hi) as =
$storage,
                _ =3D> ::kernel::build_error!("Unsupported storage type =
size")
            }
        };
        const [<$field:upper _SHIFT>]: u32 =3D $lo;
        );

        $(
        #[doc=3D"Returns the value of this field:"]
        #[doc=3D$comment]
        )?
        #[inline(always)]
        $vis fn $field(self) -> $res_type {
            ::kernel::macros::paste!(
            const MASK: $storage =3D $name::[<$field:upper _MASK>];
            const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
            );
            let field =3D ((self.0 & MASK) >> SHIFT);

            $process(field)
        }


>=20
>=20
> Best regards
>=20
> Dirk


[0]: =
https://doc.rust-lang.org/stable/nightly-rustc/rustc_lint/nonstandard_styl=
e/static.NON_CAMEL_CASE_TYPES.html

