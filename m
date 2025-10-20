Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDABBF3FC9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 01:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E7F10E53A;
	Mon, 20 Oct 2025 23:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jQjKWkZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C48D10E539;
 Mon, 20 Oct 2025 23:07:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFA93456C1;
 Mon, 20 Oct 2025 23:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E485C4CEFB;
 Mon, 20 Oct 2025 23:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761001667;
 bh=2Wa1BgnVlLMR9sWUOy65xMkiyC8G6kFyDOFsk3N3BBQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=jQjKWkZovtgan8oP7x3Yg9nVAcUQxzBrpl+k+LoV1DWOEGDhznrBSuIC4YAs5XNsT
 kWJR568cr7apF1VPYjDqs+3yM0/ClSQ4wvOcC3cEuBZEUlZgFsQGhajhQULk9XLQq3
 tj8kN04500N1jT2BlE5VKEtYcJnDI9+zpX2sQmC6eG6RNhdRYr8c7AW1E+as8+CPJW
 jaO1ZZOeyh2TIqs1r/qj6w20IBbYGpKbU6ZsDjCV9wrDDL9JRlqBVOA5jwRC3u6hEy
 WB98/dZafN5t6EKhvZ0FBi62uIx9+YD2IRJrTbEOHsN0RvJBV/j+1qnEM+DuSRt/DJ
 aGuCg2/ju2YUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 01:07:40 +0200
Message-Id: <DDNIZMOBCE1Z.1ZOQ83TKTHQ28@kernel.org>
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
In-Reply-To: <aa3b4ebf-12c9-4ffd-bfd9-bcd920970309@nvidia.com>
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

On Tue Oct 21, 2025 at 12:50 AM CEST, John Hubbard wrote:
> On 10/16/25 12:39 PM, John Hubbard wrote:
>> On 10/16/25 12:34 PM, Danilo Krummrich wrote:
>>> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>>>> On Oct 16, 2025, at 1:48=E2=80=AFPM, Yury Norov <yury.norov@gmail.com=
> wrote:
>>>>> =EF=BB=BFOn Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wro=
te:
>> ...
>>> While I'm not super opinionated for general bitfields, for the register=
!()
>>> infrastructure I very much prefer the hi:lo notation, as this is the co=
mmon
>>> notation in datasheets and TRMs.
>>>
>>> However, if we use hi:lo, we should use it decending, i.e.:
> (restored from the email thread):
>
> 	bitfield! {
> 	    struct ControlReg {
> 	        7:5 state as u8 =3D> State;
> 	        3:0 mode as u8 ?=3D> Mode;
> 	    }
> 	}>>
>>=20
>> Sure, descending works.
>
> Oops! I need to correct myself. After reviewing most of Joel Fernandes'
> latest patchset ([PATCH 0/7] Pre-requisite patches for mm and irq in
> nova-core) [1], I remember that the HW documentation is written in
> ascending order.
>
> For one example (out of countless hundreds or thousands), please see [2].
> Considering that I actually pushed this file up to github just a few
> years ago, it's rather silly of me to forget this basic truth. :)
>
> We really want to stay close to the HW documentation, and so, all other
> things being (nearly) equal, this means that we should prefer ascending
> field order, if that's OK with everyone.

But that's OpenRM specific, I'm pretty sure when you look at internal datas=
heets
and TRMs you will find hi:lo with decending order, for instance [3] page 16=
72
(clicked a random location in the scroll bar. :).

Besides, I think that hi:lo with ascending order is confusing. It should ei=
ther
be hi:lo decending or lo:hi ascending.

For registers the common one is the former.

> [1] https://lore.kernel.org/20251020185539.49986-1-joelagnelf@nvidia.com
> [2] https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/ga1=
02/dev_ce.ref.txt
[3] https://developer.nvidia.com/downloads/orin-series-soc-technical-refere=
nce-manual/
