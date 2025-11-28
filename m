Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC7C91F96
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 13:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A693A10E158;
	Fri, 28 Nov 2025 12:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="d3l6fHlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BC010E158
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 12:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764332482; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LLF0Di3YIwQHvA7cmUTuK9FYbGP/cQgvq8/RFnn0x/BmVoTH/RKhX0jYPo1GU5vlvsRTIhZcZLStC/JsdBw3BoDav7NHXb4GyphXMwmUp9/BRQ580GExZsqoapbu6xS14P9GkgMO9PGRNf/XHBP1JPsqEdZUEB4qql1gE9dT26Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764332482;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6t5JL2B6EIgnIbqzhrLkmAa4u6M0fh7nfVDXCEJtE/o=; 
 b=DFTScu6OuaHkwp9VeqfU6QcCjIqpXamcMYlG+8YgEW0tVwEqs9gPkT96oGlfPRu6rJo1AQvfKLmJMC7RRmgfs+nnTGuuNic4HHkDMugJiLno7EgW4eOvBI7alkBtrY1yt6RcVrdNt+XzHCW41XmqU5ooLEHq/4fzaFSJMD1Al3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764332482; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=6t5JL2B6EIgnIbqzhrLkmAa4u6M0fh7nfVDXCEJtE/o=;
 b=d3l6fHlUHfNt1uup2oLg++gRBI+thaYq7G1BZ8dHHPVqOOmXfxQ0C5gU43Vc6vo6
 c+sNsKIHpZS/CbCoy+vhhfpXqkRBsD7m16BQcl1Pxs7tfOgdYp6XJ1hwy5t9VYBOUKd
 ROs7oCjSG8Lg6CLTp6zk+/GFGWnQGCdBt5PQLEdI=
Received: by mx.zohomail.com with SMTPS id 1764332480380647.2965139063591;
 Fri, 28 Nov 2025 04:21:20 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <19e9f6fb270b28b06bfeddf274ad3bcacdc22e0d.camel@mailbox.org>
Date: Fri, 28 Nov 2025 09:21:05 -0300
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Peter Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8D41E5E9-5784-4439-8ACC-13E9F3DA589F@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
 <19e9f6fb270b28b06bfeddf274ad3bcacdc22e0d.camel@mailbox.org>
To: phasta@kernel.org
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



> On 28 Nov 2025, at 08:08, Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> On Mon, 2025-11-24 at 09:49 -0300, Daniel Almeida wrote:
>> Hi Phillipp,
>>=20
>>> On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
>>>=20
>>> dma_fence is a synchronization mechanism which is needed by =
virtually
>>> all GPU drivers.
>>>=20
>=20
> [=E2=80=A6]
>=20
>>> +#[pin_data]
>>> +pub struct DmaFence<T> {
>>> +    /// The actual dma_fence passed to C.
>>> +    #[pin]
>>> +    inner: Opaque<bindings::dma_fence>,
>>> +    /// User data.
>>> +    #[pin]
>>> +    data: T,
>>=20
>> Same here: we should probably deref to this type.
>=20
> Oh, wait.
>=20
> There's another problem:
>=20
> done_fences are created by JQ and returned to the driver. The JQ
> doesn't need to stuff any data into those fences (it just wants to
> signal them, and register events on done_fences coming from other =
JQs).
>=20
> So I was about to investigate how we could have a DmaFence<()> to make
> the data optional (see the following patch, there I still use an i32 =
as
> dummy data).
>=20
> Is that compatible with Deref?
> Ideas?
>=20
>=20
> P.
>=20

It will just Deref to (). Not a problem.

=E2=80=94 Daniel=
