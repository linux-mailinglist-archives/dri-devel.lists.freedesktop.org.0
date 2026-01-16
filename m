Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F5FD31117
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC9B10E873;
	Fri, 16 Jan 2026 12:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="XfFI5+0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757FD10E873
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768566435; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XztM6jXcggCoSAdRQhx7ulTk76U7pV8YwGRkO7TnPNgoaVztEjJsy2++/n58bI77cwmRaDfJoVdr4Qa0i2CkQ396GOyhqnd33FfG+tO5rx2W49fdATqqEmhS3tPzK7A5eSIoxkxUNHAPpygYxiS2I7Qsv/+lzzlpGvHHaDoRs+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768566435;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vBfAEgyGBaloJD+gDr2a3D9GTaH00nj/0Atxxx5/vhA=; 
 b=DCdmP1ByQqir2BQM5uGG/rzv7tr9DWbaQWS0vaG48hjvlR0OqZmYsoWR9/FIT7DMnpjs2zkKB4zjh6hAhL0sqZXo7cbWGCuEwk+aI4+cvhqXvd5YQXCeqUew1rNWcuQaqdbejZ1p/HCv6TOfYJNw7OyH0O6dJTZKvqepwUSQT1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768566435; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=vBfAEgyGBaloJD+gDr2a3D9GTaH00nj/0Atxxx5/vhA=;
 b=XfFI5+0aH9b6MOxsWTdNDxgZ305ALBA0GN82wKazNq5mu2V4/vcGPURLn/tNn3wA
 y13L+uhclztPByheXrJOF12eEI6XQiljbR//pownUl0x+SHLShLkrCKuM0M4zxE5Fcn
 zFz9Fk+ifOzyV8sCNxhUHrvjeBbwELmBpmoZp4uI=
Received: by mx.zohomail.com with SMTPS id 176856643300881.11206264439409;
 Fri, 16 Jan 2026 04:27:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
Date: Fri, 16 Jan 2026 09:26:55 -0300
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
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
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

+cc Alex,


>>> +    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active =
(higher 32 bits)";
>>> +});
>>> +
>>>  pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>>>  pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>>>  pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>>>  -pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>>> +register!(McuControl @ 0x700, "Controls the execution state of the =
MCU subsystem" {
>>> +    1:0     req as u32, "Request state change";
>>> +});
>> Any reason why req is a u32 and not a u8? Same for some other places.
>> And would it be an option to move the const MCU_CONTROL* to an =C3=ACmp=
l
>> McuControl Same for STATUS below.
>=20
> Just fyi something like [1] builds for me.
>=20
> This is inspired by
>=20
> =
https://lore.kernel.org/rust-for-linux/20251003154748.1687160-6-joelagnelf=
@nvidia.com/
>=20
> Best regards
>=20
> Dirk
>=20
> [1]
>=20
> #[repr(u32)]
> #[derive(Debug, Default, Clone, Copy, PartialEq)]
> enum McuControl {
>    #[default]
>    Disable =3D 0,
>    Enable =3D 1,
>    Auto =3D 2,
> }
>=20
> impl From<McuControl> for u8 {
>    fn from(ctrl: McuControl) -> Self {
>        ctrl as u8
>    }
> }
>=20
> impl From<u8> for McuControl {
>    fn from(req: u8) -> Self {
>        match req & 0x3 {
>            0 =3D> McuControl::Disable,
>            1 =3D> McuControl::Enable,
>            2 =3D> McuControl::Auto,
>            _ =3D> McuControl::Disable,
>        }
>    }
> }
>=20
> register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU =
subsystem" {
>    1:0     req as u8 =3D> McuControl, "Request state change";
> });

Alex, looking at the above, I wonder if a =E2=80=9Cas Foo=E2=80=9D would =
be a good
addition to the macro? That would then invoke a Try=46rom =
implementation, i.e.:


register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU =
subsystem" {
   1:0     req as McuControl =3D> McuControl, "Request state change";
});

