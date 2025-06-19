Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE2AE073A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47A10EA65;
	Thu, 19 Jun 2025 13:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J22gnJhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378B710EA4F;
 Thu, 19 Jun 2025 13:29:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 803C361148;
 Thu, 19 Jun 2025 13:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E5FC4CEEA;
 Thu, 19 Jun 2025 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750339743;
 bh=jiHebfdNt4UzeD/k4En63OuTpwaiQo6q3ZZN6iNLq4Q=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=J22gnJhOAcWcxT0sOPDAjSTJ4bxfM86CqEKwhVaEm37UY4DBfGIHg3OlEhRGOot0v
 PTn3t1g3PUPz2nMTp0zE82aLSCTxm14cSGQonFmqYvKE4KUVEXP4opQ3g/eK+XALmS
 PxB4Al91QIsS/EVolGuGDtn8chRO0iW/QH/Fwuv7UN8HSeNT3oc6JX1pQklRqw45Tx
 uUa1qowr4Noq9knuFk7HdZF9sM995hAS/MkQmbxNZoZfhEi8x+kTHcnn7oh2aPXkn/
 Mj0KVGPiURc0KDt1I4XE9kLPopv1LvlOsKx9PPRuN+3GSAw3W68IMT7i3xXcDVyYQd
 U9a+UgFFHrs3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 15:28:56 +0200
Message-Id: <DAQJNI4Z04B0.32WEF8E3D3V2@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
 <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
 <DANR43CR8X87.1YWHJK7P75TPQ@nvidia.com>
 <DAPWKX9V8T26.315LG5OZLLL2M@kernel.org>
 <DAQJLYKS5AV3.62SL1IRSQE4B@nvidia.com>
In-Reply-To: <DAQJLYKS5AV3.62SL1IRSQE4B@nvidia.com>
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

On Thu Jun 19, 2025 at 3:26 PM CEST, Alexandre Courbot wrote:
> On Thu Jun 19, 2025 at 4:24 AM JST, Benno Lossin wrote:
>> On Mon Jun 16, 2025 at 8:41 AM CEST, Alexandre Courbot wrote:
>>> On Sun Jun 15, 2025 at 4:16 AM JST, Benno Lossin wrote:
>>>> On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
>>>>> +            #[inline(always)]
>>>>> +            pub const fn [<fls_ $t>](v: $t) -> u32 {
>>>>
>>>> Can we name this `find_last_set_bit_ $t`? When the upstream function
>>>> lands, we should also rename this one.
>>>
>>> We can - but as for `align_up`/`next_multiple_of`, I am not sure which
>>> naming scheme (kernel-like or closer to Rust conventions) is favored in
>>> such cases, and so far it seems to come down to personal preference. I
>>> tend to think that staying close to kernel conventions make it easier t=
o
>>> understand when a function is the equivalent of a C one, but whichever
>>> policy we adopt it would be nice to codify it somewhere (apologies if i=
t
>>> is already and I missed it).
>>
>> I don't think we have it written down anywhere. I don't think that we
>> should have a global rule for this. Certain things are more in the
>> purview of the kernel and others are more on the Rust side.
>>
>> My opinion is that this, since it will hopefully be in `core` at some
>> point, should go with the Rust naming.
>
> I guess in that case we should go with `last_set_bit`, as `find_` is not
> really used as a prefix for this kind of operations (e.g.
> `leading_zeros` and friends).

Sounds good!

---
Cheers,
Benno
