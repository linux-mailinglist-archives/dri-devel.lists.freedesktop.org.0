Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C972B36156
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 15:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC110E660;
	Tue, 26 Aug 2025 13:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="etY5PLFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946710E65C;
 Tue, 26 Aug 2025 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JHZTLFlxAYI1wokhjuCEuruyUylGu43DM7IKjkNYSic=; b=etY5PLFfHvVwRjOXszye/DGGB6
 EeDfwhUfPBBHElGIuEt4CBRy1AldhAFBccZnj543K6AV4Xvqq6pcdNIfqcf1J9sqxP9GTv1Rld421
 0AuJKLh2CRWDkm+Ul9/DFHMDYluLA3AIkv78pFeyA09fvuZwxu6ukwM8cR1N29k6qKImuFZmW3MMM
 qCVOi9ccAynQbDiNrFS78BcReEN5xdvzHPhO4NkOVApB1RYQ/p8auBap2lsOA66RFcIqiEM+p/Jrp
 EIJVtCqUjQE/N3Tepz7e+3E78hAlvb2elxzZDQC0yDBfD4BGP9yDnTXc67Vd2CW73P1jADDmWRbp0
 QXd2jvjA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uqtPb-00000002DYZ-2cEd; Tue, 26 Aug 2025 13:08:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id A98B6300323; Tue, 26 Aug 2025 15:08:30 +0200 (CEST)
Date: Tue, 26 Aug 2025 15:08:30 +0200
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
Subject: Re: [PATCH 17/19] perf: Retire PERF_PMU_CAP_NO_INTERRUPT
Message-ID: <20250826130830.GZ4067720@noisy.programming.kicks-ass.net>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32bf39943eef7c7f516d814d749cdbe322eec204.1755096883.git.robin.murphy@arm.com>
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

On Wed, Aug 13, 2025 at 06:01:09PM +0100, Robin Murphy wrote:
> Now that we have a well-defined cap for sampling support, clean up the
> remains of the mildly unintuitive and inconsistently-applied
> PERF_PMU_CAP_NO_INTERRUPT. Not to mention the obvious redundancy of
> some of these drivers still checking for sampling in event_init too.

Ah, clearly I should've read the next patch... n/m.
