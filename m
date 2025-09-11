Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C5B525EE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 03:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8880F10E196;
	Thu, 11 Sep 2025 01:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FAr7AWQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440F10E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 01:47:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7741991159bso302007b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 18:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757555227; x=1758160027; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OEZsk5IgIJE2olJ8uhS0ciJ6RlLJjXOKHsdYkiwECsw=;
 b=FAr7AWQO8wn34jab4RZld8hsNTkTKbGQOgFmT6eIeVbutMfufgoqFhsAF4WTB4+Sal
 9k3x4/u4ZpI7+ML9RcNvJQ2xpSrdT2CcTzn8ka1lJHNkpNZfezRAYVrig3UY6VBtoK0a
 sQ2g5DQFkJdJLJm9WZs/5JSh3vy7ZC6bb12w+NIua0S4Z0VR5UY+r1Q/9qfAfKQhDRGC
 UegfSz0h2N1XoyYOPpRcud4iOHT8g+F+/IFNMM+kwXJdrqZSWFtkp/5JmYr0riq6xmUs
 yFwGL3BUQo8yLAxs8Rh2jmNqTPpaH2z9qj7F+qzgC4xKAjcWz0hAG6/WUP8conUCn7uz
 6Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757555227; x=1758160027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEZsk5IgIJE2olJ8uhS0ciJ6RlLJjXOKHsdYkiwECsw=;
 b=g2q4lCFQCtN9tncWGdYfw+oKAcMlADCi/XVzRURiX3dcLS24M4p2Bm3s8QHhj4SCA7
 9b+iKrLvftQ/1oURcjkvcViRFUEnH4MIqM5BI0VR152tsDQ01xCI4UECt9ghzWktrsKC
 4p91Xdp01WnyiSEoo48FdTl63rD0dSEqZTH4iNHX8eAqRKtwjuR7G2ZLl0gnZFM+W2cq
 JgOHsfqIwQb8Ta8KQHcO+u8bi20tHh4UdiQ6kpKlQRVkJ1f/Mn0cSozqZw0Gw1DGSOJc
 X0hHKw4VyjLVB5sgbszPBJbZlA8rvvniwnC6lC2SHlL0AbCSh5QPvBN5tu09uABbK/9a
 4EpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMVDcu0/aZkjcXs+559r1pFzABPXCHvgLNDIciVGAXBOgCsLJbrfwjvoZ+fAx3PQk0fugk9yeJEj4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf7+ml34EOFj8BhD399P2JTTCtYrGvyJAy6MXRZnNtHH80kBFV
 B/0t2WLJvvhRvgyOPoqAqozDuj5mEVbmrntxvLnee8rz5SAeROBc+LkG
X-Gm-Gg: ASbGncud/FnJh/kph+1o+MbqmDi/SZY7tt9vSP3iM5TBOgwo1A8GeLuPai3Nra4n2rB
 1RX2014fdgF7r/Vfr7KaCNq+ltvFMTj1hTlgz88y8DHVL6xkGWLo8d7qYidpDALPkxg69rM5WXv
 Nwi/lCv5hEwSczNsCYMVMFBYRqfgbuFwURwQjl3chqAXwh5d2PZ8nukvRoU7x7fMZrs34wa23Ks
 dl/cFJ82iP6KCMaGSR/FtAOUDnVpFK73iEWwsgw7e5C854uS3YaXb3Z1zD1irdNOwNFhC4sPqoQ
 1VsE2mY1pSIdX8U1u1SoSR4WK2JeoLNljAWU0gKad+37ZU5PSoAqcM5pgK5l58JdexdSS/jBf6N
 /LWuCT0UQxeH4AyU0mawR7MjFrAm/BAtL
X-Google-Smtp-Source: AGHT+IHaIDh8YEvy5MNx/DrTxCXuyUt/GErzLvTsLnkRsoq21VQQ58b6byrmg3bf51ljPUzBvmtNag==
X-Received: by 2002:a05:6a20:914c:b0:24a:d857:fcab with SMTP id
 adf61e73a8af0-2533fab75e9mr23158841637.23.1757555227324; 
 Wed, 10 Sep 2025 18:47:07 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a32ea462sm189220a12.0.2025.09.10.18.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 18:47:06 -0700 (PDT)
Date: Wed, 10 Sep 2025 21:47:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <aMIqGBoNaJ7rUrYQ@yury>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
 <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
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

