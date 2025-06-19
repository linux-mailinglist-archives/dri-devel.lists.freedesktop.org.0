Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D872AE05AB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953A910E0BB;
	Thu, 19 Jun 2025 12:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="V7WECjwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0492A10E0BB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750336026; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y/3KjsQt7ratnusfZtfrGx/S5qj+vswy0UDGHfbLfGoKwPnKDGI0oB2IFs/3Zd+Mj6Xm/FKMNc1B8wl4KsjnyNHf0Rhhw9v2tUIhpe+ESRby9/dvViRZyPvAiioHvb4g+2hYkG3/Gd2+NBLEdhmz4OrptXL1Ktl/bGX2FYo8/CM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750336026;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Y23/F3YZXW49CifwI8zvwOTLNocB6jmgOlf40p5qda8=; 
 b=kQ1auegOOZCtY12Xcut/8VtNexb+WejC2QZQAK9MS9Zi+ySlpBQIwdkcAiA5povLdEsmnLs011nSuzkIbIj5x825S62RX22kyCkIUEWXHA9Kg3dG3esfg5nQbKicgCFlkzqEls/uf07LHtiO5PXil1dDzcdH8hET71kuv6TIavk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750336026; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Y23/F3YZXW49CifwI8zvwOTLNocB6jmgOlf40p5qda8=;
 b=V7WECjwcYbuVz63oQrCTkLlqvMllLbDY3WtO1YDIGselrMgxyZ1dHORP9cAv0ZMx
 TjvjA7p5/UoiMytpP3qFf/MiXf+Ud16jT1X6l4Cx8QXX80BNasQyU4uuYG3bQIbg0QJ
 fvKSnIdQy3diYlHpBIzsElmYbGR4qn8Zuo1gdbP4=
Received: by mx.zohomail.com with SMTPS id 1750336024069742.4704110312686;
 Thu, 19 Jun 2025 05:27:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
Date: Thu, 19 Jun 2025 09:26:48 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

Hi Benno,

> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>>> index 445639404fb7..12b296131672 100644
>>> --- a/rust/kernel/drm/ioctl.rs
>>> +++ b/rust/kernel/drm/ioctl.rs
>>> @@ -139,7 +139,7 @@ pub mod internal {
>>>                             // asserted above matches the size of =
this type, and all bit patterns of
>>>                             // UAPI structs must be valid.
>>>                             let data =3D unsafe {
>>> -                                &*(raw_data as *const =
$crate::types::Opaque<$crate::uapi::$struct>)
>>> +                                &mut *(raw_data as *mut =
$crate::uapi::$struct)
>>=20
>> I think we have to document the guarantees we rely on to create this =
mutable
>> reference.
>=20
> If the C side is using pointers to read/write the value concurrently,
> this is wrong, it needs to be wrapped in Opaque.
>=20
> ---
> Cheers,
> Benno

How can this happen, exactly? Can you provide an example that =
corroborates it?

The general pattern for drivers is to fill an uapi type and then wait on =
an
ioctl. The kernel then copies that using copy_from_user, so we're safe =
from
that perspective (i.e.: from the perspective of concurrent access from
userspace).

In kernelspace, we usually extract arguments from the uapi types to then
dictate further processing inside drivers. In what way are these shared =
with
"the C side" ?

If the result of this discussion is that we agree that this Opaque is =
not
needed, then we definitely need this patch, because using Opaque<T> =
complicates
all ioctls implementations by making it harder to get to the inner T in =
the
first place. We would have to needlessly add a lot of unsafe blocks for =
drivers
that wouldn't otherwise be there.


-- Daniel=
