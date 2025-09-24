Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E3B9A49B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 16:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523110E73F;
	Wed, 24 Sep 2025 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RgXGPCiZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180C910E740
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 14:38:18 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77f68fae1a8so1216965b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758724697; x=1759329497; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg4vhWciPFps4M4OUQazNr9EqiFhSJh6FT393Od5Kbo=;
 b=RgXGPCiZ38K0KNjpFKgGmnIbCMNF9bvp1LaNHwPem1X4eAGhe/3LZirUY8T5Jku7Bm
 4EbSt0a8OUTjJbJTPN6Dl08yKKhUU+b5shZaOrbZW0i6kGZHJcgDmw4dl+nfMBp2L3O8
 zR6u8ZBMtiCjKuVf/UvXhLNYMxM4gzPEkcSKAp8rXoGt6wgKmbJCbIM5RkVvyog2VwyX
 QS4jpAWDkg250huUWNhYsa2kEUpppP7czq2DvCZYhtQ024+1E8vpDc5W5mxDPwQge3vo
 6YioKA+MWTqz0fSxIScegNEVnBSLjwpCpoYFj3tVFgLVry/3kriWjaZmp4YFuczhN1kQ
 g5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758724697; x=1759329497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eg4vhWciPFps4M4OUQazNr9EqiFhSJh6FT393Od5Kbo=;
 b=UqVHa3hHcknlXhRHNQ1esSE5zc4OrkLd7a2FkWy/lfDEaSgj9cekHySVOmwy/DChbD
 4H4SaClFjkJOok3y0aEsdCtU3anaKIM1Y9uyraO+qksNM4Q70Hmaf7HyW9yRfSM8GO+E
 ImrgPwcHi8NXGt8eSVmptZaElm9R8pUg0OCJ7+1lcmqbXBmxf4I01YU+tqz3SMOYqv2x
 ufjG1jSInffEJsAtuoIqmZtREQqKhtdeP/sVkQtPIj/pX/l67cu9Oq15dt8FvuW9aFIj
 4U0mlWl28qc+y7h7++agFj6pto9zsSF3t91EPTyyGRt9520iYGqVZk0Je8zC4+hHSojS
 MNxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwjdWE/15/RWM76i23hy73nPA50L7Q+ZNcdlMWj9RGqseqft0lHNgbVdKZg7HsSvhwqFD5Hvai3IU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2oswSd2ieShFMw1v6ZAD2LLUX8Q6GLbZg8rhAiLwd6rQMNNi6
 d9ij2L/X63kMkgihGJD5Tfy1FvHLScdPipEk/siJ1W5iINdO2Czf2NG/
X-Gm-Gg: ASbGnct6fsMlaxb8wfLzUjzaiWuSyFm5sRemv617/rDGVkp915+nCgM9Cd9bg3uLGOT
 A9F7D/YdNm6aKCD2EgfH95IRGa3GqVoHRidlJdTz46cuDPGv2s/ez3fY5mvF7MmjVZeZPXTIWxE
 zEMnKfvicNdcnePSG7cZoRN9pok0z1InmWSMxjbGJhfq89gRgoEf39vwx4QmjZJE9ndW6P6T+93
 CHNhxcaOjN2KdEi4nb4h8R7qy6U+WSo34ujfjPL0xrocRsCYc3/ESTFTeOFHlnse6Xk6FtRwkxN
 Xko7nxiFEVcdNt52gIt8DmCb1I3o6IBzxr3c7euKCSBLZdcfURcJg1JtoGQX6F7qc5/LutJ/D5e
 mC7cgRL4umdoDdeLxbZqR/A==
X-Google-Smtp-Source: AGHT+IENwMEQzhAq/TYA+R4mvEKMicY7gTqR8AJL3WpiI0Dqquz1Gu+IYnL5yycGh6NnH1/2ZJiBVg==
X-Received: by 2002:a05:6a00:1304:b0:772:5513:ba3b with SMTP id
 d2e1a72fcca58-780fcddd1famr238921b3a.5.1758724697118; 
 Wed, 24 Sep 2025 07:38:17 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-780f9acb5f4sm712020b3a.30.2025.09.24.07.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 07:38:16 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:38:14 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Message-ID: <aNQCVslEIHHSm8f5@yury>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
 <2025092432-entrust-citizen-0232@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025092432-entrust-citizen-0232@gregkh>
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

