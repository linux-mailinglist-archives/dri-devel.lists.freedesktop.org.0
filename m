Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C77C8989E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90B10E537;
	Wed, 26 Nov 2025 11:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="tiRnR90C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEF910E537
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:34:27 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251126113425euoutp0207410ed3fde7d7fb681922cd80c86f37~7i1KQG6Df3162131621euoutp02_;
 Wed, 26 Nov 2025 11:34:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251126113425euoutp0207410ed3fde7d7fb681922cd80c86f37~7i1KQG6Df3162131621euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1764156865;
 bh=Mlk/8cVuM1r8cgr34kGmewo0VCLvDAclx64Kzq7IU10=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=tiRnR90C/z2zgZPKygxThBoTiu4KqlPU0OaQwH6dp6i76ubEfSiAM9znavX/GF7Rb
 RAFCNSTuOurGjRXsJvkb8/G0My+M92lJmm6hMlawYDQO2TxN8UKncGYm6UuLhBWRpA
 P0cee2QTEJo4ppVsAjcc2gTALBB+yYyV4JExx53Y=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251126113425eucas1p20472c28098c08344e4348a1ee22407ae~7i1J8Jf2K2271922719eucas1p2R;
 Wed, 26 Nov 2025 11:34:25 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251126113423eusmtip1f3fa48d667a8b110b0790a7b70bca88e~7i1Ij3pon2329423294eusmtip1h;
 Wed, 26 Nov 2025 11:34:23 +0000 (GMT)
Message-ID: <cca5c7e8-d9c4-4e28-8da2-62dd521ceea3@samsung.com>
Date: Wed, 26 Nov 2025 12:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen
 <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, Christian
 Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin
 <igor.korotin.linux@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pwm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CANiq72mQ4cu9wehGKxS92EK2H3kcX8XPpRmv2DdYmn6Ve9iDAw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126113425eucas1p20472c28098c08344e4348a1ee22407ae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251125123134eucas1p230415281df788e787f4b71e4d7b3ac3f
X-EPHeader: CA
X-CMS-RootMailID: 20251125123134eucas1p230415281df788e787f4b71e4d7b3ac3f
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com>
 <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
 <CGME20251125123134eucas1p230415281df788e787f4b71e4d7b3ac3f@eucas1p2.samsung.com>
 <CANiq72mQ4cu9wehGKxS92EK2H3kcX8XPpRmv2DdYmn6Ve9iDAw@mail.gmail.com>
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



On 11/25/25 13:31, Miguel Ojeda wrote:
> On Mon, Nov 24, 2025 at 5:10 PM Uwe Kleine-König
> <u.kleine-koenig@baylibre.com> wrote:
>>
>> having no clue about Rust:
>>
>> Can this patch be applied independent of the others via the pwm tree? If
>> I understand correctly it's only patch #10 that depends on the previous
>> patches, right?
>>
>> Is there already a merge plan for this series?
> 
> Yeah, if subsystems pick the independent patches at their own pace,
> then that is great, so please do!
> 
> Then, after 1 or 2 cycles, we can do the flag day change on the Rust
> tree (with any last changes needed Ack'd, but ideally there will be
> none remaining).
> 
> It is what did in similar cases for renaming (or moving across the
> path hierarchy) things in Rust. For simple things that get Ack'd quick
> enough by everyone, sometimes we may be able to take everything in the
> Rust tree.
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

I think code wise it's fine, provided the subject is fixed like Uwe suggested.

Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>
