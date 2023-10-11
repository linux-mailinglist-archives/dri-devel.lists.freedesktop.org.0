Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC67C58DE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C1C10E52E;
	Wed, 11 Oct 2023 16:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Wed, 11 Oct 2023 15:12:56 UTC
Received: from outbound-smtp16.blacknight.com (outbound-smtp16.blacknight.com
 [46.22.139.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0910E928
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 15:12:56 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
 by outbound-smtp16.blacknight.com (Postfix) with ESMTPS id
 770971C580D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:07:27 +0100 (IST)
Received: (qmail 21105 invoked from network); 11 Oct 2023 15:07:27 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.197.19])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 11 Oct 2023 15:07:27 -0000
Date: Wed, 11 Oct 2023 16:07:25 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: high IRQ latency due to pcp draining
Message-ID: <20231011150725.mmntnlcycwzvw54q@techsingularity.net>
References: <da2d50228d70da212741da9ac475d7a75d356877.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da2d50228d70da212741da9ac475d7a75d356877.camel@pengutronix.de>
X-Mailman-Approved-At: Wed, 11 Oct 2023 16:08:00 +0000
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
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 03:25:54PM +0200, Lucas Stach wrote:
> Hi all,
> 

Hi Lucas,

> recently I've been looking at inconsistent frame times in one of our
> graphics workloads and it seems the culprit lies within the MM
> subsystem. During workload execution sporadically some graphics
> buffers, which are typically single digit megabytes in size, are freed.
> The pages are freed via __folio_batch_release from drm_gem_put_pages,
> which means they are put on the pcp and drained back into the zone via
> free_pcppages_bulk.
> 
> As the buffers are quite large even a single free triggers the batching
> optimization added in 3b12e7e97938 ("mm/page_alloc: scale the number of
> pages that are batch freed"), as there is a huge number of pages that
> get freed without any intervening allocations. The pcp for the normal
> zone on this system has a high watermark of 614 pages and batch of 63,
> which means that the batching optimizations will drive up the number of
> pages freed per batch to 551 pages.
> As the cost per page free (including tracing overhead, which isn't
> negligible on this small ARM system) is around 0.7µs and the batch free
> is done with zone spinlock held and IRQs disabled, this leads to
> significant IRQ disabled times of upwards of 250µs even in the
> production system without tracing. Those long IRQ disabled sections do
> interfere with the workload of the system.
> 

Ouch.

> As the larger free batching was added on purpose I don't want to rip it
> out altogether. But then there are also no tuneables aside from the pcp
> high watermark, which may have other unintended side effects.
> 
> I'm hoping to get some ideas on how to proceed here. Should we consider
> a more conservative maximum of pages for the batching optimization?

Picking a different default on its own will simply end up changing what gets
punished and for different reasons. While it would address your problem,
it might be harder to get merged without being identified as a problem
via bisection.

> Should another tunable be added? Or any other clever ideas to minimize
> those critical sections?
> 

I think the first option is to look at the series
https://lore.kernel.org/all/20230920061856.257597-1-ying.huang@intel.com/.
I delayed responding to your mail until I had a chance to look at it properly
but specifically I think
https://lore.kernel.org/all/20230920061856.257597-5-ying.huang@intel.com/
is of interest to you and the comment I added in response had you in
mind https://lore.kernel.org/all/20231011125219.kuoluyuwxzva5q5w@techsingularity.net/

It may be the case that the patch on its own helps with your problem or
at least allows the possibility of making it a runtime configurable or
kconfig option. Which is suitable depends on how and where your kernel
is being deployed. The patches in question have not hit mainline yet and
are only in mm-unstable where they are not guaranteed to be merged, but
there is a strong chance. If the series does not directly help you then
any solution should at least take that series into account.

Even if that patch does not directly help you, patch 3 might accidentally
help you. While there is not a direct correlation between the speed of
a CPU and the size of the cache, there probably is an indirect one in a
lot of cases. If your target CPU has a small cache, your problem may be
accidentally fixed by patches 2+3 from that series.

-- 
Mel Gorman
SUSE Labs
