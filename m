Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A79BF14B6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 14:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15B10E29B;
	Mon, 20 Oct 2025 12:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vu6ZG5gM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA77310E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 12:45:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 713D141B4A;
 Mon, 20 Oct 2025 12:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68FBC4CEF9;
 Mon, 20 Oct 2025 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760964331;
 bh=E8/qid2gLwe8oEsR/E/h8omGhNsTE6MoxWDuMvOCa7o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vu6ZG5gMwnWnP18yIjq2Coml/n0/etetWYWhQZndfqasBjVzf2+h5BcpQunp2EHn+
 wGk7ekgx863EYYacdpB1OViSJRoC/l+XSwl1uxM7EYG1sY2UggNWDXRgP0RB32Cmgj
 DYpE2VPAWFKtWebkc5BpwpHugLyOqiCYSQGnaLoYNivILMG7GpOKZwfRXenNfGijBK
 kdVZ6fLrKUefCxsbWH2QDLTtYHCOxzHkiFAe3sxmEx6ysXqBlcDPo+72hmNat+tBlr
 HjH1ho9WQs3EnNIXnmRbNVoOQu9DpFY8DL27jefzvOZemLusSCC7in5APibiIwOgZf
 ji8HRf0c9RL3Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, tamird@gmail.com
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, arve@android.com, axboe@kernel.dk,
 bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 brauner@kernel.org, broonie@kernel.org, cmllamas@google.com,
 dakr@kernel.org, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 gregkh@linuxfoundation.org, jack@suse.cz, joelagnelf@nvidia.com,
 justinstitt@google.com, kwilczynski@kernel.org, leitao@debian.org,
 lgirdwood@gmail.com, linux-block@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com,
 lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com,
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com,
 mturquette@baylibre.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, nm@ti.com, ojeda@kernel.org,
 peterz@infradead.org, rafael@kernel.org, russ.weight@linux.dev,
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 surenb@google.com, tkjos@android.com, tmgross@umich.edu, urezki@gmail.com,
 vbabka@suse.cz, vireshk@kernel.org, viro@zeniv.linux.org.uk,
 will@kernel.org
Subject: Re: [PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
In-Reply-To: <20251018180303.3615403-1-aliceryhl@google.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018180303.3615403-1-aliceryhl@google.com>
Date: Mon, 20 Oct 2025 14:44:56 +0200
Message-ID: <87ms5lspx3.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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

Alice Ryhl <aliceryhl@google.com> writes:

> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


