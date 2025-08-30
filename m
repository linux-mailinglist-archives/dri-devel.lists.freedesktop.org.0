Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E32B3CAE5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 14:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1610E23F;
	Sat, 30 Aug 2025 12:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l+7mlNZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61810E23F;
 Sat, 30 Aug 2025 12:57:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F880402BD;
 Sat, 30 Aug 2025 12:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C74C4CEF4;
 Sat, 30 Aug 2025 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756558625;
 bh=6kFjNNDgn39uI5ZcQcgVoBOGmQgQ9XzNrTTLP1QtxqA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l+7mlNZtZvwRvnEwROPTwb+Wm8f3sykidxk098PNE2hu/xbO1k+LzWXqJNhnHTqRF
 vvNOiix9E6hcW7pd/QuP8LhA24EBHyjQW8YekEbXjFNptjgbCFu3Ps/2Tu8Yt78UB6
 BUWfGP4HDjHQnm0WPv/JM7SG70yIUASggKc0mmwWodfpLTuTdohR6TpxfBlIFJldJW
 NWq9GF/TwTqDbn2ctd2tDvvYTPf3XBZMb7zammky+MJ9D5GEazyXJcV/ES2IkbKbdd
 os2okRG06HUUUcFUdYtk/AOLXIBcftXj9wwOSkgWRHXr9Axe5ZCNWk3C0J1zIUD3uV
 EX5++HeSYn5UA==
Message-ID: <e249a1d1-f1fb-4818-b9d6-e0b5c17c61a5@kernel.org>
Date: Sat, 30 Aug 2025 14:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the
 GSP firmware
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
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
 <5338bd30-f3ed-42c7-af0e-77c3ef7d675d@kernel.org>
 <DCEVAXNB3EL9.YFTIP5RQCTUW@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DCEVAXNB3EL9.YFTIP5RQCTUW@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/29/25 1:16 PM, Alexandre Courbot wrote:
> On Thu Aug 28, 2025 at 8:27 PM JST, Danilo Krummrich wrote:
>> On 8/26/25 6:07 AM, Alexandre Courbot wrote:
>>>    /// Structure encapsulating the firmware blobs required for the GPU to operate.
>>>    #[expect(dead_code)]
>>>    pub(crate) struct Firmware {
>>> @@ -36,7 +123,10 @@ pub(crate) struct Firmware {
>>>        booter_unloader: BooterFirmware,
>>>        /// GSP bootloader, verifies the GSP firmware before loading and running it.
>>>        gsp_bootloader: RiscvFirmware,
>>> -    gsp: firmware::Firmware,
>>> +    /// GSP firmware.
>>> +    gsp: Pin<KBox<GspFirmware>>,
>>
>> Is there a reason why we don't just propagate it through struct Gpu, which uses
>> pin-init already?
>>
>> You can make Firmware pin_data too and then everything is within the single
>> allocation of struct Gpu.

Thanks a lot for the write-up below!

> I tried doing that at first, and hit the problem that the `impl PinInit`
> returned by `GspFirmware::new` borrows a reference to the GSP firmware
> binary loaded by `Firmware::new` - when `Firmware::new` returns, the
> firmware gets freed, and the borrow checker complains.
> 
> We could move the GSP firmware loading code into the `pin_init!` of
> `Firmware::new`, but now we hit another problem: in `Gpu::new` the
> following code is executed:
> 
>      FbLayout::new(chipset, bar, &fw.gsp_bootloader, &fw.gsp)?
> 
> which requires the `Firmware` instance, which doesn't exist yet as the
> `Gpu` object isn't initialized until the end of the method.
> 
> So we could move `FbLayout`, and everything else created by `Gpu::new`
> to become members of the `Gpu` instance. It does make sense actually:
> this `new` method is doing a lot of stuff, such as running FRTS, and
> with Alistair's series it even runs Booter, the sequencer and so on.
> Maybe we should move all firmware execution to a separate method that is
> called by `probe` after the `Gpu` is constructed, as right now the `Gpu`
> constructor looks like it does a bit more than it should.

Absolutely, executing the firmware should be a separate method. Having it in the
constructor makes things more difficult.
> ... but even when doing that, `Firmware::new` and `FbLayout::new` still
> require a reference to the `Bar`, and... you get the idea. :)

Lifetime wise this should be fine, the &Bar out-lives the constructor, since
it's lifetime is bound to the &Device<Bound> which lives for the entire duration
of probe().
> So I don't think the current design allows us to do that easily or at
> all, and even if it does, it will be at a significant cost in code
> clarity. There is also the fact that I am considering making the
> firmware member of `Gpu` a trait object: the boot sequence is so
> different between pre and post-Hopper that I don't think it makes sense
> to share the same `Firmware` structure between the two. I would rather
> see `Firmware` as an opaque trait object, which provides high-level
> methods such as "start GSP" behind which the specifics of each GPU
> family are hidden. If we go with this design, `Firmware` will become a
> trait object and so cannot be pinned into `Gpu`.
> 
> This doesn't change my observation that `Gpu::new` should not IMHO do
> steps like booting the GSP - it should just acquire the resources it
> needs, return the pinned GPU object, and then `probe` can continue the
> boot sequence. Having the GPU object pinned and constructed early
> simplifies things quite a bit as the more we progress with boot, the
> harder it becomes to construct everything in place (and the `PinInit`
> closure also becomes more and more complex).
> 
> I'm still laying down the general design, but I'm pretty convinced that
> having `Firmware` as a trait object is the right way to abstract the
> differences between GPU families.

Makes sense, it's fine with me to keep this in its separate allocation for the
purpose of making Firmware an opaque trait object, which sounds reasonable.

But we should really properly separate construction of the GPU structure from
firmware boot code execution as you say. And actually move the construction of
the GPU object into try_pin_init!().
