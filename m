Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F56DB532AB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F60810E315;
	Thu, 11 Sep 2025 12:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b2Jgjxe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6167C10E315;
 Thu, 11 Sep 2025 12:46:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0057F44576;
 Thu, 11 Sep 2025 12:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1842C4CEF1;
 Thu, 11 Sep 2025 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757594816;
 bh=ZMKRsM2d2FmjPym3iMEMNiiUE1WxtkOsfG1kTOUZ+po=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b2Jgjxe0smjNxwt90PXOQmhfvrW+ekazryG1m+dsEte/g78R+1fK3qaDluF7kr6qw
 DOUSJCOcA1AxyvONbB/ozhz0+y2dBOVqOu1Npn4WNDyBu0uKNYhPZcI5gSvrxShHsA
 JahfpeIWpvJth+407eK40K+s2A6BHrfSYHtL/DPAdToRxSNbDeLCoCxQn86SIUuIGk
 YWGOFAF4lrSbKcYkJPXMYY0KzQQ2SNnLs89YCEMmlxTVk8emI6d5xVNPdLO3qjITm7
 qSlhqA5q/vBTAeTXwmixuXgvjIqOB/4KixRAVS5iQNIruTnDfHHodcyWPNoY4n/ayS
 Y/RuMddb9f1Hw==
Message-ID: <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
Date: Thu, 11 Sep 2025 14:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/11/25 2:17 PM, Alexandre Courbot wrote:
> On Thu Sep 11, 2025 at 8:22 PM JST, Danilo Krummrich wrote:
>> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>>> +    /// Attempt to start the GSP.
>>> +    ///
>>> +    /// This is a GPU-dependent and complex procedure that involves loading firmware files from
>>> +    /// user-space, patching them with signatures, and building firmware-specific intricate data
>>> +    /// structures that the GSP will use at runtime.
>>> +    ///
>>> +    /// Upon return, the GSP is up and running, and its runtime object given as return value.
>>> +    pub(crate) fn start_gsp(
>>> +        pdev: &pci::Device<device::Bound>,
>>> +        bar: &Bar0,
>>> +        chipset: Chipset,
>>> +        gsp_falcon: &Falcon<Gsp>,
>>> +        _sec2_falcon: &Falcon<Sec2>,
>>> +    ) -> Result<()> {> +        let dev = pdev.as_ref();
>>> +
>>> +        let bios = Vbios::new(dev, bar)?;
>>> +
>>> +        let fb_layout = FbLayout::new(chipset, bar)?;
>>> +        dev_dbg!(dev, "{:#x?}\n", fb_layout);
>>> +
>>> +        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
>>> +
>>> +        // Return an empty placeholder for now, to be replaced with the GSP runtime data.
>>> +        Ok(())
>>> +    }
>>
>> I'd rather create the Gsp structure already, move the code to Gsp::new() and
>> return an impl PinInit<Self, Error>. If you don't want to store any of the
>> object instances you create above yet, you can just stuff all the code into an
>> initializer code block, as you do in the next patch with
>> gfw::wait_gfw_boot_completion().
> 
> I don't think that would work, or be any better even if it did. The full
> GSP initialization is pretty complex and all we need to return is one
> object created at the beginning that doesn't need to be pinned.
> Moreover, the process is also dependent on the GPU family and completely
> different on Hopper/Blackwell.

Why would it not work? There is no difference between the code above being
executed from an initializer block or directly in Gsp::new().
> You can see the whole process on [1]. `libos` is the object that is
> returned (although its name and type will change). All the rest it
> loading, preparing and running firmware, and that is done on the GPU. I
> think it would be very out of place in the GSP module.
> 
> It is also very step-by-step: run this firmware, wait for it to
> complete, run another one, wait for a specific message from the GSP, run
> the sequencer, etc. And most of this stuff is thrown away once the GSP
> is running. That's where the limits of what we can do with `pin_init!`
> are reached, and the GSP object doesn't need to be pinned anyway.

I don't see that, in the code you linked you have a bunch of calls that don't
return anything that needs to survive, this can be in an initializer block.

And then you have

let mut libos = gsp::GspMemObjects::new(pdev, bar)?;

which only needs the device reference and the bar reference.

So you can easily write this as:

try_pin_init!(Self {
   _: {
      // all the throw-away stuff from above
   },
   libos <- gsp::GspMemObjects::new(pdev, bar),
   _: {
      libos.do_some_stuff_mutable()?;
   }
})
> By keeping the initialization in the GPU, we can keep the GSP object
> architecture-independent, and I think it makes sense from a design point
> of view. That's not to say this code should be in `gpu.rs`, maybe we
> want to move it to a GPU HAL, or if we really want this as part of the
> GSP a `gsp/boot` module supporting all the different archs. But I'd
> prefer to think about this when we start supporting several
> architectures.

Didn't we talk about a struct Gsp that will eventually be returned by
Self::start_gsp(), or did I make this up in my head?

The way I think about this is that we'll have a struct Gsp that represents the
entry point in the driver to mess with the GSP command queue.

But either way, this throws up two questions, if Self::start_gsp() return a
struct GspMemObjects instead (which is probably the same thing with a different
name), then:

Are we sure this won't need any locks? If it will need locking (which I expect)
then it needs pin-init.

If it never needs pinning why did you write it as

gsp <- Self::start_gsp(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?,

in a patch 3?
> [1] https://github.com/Gnurou/linux/blob/gsp_init_rebase/drivers/gpu/nova-core/gpu.rs#L305

