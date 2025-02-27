Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2367EA4706A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 01:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82210E0B1;
	Thu, 27 Feb 2025 00:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kYj1VO/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2501810E0B1;
 Thu, 27 Feb 2025 00:41:56 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c0b9f35dc7so49991985a.2; 
 Wed, 26 Feb 2025 16:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740616915; x=1741221715; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBYtztjxLyrkD0HRV/UOGdGGNoqugc5RDu2qyVaSfBg=;
 b=kYj1VO/mUHYMi8kwM+855rL/p3KpjE5/4xEaLojj9+i4CGmtxJBRyKtDZpuag5WGJC
 ysRUsaQH3RP7kwnMYI302h+T3WqY2bSEoqr1fOclgR5PIH0kP8v3/cK1KaFlRefrdILr
 VFTB0u+eSYwQf+ceX1NgpNM4s8poxevxAT5lJ2wImfXm6kliJeKJnntsniTOI+ArsT0o
 bnx6naeGrs4kvK9i99Rd9gOvWIzRtMcwHDZ3yBy4UH8/p/VazlUYU+RRx8xmZQhGqJJ1
 M6kCdh1abb6WJxx2xjcIDW6y4ybFa98L2YBtNW8ySZ/nErbD4YS4uUeMFjYBWYjw5dvj
 eMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740616915; x=1741221715;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EBYtztjxLyrkD0HRV/UOGdGGNoqugc5RDu2qyVaSfBg=;
 b=KuL7ojnwanqH47nWa/WKhnTkvVtKSscGaUfpCDlqEZH/uIlpf80vfvcYAzibyQBNnH
 FmeKeF1Lr2y01ceUPqwogHwr7NRr+M5uTSl1JMyhhHhs2cM1P+ta0Pb3x6lhc/ji7lnQ
 50EaS5joKse2hqwZcSUHgvKAUB9KbkLlewyd1shKrYbjjJeaH7jD0xBeLG6Eo5+F8iJ4
 nH1HVU29h+6I/5CF/OJ5f8z79F0Kr58fZnK+Yz6/9029D9CE3BliBKKbqHcT2kQTIxA4
 QcA3GNZh4R4vL4oXNz2B+Tpd/cBQuDczBRCEcAuXLybUkY4jwqNuhSl04z26zuyepnaN
 CWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi9e8OTfXK2hf62W20I/dPa6EBCQZt+MQDE891+UTw9AH4xHHiOkyydTpeBG1x5wDp5ByqyEkOqQ==@lists.freedesktop.org,
 AJvYcCWRp+qEXSET4ZhuPEwDzmCZ+nJ1AsVpRz/lzxH6O6P5oN3vljxTfRCelKcQOmBfkXZRjsLiIt9x44Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU33empbH3G5Jnkwo09bp5g4dBii1yhTQ4gl/pkWp0TaDHAz7t
 YosWj77CRJRsHPAQKhks3EFzqbvPLc6WHUs9MjPqASYe4LBHoEnE
X-Gm-Gg: ASbGnctiEayFJ7Z6CAN322a7q5YcwIrNpkXfRbtoJnrcthQ15PSZKcjsk2nZdl66iwG
 AOt/bZj7I6EQMwuDy4lCnYyOp/snVWeKVbOD5ijKpRwKHDEZ87RXQy46XJxR25b0MpnBotMTqis
 dRNIIOUENwI2GkiNBmDKhVi0zon2Gjw7AEvfz3g1TlXZsORpZj1MJVqp7P8i2DZ2dJD2QpxtSj1
 ZN/NfNHG/vAXNFx66qODa2pFf1REMWvJPjupbWyPNJCqn3qokK0c5qr2eE1uRAPNSYxxbq8UdM7
 s8YLEfaEZSb49K8VPJWtTLosUAWsdPBFJc72KLHA4/VppboKm+a9NMmww7JVyno2bu7OhU8+lRr
 3ucLB+leJjQySPSgD
X-Google-Smtp-Source: AGHT+IHEFPQ7h2hiLqhunzFMCRcCHXQxnJ3HssD/+iXCLwudLrT5IggZ0fY4ywZ4notarqngMnZKOw==
X-Received: by 2002:a05:620a:4506:b0:7c0:a594:d788 with SMTP id
 af79cd13be357-7c247fcb710mr803662885a.39.1740616915089; 
 Wed, 26 Feb 2025 16:41:55 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c378dacd0bsm30867385a.90.2025.02.26.16.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 16:41:54 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 2034B1200043;
 Wed, 26 Feb 2025 19:41:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 26 Feb 2025 19:41:54 -0500
