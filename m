Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91991AD7C06
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 22:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160E10E181;
	Thu, 12 Jun 2025 20:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mb1ymPDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777010E181;
 Thu, 12 Jun 2025 20:12:18 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6fad79433bbso16038766d6.0; 
 Thu, 12 Jun 2025 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749759137; x=1750363937; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVFfh/OIaSzF+T7uh2as5eWwfIjPE42Cyz++RGQQ/jw=;
 b=Mb1ymPDp0wdt4Ald5dnrhbTDx9Q7F/sN/m5K7wPEF/U/4Ia+x+R3OCrWBgovqYqZdk
 fdhCx65ZoId2wNkXV+DgoR3QAr/sScrP1OggfoMvskb0/X+Vt/YkDDMt2YwyCghUpY1R
 svZ4bX0YcdVycIDckdkspjR0oa9aNFdxOX9R35j/HRmGzdL8n9bU82G63TjRpLD6Ix/x
 GlebGCQBQXgULuwEy5jF2RPE40lplxB9W08DkJC4TYpU4h7/9nbGKy9Hj4ZepfSIiJky
 S9vlIq7MUrFbypWamBf/Fb0JbB3yxtEFLulApI+y1KRDLXsGaM/9eF1o92jD7krsW3zA
 kKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749759137; x=1750363937;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVFfh/OIaSzF+T7uh2as5eWwfIjPE42Cyz++RGQQ/jw=;
 b=JGfZpuNVLrJc1oIe+UKKcLa406nzSa71Eyr7PGKAnAbu7Cwh6pmAAPF+zoRYqfSNJS
 astxZFxVyYXP9Uf0uMBEvoerlYXa9F3rcwlIrSSU+3WFAPmC2y2uSAbdYG0UfPs4tZU7
 1C10WqeS+uyUgDVvnWkkPU4f/66ivVsgxrACZ1RgPfqbwHkPLBL6Px9Pvbr31JA0ZOU9
 ZDw/l1MKspa+f/YegE22DIyKvCiwjS73i1i/hJFiuJUOO3rUYPqhr+UFUTTAZkxn5aSp
 E30nmoVp3WcEHoakMBAuB5OOJ+oDil8jmPuSs6z2ncv4nNLC981Y/aPXaQ40NwdeDizM
 eqkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOZ5yhCpz9+GzbJu6krdSCFj/JMPVJhhpcGml85oF48K/1b7wIUscqJ1eWrvjCoPbo4pfYnEAVHA==@lists.freedesktop.org,
 AJvYcCX4el5d0YLSaDutyhDGaAulXX8tGT9rpL9rREl0kK30flTPCvpzH4t9Rd+QgndGQJ4EJ5APDfwVYAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEZKBMEQj917fv2aHgp6N8gvJugYzk6/10ERlhOxM46bHSq97e
 gJC67aHbNPBOEO4Eb3vN3GAvhkf/wD9V++zmMXh7SQH2uC0wclS2IucR
X-Gm-Gg: ASbGnctDVz0zwY43LTo2bQ6+y12UkshupIm17GAbLVYOf7zRrq3RnO+gePQ3BAj5G1l
 NluigqDJgO31kZjacy+DKN92qTF0C9fnVjFyj69ZsrA22uWjl4ASUJPyR9tewggxsXlFlg61H+z
 ToP/FWWKcz8qwLKFXQmvJo+B66ItKhOaS5oScKG8NLLgiLSRSRJCUka5slO2a/q8pLPCnMapc84
 JMoC7vTCwfW4u77AYGbWBN0FsaX74oybaHS+CEJyRaJDhMoScnFKjGckDxGCDrZElBqbvUHFFYN
 oVuZ6V+ABkFZ5E/05urnVlL6EjEMhChwUm3pjifIMJf3sm4Db6+muuYDiJz+4J/++HmhUYQRGfU
 MTCrWrv5dDGhzf/bIPbpNgHE3TQctVNLpkQOhDYMIe3dmA6YzNkzw
X-Google-Smtp-Source: AGHT+IFJNlGuVyvaF9eRVutRSsDpcCFkY1tMrNQNHCT2HWLojqkctlXf1dIxq1F7oOHuTDrPXVYCgg==
X-Received: by 2002:a05:6214:f22:b0:6fa:ccb6:600d with SMTP id
 6a1803df08f44-6fb3e5de4c4mr3415446d6.21.1749759137250; 
 Thu, 12 Jun 2025 13:12:17 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c31ac3sm13639086d6.68.2025.06.12.13.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:12:16 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id 240E31200043;
 Thu, 12 Jun 2025 16:12:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 12 Jun 2025 16:12:16 -0400
