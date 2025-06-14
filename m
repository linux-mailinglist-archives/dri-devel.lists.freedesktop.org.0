Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35FAAD9E61
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 19:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC8510E0EA;
	Sat, 14 Jun 2025 17:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZUvegvOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D84410E07C;
 Sat, 14 Jun 2025 17:08:32 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c5675dec99so388294585a.0; 
 Sat, 14 Jun 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749920911; x=1750525711; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxVUAAHvP8h1CL9/50hYyRFp+95+lQwkRR0h40rA/qQ=;
 b=ZUvegvOsn/vnadmMhdpZo8u0hFzSLFcdbg8Zo1laMjulIPdPseUSludV80iRrfZ+VU
 tkSR7VNO4j0DA80KeOTRYVRzmB7ZDJY5HvoGrOonKS8RbdzYXIL1N6KkDlPMT6CRAKgv
 6jo5qIFGs0A0cMBC7VZ1n4R/+f9PxOvtOx+qLWFZQMO+d13ABNpodY9HRjp6mPMc0CIS
 g1lr6KdZhKiAAWOo8hf4y1JP4/HSnvwVKTUNPEa7GjyLTQoSboIIMPRREM3HUH826Z/f
 I2IVmD+GQ2aI1LmRmwq0T8gChtgzAt+xthAKZyaBxqae7XixiOsPhoNOiHvaVQtsj2oz
 Ny5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749920911; x=1750525711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxVUAAHvP8h1CL9/50hYyRFp+95+lQwkRR0h40rA/qQ=;
 b=wzZOieaIemQvlj2IIF11HK+4CqdS+ukXQAeP1rRhhy/j6xzzrNmMRa1ycgiFu15zij
 b0Th8mk0v3TsTQ4MG7OZeQ+U3gn/5iY/Y1byP7da9SMdjuV3Js5L9XWz8UGE0xACbyKF
 ihjo+TtXsDpHXzH644cJBjvGbxEOAM/igO9gkfLsA6/5QUJSIeskt5LtWEULKPVqwb+x
 L0Nq+3fl3D0K1auDqJHcxbAq/F2Fa+M0xS3wOjysRRK+fI3V9Ra96m+94CeXY5rqu4Uy
 aC3CbCoKBLRc3Q1WaycZVtJ5pPbOELtI/9ImGz8BZzSV0ifVBA+X6QKtyE77RmlJrxAt
 l1Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rzdK1/EAJ+f1mLWTaxxBvaRxE4D5Y/7I1os4HpJOGnajGzXyfY8Chf8u5RuiFg/vQhT2RfSgtko=@lists.freedesktop.org,
 AJvYcCVllsMIs5OSctNTLVAQwQGiz6nwyAy8XuW+TjUzQBnz5/uQhrQnUKyct7HSwNHYUZk+94CGXanrZA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcvYfitXqJmGTJh0VUn48EBA2Bm29wQVQpruMBYWwnBZYWMv3l
 lm3zu1RjDbguT5qw/gDMl5FZQwKAMcEVpldxElFe1+bo/aiNH8vhBGad
X-Gm-Gg: ASbGnctG8UBKgRBExIh45pswDDGbbL8C4xtjCf4CL9LSFISZO5bjOqveko8OdkdIKBN
 NKbRaWtelU7RZze4ZI6gwWp9eOv8AxWHywbB0N1tCLJKkGwgnuM0s7OODei8Ee3v3UKapmkoh4m
 64Y1dcDKCUQk1wHwBx76h7EzbDt2fsIqoT9xhfOzZkjeVP+g24NOvL7pTgzH4lPKLFY51Xtam9I
 TVhcsGCmAxEdp+DDoL8Hd8h5V99/ml0LKHqrPo+WZT4QDXrgL7tzHVU02Hl/mi93Bj1U+PRAGm0
 7wdKVJb9UV38sCcJSpv/Mk7M3jchazt4UsH5HfNgVqrh46cEW5pUgKw8PVMLFVEGs9tF2T4ysXi
 IbWi03gVSR+wIf0KZhsH0O7yzfazP5BWu3fPFP1Fn57vBuUkmE60E
