Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597193AFF2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 12:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D7710E673;
	Wed, 24 Jul 2024 10:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lrv574tR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C479D10E543
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721817888;
 bh=aGxT0r4whNVWcuHx9lQ2vuj04q4n7D2hOtv6taXJucI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lrv574tRvabtWKZKfQNcFiCNLJxs/HH3Hrr4Y9ojqdGAMtSbtl3JuQZjfb52zDZ1k
 ygxXSnyKn9W21qdJ/ftRDm1JLilPWx8HmV/+yoNMcEdECQAh6m4epwGVJ5YnknJ5Cd
 Cb1YkPVBpuAJkL1ZrJp50hic3XVcs0bhuNvvwE1kjykRNuXiCWYo4ws4CQcPBDrc3l
 MOMMldZes1fJxHYFnymihWdt4tCEsose2J3+uvWKBBiPuEkkqKkiU+r0KkF+muYWmW
 ADoesySsLlevWaR6Y2s8O/d8gXpwnKpaEsnLLTCjJfc1N3voOab/M5IZqccuXrDCzk
 oqqqHpDZOU3Kg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3BD937811D1;
 Wed, 24 Jul 2024 10:44:47 +0000 (UTC)
Date: Wed, 24 Jul 2024 12:44:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, ojeda@kernel.org, Danilo Krummrich <dakr@redhat.com>,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net, mcanal@igalia.com,
 airlied@gmail.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <20240724124446.11b23885@collabora.com>
In-Reply-To: <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Steve,

On Wed, 24 Jul 2024 09:59:36 +0100
Steven Price <steven.price@arm.com> wrote:

> Hi Boris,
> 
> On 23/07/2024 17:06, Boris Brezillon wrote:
> > Hi Steve,
> > 
> > On Mon, 15 Jul 2024 10:12:16 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> I note it also shows that the "panthor_regs.rs" would ideally be shared.
> >> For arm64 we have been moving to generating system register descriptions
> >> from a text source (see arch/arm64/tools/sysreg) - I'm wondering whether
> >> something similar is needed for Panthor to generate both C and Rust
> >> headers? Although perhaps that's overkill, sysregs are certainly
> >> somewhat more complex.  
> > 
> > Just had a long discussion with Daniel regarding this panthor_regs.rs
> > auto-generation, and, while I agree this is something we'd rather do if
> > we intend to maintain the C and rust code base forever, I'm not
> > entirely convinced this is super useful here because:  
> 
> So I think we need some more alignment on how the 'Rustification'
> (oxidation?) of the driver is going to happen.
> 
> My understanding was that the intention was to effectively start a
> completely separate driver (I call it "Rustthor" here) with the view
> that it would eventually replace (the C) Panthor. Rustthor would be
> written by taking the C driver and incrementally converting parts to
> Rust, but as a separate code base so that 'global' refactoring can be
> done when necessary without risking the stability of Panthor. Then once
> Rustthor is feature complete the Panthor driver can be dropped.
> Obviously we'd keep the UABI the same to avoid user space having to care.

That's indeed what we landed on initially, but my lack of rust
experience put me in a position where I can't really challenge these
decisions, which is the very reason we have Daniel working on it :-). I
must admit his argument of implementing new features in rust and
progressively converting the other bits is appealing, because this
reduces the scope of testing for each component conversion...

> 
> I may have got the wrong impression - and I'm certainly not saying the
> above is how we have to do it. But I think we need to go into it with
> open-eyes if we're proposing a creeping Rust implementation upstream of
> the main Mali driver. That approach will make ensuring stability harder
> and will make the bar for implementing large refactors higher (we'd need
> significantly more review and testing for each change to ensure there
> are no regressions).

... at the risk of breaking the existing driver, that's true. My hope
was that, by the time we start converting panthor components to rust,
the testing infrastructure (mesa CI, for the open source driver) would
be mature enough to catch regressions. But again, I wouldn't trust my
judgment on anything rust related, so if other experienced rust
developers think having a mixed rust/c driver is a bad idea (like Sima
seemed to imply in her reply to Daniel), then I'll just defer to their
judgment.

> 
> > 1. the C code base is meant to be entirely replaced by a rust driver.
> > Of course, that's not going to happen overnight, so maybe it'd be worth
> > having this autogen script but...  
> 
> Just to put my cards on the table. I'm not completely convinced a Rust
> driver is necessarily an improvement, and I saw this as more of an
> experiment - let's see what a Rust driver looks like and then we can
> decide which is preferable. I'd like to be "proved wrong" and be shown a
> Rust driver which is much cleaner and easier to work with, but I still
> need convincing ;)

Okay, I was more in the mood of "when will this happen?" rather than
"will this ever be a viable option?" :-). At this point, there seems
to be enough traction from various parties to think DRM/rust will be a
thing and in not a such distant future actually. But yeah, I get your
point.

