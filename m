Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C289C9973E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20B410E4BA;
	Mon,  1 Dec 2025 22:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bYDKXHai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F410E4BA;
 Mon,  1 Dec 2025 22:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764629708; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WUUlwegPL+TaM1SCSPVueIIpNkDW8TM/B1c2ED/rd7bziI0UVJ0mVjiPfMeLQBbKP9ggr/O1CnMa2Rz1lYH/VkBct5O7jxQX+wmXrjD0DjzVmCIUJELiI+Lyn+NwgMwQ0BngLOF7vzO3iUPgRlNzVTB3xfdBaaQY2Tb8/ONtp30=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764629708;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ypRRmD2xCCGEl+qbk0MV7p2Ceeb2oGK2vSUVjqR1prk=; 
 b=QMSshcslQMhtS/QxlpqIpp+0eIELmrIWAAQ1hwwdgx+6wh2avbf/LdgLTOZlkXhk+7tefC596uNMPsAL6sJAwpGuAlo63Rx1U4Hf1vLcXsiaKa6xfBK4g+Z5N563K2Kw13NCF8n8KzGwYZJfODuGutlt79he5d6NWUtUapnLuqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764629708; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ypRRmD2xCCGEl+qbk0MV7p2Ceeb2oGK2vSUVjqR1prk=;
 b=bYDKXHaiL/nCoFUsA21cGFvl+BM5+e/nle8+/LsCBJ1cfSELuLvQIQnU7EB0cLNk
 M8yHl+vEIjTfcFrF6LVm4gfUmnkVgh0U/fzCfRRZOurLRTbLJWZ/cJFik4o9qHjErJS
 Sekn246SE48RQ0bvkzqYb+F9kjW9N6Fy6ES6muno=
Received: by mx.zohomail.com with SMTPS id 1764629706021913.819960823426;
 Mon, 1 Dec 2025 14:55:06 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
Date: Mon, 1 Dec 2025 19:54:49 -0300
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
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
Message-Id: <48EFFE1F-4D20-4A2D-B3E0-13E9CB796624@collabora.com>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <5B89D953-BB52-4E8F-AC40-1FA33C016780@collabora.com>
 <87d2c2d5-12d2-4655-b070-872c909f7e0a@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
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



> On 1 Dec 2025, at 16:35, John Hubbard <jhubbard@nvidia.com> wrote:
>=20
> On 12/1/25 8:51 AM, Daniel Almeida wrote:
>>> On 29 Nov 2025, at 18:30, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
> ...
>>> +#[repr(transparent)]
>>> +pub struct ClistHead(Opaque<bindings::list_head>);
>>=20
>> I still think we should call this CList. IMHO, it does not make sense =
to have a
>=20
> I am guessing you meant to place this comment after Clist, rather than =
here
> (after ClistHead)? Otherwise I don't know what you are actually =
suggesting?
>=20
>> Clist, and a ClistHead (notice the capitalization). CList and =
CListHead are
>> easier to read and reason about.
>>=20
>> Did anyone push back on this?
>=20
> If you are simply recommending renaming:
>    Clist     --> CList
>    ClistHead --> CListHead

Yes, this is what I meant.

>=20
> ...then I'd say "+1" for that suggestion.
>=20
> thanks,
> --=20
> John Hubbard
>=20
>=20