X-Google-Smtp-Source: AGHT+IFuI5Iogxyn4F7KxbnZi28W1LHxaKHJ2292LsmPp2oZPmDqNDtGdBDsq/ot6E0bqW+DooZb2A==
X-Received: by 2002:a05:620a:17a9:b0:7ca:f41a:546b with SMTP id
 af79cd13be357-7d3c6c096f4mr572262285a.6.1749920911374; 
 Sat, 14 Jun 2025 10:08:31 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8dc9323sm312906185a.20.2025.06.14.10.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jun 2025 10:08:31 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 1054E1200043;
 Sat, 14 Jun 2025 13:08:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sat, 14 Jun 2025 13:08:30 -0400
X-ME-Sender: <xms:jaxNaDa_fdqUB9RuIocIKW8UidJwkUIn4A0q3HBRGMgUVREMdHNxiA>
 <xme:jaxNaCYKE2MOC8kSyCcAy3XqoI1fat1wBEmgdNhrtxQwdZ9PPcZbff-BHc5C49H9Q
 uC_GkmccjMksRy6RQ>
X-ME-Received: <xmr:jaxNaF_OoZCym3thLwfVjhd25VyveWQJBL_hzrurVDE2cEuL9ZeGvhoi1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
 homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
 lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
 hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
 ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
 pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
 gvlhdrohhrgh
X-ME-Proxy: <xmx:jaxNaJqkxdpUUQV9yk0sxRCuluUUw6kOcfHdnrkh8a61mHlNX1arFQ>
 <xmx:jaxNaOo1RT6izaizxVP9UWs-2IAqcudHXVlcSDLtSJO3_0bkEf81Sw>
 <xmx:jaxNaPTMhtLH-bGDn1gnSf3WN-VSrJZQigtqfdLxvmE12vyDfrM2Zw>
 <xmx:jaxNaGoNFrt02Ky4jp8HsgwAFF4rdUi-lnYGAWrorw-ffzxbY1dtPA>
 <xmx:jqxNaP6-2cpiS8pKJslikTdmjkOA37vypgNNkTF-P6_7EVybrvejQAAf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 13:08:29 -0400 (EDT)
Date: Sat, 14 Jun 2025 10:08:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aE2sjA4DxFndTZYk@Mac.home>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
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

On Fri, Jun 13, 2025 at 11:16:10PM +0900, Alexandre Courbot wrote:
[...]
> >> +                /// Aligns `self` down to `alignment`.
> >> +                ///
> >> +                /// # Examples
> >> +                ///
> >> +                /// ```
> >> +                /// use kernel::num::PowerOfTwo;
> >> +                ///
> >> +                /// assert_eq!(PowerOfTwo::<u32>::new(0x1000).align_down(0x4fff), 0x4000);
> >> +                /// ```
> >> +                #[inline(always)]
> >> +                pub const fn align_down(self, value: $t) -> $t {
> >
> > I'm late to party, but could we instead implement:
> >
> >     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
> >         value & !((1 << shift) - 1)
> >     }
> >
> >     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
> >         let mask = (1 << shift) - 1;
> >         value.wrapping_add(mask) & !mask
> >     }
> >
> > ? It's much harder to pass an invalid alignment with this.
> 
> It also forces you to think in terms of shifts instead of values - i.e.
> you cannot round to `0x1000` as it commonly done in the kernel, now you

Well, for const values, you can always define:

   const ROUND_SHIFT_0X1000: i32 = 12;

because `0x1000` is just a name ;-)

or we define an Alignment in term of the shift:

    pub struct Alignment {
        shift: i8,
    }

    ipml Alignment {
        pub const new(shift: i8) -> Self {
            Self { shift }
        }
    }

then

    const ALIGN_0x1000: Alignment = Alignment::new(12);

and

    pub const fn round_down_i32(value: i32, align: Alignment) -> i32 {
        ...
    }

My point was that instead of the value itself, we can always use the
shift to represent a power of two, and that would avoid troubles when we
need to check the internal representation.

That said, after some experiments by myself, I haven't found any
significant difference between shift representations vs value
representations. So no strong reason of using a shift representation.

Regards,
Boqun

> need to do some mental gymnastics to know it is actually a shift of `12`.
> Being able to use the actual value to round to is more familiar (and
> natural) to me.
