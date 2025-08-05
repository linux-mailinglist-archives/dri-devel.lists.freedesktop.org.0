Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC9B1B39D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 14:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F5F10E661;
	Tue,  5 Aug 2025 12:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fc1kDs9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942210E661
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 12:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754397720; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wx4m7as+nKB7jA3b5+YRisCwBHdKIdNNO2e90MFj5uGnJWX6bQ+XED8f4jNfukn0zv7bob5AvaD5JqIlX9I0pzNUZ6QKIbdQA5/fpFkdKaDr3WxRk3WqOpUN5Ily8iIGiM5kMoXOxEPInKU9DPEeiy6EzDL6RRMWQMUz0B/dPhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754397720;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wzqHFt2lJOBN3obRMiws9twHVlcCWkgkdwKk6A+VdZI=; 
 b=Rq+rvyFSr7jN6OdrzKqqaIAq8TkJJtFYGkeXkFdFVX9cNWmmwYtfZLS9o8OQmmLE9bLF3GqNxTgvzuyI4SlVJ8QV8ppGcYiShSBLwZGwDaNxU1A1/h50uIqruuKyavZjSmJQDGVPhZU8JdXJjjB9s5M02W+r8+u1Fl7mW0+kb3g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754397720; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=wzqHFt2lJOBN3obRMiws9twHVlcCWkgkdwKk6A+VdZI=;
 b=fc1kDs9zdrOXsykMZgh0mDDPrmIw+dwvEsDHmfocbHFIAiXm3Z+kouRCpLCZEBpu
 9xNS2Ffah22lrFtsCA2fDt3OKmsvJCsB238ADf/1nb05NBXntHeu2HVmMb6PTEuZbQ4
 zzzhvf5foM4VlEwz1yAzYqFPUe0VLOtEf2h0uEYQ=
Received: by mx.zohomail.com with SMTPS id 1754397717740746.1533480220385;
 Tue, 5 Aug 2025 05:41:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250805120813.1f8714f5@nimda.home>
Date: Tue, 5 Aug 2025 09:41:43 -0300
Cc: Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8FA1F09F-CDD0-4A95-8E9E-49A3326613A2@collabora.com>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <20250707163913.5ffc046d@nimda.home>
 <DB5XIWGZ8U36.1VB58YBJFL7OT@kernel.org> <20250707210613.2fd5bb55@nimda.home>
 <DB62ZN1LTO31.1HVWDLAWJWVM8@kernel.org>
 <FF481535-86EF-41EB-830A-1DA2434AAEA0@collabora.com>
 <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
 <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
 <20250805120813.1f8714f5@nimda.home>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
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

Hi Onur,

> On 5 Aug 2025, at 06:08, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> On Sat, 2 Aug 2025 11:15:07 -0300
> Daniel Almeida <daniel.almeida@collabora.com> wrote:
>=20
>> Btw, I can also try to implement a proof of concept, so long as
>> people agree that this approach makes sense.
>=20
> It's not necessary to provide a full P.o.C but a small demonstration =
of
> the kind of ww_mutex API you would prefer would be helpful. Seeing a =
few
> sample Rust use-cases (especially in comparison to existing C
> implementations) would give a clearer picture for me.
>=20
> At the moment, the implementation is just a wrapper ([1]) around the C
> ww_mutex with no additional functionality, mostly because we don't =
have
> a solid consensus on the API design yet (we had some ideas about Tuple
> based approach, but seems like that isn't going to be useful for most
> of the ww_mutex users).
>=20
> [1]: https://github.com/onur-ozkan/linux/commits/673e01a9c309c
>=20
>> By the way, dri-devel seems to not be on cc? Added them now.
>=20
> Thanks!
>=20
> --
>=20
> Regards,
> Onur
>=20

This topic is on my TODO for this week.

=E2=80=94 Daniel=
