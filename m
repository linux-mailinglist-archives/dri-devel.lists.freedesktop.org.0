Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17FB37CD5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3210E757;
	Wed, 27 Aug 2025 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24BD10E756;
 Wed, 27 Aug 2025 08:05:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3641691;
 Wed, 27 Aug 2025 01:05:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D650B3F694;
 Wed, 27 Aug 2025 01:05:07 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:04:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com,
 kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
Message-ID: <aK68Ht03vZ0G3Xpt@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
 <aK259PrpyxguQzdN@J2N7QTR9R3>
 <015974a4-f129-4ae5-adf9-c94b29f0576a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015974a4-f129-4ae5-adf9-c94b29f0576a@arm.com>
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

On Tue, Aug 26, 2025 at 11:46:02PM +0100, Robin Murphy wrote:
> On 2025-08-26 2:43 pm, Mark Rutland wrote:
> > On Wed, Aug 13, 2025 at 06:01:10PM +0100, Robin Murphy wrote:
> > To bikeshed a little here, I'm not keen on the PERF_PMU_CAP_RAW_EVENTS
> > name, because it's not clear what "RAW" really means, and people will
> > definitely read that to mean something else.
> > 
> > Could we go with something like PERF_PMU_CAP_COMMON_CPU_EVENTS, to make
> > it clear that this is about opting into CPU-PMU specific event types (of
> > which PERF_TYPE_RAW is one of)?
> 
> Indeed I started with that very intention after our previous discussion, but
> soon realised that in fact nowhere in the code is there any definition or
> even established notion of what "common" means in this context, so it's
> hardly immune to misinterpretation either.

We can document that; it's everything less than PERF_TYPE_MAX:

	enum perf_type_id {
		PERF_TYPE_HARDWARE                      = 0, 
		PERF_TYPE_SOFTWARE                      = 1, 
		PERF_TYPE_TRACEPOINT                    = 2, 
		PERF_TYPE_HW_CACHE                      = 3, 
		PERF_TYPE_RAW                           = 4, 
		PERF_TYPE_BREAKPOINT                    = 5, 

		PERF_TYPE_MAX,                          /* non-ABI */
	};

... and maybe you could use "PERF_PMU_CAP_ABI_TYPES" to align with that
comment?

> Furthermore the semantics of the cap as it ended up are specifically
> that the PMU wants the same behaviour as if it had registered as
> PERF_TYPE_RAW, so having "raw" in the name started to look like the
> more intuitive option after all (plus being nice and short helps.)

I appreciate the shortness, but I think it's misleading to tie this to
"RAW" specifically, when really this is a capabiltiy to say "please let
me try to init any events for non-dynamic types, in addition to whatever
specific type I am registered with".

> If anything, it's "events" that carries the implication that's proving hard
> to capture precisely and concisely here, so maybe the answer to avoid
> ambiguity is to lean further away from a "what it represents" to a "what it
> actually does" naming - PERF_PMU_CAP_TYPE_RAW, anyone?

I'm happy with TYPE in the name; it's just RAW specifically that I'm
objecting to.

> > Likewise, s/is_raw_pmu()/pmu_supports_common_cpu_events()/.
> 
> Case in point: is it any more logical and expected that supporting common
> CPU events implies a PMU should be offered software or breakpoint events as
> well? Because that's what such a mere rename would currently mean :/

Yes, I think it is.

> > > ---
> > > 
> > > A further possibility is to automatically add the cap to PERF_TYPE_RAW
> > > PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
> > > undecided...
> > 
> > I reckon we don't need to automagically do that, but I reckon that
> > is_raw_pmu()/pmu_supports_common_cpu_events() should only check the cap,
> > and we don't read anything special into any of
> > PERF_TYPE_{RAW,HARDWARE,HW_CACHE}.
> 
> OK, but that would then necessitate having to explicitly add the cap to all
> 15-odd other drivers which register as PERF_TYPE_RAW as well, at which point
> it starts to look like a more general "I am a CPU PMU in terms of most
> typical assumptions you might want to make about that" flag...
> 
> To clarify (and perhaps something for a v2 commit message), we currently
> have 3 categories of PMU driver:
> 
> 1: (Older/simpler CPUs) Registers as PERF_TYPE_RAW, wants
> PERF_TYPE_RAW/HARDWARE/HW_CACHE events
> 2: (Heterogeneous CPUs) Registers as dynamic type, wants
> PERF_TYPE_RAW/HARDWARE/HW_CACHE events plus events of its own type
> 3: (Mostly uncore) Registers as dynamic type, only wants events of its own
> type

Sure, but I think that separating 1 and 2 is an artificial distinction,
and what we really have is:

(a) Wants to handle (some of) the non-dynamic/common/ABI types (in
    addition to whatever specific type it was registered with). Needs to
    have a switch statement somewhere in pmu::event_init().

(b) Only wants to handle the specific type the PMU was registered with.

> My vested interest is in making category 3 the default behaviour, given that
> the growing majority of new drivers are uncore (and I keep having to write
> them...) 

Yes, we're aligned on that.

> However unclear the type overlaps in category 1 might be, it's been
> like that for 15 years, so I didn't feel compelled to churn fossils like
> Alpha more than reasonably necessary. Category 2 is only these 5 drivers, so
> a relatively small tweak to distinguish them from category 3 and let them
> retain the effective category 1 behaviour (which remains the current one of
> potentially still being offered software etc. events too) seemed like the
> neatest way to make progress.

I just think we should combine 1 and 2 (into categroy a as above), since
that removes the need to treat RAW specially going forwards.

> I'm not saying I'm necessarily against a general overhaul of CPU PMUs being
> attempted too, just that it seems more like a whole other side-quest, and
> I'd really like to slay the uncore-boilerplate dragon first.

I think that adding the cap to those 15 PMUs would take less time than
it has taken me to write this email, so I do not understand the
objection.

Mark.