On Wed, Sep 10, 2025 at 07:08:43PM -0400, Joel Fernandes wrote:
> > You've got only one negative test that covers the .from() method.
> > Can you add more?
> 
> Sure, but note that we can only add negative tests if there is a chance of
> failure, which at runtime can mainly happen with the fallible usage (?=>
> pattern). Also just to note, we already at ~300 lines of test code now :)
> 
> > 
> > What if I create a bitfield from a runtime value that exceeds
> > the capacity?
> > 
> >     bitfield! {
> >         struct bf: u8 {
> >             0:0       ready       as bool;
> >             1:1       error       as bool;
> >             3:2       state       as u32;
> Here you mean 'as u8', otherwise it wont compile.

No, I meant u32. Can you explain this limitation in docs please? From
a user perspective, the 'state' is a 2-bit variable, so any type wider
than that should be OK to hold the data. If it's just an implementation
limitation, maybe it's worth to relax it?
 
> >        }
> >     }
> > 
> >     let raw_value: u8 = 0xff;
> >     let bf = bf::from(raw_value);
> > 
> > I guess you'd return None or similar.
> 
> No, we would ignore the extra bits sent. There is a .raw() method and 'bf' is
> 8-bits, bf.raw() will return 0xff. So it is perfectly valid to do so.

So I'm lost. Do you ignore or keep untouched?

Imagine a code relying on the behavior you've just described. So, I
create a 5-bit bitfield residing in a u8 storage, and my user one
day starts using that 3-bit tail for his own purposes.

Is that OK? Can you guarantee that any possible combination of methods
that you've implemented or will implement in future will keep the tail
untouched?

In bitmaps, even for a single-bit bitmap the API reserves the whole word,
thus we have a similar problem. And we state clearly that any bit beyond
the requested area is 'don't care'. It's OK for C. Is it OK for rust?

(And even that, we have a couple of functions that take care of tails
for some good reasons.)

So the question is: do you
 - provide the same minimal guarantees as C does (undefined behavior); or
 - preserve tails untouched, so user can play with them; or
 - clean the tails for user; or
 - reject such requests?

Or something else? Whichever option you choose, please describe
it explicitly.

> I don't
> think we should return None here, this is also valid in C.

This doesn't sound like an argument in the rust world, isn't? :) I've
been told many times that the main purpose of rust is the bullet-proof
way of coding. Particularly: "rust is free of undefined behavior gray
zone".  

> > Can you add such a test?
> 
> Sure, I added such a test.
> 
> > The same question for the setters. What would happen for this:
> > 
> >     let bf = bf::default()
> >              .set_state(0xf)
> >              .set_ready(true);
> > 
> > I think that after the first out-of-boundary in set_state(), you
> > should abort the call chain, make sure you're not touching memory
> > in set_ready() and returning some type of error.
> 
> Here, on out of boundary, we just ignore the extra bits passed to set_state. I
> think it would be odd if we errored out honestly. We are using 'as u8' in the
> struct so we would accept any u8 as input, but then if we complained that extra
> bits were sent, that would be odd.

That really depends on your purpose. If your end goal is the safest API
in the world, and you're ready to sacrifice some performance (which is
exactly opposite to the C case), then you'd return to your user with a
simple question: are you sure you can fit this 8-bit number into a 3-bit
storage?   

> In C also this is valid. If you passed a
> higher value than what the bitfield can hold, the compiler will still just use
> the bits that it needs and ignore the rest.

In C we've got FIELD_{PREP,GET,MODIFY}, implementing the checks.
So those who want to stay on safe side have a choice.

> Now, I am not opposed to error'ing out on that, but that's not what we currently
> do and it is also not easy to do. The setters in the patch return Self, not
> Result<Self>, so they are infallible, which is what allows them to be chained as
> well (builder pattern).

That 'chainability' looks optional to me, not saying weird, anyways. 

> I added another test here as well, to ensure the behavior is as I describe.
> 
> > 
> > And for this:
> > 
> >     let ret: u32 = -EINVAL;
> >     bf = bf::default();
> >     bf = bf.set_state(ret);
> > 
> > For compile-time initializes, it should be a compile-time error, right?
> 
> Yes, since the struct in this example is u8, this wont compile. Yes, I will add
> a comment.

So, the following would work?

     bitfield! {
         struct bf: u32 {
             0:0       ready       as bool;
             1:1       error       as bool;
             3:2       state       as u32;
             ...
         }
     }

     let state: u32 = some_C_wrapper(); // returns 0..3 or -EINVAL
     bf = bf::default();
     bf = bf.set_state(state);

That doesn't look right...

> > Can you drop a comment on that?
> 
> Yes, I will do so.
> 
> > 
> > I tried to apply your series on top of master, but it failed. So
> > my apologies for not finding the answers to some questions above
> > by myself.
> 
> Oh ok, I applied it on top of drm-rust-next. I will rebase on -next for the next
> revision, thanks.
> 
> > For the next version, can you make sure your series is applicable
> > on top of master or -next?
> Sure, thanks.
>  - Joel
