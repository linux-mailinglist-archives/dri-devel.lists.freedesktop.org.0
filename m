Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23EBA4A247
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155110ED25;
	Fri, 28 Feb 2025 18:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fh564Eqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C3710ED2A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5A0B6115C;
 Fri, 28 Feb 2025 18:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82186C4CED6;
 Fri, 28 Feb 2025 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740769127;
 bh=CIA17vKj86QZVvcuBdGngR2g3nwrDmSjGoJQOl2IIs4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Fh564EqxRGkM4ET1BYBiFfp6RT69LGTwBPr/GQ/PAMqX3Y0D2RN+/ad6M4RZL1gGi
 5/DSOCyVblBbt7bHCOG0S5g6FYcuHeDOvCdkWdKnx1ZnXvE2vMAaSL9zReGjcS5u8F
 s4zl61WKhzRfdn0Y+v5pRIZaP4SbfRL0/NaA/noarNaUCP4GN6uRjB9ZND9LEaRzhQ
 /BmP1DcWGYEua/HEb3alrccBqVw+oW4yyr/xDF8BuLXdJ2moQy8aHED3KzfzE7rRPG
 4DIkfeMY+SJJh2uBaLG9HhKIjrmxhBbUPHGe8tFIOP7FLqcd6fwuJ5Ygpi53x9OCD+
 J79qRh6kVuGMQ==
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
Subject: Re: [PATCH v2 2/5] rust: macros: support additional tokens in quote!
In-Reply-To: <20250228-export-macro-v2-2-569cc7e8926c@google.com> (Alice
 Ryhl's message of "Fri, 28 Feb 2025 12:39:31 +0000")
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <2uURW8_Sq6S8VV2UoJJ6bmoH71NWq1X6b1niImKX2mpjudmVM5tNapWA4OLWXoZ8nmcM--z2XtAdgKiNPx8qQg==@protonmail.internalid>
 <20250228-export-macro-v2-2-569cc7e8926c@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 19:51:21 +0100
Message-ID: <874j0dnbrq.fsf@kernel.org>
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

> This gives the quote! macro support for the following additional tokens:
>
> * The = token.
> * The _ token.
> * Using #my_var with variables of type Ident.
>
> Additionally, some type annotations are added to allow cases where
> groups are empty. For example, quote! does support () in the input, but
> only when it is *not* empty. When it is empty, the compiler cannot infer
> the item type of `tokens`.
>
> These additional quote! features are used by a new proc macro that
> generates code looking like this:
>
> 	const _: () = {
> 	    if true {
> 	        ::kernel::bindings::#name
> 	    } else {
> 	        #name
> 	    };
> 	};
>
> where #name has type Ident.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


