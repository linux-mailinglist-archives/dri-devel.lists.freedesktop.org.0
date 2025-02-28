Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F81A494A4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C449A10EC2F;
	Fri, 28 Feb 2025 09:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SQ9n4SuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC710EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:19:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67E055C58C0;
 Fri, 28 Feb 2025 09:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ABCC4CEE4;
 Fri, 28 Feb 2025 09:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740734342;
 bh=A25tAOF8LWK1knSivsYAeHkV8bvcON0THzor7i3KpNE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SQ9n4SuAbYUG5cK3GuLC6Jw53T9Fk7t5QzujB7vK7BFIV3+rgPTYCRGB6Oru3uuin
 4FnrbMCgNN2QZMzHpgW7Qo15+ZI7cTSOkpKtqo815rNxoCeEm8BPlpliWNDvl5W/bO
 KxUGxS8YWm1KagDqsuezs3xthzpMNRaaBhwiNI7hNU9sB/SaTgXQ7W6v90DIp8Q/lv
 ccEJhs0z5eH/OOM8U7n42azhnvqsBEHGjAWImyEtzVPSiKEhh6qYvFm5OnavYvPrK8
 GaewI4/0qms4BZqqnJ5fmhFw5yDaDv5GnHA3X92nC/RlbtNb1ckjR5I6ID/rzLd7By
 6vyFqEJlh+mHQ==
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
In-Reply-To: <CAH5fLgiNs-VKEQduL16eymSPnqA0_6aR8WDRYm68SE8FXGDHRw@mail.gmail.com>
 (Alice Ryhl's message of "Fri, 28 Feb 2025 09:46:32 +0100")
References: <UXTosjUFv_CKOV-K4oqNGBhMEv64tds9NgXWhHEYdCHuKM2qSPFrpBnTqhFGkcbv5_KXYERykIXhn-sYnEeuUg==@protonmail.internalid>
 <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <877c5apmdi.fsf@kernel.org>
 <n_SgeABndEnm2Yl1urxt15OBDGbfaY4y8M_DCt06Cwoql_kH-ErUfE48HL1gXbCy0eTa7sKHXdHmhyfuJteS-A==@protonmail.internalid>
 <CAH5fLgiNs-VKEQduL16eymSPnqA0_6aR8WDRYm68SE8FXGDHRw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 10:18:14 +0100
Message-ID: <878qpqo2ax.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> On Fri, Feb 28, 2025 at 8:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>
>> What is going on with the cover letter of this one?
>
> It's empty.

I can see that =F0=9F=98=86 Would you consider making it not empty?


Best regards,
Andreas Hindborg



