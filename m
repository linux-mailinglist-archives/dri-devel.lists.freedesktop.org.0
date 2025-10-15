Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617BBBDE785
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFDC10E7A3;
	Wed, 15 Oct 2025 12:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WNqwgQiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB96410E7A0;
 Wed, 15 Oct 2025 12:29:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DCC2860143;
 Wed, 15 Oct 2025 12:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6304C113D0;
 Wed, 15 Oct 2025 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760531398;
 bh=PqJfoggt1kaUHs+pnswClZspb/rHacAJYxqaLklDo8Y=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WNqwgQiyzevwYN1GxBKFMLtmBCihT0LReAj2GoSxetoHexRotvldlu7LuR65ar5Zi
 ox5OjVlssvP7quoPixt1JcJYYar6RhWuH7H0GxA7mEBtSHeiUxUWYoMKRKrJ0mDmVs
 YuY2AwkmYXssbFhBUj9VTCr49Jp/52cLVbMsksH66lNU4MzxsiAkt8FmCwoza9KYCe
 xC5AXlH65vP8aAPFFEHumkgDJl9nq6cxXxLFU965UsRTMzTsIk3oYaH/IJsf1jgaKL
 s8cXaFNTrtrtXumgQYNiMNu4zExL86eCOaqP+LU/2XVZ6y8sNwAWJKMooy2qgy5TOR
 yQA2lViwCuYsA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 14:29:52 +0200
Message-Id: <DDIWAK8RNEMY.2D4471L1K87QT@kernel.org>
Subject: Re: [PATCH v3] rust: pci: Allocate and manage PCI interrupt vectors
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
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
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251008190726.823527-1-joelagnelf@nvidia.com>
In-Reply-To: <20251008190726.823527-1-joelagnelf@nvidia.com>
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

On Wed Oct 8, 2025 at 9:07 PM CEST, Joel Fernandes wrote:
> Add support to PCI rust module to allocate, free and manage IRQ vectors.
> Integrate with devres for managing the allocated resources.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Applied to driver-core-testing, thanks!

    [ Add links in doc-comments; add missing invariant comment; re-format
      multiple safety requirements as list and fix missing backticks;
      refactor the example of alloc_irq_vectors() to compile. - Danilo ]
