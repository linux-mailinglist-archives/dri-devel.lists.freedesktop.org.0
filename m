Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7362C99809
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD52510E4BE;
	Mon,  1 Dec 2025 23:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FdGTmqbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80C110E4BE;
 Mon,  1 Dec 2025 23:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764630138; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jKfrW1A5lxguTIMp54rB70wi+PXhcLslTJX8rvz4hdkmq5B7G9rDgAK3ZcfzIkCXSjbS+ElQGjSvugADJPB9AulwoR40FZbWh4f30AfhBOrQLdGTQlQC6+LM1fx8Rxl4oinJKPo7CQgBlT9Jfi/wmhm3CW2zlb1egVFMunPEANo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764630138;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vVOcuLzLn7ix/bSszGqLHStAGdGJEE4HEpB2JdOabJY=; 
 b=kSyxtQLdmeWqKAUo6r5pCL60GQ5X/EqL36f6kwJm00WBspXOUuLox8V1ROqq8dwDWqToh4/SVGMOiwby2tvrqCtK4BQ4WVMCHhOfBU7KCEZYG3XAYzU0RFFQJa4J3stpFNDJ1gwkYNdDzy/QG5Oy3IwrNV1hCCaF8T06fEcdPIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764630138; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=vVOcuLzLn7ix/bSszGqLHStAGdGJEE4HEpB2JdOabJY=;
 b=FdGTmqbAkChHbCIsmaUzM9C6cc8mW/E7FSYraanKrtvQO6zsWKQJWgWpLkGgineo
 g7lrRyB1Li5s0eEehWvG9xQUHjsoORffX5I2Y1yJsomHehYlJMHcKg2l7HW+PHDM4kL
 W6BEalHKUGUyOOZ4N1meQtO+n0N/XLr4sz4DKfmw=
Received: by mx.zohomail.com with SMTPS id 1764630135734988.7309531841487;
 Mon, 1 Dec 2025 15:02:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <1933c83d-7692-431b-b2b8-9c9a637ebed2@nvidia.com>
Date: Mon, 1 Dec 2025 20:01:58 -0300
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2584CA37-1AE6-4B1B-90B1-8DE4F826E760@collabora.com>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
 <1933c83d-7692-431b-b2b8-9c9a637ebed2@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
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



> On 1 Dec 2025, at 17:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>=20
>=20
>=20
> On 12/1/2025 2:35 PM, John Hubbard wrote:
>> On 12/1/25 8:51 AM, Daniel Almeida wrote:
>>>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
>> ...
>>>> +#[repr(transparent)]
>>>> +pub struct ClistHead(Opaque<bindings::list_head>);
>>>=20
>>> I still think we should call this CList. IMHO, it does not make =
sense to have a
>>=20
>> I am guessing you meant to place this comment after Clist, rather =
than here
>> (after ClistHead)? Otherwise I don't know what you are actually =
suggesting?
>>=20
>>> Clist, and a ClistHead (notice the capitalization). CList and =
CListHead are
>>> easier to read and reason about.
>>>=20
>>> Did anyone push back on this?
>>=20
>> If you are simply recommending renaming:
>>    Clist     --> CList
>>    ClistHead --> CListHead
>>=20
>> ...then I'd say "+1" for that suggestion.
>=20
> I am not fond of the suggestion but I don't oppose it either. I =
honestly don't
> like the triple capitalization with CListHead though. Lets see where =
all of us
> stand and then take a call on it. Opinions?
>=20
> Thanks.

Well, there are three things at play:

C, List, Head

So I think that the CListHead capitalization correctly describes it. =
IMHO
it=E2=80=99s hard to see =E2=80=9CC=E2=80=9D and =E2=80=9CList=E2=80=9D =
if you spell it
=E2=80=9CClist=E2=80=9D, i.e.: it=E2=80=99s easier to read this as a =
single word and wonder
what=E2=80=99s that for a few seconds.

This is a bit of a nitpick though, so feel free to keep the old spelling =
if
there is no consensus here.

=E2=80=94 Daniel=
