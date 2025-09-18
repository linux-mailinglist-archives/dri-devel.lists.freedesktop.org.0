Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7AB84E9E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB8010E8B8;
	Thu, 18 Sep 2025 13:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cgQ42M/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D3E10E8B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:52:39 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-78defc1a2afso12119296d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758203558; x=1758808358; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cE/jfSCYe24SF+rre+WE2G1fWS5o331BSQb66kdw9Tw=;
 b=cgQ42M/XE1xkZrd+6iX56DEsTfn/OpHnuDSuy2pV0Wj8oQnZXes1gvg3a4u+VHdrrz
 zGEM6e1EVB0Redg34qgP/8DFspqj3+fOcHU+hWlkL+R/XAgTzAeULXIH5nRjIGYjXs1J
 mDXhQJ7ljJ8PnHqtR47tKEWUTmtpF4Q+Yt8a1b2IRmpAs/gDHzjp+uhWdibuRfWG23tu
 gniFMKcOHB8lcNTx4zkPtyvc2wNnXgpC+vXulxBFX17EqT7u+vLDjJhbN7ujVl3ALoph
 xlBwxcJ0P/Jrg0sOIvVhO9ph5UeV/fxfEZJUI4pLCoLG9rs5Vg2XtRKtWjq4YpBiSZvZ
 81Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758203558; x=1758808358;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cE/jfSCYe24SF+rre+WE2G1fWS5o331BSQb66kdw9Tw=;
 b=m7kW7H09iBQ1K1k56zYyoOEPd4C/3TSIRxM73nm9CEPduV+wL5w82C08vGPk1+2qrn
 bmK+e31fDUnjj2OeoNJldd2llw1e3tKdqFvNPEiodFw9kAllu9UlTFyJUQUCdgkrJak6
 ktq8IgKplPKD5+oYw/E2vq93CdTgsT4C0ySqNWfnLKpoDxwY/ORNOF1dnzlh2VHNobuJ
 A1waVCDofQlQPwaZE1W/jAPy+Rc9xJIA2w4XWxpQsoAJzMAMZ0vg1NO7FRqV96DUOc5q
 0Xyv/UAx4IgraFN8t70sUkAD3cMNLYAHrFszJHvPT7f6lk1ofjZfYmE2H+4fpZuqK05R
 W14w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3UW5P11XEO+Y107tSNWs3csnapHQPyZqbYbiNuhcz+HhneBLuzU64aKWU95wfTcAGRxpwanNpSyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDe+pSLd+l8i/W3VS7fodUNm4a6BlnUV2IAXqC7nc1CGVt3s8o
 PIhBQikNImYHOxVhRyeEAZDYDP1vf6DEPFl73myIMJzzKpMPVdQ/f2UX
X-Gm-Gg: ASbGncvT+god9TPdt6DH78LV9tRT0um0kNNEKKz+E1hua8zzip4BbBlrwFiNFrkD8fG
 1hGaZLLAbXbROBYJ1+kENatGuTwn3ShQDl4gddP1z7+lt4nIWjIIyRIOsnN4K/PIYfsxat35uK/
 9enkxyzWsRO+s+MT0pNOCO37lkfTCR89EzJxyVf5zotMFVUWjdGAEIBvx2QH6SuXyFhkS+saDy8
 GAIc88fuFSUf4oqBdAat0RLFptooJyM9b/h421YsjDMevIQsWCq8uo18yheC6hZLyGl4dNaT5eS
 X8HwCrybNoE0dFdl1pfHSL412xtDqTuGYQPAXqZuhr7aYHmFEgr7MU8UeG/kKCk5EXm5VmSVcow
 g+k4iZ3uH5zH6Wv+mC8zw+yafDSD84W6gjLMv+ihiUs87ugAVZQjbVA+d1IrxBsoOLpasEu7MAC
 eY2Pt9jr6kZT5qMupy8l1uZfS0HFbmArE=
X-Google-Smtp-Source: AGHT+IG0+wbWRL9kj9CAnFUfs7kPskW4drG3XQcDv80xqtqRIjJDglvei2+8r7mvayYyCmhK5XG5zg==
X-Received: by 2002:a05:6214:d61:b0:785:a907:967d with SMTP id
 6a1803df08f44-78ece36a473mr62210306d6.41.1758203557584; 
 Thu, 18 Sep 2025 06:52:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-79355ce7048sm13234056d6.69.2025.09.18.06.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:52:37 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id 07115F40068;
 Thu, 18 Sep 2025 09:52:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 18 Sep 2025 09:52:36 -0400
