Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57505EAB25
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A21710E6ED;
	Mon, 26 Sep 2022 15:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E42410E6F8;
 Mon, 26 Sep 2022 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664206383; x=1695742383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=neI0pHHqjLCVXMfycxXjSFhnAILxBQHzkFKL1CQ2Azc=;
 b=m0L2o+fg77F6/+RsQA3nV2tzgo5TssnkaF8YZeP5hTIMAk+P4dks2AlD
 X8BHnWyPbz+hFKCBBasyyVBSsIdSqVhITojrGN2+ty7kJhStnU1M2X7tC
 Sz++jhGbnn0fuq09bVoJFCl2nh+ZKtiFGVOryO8hpPNCdIcWxspSclbVB
 0M+ZIV3h8zfQ8NavjKXoAkSqLgvDLEJ1JCyeoUr2pNXfXU+OYrrL8UIYc
 pB1EGxJc04pWG7VqETkfvpbbXefEEvh2QjAWaAlOR+Uc9ZP8ut4emXNcj
 993ZX5mu6DNTfi3qzU98iDEUJHseY2n5K4coVqUp4+jsrDFun5LMohRmX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="288197789"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="288197789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="651869066"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="651869066"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 26 Sep 2022 08:32:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 18:32:57 +0300
Date: Mon, 26 Sep 2022 18:32:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/4] drm/atomic: Lockless blocking commits
Message-ID: <YzHGKXUjwZAExVw4@intel.com>
References: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
 <20220920103415.369d3ef4@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920103415.369d3ef4@eldfell>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 10:34:15AM +0300, Pekka Paalanen wrote:
> On Fri, 16 Sep 2022 19:33:27 +0300
> Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > I've talked about making blocking commits lockless a few
> > times in the past, so here's finally an attempt at it.
> > The main benefit I see from this is that TEST_ONLY commits
> > no longer getting blocked on the mutexes by parallel blocking
> > commits.
> > 
> > I have a small test here that spools up two threads,
> > one does just TEST_ONLY commits in a loop, the other
> > does either blocking or non-blocking page flips. Results
> > came out as follows on a snb machine here:
> > 
> > test-only-vs-non-blocking:
> > -85319 TEST_ONLY commits in 2000000 usecs, 23 usecs / commit
> > +87144 TEST_ONLY commits in 2000006 usecs, 22 usecs / commit
> > 
> > test-only-vs-blocking:
> > -219 TEST_ONLY commits in 2001768 usecs, 9140 usecs / commit
> > +82442 TEST_ONLY commits in 2000011 usecs, 24 usecs / commit
> > 
> > Now, I have no idea if anyone actually cares about lack
> > of parallelism due to locked blocking commits or not. Hence
> > Cc'd some compositor folks as well. I guess this is more of
> > an RFC at this point.
> > 
> > Also curious to see if CI goes up in smoke or not...
> 
> Hi Ville,
> 
> thanks for thinking about this. If I understand correctly, the issue
> you are solving here happens only when a blocking commit is underway
> while TEST_ONLY commits are done. This can only happen if userspace
> does the blocking commits from one thread, while another thread is
> doing TEST_ONLY probing on the same DRM device. It is inconsequential
> whether the two threads target distinct CRTCs or same CRTCs.
> 
> If so, this is not a problem for Weston for two reasons:
> 
> - Weston is fundamentally single-threaded, so if it does use a blocking
>   commit, it's not going to do anything else at the same time.
> 
> - Weston practically always uses non-blocking commits.
> 
> I cannot imagine those two facts to change.

I figured that is likely the case. Thanks for confirming.

> 
> Ah, but there is a case: KMS leasing!
> 
> With leasing you have two processes poking distinct CRTCs on the same
> device at the same time. Even if Weston never blocks, an arbitrary
> leasing client might, and I presume that would then stall Weston's
> TEST_ONLY commits.
> 
> I believe working on optimising this could be useful for KMS leasing use
> cases, assuming lessees do blocking commits. I don't know if any do.

Hmm, yeah didn't even think about leasing. Never have really.

The other reason (one I already forgot) I had for this is
drm_private_obj which has its own lock embbedded inside now.
So currently you have to think hard before actually using one
so as to not make everything block on it. With the locks not
held so much maybe drm_private_obj might become more palatable
for some things.

Oh, I guess there might also be some internal commits (or commit
like things) happening in the driver in some cases, such as DP
link retraining. At least with i915 those currently happen with
the locks held, but maybe could also be made lockless. But I
admit that those should be exceedingly rare situations.

-- 
Ville Syrjälä
Intel