X-ME-Sender: <xms:0rS_Z-qHnb1z3udMVQg71w3rlADl-5Kx4_8RPFk0ssTNufr-d_7ciQ>
 <xme:0rS_Z8o23cN0gXUZ2OOUMuMaTRzcPghkFhRG61AnERPYIyKgLaFTxO2knPD-_hGk2
 fAUHYTKghkOdxxJ7w>
X-ME-Received: <xmr:0rS_ZzMoAsoL2KIkFvTj6D4vFzQ0ylLSpHKjgwfJiBGIxpyJFqUFoHuzVuE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekiedthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgghesnhhvihguihgrrdgtohhmpdhrtg
 hpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhgrghhn
 vghlfhesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiug
 hirgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghp
 thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepjhhovghlsehjoh
 gvlhhfvghrnhgrnhguvghsrdhorhhgpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhi
 ughirgdrtghomhdprhgtphhtthhopegsshhkvghgghhssehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:0rS_Z95b8IAr5V57cIk9vPxV9IQj3u_MqcKTTVBJNWw7vdPYNKZ_ww>
 <xmx:0rS_Z95VzEmi7ly3IrRqhUnzLxp_ZLBZdoNO2UPvbKMm5zNAdsk1gg>
 <xmx:0rS_Z9iftC5GfXLLYP2Hmwtw6OXqfK0Aifr0_r2rXAeY4qo8b83Z8w>
 <xmx:0rS_Z36wQUjk18b5yGAG03hOAAgsgo2ShSyFBlUYQ9YZq6LOOP2Zag>
 <xmx:0rS_Z4ImYsmrxwYVTBU9Ve_ju9CN5hHKmwKJPcFy472NycoJqeSLWsFJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Feb 2025 19:41:53 -0500 (EST)
Date: Wed, 26 Feb 2025 16:41:08 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7-0pOmWO6r_KeQI@boqun-archlinux>
References: <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226234730.GC39591@nvidia.com>
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

On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
[...]
> 
> > Other abstractions do consider this though, e.g. the upcoming hrtimer work. [1]
> 
> Does it??? hrtimer uses function pointers. Any time you take a
> function pointer you have to reason about how does the .text lifetime
> work relative to the usage of the function pointer.
> 
> So how does [1] guarentee that the hrtimer C code will not call the
> function pointer after driver remove() completes?
> 
> My rust is aweful, but it looks to me like the timer lifetime is
> linked to the HrTimerHandle lifetime, but nothing seems to hard link
> that to the driver bound, or module lifetime?
> 

So to write a module, normally you need to have a module struct, e.g.

	struct MyModule { ... }

and if a hrtimer is used by MyModule, you can put an HrTimerHandle in
it:

	struct MyModule {
	    ...
	    handle: Option<HrTimerHandle>
	}

, when module unloaded, every field of MyModule will call their drop()
function, and HrTimerHandle's drop() will cancel the hrtimer, so that
the function pointer won't be referenced by hrtimer core.

And if you don't store the HrTimerHandle anywhere, like you drop() it
right after start a hrtimer, it will immediately stop the timer. Does
this make sense?

Regards,
Boqun

> This is what I'm talking about, the design pattern you are trying to
> fix with revocable is *everywhere* in the C APIs, it is very subtle,
> but must be considered. One solution would be to force hrtimer into
> a revocable too.
> 
> And on and on for basically every kernel API that uses function
> pointers.
> 
> This does not seem reasonable to me at all, it certainly isn't better
> than the standard pattern.
> 
> > be) also reflected by the corresponding abstraction. Dropping a
> > MiscDeviceRegistration [2] on module_exit() for instance will ensure that there
> > are no concurrent IOCTLs, just like the corresponding C code.
> 
> The way misc device works you can't unload the module until all the
> FDs are closed and the misc code directly handles races with opening
> new FDs while modules are unloading. It is quite a different scheme
> than discussed in this thread.
> 
> Jason