X-ME-Sender: <xms:ow7MaKie56oVZXFhhaDZNmEU1iOrKavP0VQzpmbPAJm-1LxBETU0Lw>
 <xme:ow7MaJzi7CNJPjA-2vAE28QLiAj4I7V-4UyITUicsDcBy5KZtWSKzck2JQ6mPDL2X
 ht4V_PDwNP47iibXg>
X-ME-Received: <xmr:ow7MaGqbxKXfYVnIkVsjA0m4J6D-uVDVjyPcSoj61NPKxoGvBl7p-4OqA5eait0yy0KasLMC3xAiDotJq6xMa-t-7HehYDt60NMl0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpefgleehteekgfduteejjeekhfejfedvieeftdfhhefggfehheeileeihfdtteeh
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
 rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
 gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
 peefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhhrghsthgrsehkvghrnh
 gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
 thhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
 ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
 ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
 oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
 hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:ow7MaPVc8T7eZBy2RgW9sfyPigQKRfcjyhXDf47-1LDV2oC82c34Pw>
 <xmx:ow7MaPM072-TRFZ85bgpHbLLRkyNUHsjKtKuIMbZUT6vjGxkEY2mDw>
 <xmx:ow7MaGkpDFl1mZWl7EeGd7k0ZEyKWnGWtSo-Mob6pYsTFLbXLuVYeQ>
 <xmx:ow7MaEpdTrbDMRd8hmdFBYLVuTCXbSTCi-kiw3IeU9UrqNoXN9_qhg>
 <xmx:pA7MaNnK8xCAmxYh-hPX_BlzF6o-fxbbk-FKI5-2ujJWT4JdG0vkQtHP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Sep 2025 09:52:35 -0400 (EDT)
Date: Thu, 18 Sep 2025 15:52:33 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aMwOoYe1xGDBg0Zv@tardis-2.local>
References: <20250918123100.124738-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918123100.124738-2-phasta@kernel.org>
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

On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
[...]
> ---
> So. ¡Hola!
> 
> This is a highly WIP RFC. It's obviously at many places not yet
> conforming very well to Rust's standards.
> 
> Nevertheless, it has progressed enough that I want to request comments
> from the community.
> 
> There are a number of TODOs in the code to which I need input.
> 
> Notably, it seems (half-)illegal to use a shared static reference to an
> Atomic, which I currently use for the dma_fence unit test / docstring

The `CHECKER` static you mean? If so, it should be a `static CHECKER`
instead of `static mut CHECKER`, also for future versions please use
LKMM (Linux Kernel Memory Model) atomics [1] instead of Rust native
atomics (you probably need to define `CHECKER` as `Atomic<i32>` because
AtomicBool is not supported by LKMM and potentially sub-optimial in some
cases).

> test. I'm willing to rework that if someone suggests how.
> (Still, shouldn't changing a global Atomic always be legal? It can race,
> of course. But that's kind of the point of an atomic)
> 
> What I want comments on the most is the design of the callbacks. I think
> it's a great opportunity to provide Rust drivers with rust-only
> callbacks, so that they don't have to bother about the C functions.
> 
> dma_fence wise, only the most basic callbacks currently get implemented.
> For Nova, AFAICS, we don't need much more than signalling fences and
> registering callbacks.
> 
> 
> Another, solvable, issue I'm having is designing the
> dma_fence_begin_signallin() abstractions. There are TODOs about that in
> the code. That should ideally be robust and not racy. So we might want
> some sort of synchronized (locked?) way for using that abstraction.
> 
> 
> Regarding the manually created spinlock of mine: I so far never need
> that spinlock anywhere in Rust and wasn't sure what's then the best way
> to pass a "raw" spinlock to C.
> 

You can use `SpinLock<()>` for this purpose, no need to add new
bindings.

[1]: https://lore.kernel.org/rust-for-linux/20250905044141.77868-1-boqun.feng@gmail.com/

Regards,
Boqun

> 
> So much from my side. Hope to hear from you.
> 
> (I've compiled and tested this with the unit test on the current -rc3)
> 
> Philipp
> ---
[...]