X-ME-Sender: <xms:oDRLaFc_03txAVqTKE90sYUCBRynSpdVPHQjWgopAaipmum3EiCnWg>
 <xme:oDRLaDM-BKIpyWnAjmG32Hzuxc51gt3WkipfILmRtJEBylR6gtaf1-EuwHIuyFDec
 xcKpbKvEIlgvu2oBA>
X-ME-Received: <xmr:oDRLaOilFFQO6Jy2Y-t7G7IOuF_sHc6ylNB99aGCDl28AA-AtAF-VtDkIDs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduiedttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhiughirgdrtg
 homhdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrdgtohhmpdhrtghpthht
 ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
 horhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
 thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
 gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 rghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhssh
 esuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:oDRLaO9_nMB1tWbwRzzD-Zvo5jVdXayR0dtZaUGL4e1pHfne-1RzlQ>
 <xmx:oDRLaBv3KgwHgSY_H5-Rb6oL2HftHm2kKPDCQBIcmCZYPEgQgo5bmw>
 <xmx:oDRLaNEUGIB2EbhOzkQ_wdcDKK-5DOKcUxk89H9GjZDLTc0CkEcEKw>
 <xmx:oDRLaIM0Pg4EkifRY2hLgxF5UDZFc2yPS5CxYJKvuwT4dfJqVM4b3w>
 <xmx:oDRLaKPaHv8UVEXfB6bNyd0pDweM1L1hyRFATrjaqFtjCelg0iQfmsFJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 16:12:15 -0400 (EDT)
Date: Thu, 12 Jun 2025 13:12:14 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aEs0noYbLf1crnAf@tardis.local>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <f8d9af76-fc1d-4f7a-8dfb-a0606e44c56b@nvidia.com>
 <aEsy8XDy6JW8zb6v@tardis.local>
 <529736c9-15a1-4777-be30-cc9aa9d11a87@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <529736c9-15a1-4777-be30-cc9aa9d11a87@nvidia.com>
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

On Thu, Jun 12, 2025 at 01:08:25PM -0700, John Hubbard wrote:
> On 6/12/25 1:05 PM, Boqun Feng wrote:
> > On Thu, Jun 12, 2025 at 01:00:12PM -0700, John Hubbard wrote:
> >> On 6/12/25 8:07 AM, Boqun Feng wrote:
> >>> On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
> >> ...
> >>>> +                #[inline(always)]
> >>>> +                pub const fn align_down(self, value: $t) -> $t {
> >>>
> >>> I'm late to party, but could we instead implement:
> >>>
> >>>     pub const fn round_down<i32>(value: i32, shift: i32) -> i32 {
> >>>         value & !((1 << shift) - 1)
> >>>     }
> >>>
> >>>     pub const fn round_up<i32>(value: i32, shift: i32) -> i32 {
> >>>         let mask = (1 << shift) - 1;
> >>>         value.wrapping_add(mask) & !mask
> >>>     }
> >>
> >> Just a naming concern here.
> >>
> >> The function name, and the "shift" argument is extremely odd there.
> >> And that's because it is re-inventing the concept of align_down()
> >> and align_up(), but with a misleading name and a hard to understand
> >> "shift" argument.
> >>
> >> If you are "rounding" to a power of two, that's normally called
> >> alignment, at least in kernel code. And if you are rounding to the
> >> nearest...integer, for example, that's rounding.
> >>
> >> But "rounding" with a "shift" argument? That's a little too 
> >> creative! :) 
> >>
> > 
> > Oh, sorry, I should have mentioned where I got these names, see
> > round_up() and round_down() in include/linux/math.h. But no objection to
> > find a better name for "shift".
> 
> lol, perfect response! So my complaint is really about the kernel's existing
> math.h, rather than your proposal. OK then. :)
> 

;-) I realised I misunderstood round_up() and round_down(), I thought
they are using the numbers of bits of the alignment, but it turns out
they are using the alignment itself. What I tried to suggest is that
for this align functions, we use numbers of bits instead of alignment.

Not sure about the name now :)

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 
