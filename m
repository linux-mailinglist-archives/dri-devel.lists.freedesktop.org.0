Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2D93B0F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 14:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DB810E6B1;
	Wed, 24 Jul 2024 12:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC38310E6A0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 12:37:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5C9106F;
 Wed, 24 Jul 2024 05:37:39 -0700 (PDT)
Received: from [10.57.44.253] (unknown [10.57.44.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2A943F5A1;
 Wed, 24 Jul 2024 05:37:11 -0700 (PDT)
Message-ID: <0bd6ed95-432a-4304-98e9-76ba445de777@arm.com>
Date: Wed, 24 Jul 2024 13:37:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, mcanal@igalia.com, airlied@gmail.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <20240724124446.11b23885@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240724124446.11b23885@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Boris,

Sounds like we're violently agreeing with each other ;) Just want to
reply to a couple of points.

On 24/07/2024 11:44, Boris Brezillon wrote:
> Hi Steve,
> 
> On Wed, 24 Jul 2024 09:59:36 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> Hi Boris,
>>
>> On 23/07/2024 17:06, Boris Brezillon wrote:
>>> Hi Steve,
>>>
>>> On Mon, 15 Jul 2024 10:12:16 +0100
>>> Steven Price <steven.price@arm.com> wrote:
>>>   
>>>> I note it also shows that the "panthor_regs.rs" would ideally be shared.
>>>> For arm64 we have been moving to generating system register descriptions
>>>> from a text source (see arch/arm64/tools/sysreg) - I'm wondering whether
>>>> something similar is needed for Panthor to generate both C and Rust
>>>> headers? Although perhaps that's overkill, sysregs are certainly
>>>> somewhat more complex.  
>>>
>>> Just had a long discussion with Daniel regarding this panthor_regs.rs
>>> auto-generation, and, while I agree this is something we'd rather do if
>>> we intend to maintain the C and rust code base forever, I'm not
>>> entirely convinced this is super useful here because:  
>>
>> So I think we need some more alignment on how the 'Rustification'
>> (oxidation?) of the driver is going to happen.
>>
>> My understanding was that the intention was to effectively start a
>> completely separate driver (I call it "Rustthor" here) with the view
>> that it would eventually replace (the C) Panthor. Rustthor would be
>> written by taking the C driver and incrementally converting parts to
>> Rust, but as a separate code base so that 'global' refactoring can be
>> done when necessary without risking the stability of Panthor. Then once
>> Rustthor is feature complete the Panthor driver can be dropped.
>> Obviously we'd keep the UABI the same to avoid user space having to care.
> 
> That's indeed what we landed on initially, but my lack of rust
> experience put me in a position where I can't really challenge these
> decisions, which is the very reason we have Daniel working on it :-). I
> must admit his argument of implementing new features in rust and
> progressively converting the other bits is appealing, because this
> reduces the scope of testing for each component conversion...

I can see the appeal, and I found it useful to review and look at some
real Rust code in the kernel.

However... for features quite peripheral to the driver (e.g.
devcoredump) this becomes much more complex/verbose than the equivalent
implementation in C - I could rewrite Daniel's code in C fairly
trivially and drop all the new Rust support, which would get us the new
feature and be "trivially correct" from a memory safety point of view
because Rust has already done the proof! ;) Although more seriously the
style of sub-allocating from a large allocation means it's easy to
review that the code (either C or Rust) won't escape the bounds of each
sub-allocation.

For features that are central to the driver (to pick an example: user
mode submission), it's not really possible to incrementally add them.
You'd have to do a major conversion of existing parts of the driver first.

It also seems like we're likely to be a "worst of both worlds" situation
if the driver is half converted. There's no proper memory safety
(because the Rust code is having to rely on the correctness of the C
code) and the code is harder to read/review because it's split over two
languages and can't make proper use of 'idiomatic style'.

>>
>> I may have got the wrong impression - and I'm certainly not saying the
>> above is how we have to do it. But I think we need to go into it with
>> open-eyes if we're proposing a creeping Rust implementation upstream of
>> the main Mali driver. That approach will make ensuring stability harder
>> and will make the bar for implementing large refactors higher (we'd need
>> significantly more review and testing for each change to ensure there
>> are no regressions).
> 
> ... at the risk of breaking the existing driver, that's true. My hope
> was that, by the time we start converting panthor components to rust,
> the testing infrastructure (mesa CI, for the open source driver) would
> be mature enough to catch regressions. But again, I wouldn't trust my
> judgment on anything rust related, so if other experienced rust
> developers think having a mixed rust/c driver is a bad idea (like Sima
> seemed to imply in her reply to Daniel), then I'll just defer to their
> judgment.

The testing infrastructure will (hopefully) catch major regressions, my
main concern is that for corner case regressions even if we do get them
reported during the release cycle it could be difficult to find a fix
quickly. So we could end up reverting changes that rustify the code just
to restore the previous behaviour. It's certainly not impossible, but I
can't help feel it's making things harder than they need to be.

Sima also has an interesting point that the Rust abstractions in DRM are
going to be written assuming a fully Rust driver, so a half-way house
state might be particularly painful if it prevents us using the generic
DRM infrastructure. But I'm also out of my depth here and so there might
be ways of making this work.

<snip>

>>
>>> 4. we're still unclear on how GPU registers should be exposed in rust,
>>> so any script we develop is likely to require heavy changes every time
>>> we change our mind  
>>
>> This is the real crux of the matter to my mind. We don't actually know
>> what we want in Rust, so we can't write the Rust. At the moment Daniel
>> has generated (broken) Rust from the C. The benefit of that is that the
>> script can be tweaked to generate a different form in the future if needed.
> 
> Well, the scope of devcoredump is pretty clear: there's a set of
> GPU/FW register values we need to properly decode a coredump (ringbuf
> address, GPU ID, FW version, ...). I think this should be a starting
> point for the rust GPU/FW abstraction. If we start from the other end
> (C definitions which we try to convert to rust the way they were used
> in C), we're likely to make a wrong choice, and later realize we need
> to redo everything.
> 
> This is the very reason I think we should focus on the feature we want
> to implement in rust, come up with a PoC that has some reg values
> manually defined, and then, if we see a need in sharing a common
> register/field definition, develop a script/use a descriptive format
> for those. Otherwise we're just spending time on a script that's going
> to change a hundred times before we get to the rust abstraction we
> agree on.

Agreed, I'm absolutely fine with that. My only complaint was that the
Rust register definitions included things unrelated to devcoredump (and
some which were converted incorrectly).

>>
>> Having a better source format such that the auto-generation can produce
>> correct headers means that the Rust representation can change over time.
>> There's even the possibility of improving the C. Specifically if the
>> constants for the register values were specified better they could be
>> type checked to ensure they are used with the correct register - I see
>> Daniel has thought about this for Rust, it's also possible in C
>> (although admittedly somewhat clunky).
> 
> If that's something we're interested in, I'd rather see a script to
> generate the C definitions, since that part is not a moving target
> anymore (or at least more stable than it was a year ago). Just to be
> clear, I'm not opposed to that, I just think the time spent developing
> such a script when the number of regs is small/stable is not worth it,
> but if someone else is willing to spend that time, I'm happy to
> ack/merge the changes :-).

Also agreed, but I'm afraid I'm not volunteering my time for the
implementation ;) But happy to review if others want to tackle this.

Steve
