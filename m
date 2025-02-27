Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A531A485D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1610EB3D;
	Thu, 27 Feb 2025 16:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hetNUXYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F9C10EB3D;
 Thu, 27 Feb 2025 16:55:13 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6e66d4f3be2so16034296d6.3; 
 Thu, 27 Feb 2025 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740675312; x=1741280112; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=980w1YB2itkCLikkG2aaoTrs25//o08fnkucvOSS5Ig=;
 b=hetNUXYKezpoNz8Ip1TH1c9I0hNuP/Gkuia0fZFFdOUP67Ce8NoXLUTSt8e51dIa/Z
 waIqgptQzJhHuOu2OIB7Wk0eUSa8DwWM1S0QgCMtezmsNgK1hOYeaM/5x3pmrZ19G2xV
 wwLdog7bwFhff5fXWdSOVptWt2WcuMAWf0Vdprkov0Pw9amWMvIyxHmqWrL/QxDE4hyK
 VnJoJu/NMUVMd0CZZthNvv1PtEfmt02/kOIQe4jgyzz5iP2PLOFXjdo4oG5ADP6Y53TX
 ycXaubGkfkIjad0RxetB7Jp/AQ9v0ZtA3N5KSGFQTI54yUCsF0BkSOBE2IA+6PQI4NOq
 Ulrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675312; x=1741280112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=980w1YB2itkCLikkG2aaoTrs25//o08fnkucvOSS5Ig=;
 b=dNfZfOxrxo/Z3O6QxXZJw484s877Cac2AXMkI5ugIeEJRO+cx2TNZ5z2wW7Q9KklTh
 91aHp2DDVejt4WuqsiD7qhAbFa9mgHR3QdGTQK7aPKS6Mru5GqaY9MXCqpiACpc5ovud
 1mLZlddf3+uMbWD9yS6qRcNjjSJTtqQsUFerCEYT7PktwuFSNDa47ZYqUJ2Y2s0xBQwP
 1W235ve40ENGHs4DXmPzlzyg3nYaz0nyEuybgP5IylGanFW3Bf7RgTaN7TJeEqVhfFBh
 lmFmx7+WxfhAQ+AF/wTe56AQDiWafse6T5DsDW0ZDC/NsL24ezgmSPPaCYVYVcHXkHZt
 wXFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbBI/DY/fJ1Nyx544g5NVIJ6lgQlwEHVHBP6yDcc8Ixn9JEqkn3+ehmcDMflD/eMl2jFnkY/fk3Q==@lists.freedesktop.org,
 AJvYcCXqy0q6UIjMLEXgo4LSiW5PzM8NjZ+B9CXzsTyWehuRrqgODvuSAdy647AxQFE+AXW9V6EEBKZZzc0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqDrNiydbZs8AZuGB0AwWmNBZSiMNUuw5l8x06QK8wfHwuaB9a
 jV8/ZnzkwUbBi3vIRp8Zo7qrkHUlDCO7XIPWLO4bQ2KKBuZJV4xW
X-Gm-Gg: ASbGnctgr0Eg6R3Q7jeOOvvcCy+tVFMENz3GBzI3ZltGN2H0ABcG7so2kfLa3XTPNi8
 78M2ym/NfnpmYK8q3fSH8ChY/NS9xLmygSao/AY2hCBwsxgZaT60SwzRVg+ppd0GbdGai+Jy+mf
 Defm4DjpTMgmtkVPhDDZz5VXW/6pMg/K9Vl9z2lw5ejDA9dQQf4apodjQ6Dh+JIlgYm8jvcPzuK
 NlIvNS4F07fkzG0C2QqpIh/l416wM9HalmDZa7243Jzci2UuRAiR0t0Yz/yrG+ksChaAEOZh8WY
 GSCOFFjYenPI1kPtiXJhLk2ExIgCodHTWRWq1PzU6Hz5UQIt7IyWqntjRO5IvmfQ/lxVfTb3Zc1
 S8piXkls2Pe7mlYhp
