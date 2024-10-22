Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73D9AB905
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F18510E211;
	Tue, 22 Oct 2024 21:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="pwLNbUVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218610E211
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hZaaZxezYJoPjgvUIQ46ARJxZfsSw3SrOrxGEnlPJV4=; b=pwLNbUVPP/BuC0hUfq5oCm5rm3
 NrhmhwwsjsH1NT3DeO8npLVkd5zH7P6lwik62WRkFztWgcJWYLjz3enRDtAjBaOHqwPPVn4lSrWPj
 GIkfnuEsmtd7a/31DfPj0gElM/iSGGzHcPedLrL0RjzJbRCY/GiVzMLzzwv2weIVJuLkNEfUxHAso
 8+VHiDPrdef0oiQPaCbrHAgDJ02vufYpHj1IFOJNqobZr1mLUKPcdmns8uzAj1BZsuZrE9k3jW8wT
 8o1nw0nzni2TIFtfxAyi5c9gGw2Hrr8AIgSCJpCyqBCg0oGBWF66kwiUhIhpSODi7u8yr4e1VY3yE
 nfdlwUoQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t3MnT-000000024qp-0OXY; Tue, 22 Oct 2024 21:52:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id CB76130073F; Tue, 22 Oct 2024 23:52:10 +0200 (CEST)
Date: Tue, 22 Oct 2024 23:52:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <20241022215210.GA31953@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
 <20241016120302.GP33184@noisy.programming.kicks-ass.net>
 <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
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

On Fri, Oct 18, 2024 at 02:46:31PM -0500, Lucas De Marchi wrote:

> I will give this a try with i915 and/or xe.

Less horrible version here:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister

I've just pushed it out to the robots, but it builds, passes perf test
and your dummy_pmu testcase (for me, on my one testbox and .config
etc..)

I'll let it sit with the robots for a few days and if they don't
complain I'll post it.

Thanks!
