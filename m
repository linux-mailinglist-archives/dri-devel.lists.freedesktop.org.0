Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EB4384AE
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFF06E0E7;
	Sat, 23 Oct 2021 18:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6E6E0E7;
 Sat, 23 Oct 2021 18:23:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10146"; a="216378155"
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="216378155"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:23:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,175,1631602800"; d="scan'208";a="464389724"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2021 11:23:19 -0700
Date: Sat, 23 Oct 2021 11:18:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a
 GT reset in hangcheck selftest
Message-ID: <20211023181838.GA35211@jons-linux-dev-box>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <20211022170356.GA23182@jons-linux-dev-box>
 <070ab480-6306-653c-514a-6648ac495253@intel.com>
 <42cb2c7c-ce69-1cae-6e0c-a1f2b3cd5a67@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42cb2c7c-ce69-1cae-6e0c-a1f2b3cd5a67@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Sat, Oct 23, 2021 at 07:46:48PM +0200, Thomas Hellström wrote:
> 
> On 10/22/21 20:09, John Harrison wrote:
> > And to be clear, the engine reset is not supposed to fail. Whether
> > issued by GuC or i915, the GDRST register is supposed to self clear
> > according to the bspec. If we are being sent the G2H notification for an
> > engine reset failure then the assumption is that the hardware is broken.
> > This is not a situation that is ever intended to occur in a production
> > system. Therefore, it is not something we should spend huge amounts of
> > effort on making a perfect selftest for.
> 
> I don't agree. Selftests are there to verify that assumptions made and
> contracts in the code hold and that hardware behaves as intended / assumed.
> No selftest should ideally trigger in a production driver / system. That
> doesn't mean we can remove all selftests or ignore updating them for altered
> assumptions / contracts. I think it's important here to acknowledge the fact
> that this and the perf selftest have found two problems that need
> consideration for fixing for a production system.
> 

I'm confused - we are going down the rabbit hole here.

Back to this patch. This test was written for very specific execlists
behavior. It was updated to also support the GuC. In that update we
missed fixing the failure path, well because it always passed. Now it
has failed, we see that it doesn't fail gracefully, and takes down the
machine. This patch fixes that. It also openned my eyes to the horror
show reset locking that needs to be fixed long term.

> > 
> > The current theory is that the timeout in GuC is not quite long enough
> > for DG1. Given that the bspec does not specify any kind of timeout, it
> > is only a best guess anyway! Once that has been tuned correctly, we
> > should never hit this case again. Not ever, Not in a selftest, not in an
> > end user use case, just not ever.
> 
> ..until we introduce new hardware for which the tuning doesn't hold anymore
> or somebody in a two years wants to lower the timeout wondering why it was
> set so long?

If an engine reset fails in the GuC, the GuC signals the i915 via a G2H
that the engine reset has failed and i915 initiates a full GT reset.
After this patch (which removes hacky behavior to block foreign,
relative to the test, resets) we can see the i915 behaving correctly and
the GPU recovering. This path in the code is working as designed. Do you
have test for that behavior, no. Can we? No at the moment as we would
need a way for the GuC to intentionally fail a engine reset. Right now
all we have is either flaky HW or GuC isn't waiting long enough. 

As far as why the engine reset fails - I am currently working with the
GuC team to get a firmware with a configurable timeout period so we can
root cause the engine failure. Figures crossed we are just not waiting
long enough rather than a HW issue.

Regardless of everything above, this patch is correct to unblock CI in
the short term and is correct in the long term too as this test
shouldn't bring down CI when it fails.

Matt

> 
> /Thomas
> 
> 