> 
> > 2. the set of register and register fields seems to be pretty stable.
> > We might have a few things to update to support v11, v12, etc, but it
> > doesn't look like the layout will suddenly become completely different.  
> 
> Yes, if we ever had a major change to registers we'd probably also want
> a new driver.
> 
> > 3. the number of registers and fields is somewhat reasonable, which
> > means we should be able to catch mistakes during review. And in case
> > one slip through, it's not the end of the world either because this
> > stays internal to the kernel driver. We'll either figure it out when
> > rust-ifying panthor components, or that simply means the register is
> > not used and the mistake is harmless until the register starts being
> > used  
> 
> So I think this depends on whether we want a "complete" set of registers
> in Rust. If we're just going to add registers when needed then fair
> enough, we can review the new registers against the C header (and/or the
> specs) to check they look correct. I'd really prefer not to merge a load
> of wrong Rust code which isn't used.

Totally agree with that.

> 
> > 4. we're still unclear on how GPU registers should be exposed in rust,
> > so any script we develop is likely to require heavy changes every time
> > we change our mind  
> 
> This is the real crux of the matter to my mind. We don't actually know
> what we want in Rust, so we can't write the Rust. At the moment Daniel
> has generated (broken) Rust from the C. The benefit of that is that the
> script can be tweaked to generate a different form in the future if needed.

Well, the scope of devcoredump is pretty clear: there's a set of
GPU/FW register values we need to properly decode a coredump (ringbuf
address, GPU ID, FW version, ...). I think this should be a starting
point for the rust GPU/FW abstraction. If we start from the other end
(C definitions which we try to convert to rust the way they were used
in C), we're likely to make a wrong choice, and later realize we need
to redo everything.

This is the very reason I think we should focus on the feature we want
to implement in rust, come up with a PoC that has some reg values
manually defined, and then, if we see a need in sharing a common
register/field definition, develop a script/use a descriptive format
for those. Otherwise we're just spending time on a script that's going
to change a hundred times before we get to the rust abstraction we
agree on.

> 
> Having a better source format such that the auto-generation can produce
> correct headers means that the Rust representation can change over time.
> There's even the possibility of improving the C. Specifically if the
> constants for the register values were specified better they could be
> type checked to ensure they are used with the correct register - I see
> Daniel has thought about this for Rust, it's also possible in C
> (although admittedly somewhat clunky).

If that's something we're interested in, I'd rather see a script to
generate the C definitions, since that part is not a moving target
anymore (or at least more stable than it was a year ago). Just to be
clear, I'm not opposed to that, I just think the time spent developing
such a script when the number of regs is small/stable is not worth it,
but if someone else is willing to spend that time, I'm happy to
ack/merge the changes :-).

> 
> > For all these reasons, I think I'd prefer to have Daniel focus on a
> > proper rust abstraction to expose GPU registers and fields the rust-way,
> > rather than have him spend days/weeks on a script that is likely to be
> > used a couple times (if not less) before the driver is entirely
> > rewritten in rust. I guess the only interesting aspect remaining after
> > the conversion is done is conciseness of register definitions if we
> > were using some sort of descriptive format that gets converted to rust
> > code, but it comes at the cost of maintaining this script. I'd probably
> > have a completely different opinion if the Mali register layout was a
> > moving target, but it doesn't seem to be the case.  
> 
> That's fine - but if we're not generating the register definitions, then
> the Rust files need to be hand modified. I.e. fine to start with a quick
> hack of generating the skeleton (once), but then we (all) throw away the
> script and review it like a hand-written file. What Daniel posted as
> obviously machine generated as it had been confused by the (ambiguous) C
> file.

Yeah, I wasn't even considering auto-generating the panthor_regs.rs
file in the first place. More of a hand-write every reg/field accessor
you need for the coredump feature, and extend it as new features
are added/components are converted. Once the interface is stable, we
can consider having a script that takes care of the C/rust autogen, but
when you get to this point, I'm not even sure it's useful, because you
almost sure you got things right by testing the implementation.

> 
> But to me this conflicts with the statement that "we're still unclear on
> how GPU registers should be exposed in rust" - which implies that a
> script could be useful to make the future refactors easier.

Unless modifying the script becomes more painful than manually
refactoring the rs file directly :-).

> 
> > FYI, Daniel has a python script parsing panthor_regs.h and generating
> > panthor_regs.rs out of it which he can share if you're interested.  
> 
> Thanks for sharing this Daniel. I think this demonstrates that the C
> source (at least as it currently stands) isn't a great input format.

I couldn't agree more.

> AFAICT we have two options:
> 
> a) Improve the import format: either fix the C source to make it easier
> to parse, or better introduce a new format which can generate both Rust
> and C. Something along the lines of the arm64 sysreg format.

If we go for autogen, I definitely prefer the second option.

> 
> b) Don't generate either the C or Rust headers. Hand-write the Rust so
> that it's idiomatic (and correct!). The review of the Rust headers will
> need to be more careful, but is probably quicker than reviewing/agreeing
> on a script. The major downside is if the Rust side is going to be
> refactored (possibly multiple times) as the changes could be a pain to
> review.

Could be, but if we're exposing a minimal amount of regs/fields until
we agree on the most appropriate abstraction, the refactoring shouldn't
be that painful.

> 
> I really don't mind which, but I do mind if we don't pick an option ;)

Yeah, I agree.

Thanks for valuable your feedback.

Boris

