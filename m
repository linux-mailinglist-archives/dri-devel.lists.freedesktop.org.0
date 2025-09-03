Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CAFB41C9E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC810E76E;
	Wed,  3 Sep 2025 11:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ggb9XAOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D237810E76C;
 Wed,  3 Sep 2025 11:05:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF69F6013D;
 Wed,  3 Sep 2025 11:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3AAC4CEF0;
 Wed,  3 Sep 2025 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756897521;
 bh=rZ2DDWGNicVIDpxbt6WBxkpuXKZ7yljlhaXlWCuPQeg=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=ggb9XAOnIFuNb0Yr72J2eO8bIm8EOURyntxFrJkUuScr/+3U4j9AcxV5468ICvmmQ
 aHYJqgGloFteC9jOtR2jOFsGzffd3bRMFoL9/Kes5TCEoszKRsY5NMoj74iPE8ApDw
 9yaxR0hVQsdBiQG5c1AJb2IBfZRYEfwlmDMy/23lFCFQ0J2RVU/zT4VpsoiapgWKT3
 bk7TH2vvVHxxbVKr0BAfPxDa/jK4U4aprT+zSTQrrVkyGhX/nHJVCLVUAmjDbzYS+I
 O2ZqEqTvUZKkZX50LKHhVJe2l5ltqK/R0KmMwaTWYEw+aPTxO8P0I1yv69VHAHOEYn
 4KieIRBTQ+CVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 13:05:15 +0200
Message-Id: <DCJ46WGRUXR8.1GKGGL2568E1X@kernel.org>
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
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
 <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
 <DCJ3R8YQUYK1.3K5BCWHMAEOL7@nvidia.com>
In-Reply-To: <DCJ3R8YQUYK1.3K5BCWHMAEOL7@nvidia.com>
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

On Wed Sep 3, 2025 at 12:44 PM CEST, Alexandre Courbot wrote:
> On Wed Sep 3, 2025 at 5:26 PM JST, Danilo Krummrich wrote:
>> On Wed Sep 3, 2025 at 9:08 AM CEST, Alexandre Courbot wrote:
>>> On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
>>>> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>>>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/=
driver.rs
>>>>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f=
009c2e8029ffaa1e2f8 100644
>>>>> --- a/drivers/gpu/nova-core/driver.rs
>>>>> +++ b/drivers/gpu/nova-core/driver.rs
>>>>> @@ -6,6 +6,8 @@
>>>>> =20
>>>>>  #[pin_data]
>>>>>  pub(crate) struct NovaCore {
>>>>> +    // Placeholder for the real `Gsp` object once it is built.
>>>>> +    pub(crate) gsp: (),
>>>>>      #[pin]
>>>>>      pub(crate) gpu: Gpu,
>>>>>      _reg: auxiliary::Registration,
>>>>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::I=
dInfo) -> Result<Pin<KBox<Self
>>>>>          )?;
>>>>> =20
>>>>>          let this =3D KBox::pin_init(
>>>>> -            try_pin_init!(Self {
>>>>> +            try_pin_init!(&this in Self {
>>>>>                  gpu <- Gpu::new(pdev, bar)?,
>>>>> +                gsp <- {
>>>>> +                    // SAFETY: `this.gpu` is initialized to a valid =
value.
>>>>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>>>>> +
>>>>> +                    gpu.start_gsp(pdev)?
>>>>> +                },
>>>>
>>>> Please use pin_chain() [1] for this.
>>>
>>> Sorry, but I couldn't figure out how I can use pin_chain here (and
>>> couldn't find any relevant example in the kernel code either). Can you
>>> elaborate a bit?
>>
>> I thought of just doing the following, which I think should be equivalen=
t (diff
>> against current nova-next).
>>
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index 274989ea1fb4..6d62867f7503 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -41,7 +41,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInf=
o) -> Result<Pin<KBox<Self
>>
>>          let this =3D KBox::pin_init(
>>              try_pin_init!(Self {
>> -                gpu <- Gpu::new(pdev, bar)?,
>> +                gpu <- Gpu::new(pdev, bar)?.pin_chain(|gpu| {
>> +                    gpu.start_gsp(pdev)
>> +                }),
>>                  _reg: auxiliary::Registration::new(
>>                      pdev.as_ref(),
>>                      c_str!("nova-drm"),
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 8caecaf7dfb4..211bc1a5a5b3 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -266,7 +266,7 @@ fn run_fwsec_frts(
>>      pub(crate) fn new(
>>          pdev: &pci::Device<device::Bound>,
>>          devres_bar: Arc<Devres<Bar0>>,
>> -    ) -> Result<impl PinInit<Self>> {
>> +    ) -> Result<impl PinInit<Self, Error>> {
>>          let bar =3D devres_bar.access(pdev.as_ref())?;
>>          let spec =3D Spec::new(bar)?;
>>          let fw =3D Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_=
VERSION)?;
>> @@ -302,11 +302,16 @@ pub(crate) fn new(
>>
>>          Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &f=
b_layout)?;
>>
>> -        Ok(pin_init!(Self {
>> +        Ok(try_pin_init!(Self {
>>              spec,
>>              bar: devres_bar,
>>              fw,
>>              sysmem_flush,
>>          }))
>>      }
>> +
>> +    pub(crate) fn start_gsp(&self, _pdev: &pci::Device<device::Core>) -=
> Result {
>> +        // noop
>> +        Ok(())
>> +    }
>>  }
>>
>> But maybe it doesn't capture your intend?
>
> The issue is that `start_gsp` returns a value (currently a placeholder
> `()`, but it will change into a real type) that needs to be stored into
> the newly-introduced `gsp` member of `NovaCore`. I could not figure how
> how `pin_chain` could help with this (and this is the same problem for
> the other `unsafe` statements in `firmware/gsp.rs`).

Ok, I see, I think Benno is already working on a solution to access previou=
sly
initialized fields from subsequent initializers.

@Benno: What's the status of this? I haven't seen an issue for that in the
pin-init GitHub repo, should we create one?

However, in this case I'm a bit confused why we want Gsp next to Gpu? Why n=
ot
just make Gsp a member of Gpu then?

I thought the intent was to keep temporary values local to start_gsp() and =
not
store them next to Gpu in the same allocation?

> It is a common pattern when initializing a pinned object, so I agree it
> would be nice support this without unsafe code.
