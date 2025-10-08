Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A433BBC66BB
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 21:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEB210E8C4;
	Wed,  8 Oct 2025 19:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="afsjEM19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AD710E8C4;
 Wed,  8 Oct 2025 19:09:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 809B240723;
 Wed,  8 Oct 2025 19:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2976C4CEE7;
 Wed,  8 Oct 2025 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759950550;
 bh=rDlZkxFVfeE5ywtDCiqrEgIGjXabJr8YNje3YP1LdYw=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=afsjEM19mGNanXNHRwdTpCnuYUTj1bTYJ60bUAQ9o6bVhY5Ig7ZOP1iWsXGRUP/g0
 pRDVnHQm4UwIyQzUUDwTyrTQC9J3jmqn1LEa9+cXz1ALrcUQHk9gOi22UgACq4/0j0
 b6LaLvAn+yFs9mnFGgGTX3yhgmBkXj7z0i+PJ3EbFnzCV47DTr1AK+8EPGWn8bJ9lG
 d0G8TmeBOQ0RJU9504lwShlVaMcp3CD8S/2zdQf+smGa6CzpAEFY0B+71z3vcIgQoJ
 qZOl5jMY2kyAN5M24e2iwU3AshmU/EpClp8AHP05rKwWISEWFUcpAhsZdp1OVtY5Mj
 iK1sPEU6QfR/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 21:09:04 +0200
Message-Id: <DDD6EEB2MJGJ.1UNH7GMXXU9WC@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <joel@joelfernandes.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
References: <20251002183912.1096508-1-joelagnelf@nvidia.com>
 <DDAEL8DQFWKX.1BSBDMMN9I5B0@kernel.org>
 <58a26b94-bf06-413e-a61c-2e0d71de2ac7@nvidia.com>
In-Reply-To: <58a26b94-bf06-413e-a61c-2e0d71de2ac7@nvidia.com>
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

On Wed Oct 8, 2025 at 8:45 PM CEST, Joel Fernandes wrote:
> Great idea, so paraphrasing for myself, your point is with the above code=
,
> someone could theoretically do:
>
>   1. Call new() directly on IrqVectorRegistration (bypassing alloc_irq_ve=
ctors()).
>   2. Forget to call devres::register().
>   3. Store the IrqVectorRegistration somewhere.
>   4. Device gets unbound.
>   5. Later when IrqVectorRegistration::drop() runs, it tries to free vect=
ors on
> a device that's gone.
>
> Is that right?

Correct -- however, it's less about this could actually happen, since it's =
not a
public type. But it safes you writing invariants, unsafe calls, makes the c=
ode
cleaner and more self-contained.

> So a better approach as you mentioned, is to do the devres registration d=
uring
> the construction of the IrqVectorRegistration, so there's no way to do on=
e
> without the other. Did I get that right? Anyway great point and I have ma=
de this
> change, thanks!

Great, thanks!
