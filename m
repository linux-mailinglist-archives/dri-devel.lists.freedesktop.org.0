Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E128A482BB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D065910EB31;
	Thu, 27 Feb 2025 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4f72sBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9010EB2A;
 Thu, 27 Feb 2025 15:18:06 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c0ac2f439eso120931185a.0; 
 Thu, 27 Feb 2025 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740669485; x=1741274285; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGggIkK/XZzPteLqAYumoxClI9/TZi6ilC7vijsxqiM=;
 b=J4f72sBbQ1su/Pk2KbirSx0YdGz8nDV8uRwXmE8EpRL8M6geYwa3tsm/rSLHCiKYql
 2edxvGLHqn0/1xRwQPnNHMsRFRj112wM8f+MqdjD/Km/3FoNxl1s1AdiMRS521Y7Zeyt
 OWnET4siuNefKZU6dAKm3VpO/zD0u+tjUwQvLuhKWExgcC59EBQf2bblUTaXhAvOmqln
 IiZmvkSEEcGQ0bz3aJzcbJVqr7WFgOvKfgxbxkXwkqAfJTQOrVKYyAkCoPouyWcgGR9P
 6Ri+JopJ7iNRgwC7Z4bppqlve5UN5+I+bRo6xX0g8GD6Xbe3yGuYnYzKSF7YoZT2Zrxd
 oiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740669485; x=1741274285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGggIkK/XZzPteLqAYumoxClI9/TZi6ilC7vijsxqiM=;
 b=r2mxgD2bX9dG/+PBTyx2aeRxOCh/oNkoakAZampUcNOtom1R0Jq5hZupqEcKG99fKZ
 5GsUgl8ylu6dRYBQUE2Yw058oUTDcFOVGFzCcEogR6MIOdbqZSlJrTt7/Kemb+1ypMKa
 VXmft7kkU8J9UgaDka4n2feczbVFBKht3ZBOOaXB+AWRR1L5e/TeOsteDo8jEJBEABFJ
 YeVeO2NMaPqZ26z/i74s+IHwF6oQAtlV9siGMLRWpWhv4qEI8uGgdTURuXGjcMEpvFlQ
 fe4SqmqT9aAmAKhXuiIpfSwNJWyuEua4NGYEk8cGwHsWxUILLFYGXE4pnOhbcOchx1iv
 qP2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOypScD8xzCTuxyMdgPzsfMJL+/H0obeijLbhjfY8szunBwjzxrc7QeQ2+i6oG1Qb/jS/YSaFtzLs=@lists.freedesktop.org,
 AJvYcCWq7Lj2uWtiJzrl7vnuLFOFerk75xR3rPNreF4sofzi6b4+OCz/gePC58Q68IgIjYiMaR7PAe5uxg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeD+2htpJ9hlQG5CPdVZsLTVWFDc+7uuLhZxsP4LXobflSsQZB
 EAOTIj/1YHneAVKN++h1zYn8AJIMbsg4c/Q70GIvqazg2GPLbT0R
X-Gm-Gg: ASbGncuKSiSt8hElIxtAwDcl9Y+5TxYySK0jz5iix91KUHDp76VlpVjNkpz2/8Yf3cD
 TtWFX6tynj4vGqXmi8yq4eMsMD67L7D4JXbidF6XTEKkqCFJZ5WEzz7/PH9LXP4FDG7atiUr8so
 RIhiARarspUGEQeob1vnZfItxibqeGiSGGfuoeNZwBeLiucGyEJbQizxRidWeRCoTyyQJ/Cre+l
 NqIV4tRYjrINbXQ4uezEC8Nm0uaAOjG998o/e/I26SfvKGSWNfitMTUsNte/cqtO2421zRzg3Om
 XPojl3cCrg30qeCM7XhlQt+dga04x1AJ0C+Eh1srwGvmnTfC2Pw7nbiN2ecmbYASXgpQh0pTHVC
 vBs5G9WOsRxt/ps3s
