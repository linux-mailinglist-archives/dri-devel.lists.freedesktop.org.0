Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84EDABED05
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D3910E60D;
	Wed, 21 May 2025 07:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FtvoSbzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB6B10E60D;
 Wed, 21 May 2025 07:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 73B27A4D938;
 Wed, 21 May 2025 07:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED97C4CEE4;
 Wed, 21 May 2025 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747812428;
 bh=Z/318zCr0hBm/sCk+CgpYwAIF2tZRP6Fx+5l5YhUgLQ=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=FtvoSbzAvMnMEAeMDonY0vRno+M7+kxRI+1W4MeP8ewVnBTuuM+d31ZBS4EutLE8g
 Orai1mKNIV93jG9yybwvH2pLXYY96JuPUmbnE1cQ7lln5A8C1mZZRC2gnthPRpoxVD
 xaRevxEPaR4SgeiiijruOPdBJjnAn2D6ZuYeT8cYRfjgIhOv9x7R/RXnbaQqWpSXks
 SlWbdWFtIwVizX3m6/MJdmbhpm4gCvUvAByacsDoP/+QD/dVBcwgRpHgRqi6c0aHXF
 MtaLtTvyCL2Zpohjf0DZ0FW0Rmg5TlqxmgojUjxcGiwshepox65UcpMOWuQAL5c0cl
 T5qj2gjOB8ucQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 09:27:01 +0200
Message-Id: <DA1NSLSN2Y04.230YTWZIPO0FR@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 02/20] rust: make ETIMEDOUT error available
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-2-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-2-05dfd4f39479@nvidia.com>
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

On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
> We will use this error in the nova-core driver.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/error.rs | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
