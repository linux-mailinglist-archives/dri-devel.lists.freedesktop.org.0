Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34DA49347
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0310EC14;
	Fri, 28 Feb 2025 08:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JVphZviI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E528110EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:20:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7E4360008;
 Fri, 28 Feb 2025 08:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CB0C4CED6;
 Fri, 28 Feb 2025 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740730830;
 bh=8yTO/llICtnbsknrcvGs4/GhXN3R2fhImtsrIebDg+g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JVphZviI2BP21J+rsLbShFP+I+sXr+H4DNDYOwwFPt7phwM3tNOPrSOAMNwnvIOgN
 +jaW6MGSpZZLvuj4Ddk4M96WMF24TmYHMHLZpAjKHDf3DiQw5eMcPxQ7MWnG+lPQbk
 dWGgjVEjN4xvakGoYyGY/nG8ZIX6HIHVgg1Hojzsi4IT5xt+x0vDYkLjgoxAQrpUUH
 tUlcbEgLiJT++KN50RvHszDn7yaIBigkx+1/Pz3E1HApbUqMKdzzINYpP/YetbiG0m
 iVNGxufsOUf6aPNJw/v3W/nr76Sh7+qmYo/IIGggTH5dqvTgc/ey+mSd901kx0xkfz
 /SSF3jb9/PdQQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Petr Mladek" <pmladek@suse.com>,  "Steven Rostedt"
 <rostedt@goodmis.org>,  "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>,  "Rasmus Villemoes"
 <linux@rasmusvillemoes.dk>,  "Sergey Senozhatsky"
 <senozhatsky@chromium.org>,  "Andrew Morton" <akpm@linux-foundation.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Benno
 Lossin"
 <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,  "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] print: use new #[export] macro for rust_fmt_argument
In-Reply-To: <20250227-export-macro-v1-3-948775fc37aa@google.com> (Alice
 Ryhl's message of "Thu, 27 Feb 2025 17:02:01 +0000")
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <HPpa1v7Unxin25S5VB3PgIDTgvQzpNQV4MyFqkGDP7w5sHWVmjRpH3OgnbagOSqHHCY9mnBIc3mlkAvEmEP5Kg==@protonmail.internalid>
 <20250227-export-macro-v1-3-948775fc37aa@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 09:15:09 +0100
Message-ID: <87plj2o582.fsf@kernel.org>
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

"Alice Ryhl" <aliceryhl@google.com> writes:

> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


