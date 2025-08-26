Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03AB36267
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 15:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115510E65E;
	Tue, 26 Aug 2025 13:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 739D389317;
 Tue, 26 Aug 2025 13:18:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DEB1A25;
 Tue, 26 Aug 2025 06:18:20 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E10B23F63F;
 Tue, 26 Aug 2025 06:18:22 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:18:16 +0100
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
Subject: Re: [PATCH 02/19] perf/hisilicon: Fix group validation
Message-ID: <aK20GP5g1iu9DGrQ@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
 <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK2XS_GhLw1EQ2ml@J2N7QTR9R3>
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

On Tue, Aug 26, 2025 at 12:15:23PM +0100, Mark Rutland wrote:
> On Wed, Aug 13, 2025 at 06:00:54PM +0100, Robin Murphy wrote:
> > The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
> > a bit off, in that given a software group leader, it will consider that
> > event *in place of* the actual new event being opened. At worst this
> > could theoretically allow an unschedulable group if the software event
> > config happens to look like one of the hardware siblings.
> > 
> > The uncore framework avoids that particular issue,
> 
> What is "the uncore framework"? I'm not sure exactly what you're
> referring to, nor how that composes with the problem described above.
> 
> > but all 3 also share the common issue of not preventing racy access to
> > the sibling list,
> 
> Can you please elaborate on this racy access to the silbing list? I'm
> not sure exactly what you're referring to.

Ah, I think you're referring to the issue in:

  https://lore.kernel.org/linux-arm-kernel/Zg0l642PgQ7T3a8Z@FVFF77S0Q05N/

... where when creatign a new event which is its own group leader,
lockdep_assert_event_ctx(event) fires in for_each_sibling_event(),
because the new event's context isn't locked...

> > diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > index a449651f79c9..3c531b36cf25 100644
> > --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> > @@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
> >  	/* Include count for the event */
> >  	int counters = 1;
> >  
> > -	if (!is_software_event(leader)) {
> > -		/*
> > -		 * We must NOT create groups containing mixed PMUs, although
> > -		 * software events are acceptable
> > -		 */
> > -		if (leader->pmu != event->pmu)
> > -			return false;
> > +	if (leader == event)
> > +		return true;

... and hence bailing out here avoids that?

It's not strictly "racy access to the sibling list", becuase there's
nothing else accessing the list; it's just that this is the simplest way
to appease lockdep while avoiding false negatives.

It'd probably be better to say something like "the common issue of
calling for_each_sibling_event() when initialising a new group leader",
and maybe to spell that out a bit.

Mark.
