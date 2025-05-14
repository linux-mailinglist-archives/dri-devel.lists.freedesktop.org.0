Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F877AB71C3
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FC410E6A0;
	Wed, 14 May 2025 16:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e4/vmQB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFE110E691;
 Wed, 14 May 2025 16:42:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D4215C6292;
 Wed, 14 May 2025 16:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB456C4CEE3;
 Wed, 14 May 2025 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747240953;
 bh=4AFo5tUm54a7xxV7M6z3IWvxfRA4JW1Lh17G8gW+JMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4/vmQB0wJCa+u6yUwzs4SgwlAXKKzdTAMl4yQkzUNj5mWXDKUi8mFgsmuj/J44r9
 MXE6LlU3xVClde/94h9kn46mt3VKoQXv4dbXtXi4EdjWLaj0p5Ua98QohUkBuTsnQr
 p0oT1eiu/X4gMLa0sFNFwRwmzNfPrG70LhmgkZp2rmSEUOqpNZzkKMNMNeCJNe0OrH
 xQZyp2gDnuhh6QNanBmRmuOaHTK6ylkrSC9f7t2YUOqMsy6KacqxAbcdbQik5bzU2H
 4VreJcYYBgR9Zs43rKFuDQfbfz5Z/jq7m+B2hT0tux4BRXuNmuQNpgFxnjnfcDgaFs
 s6+wQ+iy6y41w==
Date: Wed, 14 May 2025 18:42:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 19/19] gpu: nova-core: load and run FWSEC-FRTS
Message-ID: <aCTH8gnO5b4MsaiN@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-19-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-19-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:46PM +0900, Alexandre Courbot wrote:
> +
> +        dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
> +        dev_info!(pdev.as_ref(), "GPU instance built\n");

Please use dev_dbg!().
