Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB2B38BC5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 23:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AAB10E8C9;
	Wed, 27 Aug 2025 21:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA42710E763;
 Wed, 27 Aug 2025 08:06:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FE122FC;
 Wed, 27 Aug 2025 01:06:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8693F694;
 Wed, 27 Aug 2025 01:06:32 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:06:30 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
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
Message-ID: <20250827080630.GC745921@e132581.arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826131124.GB745921@e132581.arm.com>
 <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 21:59:14 +0000
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

On Tue, Aug 26, 2025 at 04:53:51PM +0100, Robin Murphy wrote:

[...]

> > Genearlly, AUX events generate interrupts based on AUX ring buffer
> > watermark but not the period. Seems to me, it is correct to set the
> > PERF_PMU_CAP_SAMPLING flag for them.
> 
> This cap is given to drivers which handle event->attr.sample_period and call
> perf_event_overflow() - or in a few rare cases, perf_output_sample()
> directly - to do something meaningful with it, since the intent is to convey
> "I properly handle events for which is_sampling_event() is true". My
> understanding is that aux events are something else entirely, but I'm happy
> to be corrected.

If the discussion is based only on this patch, my understanding is
that the PERF_PMU_CAP_SAMPLING flag replaces the
PERF_PMU_CAP_NO_INTERRUPT flag for checking whether a PMU event needs
to be re-enabled in perf_adjust_freq_unthr_context().

AUX events can trigger a large number of interrupts under certain
conditions (e.g., if we set a very small watermark). This is why I
conclude that we need to set the PERF_PMU_CAP_SAMPLING flag to ensure
that AUX events are re-enabled properly after throttling (see
perf_adjust_freq_unthr_events()).

> Otherwise, perhaps this suggests it deserves to be named a little more
> specifically for clarity, maybe PERF_CAP_SAMPLING_EVENTS?

Seems to me, the naming is not critical. If without setting the
PERF_PMU_CAP_SAMPLING flag, AUX events might lose chance to be
re-enabled after throttling.

Thanks,
Leo
