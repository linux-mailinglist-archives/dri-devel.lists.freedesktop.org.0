Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B7BB7C23
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EF110E952;
	Fri,  3 Oct 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BZGct/NC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98310E951;
 Fri,  3 Oct 2025 17:33:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D48D44B42;
 Fri,  3 Oct 2025 17:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E510DC4CEF5;
 Fri,  3 Oct 2025 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759512806;
 bh=YBxUepfkckAj5IwP5nRU1R79rwNPtTxPrmIYM0ip2TU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BZGct/NC6j5y1kDVLEt2rL44/BmKTgEood0kPUydXjqv42lBHx3Rw1iUZ5hHx0dwp
 tIor3GiB5TeGigjM+s3RTP6wyssy6PrksAVtLtAjazx3LHVd9XHSJA58NOuAt3gRLX
 EpGNbNonLZoq7EytAEtA2GbZjQQTeorcxrPQvHiwyVn9U+9RuamZ51NUgn4JRofVzj
 NlxxzZxEy8Aan7QDpHJo+NITtXHLpUECSgkcwqWo4r54l6J+0JNudKB1eYT3BXAhnz
 mO6GPGsg2zr7ZDg9kvUU+uNHUKUwVODRK8AREULm3ZalvhI9aB/e9sFjrqF1OF2A/z
 stAI0BLB6c38w==
Date: Fri, 3 Oct 2025 12:33:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, dakr@kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
Message-ID: <20251003173324.GA361946@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002183912.1096508-1-joelagnelf@nvidia.com>
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

On Thu, Oct 02, 2025 at 02:39:12PM -0400, Joel Fernandes wrote:
> Add support to PCI rust module to allocate, free and manage IRQ vectors.
> Integrate with devres for managing the allocated resources.

> +/// IRQ type flags for PCI interrupt allocation.
> +#[derive(Debug, Clone, Copy)]
> +pub enum IrqType {
> +    /// Legacy INTx interrupts
> +    Legacy,

FWIW, when I can, I try to use "INTx" instead of "legacy" because
"INTx" has a specific meaning and is used in the PCIe specs, while
"legacy" by itself has no intrinsic meaning.

> +    /// Message Signaled Interrupts (MSI)
> +    Msi,
> +    /// Extended Message Signaled Interrupts (MSI-X)
> +    MsiX,
> +}
