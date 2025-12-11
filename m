Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1029CB7560
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 00:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4140410E42E;
	Thu, 11 Dec 2025 23:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dakr.org header.i=@dakr.org header.b="Fl3bSBjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 536 seconds by postgrey-1.36 at gabe;
 Thu, 11 Dec 2025 23:11:21 UTC
Received: from hs01.dakr.org (hs01.dakr.org [84.247.131.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D719C10E20D;
 Thu, 11 Dec 2025 23:11:21 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dakr.org;
 s=20250831r; t=1765494143;
 bh=5kHr+Qkbs9zGwQTtOspFdX+ophIMJ2st4l3wc7V/7W0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Fl3bSBjmouvdBPVXjPGQxiCT5+Q+QB9gotEsWl/jm24rPfFIwWNpY9bpgNr+lPhEk
 np0MyAXmBCZ9cW3vSpa2zs2mkpgckmAmlXK8ZU1Mx+qAI4jZVOfj2J81KkP5q6lc52
 9kIaM4iHbz2US+WBsztMCmli8BzetVNjKUPUGZQAnfZI4yF1whxe4rqkmuZvk3BBAe
 jRk/84RiYB9YYxxGlNt9StRBBYyUBPkzB5wFqZqrWL6fRFzZUOQe7CO6oP9U8UT51m
 UcmfsY5RIWF+l4rDhnlpLtA8s4Vaxg+OvdPwnqxK6NO3Ih+3i7fktq9eXpgdg0NQMh
 cF8Y7wRp6i+Qg==
Date: Fri, 12 Dec 2025 07:02:22 +0800
From: Danilo Krummrich <kernel@dakr.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, John
 Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Nouveau
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] gpu: nova-core: Fixups for GSP message queue and
 bindings
In-Reply-To: <DESR20OF30KU.1DCTWADJUFIM9@nvidia.com>
References: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
 <DESR20OF30KU.1DCTWADJUFIM9@nvidia.com>
Message-ID: <4a6eb246fd6997cd3a70db7cdb15e143@dakr.org>
X-Sender: kernel@dakr.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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

On 2025-12-08 18:06, Alexandre Courbot wrote:
> On Sun Nov 23, 2025 at 2:12 PM JST, Alexandre Courbot wrote:
>> This series contains a few fixups for the recently merged GSP
>> command-queue code, by order of importance:
>> 
>> - Some explicit padding required to safely implement `AsBytes` was
>>   missing in the bindings,
>> - A bug in the received message length calculation results in the
>>   message handler being given more data than it should,
>> - `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
>>   bindings have not been updated for that,
>> - Some items in the bindings were referred to using the version module
>>   directly, instead of the alias we defined to limit the diff when we
>>   upgrade firmware versions.
>> 
>> All of them address "bugs" (with the first two fixing actual 
>> correctness
>> issues), but since Nova does not do much anyway, they are also not
>> absolutely critical and can wait -rc1 if we prefer to do so.
> 
> Alice, Danilo, how would you like to proceed with this series? We could
> either:
> 
> * Merge this into `drm-rust-next` if you are planning on sending 
> another
>   before -rc1,
> * Wait until -rc1 gets released and send it via `drm-rust-fixes` for
>   -rc2,
> * ... or just take it for 6.20, as it is not absolutely critical.
> 
> I am not very familiar with how to do things after the merge window has
> opened, so appreciate your guidance here.

Let’s wait for -rc1 and subsequently queue them up in drm-rust-fixes.

Currently we are not running a -next-fixes scheme, so -next is closed 
until -rc1 is released.
