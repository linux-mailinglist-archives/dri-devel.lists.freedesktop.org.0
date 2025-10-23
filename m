Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE54C01A33
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9441A10E04F;
	Thu, 23 Oct 2025 14:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OjZSsazL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC810E04F;
 Thu, 23 Oct 2025 14:07:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28DC160252;
 Thu, 23 Oct 2025 14:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95487C4CEE7;
 Thu, 23 Oct 2025 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761228449;
 bh=JwQLpCZil+iYyJLg+5cxLrOGFlc3x7C3P699NLnVNAw=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=OjZSsazLdapyeGKSNIxvnmSbyxj+os64UIaKEolDqwd/vD0Gp7AAi3ut/9LJ4wrE7
 cP77hQlMkP41nBf5j+s+H2pfeJFTTnkEW0hXQjy1HaQPJ3hz9+6drP7Gnn7BiYWYr4
 COUDWwbpUW+TNokbHzqmnHZGENHn2XX3SLf14Yv/SPKeA725IvzK7aSv1eITi+jJR1
 QMGzRuT2AzuyyxuXrPl/UymzOOWE0qXBjysaQfwaZjDVQfZqOHiU4x8AxYjp/aRjgl
 jVchVZDx88HuoGLSxRn7gZyqVpFImTw+PTQABisSkUjreWCr8CZAFo/JisxpR8q1d7
 TeNYiNnyOX4WA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 16:07:21 +0200
Message-Id: <DDPRDKFEK3H3.2CE3YMXRTLGTI@kernel.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Yury Norov" <yury.norov@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com> <aPklNydcTdOeXtdU@arm.com>
 <ACAA327A-AE2B-4D21-B8C5-C66BB5E09B7C@nvidia.com>
 <aPozw8TGp85YdmNU@arm.com>
In-Reply-To: <aPozw8TGp85YdmNU@arm.com>
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

On Thu Oct 23, 2025 at 3:55 PM CEST, Beata Michalska wrote:
> I guess everything that would use IoRequest::iomap(self), which generates
> Io<SIZE=3D0> which is a game over for the macro.

To be honest, we may just want to remove this API. A driver that requires a=
 zero
sized MMIO region with only optional runtime derived access offsets seems a=
 bit
too exotic.

That doesn't mean that occasionally we'll have drivers needing runtime offs=
ets,
so eventually we want to support that with the register!() macro, but it's =
not
*that* urgent.
