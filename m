Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FEB41863
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB0810E485;
	Wed,  3 Sep 2025 08:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TL0ViPMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7310E485;
 Wed,  3 Sep 2025 08:26:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E7BFE43DD8;
 Wed,  3 Sep 2025 08:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5368BC4CEF0;
 Wed,  3 Sep 2025 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756887986;
 bh=zW7TNLfa4KbD81DgW3vApU7vw2XK4yGJuNII46K+LP8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=TL0ViPMFzxCUOD60fpt2D70YnJ5+2MVzpcMuup7ylSEWM84B7/br1zhsKcfu9AHd4
 nMgW0+W+12qBYP03uBqSojB7ZiMKFXpKltcmxdNfCeAHci8x7GmUm0CzobVxmt+4fK
 jjwtYadsyI0Ett44NRPRQipLROyiPq3jINnsihMordfY8876pC+HXmjmYEG84QWZzT
 KEQHbFXHGxtzKtketd1mYBPjX1cUrPqS/106h4DnfUYy8Y9M3ViYWjmVhvvK9suLpo
 IPrpHNBcOhmabIyiaP4xGuAFo/5LXymYhFzKwAtwchdtcODQEii9WgezgFSQa2m/7F
 fblJ9A//Vtj4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 10:26:20 +0200
Message-Id: <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
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
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
In-Reply-To: <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
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

On Wed Sep 3, 2025 at 9:08 AM CEST, Alexandre Courbot wrote:
> On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
>> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dr=
iver.rs
>>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379f00=
9c2e8029ffaa1e2f8 100644
>>> --- a/drivers/gpu/nova-core/driver.rs
>>> +++ b/drivers/gpu/nova-core/driver.rs
>>> @@ -6,6 +6,8 @@
>>> =20
>>>  #[pin_data]
>>>  pub(crate) struct NovaCore {
>>> +    // Placeholder for the real `Gsp` object once it is built.
>>> +    pub(crate) gsp: (),
>>>      #[pin]
>>>      pub(crate) gpu: Gpu,
>>>      _reg: auxiliary::Registration,
>>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdI=
nfo) -> Result<Pin<KBox<Self
>>>          )?;
>>> =20
>>>          let this =3D KBox::pin_init(
>>> -            try_pin_init!(Self {
>>> +            try_pin_init!(&this in Self {
>>>                  gpu <- Gpu::new(pdev, bar)?,
>>> +                gsp <- {
>>> +                    // SAFETY: `this.gpu` is initialized to a valid va=
lue.
>>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>>> +
>>> +                    gpu.start_gsp(pdev)?
>>> +                },
>>
>> Please use pin_chain() [1] for this.
>
> Sorry, but I couldn't figure out how I can use pin_chain here (and
> couldn't find any relevant example in the kernel code either). Can you
> elaborate a bit?

I thought of just doing the following, which I think should be equivalent (=
diff
against current nova-next).

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver=
.rs
index 274989ea1fb4..6d62867f7503 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -41,7 +41,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) =
-> Result<Pin<KBox<Self

         let this =3D KBox::pin_init(
             try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar)?,
+                gpu <- Gpu::new(pdev, bar)?.pin_chain(|gpu| {
+                    gpu.start_gsp(pdev)
+                }),
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c_str!("nova-drm"),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8caecaf7dfb4..211bc1a5a5b3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -266,7 +266,7 @@ fn run_fwsec_frts(
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
-    ) -> Result<impl PinInit<Self>> {
+    ) -> Result<impl PinInit<Self, Error>> {
         let bar =3D devres_bar.access(pdev.as_ref())?;
         let spec =3D Spec::new(bar)?;
         let fw =3D Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE_VER=
SION)?;
@@ -302,11 +302,16 @@ pub(crate) fn new(

         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_l=
ayout)?;

-        Ok(pin_init!(Self {
+        Ok(try_pin_init!(Self {
             spec,
             bar: devres_bar,
             fw,
             sysmem_flush,
         }))
     }
+
+    pub(crate) fn start_gsp(&self, _pdev: &pci::Device<device::Core>) -> R=
esult {
+        // noop
+        Ok(())
+    }
 }

But maybe it doesn't capture your intend?

>>
>> More in general, unsafe code should be the absolute last resort. If we a=
dd new
>> unsafe code I'd love to see a comment justifying why there's no other wa=
y than
>> using unsafe code for this, as we agreed in [2].
>>
>> I did a quick grep on this series and I see 21 occurrences of "unsafe", =
if I
>> substract the ones for annotations and for FromBytes impls, it's still 9=
 new
>> ones. :(
>>
>> Do we really need all of them?
>
> I've counted 16 uses of `unsafe`. :)

I did a grep | wc on the mbox file, so it includes the 5 additional occurre=
nces
from the annotations. :)

Otherwise the 9 "real" ones I counted seem to match the 3 bindgen ones (fin=
e of
course) plus the 5 ones from the pin initializers (we should avoid them).

>
> - 3 in the bindgen-generated code (these can't be avoided),
> - 7 to implement `FromBytes`,
> - 1 to work around the fact that `FromBytes` doesn't work on slices yet
>   (maybe that one can be removed)
> - 5 as a result of intra-dependencies in PinInit initializers (which we
>   might be able to remove if I figure out how to use `pin_chain`).
>
> So best-case scenario would be that we will be down to 10 that are truly
> unavoidable.
