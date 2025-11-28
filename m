Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164DEC91C15
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 12:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046EE10E8AC;
	Fri, 28 Nov 2025 11:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dYrXWClQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1D10E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 11:09:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHrCH4vkqz9v76;
 Fri, 28 Nov 2025 12:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764328139; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ys/mzeQ72BAidd8ofBgTortbdFO8O++FTz3WuToRKsI=;
 b=dYrXWClQWCszfsPETC/uNyDRFq7PPGqCgeYPxPdUxjlp+p7qmLkGBfZ0y8SX5JY8GZKjzY
 PbE/1h0RSJQOpxgZrw4Z+6FaZs4VxhZa4utSAKBMeX1MzLzB8EE0ufiozQ7uA+gPKux8ki
 jg315gmGBnBpih/OOc3WpVUaNBPWvXR7UKArDLFmx6xJ2jpSbwdEUBs2N+Aqqe4imVauPo
 iiz/XVy7ysYDYg+EYbByuK+n3m6DGc7mCl/ANPoBaw8VQQQg9iIW2no3yohyMDaaka3aCC
 +TFvOlsf9hpLLJJnjZWO3/7DZSxNiKIoufc0Nzn8xJrJdpE/vMm/EgP3/TyOWg==
Message-ID: <19e9f6fb270b28b06bfeddf274ad3bcacdc22e0d.camel@mailbox.org>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  Alexandre Courbot
 <acourbot@nvidia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Peter
 Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Fri, 28 Nov 2025 12:08:52 +0100
In-Reply-To: <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b9f7089024bd5464044
X-MBO-RS-META: i1op6hier8n4hhsr4e8ftbye8zp4xg19
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-11-24 at 09:49 -0300, Daniel Almeida wrote:
> Hi Phillipp,
>=20
> > On 18 Nov 2025, at 10:25, Philipp Stanner <phasta@kernel.org> wrote:
> >=20
> > dma_fence is a synchronization mechanism which is needed by virtually
> > all GPU drivers.
> >=20

[=E2=80=A6]

> > +#[pin_data]
> > +pub struct DmaFence<T> {
> > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > +=C2=A0=C2=A0=C2=A0 /// User data.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 data: T,
>=20
> Same here: we should probably deref to this type.

Oh, wait.

There's another problem:

done_fences are created by JQ and returned to the driver. The JQ
doesn't need to stuff any data into those fences (it just wants to
signal them, and register events on done_fences coming from other JQs).

So I was about to investigate how we could have a DmaFence<()> to make
the data optional (see the following patch, there I still use an i32 as
dummy data).

Is that compatible with Deref?
Ideas?


P.
