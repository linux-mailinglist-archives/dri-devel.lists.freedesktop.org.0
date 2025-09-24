Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF56B9DE4F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BC110E867;
	Thu, 25 Sep 2025 07:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="KkxW5b7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 511 seconds by postgrey-1.36 at gabe;
 Wed, 24 Sep 2025 20:10:14 UTC
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903310E50B;
 Wed, 24 Sep 2025 20:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=startmail1; t=1758744101;
 bh=buVtHBG0eIsK75YBB8xG+KkZHwf2C9ZtWPCSBDTaxX8=;
 h=Message-ID:Date:Mime-Version:Subject:To:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:From:Subject:To:
 Date:Sender:Content-Type:Content-Transfer-Encoding:
 Content-Disposition:Mime-Version:Reply-To:In-Reply-To:References:
 Message-Id:List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
 b=KkxW5b7XAYRBlAW++GR1kHZhAJAjOZVegCtgLvKuyNcqrayrbx/fUrD3b7HzY/+c3
 A9pVNElC745uHhVVYfxajWGYUnHjuSY5oPRCz8Jabg5xcmBBDoSWdnsyHWOfZCG5of
 33lPmTcybi91XyN90aHQNb1Ho64+LzWoFI9V7q76uY0T1hNz8Z9TVXLAIU6GQJqmuX
 TR/GT50cadaJOsrh1KbnWRCnYjKzq9mEPkmsmuhglYj3OrWgfR9OdBYwz8jI2Q0GRj
 t0D4FCKjKCaT1p8mvEh/R+AVCv9hhhea1BYkPtR0H9W5N7sS046xl4c1getrGQ50Gn
 jmi32EGff+ezA==
Message-ID: <d61820e5-ee8b-4c25-8c25-81921d3a7071@weathered-steel.dev>
Date: Wed, 24 Sep 2025 20:01:33 +0000
Mime-Version: 1.0
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov
 <yury.norov@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh> <aNQCVslEIHHSm8f5@yury>
 <2979b6b8-ebdb-43cf-ba3a-5d428101f74b@nvidia.com>
Content-Language: en-US
From: Elle Rhumsaa <elle@weathered-steel.dev>
In-Reply-To: <2979b6b8-ebdb-43cf-ba3a-5d428101f74b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 25 Sep 2025 07:47:05 +0000
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


