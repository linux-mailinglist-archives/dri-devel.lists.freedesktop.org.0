Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9FAE4936
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224610E3F4;
	Mon, 23 Jun 2025 15:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8NS3wG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56E610E02D;
 Mon, 23 Jun 2025 15:50:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9B265C5C3D;
 Mon, 23 Jun 2025 15:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE7C4CEEA;
 Mon, 23 Jun 2025 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750693816;
 bh=gbion1/qQxu9hmM1ZmDJCMvGF30yf1xFP7ClQFXYwrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y8NS3wG6TF+yc7T3Nes5WnDUSTVmK69IYHpcQ25VO40xzq85gq8Jx9CWfCRY8MFNO
 cg+6SBZQBRTpISeG0JsQodokhzkBa8xvZjGVIzxUxGIehPsJGfWqzIR980iiP+RPVO
 uUPMsb9PRYsqwPWHiRpuNi5q2cp8uy7OO60pSWQrfP7RD3v2x9oh6QzE6aC9Y/BYgO
 /siE1FUHUjXunTDNoEdJaKxPva5CTTrI9hXi/gCZ4dwB3Ha/Rdr5UFEmZNLURo5MMU
 CeQC3Q9tJrJqWDnxNWl8GjlnQDSFp7ldKmNMIw8H6N5OdVDCczuCYTLi0fTFPD6vxv
 b6PBOCRFqz0sw==
Date: Mon, 23 Jun 2025 17:50:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 03/24] rust: dma: add dma_handle_with_offset method to
 CoherentAllocation
Message-ID: <aFl3sF_DbmJkFC-6@cassiopeiae>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-3-ecf41ef99252@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-3-ecf41ef99252@nvidia.com>
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

On Thu, Jun 19, 2025 at 10:23:47PM +0900, Alexandre Courbot wrote:
> Sometimes one may want to obtain a DMA handle starting at a given
> offset. This can be done by adding said offset to the result of
> `dma_handle()`, but doing so on the client side carries the risk that
> the operation will go outside the bounds of the allocation.
> 
> Thus, add a `dma_handle_with_offset` method that adds the desired offset
> after checking that it is still valid.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!
