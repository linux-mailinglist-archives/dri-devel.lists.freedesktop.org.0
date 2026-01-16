Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55999D31F4D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6FE10E0E5;
	Fri, 16 Jan 2026 13:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WmnL5hd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5AA10E0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768570727; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IrHRJsfrKhqu8fGDVtYj6phtF5yN8hV1zx6BRI48BhQnYJyF/MXJ2xM0zPqKKjRekhWLA1oXLi0VbvKiiP3eXKV+5FDlh79UPN0LkIPugXHfNmnWV0WjzIkRhHRDPHffooVRovDqutasw0lK2dC/uT2n2ib9/GWKwykTmPy18no=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768570727;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=enPjwzl5bnC2GLEGcSl4XbJTUWzDnyudvVwrQkvmoU8=; 
 b=cezAtbdKDouguX+YSN+6AdKU3pqWe885k10GLc/CB/x4R1YEoP1kTecb+rsJa/g2OjnPUrYHTh6MXxyHxQNYCDLx5Dt+iGgY3wUxw+jK1FZpxyJICCX13MvuYBaf8O1TLkHmPnONoC1aLucjEpfJGeb0QIdKm705keShqH3D2xk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768570727; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=enPjwzl5bnC2GLEGcSl4XbJTUWzDnyudvVwrQkvmoU8=;
 b=WmnL5hd5C6EOsdm9nQYo1UqOZdpGZUF46/CReJjXrsPI1u/weqz3qmOfYDtoKPkl
 UzXyg+HV/iOT8WsbuMSaIkrvYZGxICsFxY+eF49GP8BB71yikoJ+/Ks4zBi9m503Wtk
 ZHYhT8xyG1XTGEYft4IiQbYkeUOImevJE3YEGK7c=
Received: by mx.zohomail.com with SMTPS id 1768570725196465.4311800451652;
 Fri, 16 Jan 2026 05:38:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
Date: Fri, 16 Jan 2026 10:38:28 -0300
Cc: Dirk Behme <dirk.behme@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
To: Gary Guo <gary@garyguo.net>
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
>>=20
>> Not really. UPPERCASE for non-const items will trigger the linter. =
The Nova
>> people chose to #[allow] this to align with OpenRM and, IIRC from the =
LPC
>> discussions, their registers are automatically generated from some =
internal
>> docs.
>>=20
>> We have only a few, we can simply convert them to CamelCase.
>=20
> Frankly, register names do look nicer in UPPER_CASE, especially that =
they're in
> many cases, packed with acronyms.
>=20
> Best,
> Gary
>=20

I don=E2=80=99t have an opinion here, to be honest. I think CamelCase =
does make it
easier on the eyes since our register names look quite simple, specially =
when
compared to Nova. However, I can switch to UPPER_CASE and add an
#![allow(non_camel_case_types)] if more people chime in.


