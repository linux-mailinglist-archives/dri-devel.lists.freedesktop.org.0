Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94EB57093
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 08:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2E10E2C2;
	Mon, 15 Sep 2025 06:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ragfCJFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84CE10E2BA;
 Mon, 15 Sep 2025 06:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C291960191;
 Mon, 15 Sep 2025 06:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88CAC4CEF1;
 Mon, 15 Sep 2025 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757918688;
 bh=VAfu4F5dsdSIYPJ7m+h39bitRfmL3DD8Nk2X9dOJhtQ=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ragfCJFpMq98eSjOvZnc9x4bbzLfT4wMQ01fDijHQdZh7LM9OkhjE3F1fZ74HrIcY
 sopGLJsszn2n4BRv0CdZ95jFgnyShWURJoGqX3SXTnuo0+YWrHoa412S2JfyMazepG
 KLRjF9QUYt/SV5WXgi8pwJYTTq0GQEUORXy7NEDpD37DcWgrhjwXXCLU6TnYhps3GP
 8SNaBJ/AMr73WbgbSJWylotp1ZQELWaAFJp5Q/RnhlNo3D75E77EyUQXk0J9zlVqra
 C1xm44+rUYVMb8lwSeIR4hgvWfyZB8WO3R2ChkX7zwkcAurQcYZKC9WrfObwaF0WAi
 GoufU1EwP5CxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Sep 2025 08:44:38 +0200
Message-Id: <DCT65W48G0CN.19VOHM3178BWM@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
 <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
 <20250913220625.GA1564550@joelbox2> <DCS59IDCIKH1.2M3I6H0NVD0RG@nvidia.com>
 <DCSLPCSQRYOY.3BX3008H5CVQP@kernel.org>
 <DCT3XP3PVHJZ.2T0L221T3HW5R@nvidia.com>
In-Reply-To: <DCT3XP3PVHJZ.2T0L221T3HW5R@nvidia.com>
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

On Mon Sep 15, 2025 at 6:59 AM CEST, Alexandre Courbot wrote:
> On Sun Sep 14, 2025 at 11:42 PM JST, Benno Lossin wrote:
>> On Sun Sep 14, 2025 at 3:49 AM CEST, Alexandre Courbot wrote:
>>> On Sun Sep 14, 2025 at 7:06 AM JST, Joel Fernandes wrote:
>>>> On Sat, Sep 13, 2025 at 02:29:54PM -0700, John Hubbard wrote:
>>>>> Yes. It's only "paranoia" if the code is bug-free. So Rust itself
>>>>> naturally will look "a little" paranoid, that's core to its mission. =
:)
>>>>
>>>> This seems to be taken out-of-context, I said "paranoia" mainly becaus=
e I am
>>>> not sure if excessive use of pinning may tend to cause other problems.=
 The
>>>> "paranoia" is about over-usage of pinning. Personally, I don't prefer =
to pin
>>>> stuff in my code until I absolutely need to, or when I start having ne=
eds for
>>>> pinning, like using spinlocks. Maybe I am wrong, but the way I learnt =
Rust,
>>>> data movement is baked into it. I am not yet confident pinning will no=
t
>>>> constraint Rust code gen -- but that could just be a part of my learni=
ng
>>>> journey that I have to convince myself it is Ok to do so in advance of
>>>> actually requiring it even if you simply hypothetically anticipate nee=
ding it
>>>> (as Danilo pointed out that in practice this is not an issue and I do =
tend to
>>>> agree with Miguel and Danilo because they are usually right :-D). I am
>>>> researching counter examples :-)
>>>
>>> You can look at the definition for `Pin` in [1], but it is so short we
>>> can paste it here:
>>>
>>>     #[repr(transparent)]
>>>     #[derive(Copy, Clone)]
>>>     pub struct Pin<Ptr> {
>>>         pointer: Ptr,
>>>     }
>>>
>>> There isn't much getting in the way of optimized code generation - its
>>> purpose is simply to constraint the acquisition of mutable references t=
o
>>> prevent moving the pointee out.
>>>
>>> I started this patchset a little bit skeptical about the need to pin so
>>> many things, but after seeing the recent additions to `pin_init` and
>>> rewriting the code as Danilo suggested, it starteds to click. The
>>> supposed restrictions are in practice avoided by embracing the concept
>>> fully, and in the end I got that feeling (familiar when writing Rust) o=
f
>>> being guided towards the right design - a bit like playing bowling with
>>> gutter guards.
>>
>> That's a great way to put it -- I had a similar experience when writing
>> pin-init and thinking about it purely theoretically. Good to see that it
>> works out in practice (and continues to do so :).
>>
>>> Yes, that means redesigning and rebasing our code, but that's also the
>>> cost of learning a new language.
>>>
>>> And yes, things can still be a little bit rough around the edges, but
>>> there is awareness and action taken to address these issues, at the
>>> compiler level when relevant. This makes me confident for the future.
>>
>> If you have an issue that you cannot work around, or something that
>> looks off, let me know. Maybe that's something that pin-init can deal
>> better with or we can have another library that helps with it. After all
>> pin-init is specially tailored for the kernel to work :)
>
> I was thinking about the lack of access to already-initialized fields in
> the initializer when writing this, which has been covered so thanks for
> that. :)
>
> One more thing I still don't know how to do without unsafe code is
> accessing structurally-pinned members of a pinned object. I had expected
> that projection methods would be generated for such members marked
> `#[pin]`, but I haven't found anything yet. For instance, we need to
> call mutable methods on a pinned member of a pinned object, and the only
> way I have found to do this is to use unsafe code. Is there a better
> way?

That also lands together with access to initialized fields :) Danilo
already merged it into drm-rust-next: 619db96daf94 ("rust: pin-init: add
pin projections to `#[pin_data]`").

You can only project the entire struct at once, but most of the time
that should be sufficient.

---
Cheers,
Benno
