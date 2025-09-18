Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E031B35A4F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 12:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3935210E2E5;
	Tue, 26 Aug 2025 10:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5325310E2E5;
 Tue, 26 Aug 2025 10:46:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A06821A25;
 Tue, 26 Aug 2025 03:46:15 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8000D3F694;
 Tue, 26 Aug 2025 03:46:14 -0700 (PDT)
Date: Tue, 26 Aug 2025 11:46:10 +0100
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
Subject: Re: [PATCH 01/19] perf/arm-cmn: Fix event validation
Message-ID: <aK2QclH4jlHJ28EJ@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
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

Hi Robin,

On Wed, Aug 13, 2025 at 06:00:53PM +0100, Robin Murphy wrote:
> In the hypothetical case where a CMN event is opened with a software
> group leader that already has some other hardware sibling, currently
> arm_cmn_val_add_event() could try to interpret the other event's data
> as an arm_cmn_hw_event, which is not great since we dereference a
> pointer from there... Thankfully the way to be more robust is to be
> less clever - stop trying to special-case software events and simply
> skip any event that isn't for our PMU.

I think this is missing some important context w.r.t. how the core perf
code behaves (and hence why this change doesn't cause other problems).
I'd suggest that we give the first few patches a common preamble:

| When opening a new perf event, the core perf code calls
| pmu::event_init() before checking whether the new event would cause an
| event group to span multiple hardware PMUs. Considering this:
| 
| (1) Any pmu::event_init() callback needs to be robust to cases where
|     a non-software group_leader or sibling event targets a distinct
|     PMU.
| 
| (2) Any pmu::event_init() callback doesn't need to explicitly reject
|     groups that span multiple hardware PMUs, as the core code will
|     reject this later.

... and then spell out the specific issues in the driver, e.g.

| The logic in arm_cmn_validate_group() doesn't account for cases where
| a non-software sibling event targets a distinct PMU. In such cases,
| arm_cmn_val_add_event() will erroneously interpret the sibling's
| event::hw as as struct arm_cmn_hw_event, including dereferencing
| pointers from potentially user-controlled fields.
|
| Fix this by skipping any events for distinct PMUs, and leaving it to
| the core code to reject event groups that span multiple hardware PMUs.

With that context, the patch itself looks good to me.

This will need a Cc stable. I'm not sure what Fixes tag is necessary;
has this been broken since its introduction?

Mark.

> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm-cmn.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 11fb2234b10f..f8c9be9fa6c0 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1652,7 +1652,7 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
>  	enum cmn_node_type type;
>  	int i;
>  
> -	if (is_software_event(event))
> +	if (event->pmu != &cmn->pmu)
>  		return;
>  
>  	type = CMN_EVENT_TYPE(event);
> @@ -1693,9 +1693,6 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
>  	if (leader == event)
>  		return 0;
>  
> -	if (event->pmu != leader->pmu && !is_software_event(leader))
> -		return -EINVAL;
> -
>  	val = kzalloc(sizeof(*val), GFP_KERNEL);
>  	if (!val)
>  		return -ENOMEM;
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
