Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99BCBA476D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 17:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057DD10EAA4;
	Fri, 26 Sep 2025 15:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XlB53utX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54BA10EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:44:48 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-81fdd5d7b59so6181996d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758901488; x=1759506288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mcGhhHjp2eXgOL7P5TYM8JSLgVlfC9igU21PobzEN4=;
 b=XlB53utX7V7U+rhhDwEl27+NWbJA8DwPd4u2D76j+9IB/X11BSlnFLdMvDmWOrifoI
 HrJmuZu1IYL/vNyYbQ8qguD9yiEnl5Wfk//B9iNalOLCJgKD/fmh6Dpqv6gljCZtnqIc
 PiHTdY4YsoHivwo6h49G4pdBbgo3PVlt3G/iTYKSbOVNJP8UJtF4kM870nd8sF7wGaNc
 aRshZjxkJ3PuWWglnPaanLbXcHrbI3gKyHJy5qBb7K6CJI6Lc5URJ0Hdi7lUPMORC25B
 RBISMdvIOzr7U96z0HFJmNSBy003HlS9qGTgBgMeCuFDAwvnydR/wJb+qqYZ50To9a+F
 O2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758901488; x=1759506288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mcGhhHjp2eXgOL7P5TYM8JSLgVlfC9igU21PobzEN4=;
 b=QUzuChzgy91Gr0FYzK7qb6CYja7FJaavUU3FJZxDWx6DHonawudmt9ViF1jdDZkBn6
 PE3hQn+Mn/E+TKu8qyUgppGogLqmG8TnAMj158qI3K4G2tYYN/rApup3Ko80BDjpSerz
 CO/6OE8bHnsqUeUM5uxhitrY3hsofdRTKDY2BpRgS0ewgmDHTbJIg8/FBA2z4NeDbt6S
 y33GCZSBXHiNpnf+4EQeJIGA/Sn5pq5z7Q4tevj8wAAR/jmlNypXJUy44n6ieDaByQf8
 GcX5janXZ8VoG/Qds04yW1WuIjBiuv1DzWzx+G3PFu046tGBRKbsxWMz6tE8klpfSOA2
 dVDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVliFKsgjM/v2ONDt1nNd1hN1zk2NfVCWomuR8N+uP32D1AqDihrGPP8gPkKmRbDxVGBR00jtiONU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBab1Eq5HVknSgBBsUW1uK+KfYZsTmFYBVvnP87V4A6BGSCP6t
 husOo4cnK60kekYaVNRUShQblEn33Z9crF5Y/OrCVmhtbHVyNW1DRAh0
X-Gm-Gg: ASbGnctgT/Fe/O9tb7RAK1WhCeZOgIUJFJHWbVv3X7zK9WvTnXv6YeYIqXSExXQ3E5y
 z33SNPe4zFIC6CM84QFFiow2Fn5G5E7xG5tX6+nOX3sZF/OUQwBymGiL5C3klN3jpxil5CfMh0l
 /B/2gAp6k/GQrDl9X9GlfnxKN78Wr0oQ78qE/VRSRT/GKKe6syWCtYjHtsvbwckmlz+nZQ5m5c7
 HvwafxRKNYjnHpFPYnePkbHLdweWovO0SrY6H04IWrZfGFuY/bMIDey0cGhwfpOV5ndhaEXZCA8
 dvU4tJua67mZZhVq/aDhP9q157W5jgIXC9IpI6nFUjT76jTLX0ZatVsgBp7LzfArXsO7uaLqZ0U
 /DrdKFYCHv1miqbINdE6Hgiy/ZAofepYji2j3Tpl8myBoZtHpR7wC6hVyd0fwHH9R2vKYi8Qujn
 uyOaypDITS2GI8wwUPV3W1G2Vc3YCohK5LoQ==
X-Google-Smtp-Source: AGHT+IF4wq9zktArSY6pgVpnyiaBJyrWrNThCHzoU9ocyuGVqekUKxsMvPATedxtbT74AR7HQqtngw==
X-Received: by 2002:a05:6214:1c84:b0:731:e432:888c with SMTP id
 6a1803df08f44-7fc386ed8ccmr41407516d6.35.1758901487586; 
 Fri, 26 Sep 2025 08:44:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-80143053d1esm28046766d6.32.2025.09.26.08.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:44:47 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfauth.phl.internal (Postfix) with ESMTP id 25925F4007B;
 Fri, 26 Sep 2025 11:44:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 26 Sep 2025 11:44:46 -0400
