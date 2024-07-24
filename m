Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46293B217
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F310E6CF;
	Wed, 24 Jul 2024 13:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F29B10E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 13:54:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D321106F;
 Wed, 24 Jul 2024 06:54:54 -0700 (PDT)
Received: from [10.57.44.253] (unknown [10.57.44.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69A123F5A1;
 Wed, 24 Jul 2024 06:54:26 -0700 (PDT)
Message-ID: <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
Date: Wed, 24 Jul 2024 14:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Rob Herring <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 24/07/2024 14:15, Rob Herring wrote:
> On Wed, Jul 24, 2024 at 3:59 AM Steven Price <steven.price@arm.com> wrote:
>>
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
> We did discuss this, but I've come to the conclusion that's the wrong
> approach. Converting is going to need to track kernel closely as there
> are lots of dependencies with the various rust abstractions needed. If
> we just copy over the C driver, that's an invitation to diverge and
> accumulate technical debt. The advice to upstreaming things is never
> go work on a fork for a couple of years and come back with a huge pile
> of code to upstream. I don't think this situation is any different. If
> there's a path to do it in small pieces, we should take it.

I'd be quite keen for the "fork" to live in the upstream kernel. My
preference is for the two drivers to sit side-by-side. I'm not sure
whether that's a common view though.

> What parts of the current driver are optional that we could leave out?
> Perhaps devfreq and any power mgt. That's not much, so I think the
> rust implementation (complete or partial) will always be feature
> complete.

Agreed, there's not much you can drop and still have a useful driver.

>> I may have got the wrong impression - and I'm certainly not saying the
>> above is how we have to do it. But I think we need to go into it with
>> open-eyes if we're proposing a creeping Rust implementation upstream of
>> the main Mali driver. That approach will make ensuring stability harder
>> and will make the bar for implementing large refactors higher (we'd need
>> significantly more review and testing for each change to ensure there
>> are no regressions).
> 
> This sounds to me like the old argument for products running ancient
> kernels. Don't change anything so it is 'stable' and doesn't regress.
> I think it's a question of when, not if we're going to upstream the
> partially converted driver. Pretty much the only reason I see to wait
> (ignoring dependencies) is not technical, but the concerns with
> markets/environments that can't/won't adopt Rust yet. That's probably
> the biggest issue with this patch. If converting the main driver first
> is a requirement (as discussed elsewhere in this thread), I think all
> the dependencies are going to take some time to upstream, so it's not
> something we have to decide anytime soon.

I think here's an important issues: what do we do about users who for
whatever reason don't have a Rust toolchain for their kernel build? Do
we really expect that the "other dependencies" are going to take so long
to upstream that everyone who wants this driver will have a Rust toolchain?

If we're adding new features (devcoredump) it's reasonable to say you
don't get the feature unless you have Rust[1]. If we're converting
existing functionality that's a different matter (it's a clear regression).

Having a separate code base for the Rust Panthor sidesteps the problem,
but does of course allow the two drivers to diverge. I don't have a good
solution.

[1] Although I have to admit for a debugging feature like devcoredump
there might well be pressure to implement this in C as well purely so
that customer issues can be debugged...

> Speaking of converting the main driver, here's what I've got so far
> doing that[1]. It's a top down conversion with the driver model and
> DRM registration in Rust. All the ioctls are rust wrappers calling
> into driver C code. It's compiling without the top commit.
> 
>>> 1. the C code base is meant to be entirely replaced by a rust driver.
>>> Of course, that's not going to happen overnight, so maybe it'd be worth
>>> having this autogen script but...
>>
>> Just to put my cards on the table. I'm not completely convinced a Rust
>> driver is necessarily an improvement, and I saw this as more of an
>> experiment - let's see what a Rust driver looks like and then we can
>> decide which is preferable. I'd like to be "proved wrong" and be shown a
>> Rust driver which is much cleaner and easier to work with, but I still
>> need convincing ;)
> 
> Unless your Rust is as good as your C, that's never going to happen.

Well I'd hope that there's some benefit to Rust as a language, and that
therefore it's easier to write cleaner code. Not least that in theory
there's no need to review for memory safety outside of unsafe code. I
expect I'll retire before my Rust experience exceeds my C experience
even if I never touch C again!

Steve

> Rob
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=rust/panthor-6.10