X-Google-Smtp-Source: AGHT+IFZH/bq4PBfo5JkoQRcCnek7eycxVwpDI/O4N5aADIrrRHM4Y9CBi8g17hXzU4f1wl6FDEpXw==
X-Received: by 2002:a05:6214:21cf:b0:6d8:9960:b063 with SMTP id
 6a1803df08f44-6e8a0cbf934mr2932786d6.14.1740675312516; 
 Thu, 27 Feb 2025 08:55:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8976ccaefsm11596906d6.74.2025.02.27.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:55:12 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 835DA1200043;
 Thu, 27 Feb 2025 11:55:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 27 Feb 2025 11:55:11 -0500
X-ME-Sender: <xms:75jAZ0WzKQvhc3t7LIKrUC2t4q9d1dfnASwGx_e20ITekrwy_i05Rw>
 <xme:75jAZ4luY5ksvMI3XAy6dKs-nt-lDRBOPsTAm6f85XgyHKuTcJYYW7iZ58yWWz9m1
 rDWJsXGiQM2jVMXTg>
X-ME-Received: <xmr:75jAZ4Z-UVB6mx_2UxOMWjchVeST-YtAkTQporvT4fHwuMNcr4IFkqJ7zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkedttdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:75jAZzWvyoa746mp6f3kYrg60ZJZebGajSgx6zGAZ9dhRokOSlqtFg>
 <xmx:75jAZ-n71TRELjp0KTgB60thZUKAaY3jnfUSjQMs3Um6gKwAJUt3eQ>
 <xmx:75jAZ4c0IomtWna8NCV1c6DBn_b2JZOkiCyqNtUaI-hDqDXDDEndQg>
 <xmx:75jAZwE50w-W2YitkacjsQX4-IR1OrMMQd063Ohlo83o9Ui9txhhjA>
 <xmx:75jAZ0n4wvVIvs8zW-nwIKsIS-pIhYQt33C9iJbOOqUrWQB9hKvbKt0O>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 11:55:10 -0500 (EST)
Date: Thu, 27 Feb 2025 08:55:09 -0800
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
Message-ID: <Z8CY7fqbtbO4v1jv@Mac.home>
References: <Z75WKSRlUVEqpysJ@cassiopeiae> <20250226004916.GB4959@nvidia.com>
 <Z75riltJo0WvOsS5@cassiopeiae> <20250226172120.GD28425@nvidia.com>
 <Z7-IHgcVVS8XBurW@cassiopeiae> <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227161733.GH39591@nvidia.com>
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

On Thu, Feb 27, 2025 at 12:17:33PM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 27, 2025 at 07:18:02AM -0800, Boqun Feng wrote:
> > On Thu, Feb 27, 2025 at 10:46:18AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Feb 26, 2025 at 04:41:08PM -0800, Boqun Feng wrote:
> > > > And if you don't store the HrTimerHandle anywhere, like you drop() it
> > > > right after start a hrtimer, it will immediately stop the timer. Does
> > > > this make sense?
> > > 
> > > Oh, I understand that, but it is not sufficient in the kernel.
> > > 
> > > You are making an implicit argument that something external to the
> > > rust universe will hold the module alive until all rust destructors
> > > are run. That is trivialy obvious in your example above.
> > > 
> > 
> > The question in your previous email is about function pointer of hrtimer
> > EAF because of module unload, are you moving to a broader topic
> > here?
> 
> No
> 
> > If no, the for module unload, the argument is not implicit because in
> > rust/macro/module.rs the module __exit() function is generated by Rust,
> > and in that function, `assume_init_drop()` will call these
> > destructors.
> 
> That is not what I mean. You can be running code in multiple threads
> from multiple functions in the module those are all being protected
> implicitly by external C code functions. Rust itself is not managing
> module life time.
> 
> Then you are making the argument that everything created by a rust
> module somehow traces its reference back to the module itself,
> regardless of what thread, callback or memory was used to create it.
> 
> So all bindings for everything are expected to clean themselves up,
> recursively.
> 

Right, that would be the most cases in Rust if you want to control the 
cleanup orderings.

> That does make sense, but then it still raises questions that things
> like workqueue don't seem to have the cleanup.
> 

It was because the existing Workqueue was designed for built-in cases,
and we should fix that. Thank you for spotting that.

> I still wonder why you couldn't also have these reliable reference
> counts rooted on the device driver instead of only on the module.
> 

You could put reliable reference counts anywhere you want, as long as it
reflects the resource dependencies.

Regards,
Boqun

> Jason