X-ME-Sender: <xms:7bTWaD8GaXpVPbrps4d7E9n_bjzzRhZyG3UvDqjG81DMRYYMxzL2Tw>
 <xme:7bTWaP5evZu5Jr9rE7T_zoz5mMUoC-9VM42W6g_142QkRYuEIfMVqWZSfur5_keVF
 Uw-YrVo3i0uiyx6K7a6e2wombFiL7v2-MhxjU2qTfgBZcmuDcrq7Q>
X-ME-Received: <xmr:7bTWaDoLBZ1TjkSNsGNG9Isnd9Z5-o_3v-_n8RrKeYiNEoS79BAnCtlDLX9I7E3_Y2ICHPCmx3NsOJ4kQRgHwE2mfk-CRmS9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileejiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
 shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
 hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
 feehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehphhgrshhtrgeskhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
 oheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhi
 esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
 nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
 hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
 hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:7rTWaLDaM191edQ-YKFNpdeiSbvBtv0cpOhQkc4eQR5XyuNUhps9_g>
 <xmx:7rTWaMMxsC4UmqKLuFihps-FBk1oH04IIIOSgN3xQpOaRyNBxu4Q1w>
 <xmx:7rTWaKnkSMn9Z8haCh4AUBredHO5C0g2OqlHlwk31tIpgC2aEKfb9A>
 <xmx:7rTWaOd94ceZ9RNOFgxiSxh7w7N-BU8xivt9AOWwAFKni64LYzL32Q>
 <xmx:7rTWaPCKNLmxIZnmFKhOcWjFMyzLQM-dpSYZbCkdoHOB8J79vxdCuKbB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Sep 2025 11:44:45 -0400 (EDT)
Date: Fri, 26 Sep 2025 08:44:43 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: phasta@kernel.org
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
Message-ID: <aNa069wZv1cn8VGh@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aMwOoYe1xGDBg0Zv@tardis-2.local>
 <12c09de235023c99a8a864b17b2f797c7339bb7b.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c09de235023c99a8a864b17b2f797c7339bb7b.camel@mailbox.org>
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

On Fri, Sep 26, 2025 at 10:48:06AM +0200, Philipp Stanner wrote:
[..]
> > > 
> > > Regarding the manually created spinlock of mine: I so far never need
> > > that spinlock anywhere in Rust and wasn't sure what's then the best way
> > > to pass a "raw" spinlock to C.
> > > 
> > 
> > You can use `SpinLock<()>` for this purpose, no need to add new
> > bindings.
> 
> The dma_fence C backend needs a spinlock pointer, given to it by the
> driver (so Rust code).
> 
> How do I pass a SpinLock<()> to a C function? AFAICS SpinLock doesn't
> implement as_raw(), so I'd have to implement it, wouldn't I?
> 

Technically you can use a `&raw` to get the address of the spinlock and
just use it, since `SpinLock<()>` is `repr(C)`, so it's transparent to a 
spinlock_t. So you don't have to ;-)

However, while we are at it, it makes sense that we do it right.

> Or rather, as it looks, I'd have to implement it for SpinLockBackend?
> 

I think the below should work, we already have a special from_raw() for
Lock<()>, it makes sense to have a special as_raw() as well.

Let me know if you want me to send a proper patch, or feel free to add
one in your patchset ;-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 27202beef90c..78f3287a1372 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -160,6 +160,13 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
         //   `B::State`.
         unsafe { &*ptr.cast() }
     }
+
+    /// Obtains the raw pointer from a [`Lock`].
+    ///
+    /// This can be useful for working with a lock user outside Rust.
+    pub fn as_raw(&self) -> *mut B::State {
+        self.state.get()
+    }
 }

 impl<T: ?Sized, B: Backend> Lock<T, B> {


Regards,
Boqun

> 
> P.
> 
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/20250905044141.77868-1-boqun.feng@gmail.com/
> > 
> > Regards,
> > Boqun
> > 
> > > 
> > > So much from my side. Hope to hear from you.
> > > 
> > > (I've compiled and tested this with the unit test on the current -rc3)
> > > 
> > > Philipp
> > > ---
> > [...]
> 