>
> On 9/24/2025 4:38 PM, Yury Norov wrote:
>> On Wed, Sep 24, 2025 at 12:52:41PM +0200, Greg KH wrote:
>>> On Sun, Sep 21, 2025 at 03:47:55PM +0200, Danilo Krummrich wrote:
>>>> On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
>>>>> Again, regmap handles this all just fine, why not just make bindings to
>>>>> that api here instead?
>>>> The idea is to use this for the register!() macro, e.g.
>>>>
>>>> 	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
>>>> 	    28:24   architecture_0 as u8, "Lower bits of the architecture";
>>>> 	    23:20   implementation as u8, "Implementation version of the architecture";
>>>> 	    8:8     architecture_1 as u8, "MSB of the architecture";
>>>> 	    7:4     major_revision as u8, "Major revision of the chip";
>>>> 	    3:0     minor_revision as u8, "Minor revision of the chip";
>>>> 	});
>>>>
>>>> (More examples in [1].)
>>> Wonderful, but I fail to see where the endian-ness of this is set
>>> anywhere.  Am I just missing that?  The regmap api enforces this idea,
>>> and so the
>>>
>>>> This generates a structure with the relevant accessors; we can also implement
>>>> additional logic, such as:
>>>>
>>>> 	impl NV_PMC_BOOT_0 {
>>>> 	    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
>>>> 	    pub(crate) fn architecture(self) -> Result<Architecture> {
>>>> 	        Architecture::try_from(
>>>> 	            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
>>>> 	        )
>>>> 	    }
>>>> 	
>>>> 	    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
>>>> 	    pub(crate) fn chipset(self) -> Result<Chipset> {
>>>> 	        self.architecture()
>>>> 	            .map(|arch| {
>>>> 	                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
>>>> 	                    | u32::from(self.implementation())
>>>> 	            })
>>>> 	            .and_then(Chipset::try_from)
>>>> 	    }
>>>> 	}
>>>>
>>>> This conviniently allows us to read the register with
>>>>
>>>> 	let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>>>
>>>> and obtain an instance of the entire Chipset structure with
>>>>
>>>> 	let chipset = boot0.chipset()?;
>>>>
>>>> or pass it to a constructor that creates a Revision instance
>>>>
>>>> 	let rev = Revision::from_boot0(boot0);
>>>>
>>>> Analogously it allows us to modify and write registers without having to mess
>>>> with error prone shifts, masks and casts, because that code is generated by the
>>>> register!() macro. (Of course, unless we have more complicated cases where
>>>> multiple fields have to be combined as illustrated above.)
>>>>
>>>> Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
>>>> SZ_16M.
>>>>
>>>> However, the type required by read() as generated by the register!() macro
>>>> actually only requires something that implements an I/O backend, i.e
>>>> kernel::io::Io<SIZE>.
>>>>
>>>> pci::Bar is a specific implementation of kernel::io::Io.
>>>>
>>>> With this we can let the actual I/O backend handle the endianness of the bus.
>>> Ok, great, but right now it's not doing that from what I am seeing when
>>> reading the code.  Shouldn't IoMem::new() take that as an argument?
>>>
>>> But, that feels odd as our current iomem api in C doesn't care about
>>> endian issues at all because it "assumes" that the caller has already
>>> handle this properly and all that the caller "wants" is to write/read to
>>> some memory chunk and not twiddle bits.
>>>
>>>> (Actually, we could even implement an I/O backend that uses regmap.)
>>> That would probably be best to do eventually as most platform drivers
>>> use regmap today as it's the sanest api we have at the moment.
>>>
>>>> So, I think the register!() stuff is rather orthogonal.
>>> I think it's very relevant as people seem to just be "assuming" that all
>>> the world (hardware and cpus) are little-endian, while in reality, they
>>> are anything but.  As proof, the code that uses this register!() logic
>>> today totally ignores endian issues and just assumes that it is both
>>> running on a little-endian system, AND the hardware is little-endian.
>>>
>>> As a crazy example, look at the USB host controllers that at runtime,
>>> have to be queried to determine what endian they are running on and the
>>> kernel drivers have to handle this "on the fly".  Yes, one can argue
>>> that the hardware developers who came up with that should be forced to
>>> write the drivers as penance for such sins, but in the end, it's us that
>>> has to deal with it...
>>>
>>> So ignoring it will get us quite a ways forward with controlling sane
>>> hardware on sane systems, but when s390 finally realizes they can be
>>> writing their drivers in rust, we are going to have to have these
>>> conversations again :)
>> Hi Greg, all,
>>
>> Endianess is not the only problem when dealing with registers mapped
>> to the memory, right?
>>
>> I recall some built-in 12-bit ADCs in 8-bit AVR microcontrollers. That
>> required to read 4-bit LO register before 8-bit HI, if you didn't want to
>> loose those 4 bits.
>>
>> Bitfields don't address that issue as well. In my understanding, it's
>> done on purpose: bitfields encapsulate shifts and masks, and don't
>> pretend that they are suitable for direct access to a hardware.
>>
>> Notice another rust bitfield project. It tries to account for endianess
>> and everything else:
>>
>> https://docs.rs/bitfield-struct/latest/bitfield_struct/
>>
>> I didn't ask explicitly, and maybe it's a good time to ask now: Joel,
>> Danilo and everyone, have you considered adopting this project in
>> kernel?
>>
>> The bitfield_struct builds everything into the structure:
>>
>>          use bitfield_struct::bitfield;
>>          
>>          #[bitfield(u8, order = Msb)]
>>          struct MyMsbByte {
>>              /// The first field occupies the *most* significant bits
>>              #[bits(4)]
>>              kind: usize,
>>              system: bool,
>>              #[bits(2)]
>>              level: usize,
>>              present: bool
>>          }
> Thanks for raising this. The syntax seems quite different from what we need, in
> particular since register! macro is based on our bitfield! macro, this syntax is
> incompatible with the need to specify bit ranges, not just the number of bits.
> In other words, it appears the out-of-crate does not satisfy the requirement.
> They have to specific 'order' property mainly because they don't have the notion
> of bitfield index, just number of bits.
>
> Regarding endianness in that crate, it appears to be configurable based on
> user's requirement so we can make it such if needed for any kernel usecases. But
> the default in that crate is native-endianness just like our implementation right?
>
> Thanks.
>
You might be interested in an implementation that we worked on that just 
uses `macro_rules`: https://docs.rs/bitfielder/latest/bitfielder/

It's not the same syntax as what you use, but you might be able to find 
some inspiration in how we dealt with endianness. We also have 
implementations for reading bitfields from byte arrays, if you're 
interested.

Either way, thanks for your continued work on this patch series.
