Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B06B8BA61
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 01:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BDF10E261;
	Fri, 19 Sep 2025 23:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TyDkqVg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D28910E261
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 23:56:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A27244B96;
 Fri, 19 Sep 2025 23:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C490C4CEF5;
 Fri, 19 Sep 2025 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758326193;
 bh=jnQJmZBheVXo3pp3RQRswVKx1JqGxYUBeu7J45F+5VI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=TyDkqVg+ydfmvIpZW3BOrIbUI0oXw4Its1dal9d976p/0B9GgPQAjwfkPIBaEq0Rg
 aid6R8BLb/XMF/AyYHcbr44Bs4/ZoukK9O/rZEUzgCSAdRikNPUe1ETkwAxawVqgtp
 mYrSFx2Y+XUcsWF+th7mmn5WtFKonD8Z2euUoli+7c6RtoNHRSfvoAfKHIaLuJqm4a
 3FV9qDzWYFi80qkdAOB7yarvkcjZk3mgEFb/pSYNoxKvJxkxLVGzJ2VR/Q6dfVjq+F
 024+WUopqrL58Fgtx5zqArW7ojZ6L58gT+KLq6nji8SIcxKkTg+nwJZvb3mQx/SySC
 4Tz8G3RFVyoaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Sep 2025 01:56:27 +0200
Message-Id: <DCX6M3BCXV2W.37USDZEDRVA2G@kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-pci@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2> <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
 <20250919215634.7a1c184e.gary@garyguo.net>
In-Reply-To: <20250919215634.7a1c184e.gary@garyguo.net>
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

On Fri Sep 19, 2025 at 10:56 PM CEST, Gary Guo wrote:
> Turbofish is cumbersome to write with just magic numbers, and the
> fact `{}` is needed to pass in constant expressions made this much
> worse. If the drivers try hard to avoid magic numbers, you would
> effective require  all code to be `::<{ ... }>()` and this is ugly.

In the absolute majority of cases users won't see any of that anyways, sinc=
e
they'll use the register!() macro generated types.

   // Master Control Register (MCR)
   //
   // Stores the offset as associated constant.
   let mcr =3D regs::MCR::default();

   // Set the enabled bit.
   mcr.enable();

   // Write the data on the bus.
   //
   // Calls `io.write<Self::OFFSET>(self.data())` internally.
   mcr.write(&io);

For indexed registers it is indeed a problem though.
