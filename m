Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D089B77C9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 10:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6F10E2D5;
	Thu, 31 Oct 2024 09:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="sFOG+idh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326210E2D5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7KDYcR2EWRkw7tyRb76XkWQQeArKRw2kIE2yXeLOiHs=; b=sFOG+idhqxoAbcciVhEFREAZQJ
 YVqz728H3JSheP6FzP3hfVBQrHJIk8AhNZlUwPIy0dDgZ9Y9yULtWX5mWpmatx56puu1HndXPziZF
 FBxN6bnlBNJaspSgMJ0ZIGtF9YxtZcbIRVbZiEY0AOs0RzZ8mqwQ39Xpzmqi7P6+ZeUu7OgkSsOwd
 rcGEWbTauLbwKzcie2QXhh6Ayct5rX3rYYboewMzfvMBHG1/6rRg0ppnz4xWcK8ewWvTu+DAPaOkn
 w8A/tJTFAjQK0WFs5/dMncjT9/t34/RPequoYVby0dwtL7xzjmZkKq4ZMmkmPg907q1TljgM388a6
 E+U2s1xw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t6RkV-0000000EXmg-3PVg; Thu, 31 Oct 2024 09:45:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id C3C3C300599; Thu, 31 Oct 2024 10:45:51 +0100 (CET)
Date: Thu, 31 Oct 2024 10:45:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <20241031094551.GT14555@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
 <20241016120302.GP33184@noisy.programming.kicks-ass.net>
 <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
 <20241022215210.GA31953@noisy.programming.kicks-ass.net>
 <aj62ufd6pjv74bhxsynyxvir3s5jdncsljczoucdjvibfkglp4@22nc72qnhpa2>
 <kouwyypgqthwklgdlckavoasu3bbjmustsxp3sncztztijmykd@djnbwa4sm4wz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kouwyypgqthwklgdlckavoasu3bbjmustsxp3sncztztijmykd@djnbwa4sm4wz>
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

On Thu, Oct 31, 2024 at 12:07:42AM -0500, Lucas De Marchi wrote:
> On Wed, Oct 23, 2024 at 12:07:58AM -0500, Lucas De Marchi wrote:
> > On Tue, Oct 22, 2024 at 11:52:10PM +0200, Peter Zijlstra wrote:
> > > On Fri, Oct 18, 2024 at 02:46:31PM -0500, Lucas De Marchi wrote:
> > > 
> > > > I will give this a try with i915 and/or xe.
> > > 
> > > Less horrible version here:
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
> > > 
> > > I've just pushed it out to the robots, but it builds, passes perf test
> > > and your dummy_pmu testcase (for me, on my one testbox and .config
> > > etc..)
> > 
> > It passed for me as well with both dummy_pmu and with i915. I have some
> > changes to igt (i915/xe testsuite) that should bring some more coverage.
> > I minimized the pending test changes I had and posted to trigger CI:
> > 
> > https://patchwork.freedesktop.org/series/140355/
> 
> Our CI also didn't trigger that pmu issue and the test could run
> succesfully.

Excellent.

> I did get a report from kernel test robot though:
> 
> https://lore.kernel.org/all/202410281436.8246527d-lkp@intel.com/

Yeah, I think I fixed that one, but the robot gifted me another one that
I still need to find time to address. I'm hoping this weel.

I'll repost properly once I fix it.

Thanks!
