Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB33CB4FFC3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5F310E72D;
	Tue,  9 Sep 2025 14:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fd7NI8IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A0D10E754;
 Tue,  9 Sep 2025 14:43:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 903576022C;
 Tue,  9 Sep 2025 14:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F36FC4CEF8;
 Tue,  9 Sep 2025 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757429002;
 bh=kOLSsE1TcnY+gD8/KJbt5EmBVHc4itvLUUpgLRb7r8s=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Fd7NI8ICq8/Xj73RQML2SSjWlryQTl90qxTRXnDC7G+4Wy51FDUU49MFVJEqqLIn7
 /3kJOO+dvIqg+HX9M4PKWKScEthYd9widVsKPisKFVlyvJwfKAxgxtIIzNn4YTUkrt
 6x23XQoqTpgV9DG5rRMKYqthdGuZ3v9IwZ3plFa1qw6jYmsgqp7ivFS61fUR4E0/CD
 Y5kJp530UYLIMojmOH7fTh12l4fHBt0N77SFx1sLwg2muKNnCUODbpYwPXEwWCjiSU
 GUnQB1MDqvsNnWfYLUKY/ihYJbnrm+wLTyFXb/IBNx1rN8dxFIbnyt4TUSaUhUKFXz
 GI0ef9tPtyFaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 16:43:16 +0200
Message-Id: <DCOCL398HXDH.3QH9U6UGGIUP1@kernel.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
 <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
 <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
In-Reply-To: <DCOBWF0EZLHF.3FFVAB16SJ3FW@nvidia.com>
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

On Tue Sep 9, 2025 at 4:11 PM CEST, Alexandre Courbot wrote:
> On Wed Sep 3, 2025 at 5:27 PM JST, Danilo Krummrich wrote:
>> On Wed Sep 3, 2025 at 9:10 AM CEST, Alexandre Courbot wrote:
>>> On Wed Sep 3, 2025 at 8:12 AM JST, Danilo Krummrich wrote:
>>>> On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>>>>>       pub(crate) fn new(
>>>>>           pdev: &pci::Device<device::Bound>,
>>>>>           devres_bar: Arc<Devres<Bar0>>,
>>>>
>>>> The diff is hiding it, but with this patch we should also make sure th=
at this=20
>>>> returns impl PinInit<Self, Error> rather than Result<impl PinInit<Self=
>.
>>>>
>>>> I think this should be possible now.
>>>
>>> There is still code that can return errors (falcon creation, etc) - do
>>> you mean that we should move it into the pin initializer and turn it
>>> into a `try_pin_init`?
>>
>> Yeah, that would be better practice, if it doesn't work out for a good r=
eason
>> we can also fall back to Result<impl PinInit<Self, Error>, but we should=
 at
>> least try to avoid it.
>
> I tried but could not do it in a way that is satisfying. The problem is
> that `Gpu::new` receives a `Arc<Devres<Bar0>>`, which we need to
> `access` in order to do anything useful with it. If we first store it
> into the `Gpu` structure, then every subsequent member needs to `access`
> it in its own code block in order to perform their own initialization.
> This is quite cumbersome.
>
> If there is a way to obtain the `Bar0` once after the `bar` member of
> `Gpu` is initialized, and then use that instance with each remaining
> member, then that problem would go away but I am not aware of such a
> thing.

What about this?

	impl Gpu {
	    pub(crate) fn new<'a>(
	        dev: &'a Device<Bound>,
	        bar: &'a Bar0
	        devres_bar: Arc<Devres<Bar0>>,
	    ) -> impl PinInit<Self, Error> + 'a {
	        try_pin_init(Self {
	            bar: devres_bar,
	            spec: Spec::new(bar)?,
	            gsp_falcon: Falcon::<Gsp>::new(dev, spec.chipset)?,
	            sec2_falcon: Falcon::<Sec2>::new(dev, spec.chipset)?,
	            sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?
	            gsp <- Gsp::new(gsp_falcon, sec2_falcon, sysmem_flush)?,
	        })
	    }
	}
