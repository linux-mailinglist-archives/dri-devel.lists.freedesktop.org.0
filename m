Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1ABC22645
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D8B10EA31;
	Thu, 30 Oct 2025 21:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PtpTPwT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981210EA31;
 Thu, 30 Oct 2025 21:16:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 95C5760541;
 Thu, 30 Oct 2025 21:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52408C4CEF1;
 Thu, 30 Oct 2025 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761858966;
 bh=+NHcvXtDxhDQK0BCd82yMG17qtbqNUMyemzVA1CEOZk=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=PtpTPwT6DPmp6kvIEXa7KfuxLfuk2yfzkYRFE7Yh5LQcWGvBL/ME8OoBF3BRXZ3s5
 icGOERXYm6Sm2t2G93oBJiybf3i8CtzsWS+91NnjsYUMqW+0CM3GsnzuAxqZ3Ay9fr
 4QgLPhOsWmDxzXoLCWASiYb7iyygnYz2XMJ5i4VB5b28oj8C8c3eNNV12Y0SsPVRv+
 txayhoac4485v4zTv4fAQqf+r/PESlV47GzIpCOV/dOCeUOFYhk6agBu3ba2kuV2fi
 YFMUo5UNbPHvooGMlQQOVZg6BnfZCiY99UWJ9aZPNjyGdvshyKvChlbST8+pOLF0d3
 4uyisTVbx5UCQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 22:15:59 +0100
Message-Id: <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C
 linked list iteration
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-3-joelagnelf@nvidia.com>
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

On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
> Demonstrates usage of the clist module for iterating over
> C-managed linked lists. C code creates and populates the list,
> Rust code performs safe iteration using the clist abstraction.

I don't think a sample module is the correct choice for this. It makes it l=
ook a
bit like this is an API intended for drivers. I think kunit tests might be =
a
better fit.