On Wed, Sep 24, 2025 at 12:52:41PM +0200, Greg KH wrote:
> On Sun, Sep 21, 2025 at 03:47:55PM +0200, Danilo Krummrich wrote:
> > On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
> > > Again, regmap handles this all just fine, why not just make bindings to
> > > that api here instead?
> > 
> > The idea is to use this for the register!() macro, e.g.
> > 
> > 	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
> > 	    28:24   architecture_0 as u8, "Lower bits of the architecture";
> > 	    23:20   implementation as u8, "Implementation version of the architecture";
> > 	    8:8     architecture_1 as u8, "MSB of the architecture";
> > 	    7:4     major_revision as u8, "Major revision of the chip";
> > 	    3:0     minor_revision as u8, "Minor revision of the chip";
> > 	});
> > 
> > (More examples in [1].)
> 
> Wonderful, but I fail to see where the endian-ness of this is set
> anywhere.  Am I just missing that?  The regmap api enforces this idea,
> and so the 
> 
> > 
> > This generates a structure with the relevant accessors; we can also implement
> > additional logic, such as:
> > 
> > 	impl NV_PMC_BOOT_0 {
> > 	    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
> > 	    pub(crate) fn architecture(self) -> Result<Architecture> {
> > 	        Architecture::try_from(
> > 	            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
> > 	        )
> > 	    }
> > 	
> > 	    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
> > 	    pub(crate) fn chipset(self) -> Result<Chipset> {
> > 	        self.architecture()
> > 	            .map(|arch| {
> > 	                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
> > 	                    | u32::from(self.implementation())
> > 	            })
> > 	            .and_then(Chipset::try_from)
> > 	    }
> > 	}
> > 
> > This conviniently allows us to read the register with
> > 
> > 	let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> > 
> > and obtain an instance of the entire Chipset structure with
> > 
> > 	let chipset = boot0.chipset()?;
> > 
> > or pass it to a constructor that creates a Revision instance
> > 
> > 	let rev = Revision::from_boot0(boot0);
> > 
> > Analogously it allows us to modify and write registers without having to mess
> > with error prone shifts, masks and casts, because that code is generated by the
> > register!() macro. (Of course, unless we have more complicated cases where
> > multiple fields have to be combined as illustrated above.)
> > 
> > Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
> > SZ_16M.
> > 
> > However, the type required by read() as generated by the register!() macro
> > actually only requires something that implements an I/O backend, i.e
> > kernel::io::Io<SIZE>.
> > 
> > pci::Bar is a specific implementation of kernel::io::Io.
> > 
> > With this we can let the actual I/O backend handle the endianness of the bus.
> 
> Ok, great, but right now it's not doing that from what I am seeing when
> reading the code.  Shouldn't IoMem::new() take that as an argument?
> 
> But, that feels odd as our current iomem api in C doesn't care about
> endian issues at all because it "assumes" that the caller has already
> handle this properly and all that the caller "wants" is to write/read to
> some memory chunk and not twiddle bits.
> 
> > (Actually, we could even implement an I/O backend that uses regmap.)
> 
> That would probably be best to do eventually as most platform drivers
> use regmap today as it's the sanest api we have at the moment.
> 
> > So, I think the register!() stuff is rather orthogonal.
> 
> I think it's very relevant as people seem to just be "assuming" that all
> the world (hardware and cpus) are little-endian, while in reality, they
> are anything but.  As proof, the code that uses this register!() logic
> today totally ignores endian issues and just assumes that it is both
> running on a little-endian system, AND the hardware is little-endian.
> 
> As a crazy example, look at the USB host controllers that at runtime,
> have to be queried to determine what endian they are running on and the
> kernel drivers have to handle this "on the fly".  Yes, one can argue
> that the hardware developers who came up with that should be forced to
> write the drivers as penance for such sins, but in the end, it's us that
> has to deal with it...
> 
> So ignoring it will get us quite a ways forward with controlling sane
> hardware on sane systems, but when s390 finally realizes they can be
> writing their drivers in rust, we are going to have to have these
> conversations again :)

