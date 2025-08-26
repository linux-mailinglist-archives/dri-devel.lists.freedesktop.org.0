Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DDB36357
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 15:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409810E30A;
	Tue, 26 Aug 2025 13:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DFA610E306;
 Tue, 26 Aug 2025 13:28:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742EB1A25;
 Tue, 26 Aug 2025 06:28:43 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A56233F63F;
 Tue, 26 Aug 2025 06:28:45 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:28:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>, mingo@redhat.com, will@kernel.org,
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
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
Message-ID: <aK22izKE4r6wI_D9@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826130806.GY4067720@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826130806.GY4067720@noisy.programming.kicks-ass.net>
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

On Tue, Aug 26, 2025 at 03:08:06PM +0200, Peter Zijlstra wrote:
> On Wed, Aug 13, 2025 at 06:01:08PM +0100, Robin Murphy wrote:
> > Sampling is inherently a feature for CPU PMUs, given that the thing
> > to be sampled is a CPU context. These days, we have many more
> > uncore/system PMUs than CPU PMUs, so it no longer makes much sense to
> > assume sampling support by default and force the ever-growing majority
> > of drivers to opt out of it (or erroneously fail to). Instead, let's
> > introduce a positive opt-in capability that's more obvious and easier to
> > maintain.
> 
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 4d439c24c901..bf2cfbeabba2 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -294,7 +294,7 @@ struct perf_event_pmu_context;
> >  /**
> >   * pmu::capabilities flags
> >   */
> > -#define PERF_PMU_CAP_NO_INTERRUPT	0x0001
> > +#define PERF_PMU_CAP_SAMPLING		0x0001
> >  #define PERF_PMU_CAP_NO_NMI		0x0002
> >  #define PERF_PMU_CAP_AUX_NO_SG		0x0004
> >  #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
> > @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
> >  #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
> >  #define PERF_PMU_CAP_AUX_PAUSE		0x0200
> >  #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
> > +#define PERF_PMU_CAP_NO_INTERRUPT	0x0800
> 
> So NO_INTERRUPT was supposed to be the negative of your new SAMPLING
> (and I agree with your reasoning).
> 
> What I'm confused/curious about is why we retain NO_INTERRUPT?

I see from your other reply that you spotted the next patch does that.

For the sake of other reviewers or anyone digging through the git
history it's probably worth adding a line to this commit message to say:

| A subsequent patch will remove PERF_PMU_CAP_NO_INTERRUPT as this
| requires some additional cleanup.

Mark.
