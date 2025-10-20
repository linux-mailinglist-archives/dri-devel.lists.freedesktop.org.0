Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CEBF402D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 01:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57A10E538;
	Mon, 20 Oct 2025 23:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qz83Qc2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423EB10E538;
 Mon, 20 Oct 2025 23:22:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D2D6602ED;
 Mon, 20 Oct 2025 23:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE85BC4CEFB;
 Mon, 20 Oct 2025 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761002569;
 bh=mLwt746Bql4VNUGxNyThhFT4hbQLnNE7vPdHAEK1tp0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=qz83Qc2+5BdmaCk5dSamlr7LkAH2xrC+hRTW2tEGLZ2v2EjHvXlaDjkP3Sn58EBL0
 XWLxBZ6TO605if2lq3cKpxFyQ/vqM4SKI3WVo8b+cGt0BVJvCbtdnNL0dj6/E7YAbs
 L4mKkWLMfYj/ZrpYoiLusuCGcANcYsgYzdQqSlkYXgOyeARbD1TEux44xFfInY4RPL
 8MmINVMQmqLm62+1ODM6Ezs3yyfaX2+z9fYPRddhrJ87B4ht2tjL15oREvmdxGTGFQ
 PiuvW4Rq3T2gszvTfcdoujCH1SVQ4aR750fYoXihCmsbKMH6H0s+drKX0C7Yw5kmHw
 ELOdTGBuM1FaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 01:22:42 +0200
Message-Id: <DDNJB4SLN8A4.O0L8NH8IWXSO@kernel.org>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Timur
 Tabi" <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Edwin
 Peer" <epeer@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
 <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
 <aa3b4ebf-12c9-4ffd-bfd9-bcd920970309@nvidia.com>
 <DDNIZMOBCE1Z.1ZOQ83TKTHQ28@kernel.org>
 <0e592a2d-6c0a-4dab-b16c-ff994917af9a@nvidia.com>
In-Reply-To: <0e592a2d-6c0a-4dab-b16c-ff994917af9a@nvidia.com>
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

On Tue Oct 21, 2025 at 1:16 AM CEST, John Hubbard wrote:
> On 10/20/25 4:07 PM, Danilo Krummrich wrote:
>> On Tue Oct 21, 2025 at 12:50 AM CEST, John Hubbard wrote:
>>> On 10/16/25 12:39 PM, John Hubbard wrote:
>>>> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>>>>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>>>>> On Oct 16, 2025, at 1:48=E2=80=AFPM, Yury Norov <yury.norov@gmail.c=
om> wrote:
>>>>>>> =EF=BB=BFOn Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes w=
rote:
>>>> ...
>>>>> While I'm not super opinionated for general bitfields, for the regist=
er!()
>>>>> infrastructure I very much prefer the hi:lo notation, as this is the =
common
>>>>> notation in datasheets and TRMs.
>>>>>
>>>>> However, if we use hi:lo, we should use it decending, i.e.:
>>> (restored from the email thread):
>>>
>>> 	bitfield! {
>>> 	    struct ControlReg {
>>> 	        7:5 state as u8 =3D> State;
>>> 	        3:0 mode as u8 ?=3D> Mode;
>>> 	    }
>>> 	}>>
>>>>
>>>> Sure, descending works.
>>>
>>> Oops! I need to correct myself. After reviewing most of Joel Fernandes'
>>> latest patchset ([PATCH 0/7] Pre-requisite patches for mm and irq in
>>> nova-core) [1], I remember that the HW documentation is written in
>>> ascending order.
>>>
>>> For one example (out of countless hundreds or thousands), please see [2=
].
>>> Considering that I actually pushed this file up to github just a few
>>> years ago, it's rather silly of me to forget this basic truth. :)
>>>
>>> We really want to stay close to the HW documentation, and so, all other
>>> things being (nearly) equal, this means that we should prefer ascending
>>> field order, if that's OK with everyone.
>>=20
>> But that's OpenRM specific, I'm pretty sure when you look at internal da=
tasheets
>> and TRMs you will find hi:lo with decending order, for instance [3] page=
 1672
>
> TRM is Tegra. This is gradually going away, from our point of view, as
> the larger, older RM (Open RM) driver subsumes things.
>
> Open RM follows the main dGPU ref manuals, and we have piles of those
> and they all apply to Nova.
>
> None of the TRM stuff applies to Nova.

My point is less about NVIDIA TRMs, it's about that this is uncommon in gen=
eral,
OpenRM is the one being special here.

So, the question for me is do we care more about consistency throughout the
kernel, or do we care about consistency between a driver and it's uncommon
reference manual.

I think consistency throughout the kernel is more important.

>> (clicked a random location in the scroll bar. :).
>>=20
>> Besides, I think that hi:lo with ascending order is confusing. It should=
 either
>> be hi:lo decending or lo:hi ascending.
>>=20
>> For registers the common one is the former.
>>=20
>>> [1] https://lore.kernel.org/20251020185539.49986-1-joelagnelf@nvidia.co=
m
>>> [2] https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/g=
a102/dev_ce.ref.txt
>> [3] https://developer.nvidia.com/downloads/orin-series-soc-technical-ref=
erence-manual/