X-Google-Smtp-Source: AGHT+IEq6UiJGiAn5J8WLSyd0NSIn0Gz699g7En/BXC3Xd/QEAVezFlMxxou7MPtwiZYDc1OaY4iKg==
X-Received: by 2002:a05:620a:4508:b0:7c0:b7ca:70ec with SMTP id
 af79cd13be357-7c0cef4853emr3674139285a.41.1740669485263; 
 Thu, 27 Feb 2025 07:18:05 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c378d9fe36sm115572385a.83.2025.02.27.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 07:18:04 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfauth.phl.internal (Postfix) with ESMTP id 46794120006D;
 Thu, 27 Feb 2025 10:18:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Thu, 27 Feb 2025 10:18:04 -0500
X-ME-Sender: <xms:LILAZ_0n7FGmGJITqMKE32EJqDyy7Mzle5qLOF40jUOUKhGz5PUfZQ>
 <xme:LILAZ-FwrJixiSMy0LZApN6iZ3P5tpinDuFaAS_OzCXV9t5zpdL3s4A-476yKgaoC
 PPcnauyTW5KvJH0jQ>
X-ME-Received: <xmr:LILAZ_6NohMDVnPg6nF5cxXv5QjESw3A_S6s5LSYVBgruahHifKY8yP9UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeekudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:LILAZ00V1NaJ4mvj1-dwMWGjY-pTlO3NLGn9enWCsVKsRyR1AXVXDQ>
 <xmx:LILAZyEEsKioUNzF4sPKjWl06vG3bhu69SMl19pvBls-9V4UOFYQuw>
 <xmx:LILAZ18E-uNORxHsgOKOQ3JOtrZTzPTOr4UiT0IRx0C6WLcEXbJZkA>
 <xmx:LILAZ_nHko2mGSrMEiqf4tOvdP9950Gc_aexl4qnzS1hufAHlKN0-w>
 <xmx:LILAZ-GnZXcGVrbFPYhz1nd--0hhGxQeONVznQF9J2ZrcQii6wBtc808>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 10:18:03 -0500 (EST)
Date: Thu, 27 Feb 2025 07:18:02 -0800
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
Message-ID: <Z8CCKl_yA74WjpQ1@Mac.home>
References: <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227144618.GE39591@nvidia.com>
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

On Thu, Feb 27, 2025 at 10:46:18AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 04:41:08PM -0800, Boqun Feng wrote:
> > And if you don't store the HrTimerHandle anywhere, like you drop() it
> > right after start a hrtimer, it will immediately stop the timer. Does
> > this make sense?
> 
> Oh, I understand that, but it is not sufficient in the kernel.
> 
> You are making an implicit argument that something external to the
> rust universe will hold the module alive until all rust destructors
> are run. That is trivialy obvious in your example above.
> 

The question in your previous email is about function pointer of hrtimer
EAF because of module unload, are you moving to a broader topic here?
If no, the for module unload, the argument is not implicit because in
rust/macro/module.rs the module __exit() function is generated by Rust,
and in that function, `assume_init_drop()` will call these destructors.

> However, make it more complex. Run the destructor call for your
> hrtimer in a workqueue thread. Use workqueue.rs. Now you don't have
> this implicit argument anymore, and it will EAF things.
> 

Note that HrTimerHandle holds a "reference" (could be a normal
reference, or an refcounted reference, like Arc) to the hrtimer (and the
struct contains it), therefore as long as HrTimerHandle exists, the
destructor call of the hrtimer won't be call. Hence the argument is not
implicit, it literally is:

* If a HrTimerHandle exists, it means the timer has been started, and
  since the timer has been started, the existence of HrTimerHandle will
  prevent the destructors of the hrtimer.

* drop() on HrTimerHandle will 1) stop the timer and 2) release the
  reference to the hrtimer, so then the destructors could be called.

> Danilo argues this is a bug in workqueue.rs.
> 
> Regardless, it seems like EAF is an overlooked topic in the safety
> analysis.
> 

Well, no. See above.

> Further, you and Danilo are making opposing correctness arguments:
> 
>  1) all rust destructors run before module __exit completes

What do you mean by "all rust destructor"? In my previous email, I was
talking about the particular destructors of fields in module struct,
right?

>  2) rust destructors can run after driver removal completes
> 

I will defer this to Danilo, because I'm not sure that's what he was
talking about.

Regards,
Boqun

> I understand the technical underpinnings why these are different, but
> I feel that if you can make #1 reliably true for __exit then it is
> highly desirable to use the same techniques to make it true for
> remove() too.
> 
> Jason