Hi Greg, all,

Endianess is not the only problem when dealing with registers mapped
to the memory, right?

I recall some built-in 12-bit ADCs in 8-bit AVR microcontrollers. That
required to read 4-bit LO register before 8-bit HI, if you didn't want to
loose those 4 bits.

Bitfields don't address that issue as well. In my understanding, it's
done on purpose: bitfields encapsulate shifts and masks, and don't
pretend that they are suitable for direct access to a hardware.

Notice another rust bitfield project. It tries to account for endianess
and everything else:

https://docs.rs/bitfield-struct/latest/bitfield_struct/

I didn't ask explicitly, and maybe it's a good time to ask now: Joel,
Danilo and everyone, have you considered adopting this project in
kernel?

The bitfield_struct builds everything into the structure:

        use bitfield_struct::bitfield;
        
        #[bitfield(u8, order = Msb)]
        struct MyMsbByte {
            /// The first field occupies the *most* significant bits
            #[bits(4)]
            kind: usize,
            system: bool,
            #[bits(2)]
            level: usize,
            present: bool
        }
        let my_byte_msb = MyMsbByte::new()
            .with_kind(10)
            .with_system(false)
            .with_level(2)
            .with_present(true);
        
        //                          .- kind
        //                          |    .- system
        //                          |    | .- level
        //                          |    | |  .- present
        assert_eq!(my_byte_msb.0, 0b1010_0_10_1);

Here MSB is not BE. For BE you'd specify:

        #[bitfield(u16, repr = be16, from = be16::from_ne, into = be16::to_ne)]
        struct MyBeBitfield {
            #[bits(4)]
            first_nibble: u8,
            #[bits(12)]
            other: u16,
        }

The "from = be16::from_ne",  is seemingly the same as cpu_to_be32() here.

It looks like bitfield_struct tries to resolve hw access problems
by outsourcing them to 'from' and 'to' callbacks, and that looks
similar to what regmap API does (is that correct?).

Greg, Is that what you're asking about?

This is another bitfield crate with the similar approach 

https://crates.io/crates/bitfield

So we're not the first, and we need to discuss what is already done.

As far as I understand, Joel decided to go in the other direction:
bitfields are always native in terms of endianess and not designed to
be mapped on registers directly. Which means they don't specify order
of accesses, number of accesses, access timing, atomicity, alignment,
cacheability and whatever else I/O related.

I discussed with Joel about the hw register access and he confirmed
that the idea of his bitfields is to be a simple wrapper around logical
ops, while the I/O is a matter of 'backbone', which is entirely different
thing:

        reg = nova_register(addr, be64,
                                strong_ordered, lo_first, ...)
        reg.read()
        bf = reg.bf()
        val = bf.field1() | MY_FLAG
        bf.set_field1(val)
        reg.set_bf()
        reg.write()

In this design, .read() and .write() are the only accessors to the
mapped registers memory, they do endianess conversion if needed,
and everything else.

I'm not an expert in regmaps, but from what I can see, the complexity
of the backbone I/O might exceed complexity of bitfields themself; and
what the bitfield_struct (and the other project I've googled) does
looks like dictating to potentially more complex projects about how
their API should look.

Because rust has no out-of-the-box bitfields, like C does, I think
that we should have simple API that resembles C bitfields syntax and
functionality. Joel mentioned rcu_special, and I can guess there's
more examples like flags, where people just need a compact data
structure with a per-bit access capability.  

With that, from bitops perspective I think bitfields are anyways useful
addition to rust. How the rust code would address I/O problems is a more
complex and seemingly not immediately related subject.

Does that make sense?

Thanks,
Yury
