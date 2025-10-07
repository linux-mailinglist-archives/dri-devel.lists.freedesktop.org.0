Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B7BC2C82
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 23:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9910E38E;
	Tue,  7 Oct 2025 21:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hJtnTpJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E6910E38E;
 Tue,  7 Oct 2025 21:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759873340; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jst9tLl0g+DcTTlm/uVGfOB9ROwdCUi7usrrGGQVClyuDi4MQyJGwH6TaKFrdgm/gXJKrNbMvHS+zVDSqClilECD0vc0KVcJTXqP2YSuAb3JOjVyyeeWN3aSGdNn/tGFs6tGCam1/wgPkLrriBy/iBkMzaRlwlf0HfyRYBv8OXg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759873340;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=n1UoTe1AZhGigHQGV0CdR2wm8Fae8Pl6fd/EfxVHScs=; 
 b=HM6Ucj+Q+zpu/4kYaw4cbG8KHvY4QHDBeC2jrWIYvg893luy0+R3E0Lqnoi3c4eLe7koUZBTDJWOd9qXfP6baaBNhIyffGjVMwLehaBvv1PXRuBjmmXFK9NMsd1uRZGmpmtCNq74Yd6oqcL5ZArzAAtX+TPo2Lw4CVDI3tJ+B2k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759873340; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=n1UoTe1AZhGigHQGV0CdR2wm8Fae8Pl6fd/EfxVHScs=;
 b=hJtnTpJL+1bUSqKnHuxIApEBBKHhanxQbg9Kr9G8lvhe/+ZZUuni2inz/HCDHVbx
 E00Ejbfke0hp6M/0Swy4+ZIweFIJxZ4W33s3OL5j7iOmMHZqLlnXZKChJ8XSanpj0x+
 UMgsU6pRjTT33p/LJ2+Caao2sMivBq0cercIkMds=
Received: by mx.zohomail.com with SMTPS id 1759873339080158.75028192472178;
 Tue, 7 Oct 2025 14:42:19 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aOU0joJQZiU61GBB@yury>
Date: Tue, 7 Oct 2025 18:41:58 -0300
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D421296D-FFF3-4998-B467-8E079AEB7499@collabora.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <aOU0joJQZiU61GBB@yury>
To: Yury Norov <yury.norov@gmail.com>
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

Hi,

First and foremost I=E2=80=99d like to say sorry for not having the =
bandwidth to
chime in here earlier. I=E2=80=99ve been pretty consumed by Tyr itself =
lately.

> On 7 Oct 2025, at 12:41, Yury Norov <yury.norov@gmail.com> wrote:
>=20
> On Tue, Oct 07, 2025 at 07:36:21PM +0900, Alexandre Courbot wrote:
>> Hi Yuri,
>>=20
>> On Tue Oct 7, 2025 at 7:29 AM JST, Yury Norov wrote:
>> <snip>
>>> Regardless, I don't think that this is the right path to move the
>>> bitfields into the core. The natural path for a feature that has
>>> been originally developed on driver side is to mature in there and
>>> get merged to core libraries after a while. Resctrl from Intel is =
one
>>> recent example.
>>>=20
>>> With that said, I'm OK if you move the bitfields as a whole, like =
you
>>> do in v5, and I'm also OK if you split out the part essential for =
nova
>>> and take it into the driver. In that case the bitfields will stay in=20=

>>> drivers and you'll be able to focus on the features that _you_ need,
>>> not on generic considerations.
>>>=20
>>> I'm not OK to move bitfields in their current (v6) incomplete form =
in
>>> rust/kernel. We still have no solid understanding on the API and
>>> implementation that we've been all agreed on.
>>=20
>> Initially the plan was indeed to give this code some more time to =
mature
>> in nova-core before moving it out.
>>=20
>> The reason for the early move is that we have another driver (Tyr) =
who
>> wants to start using the register macro. Without it, they would be =
left
>> with the option of either reinventing the wheel, or poking at =
registers
>> the old-fashioned way, which I think we can agree is not going to be =
any
>> safer than the current macro. :)
>>=20

Tyr could use both register!() and bitfield!() today FYI. If you move it =
out, I can
follow with an actual patch to do so.

=E2=80=94 Daniel=
