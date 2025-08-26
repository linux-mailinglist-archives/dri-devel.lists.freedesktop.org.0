Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7DB360BE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 15:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0121310E654;
	Tue, 26 Aug 2025 13:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="s5T3h8Qu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C8610E661;
 Tue, 26 Aug 2025 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pe5SE8cLTPPyLKyF6S5l44TjxJSycuwoPwH53Hc4MBc=; b=s5T3h8QunORHMVi1lJq+TueBjc
 cEFljtvjN5QJ03jRIuUbqZT2dzYWLCkq7EIgZ1HjiZepKSvKZUS4jhIftbJpUomzAxLkXpo4MhYIl
 ZCvpLQBdWeqllwk2L5LEakNCj50aVxzY1I5n8BnO+qCbmyfysUZaBrevf4ZwX/NHQuj2PrtwGK3Is
 jhSt6FlQLnGrrRwVWOG3VEhB1mGDJu+1EhbkwSGhAG25rhQM5DyWklhsvsXQh2tW5FYLoYbc8dttl
 tsa9sX+EEmcEbn/jBCdJY0wOlh7GZntWiVjKPlxT8hw9CmspDWHiAZfhSZSTIR8f/mKGoVnI/OKYV
 DfymEZ2w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uqtKk-00000002CWx-1CxP; Tue, 26 Aug 2025 13:03:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id E7FAC3002C5; Tue, 26 Aug 2025 15:03:29 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:03:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mingo@redhat.com, will@kernel.org, mark.rutland@arm.com,
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
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
Message-ID: <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
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

On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> It may have been different long ago, but today it seems wrong for these
> drivers to skip counting disabled sibling events in group validation,
> given that perf_event_enable() could make them schedulable again, and
> thus increase the effective size of the group later. Conversely, if a
> sibling event is truly dead then it stands to reason that the whole
> group is dead, so it's not worth going to any special effort to try to
> squeeze in a new event that's never going to run anyway. Thus, we can
> simply remove all these checks.

So currently you can do sort of a manual event rotation inside an
over-sized group and have it work.

I'm not sure if anybody actually does this, but its possible.

Eg. on a PMU that supports only 4 counters, create a group of 5 and
periodically cycle which of the 5 events is off.

So I'm not against changing this, but changing stuff like this always
makes me a little fearful -- it wouldn't be the first time that when it
finally trickles down to some 'enterprise' user in 5 years someone comes
and finally says, oh hey, you broke my shit :-(

