Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64CB37D67
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ADF10E767;
	Wed, 27 Aug 2025 08:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44BAA10E0AD;
 Wed, 27 Aug 2025 08:18:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875DD1515;
 Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D1A3F694;
 Wed, 27 Aug 2025 01:18:41 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:18:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 will@kernel.org, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
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
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <aK6_XrA_OaLnoFkr@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
 <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
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

On Tue, Aug 26, 2025 at 11:48:48AM -0700, Ian Rogers wrote:
> On Tue, Aug 26, 2025 at 8:32 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> > >> It may have been different long ago, but today it seems wrong for these
> > >> drivers to skip counting disabled sibling events in group validation,
> > >> given that perf_event_enable() could make them schedulable again, and
> > >> thus increase the effective size of the group later. Conversely, if a
> > >> sibling event is truly dead then it stands to reason that the whole
> > >> group is dead, so it's not worth going to any special effort to try to
> > >> squeeze in a new event that's never going to run anyway. Thus, we can
> > >> simply remove all these checks.
> > >
> > > So currently you can do sort of a manual event rotation inside an
> > > over-sized group and have it work.
> > >
> > > I'm not sure if anybody actually does this, but its possible.
> > >
> > > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > > periodically cycle which of the 5 events is off.
> 
> I'm not sure this is true, I thought this would fail in the
> perf_event_open when adding the 5th event and there being insufficient
> counters for the group.

We're talking specifically about cases where the logic in a pmu's
pmu::event_init() callback doesn't count events in specific states, and
hence the 5th even doesn't get rejected when it is initialised.

For example, in arch/x86/events/core.c, validate_group() uses
collect_events(), which has:

	for_each_sibling_event(event, leader) {
		if (!is_x86_event(event) || event->state <= PERF_EVENT_STATE_OFF)
			continue;

		if (collect_event(cpuc, event, max_count, n))
			return -EINVAL;

		n++;
	}

... and so where an event's state is <= PERF_EVENT_STATE_OFF at init
time, that event is not counted to see if it fits into HW counters.

Mark.
