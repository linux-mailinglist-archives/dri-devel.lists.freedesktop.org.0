Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E999B8DCAB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 15:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174B10E316;
	Sun, 21 Sep 2025 13:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nE34BSOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE01C10E315;
 Sun, 21 Sep 2025 13:49:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 181BE601D2;
 Sun, 21 Sep 2025 13:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C34BC4CEE7;
 Sun, 21 Sep 2025 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758462573;
 bh=e5+K3Urlg6adLZ4Pwf4KqE2HE0p++T1FsRQvdME9z/o=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nE34BSOpdK7Rh5C6ebcUs3ASozou0kkmg0iq59RQAyOX81p26aH7O/NUXtBWnkA8W
 Q5vCI67SX+EhmhruBDt3SeWUmEHeEFuBXPsW4iFwJHyA6Q91S1+sXzOva5+WNVg846
 mdYWYt8x0d13nr8M9t2QdntZjz9dRgYY6pM7kA053izi62U6pIFKrO2bPhuztYOKeK
 hRzBMdYgUk4yH1eFuIvpzW0SqMxYAisxie7B5h+ISbs9Tx0Mn5QtTJ1v3X+E1vaOgH
 NxluBCSb8pWvU/oiVLS0tj7TcsWayKkhRotz8v3wzqtDLYmUNx7NDBE3FnWThrs0bI
 4CdYwy5s5vc2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 15:49:26 +0200
Message-Id: <DCYIYF3C745Z.2WYSNYOTK041R@kernel.org>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
In-Reply-To: <2025092157-pauper-snap-aad1@gregkh>
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

On Sun Sep 21, 2025 at 11:36 AM CEST, Greg KH wrote:
> Your example code using this is nice, and it shows how to set up, and
> query these bits, but that's not anything anyone actually does in the
> kernel, what they want to do is read/write from hardware with this.
>
> So, how does that work?  Where does this "drop down" to the native
> bus/memory transactions and swizzle the bits properly to work correctly?

Please see reply in [1], let's continue discussing it there. :)

[1] https://lore.kernel.org/lkml/DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org/
