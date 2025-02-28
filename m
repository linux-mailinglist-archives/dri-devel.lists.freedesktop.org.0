Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EBCA4920A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 08:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BEE10EC0F;
	Fri, 28 Feb 2025 07:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OGkTi2JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59A110EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:19:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF8F5612C2;
 Fri, 28 Feb 2025 07:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51005C4CEE7;
 Fri, 28 Feb 2025 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740727171;
 bh=JFPGqxxqRZkkHMQpC6NAIa713K0DriM3Y8/V0d2b3W0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OGkTi2JRhOOArxzG+LxU9tpIASg2gvYH6FbZwiiuzMBbl07sxlnrQo9gCgdEO5IeF
 ljSqEDkSOLVeeNvOj0iyn+CKGGCVh1KQOJzMCScbluO4SCH3JG6GGuPdsaMYDphwsl
 6/YicYgBSbdCDsrDDmmYSrCtJMTIB+zLAemEWt9GtvLxZ4V3T16ioQ5a6jhsXToMki
 Lj1mUXThClyKc0K7bNB7+Lvpq8mH4oNhGHlOrGz0COIvx+3/6mxlciuJbtY5w2IGMG
 N6fBbgNDMWlPB82y1b9QCxXmqQEn4A9E3s2W2IC6S2drmmzs50B9BBhN5Pu+GOlw05
 YbOs34rHBEXsQ==
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
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com> (Alice
 Ryhl's message of "Thu, 27 Feb 2025 17:01:58 +0000")
References: <UXTosjUFv_CKOV-K4oqNGBhMEv64tds9NgXWhHEYdCHuKM2qSPFrpBnTqhFGkcbv5_KXYERykIXhn-sYnEeuUg==@protonmail.internalid>
 <20250227-export-macro-v1-0-948775fc37aa@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 08:19:21 +0100
Message-ID: <877c5apmdi.fsf@kernel.org>
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

> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

What is going on with the cover letter of this one?


Best regards,
Andreas Hindborg


