Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A36C6608
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD9310E098;
	Thu, 23 Mar 2023 11:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2211310E098
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679569309; x=1711105309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ckAkm/rXiR7jzy//2/SC67KBJL8CLzBkEB5PNmyDaYU=;
 b=GmSM1hiUHoGFYlaLD010vQWvd6RF4gDxHGtSEesd4dhwDo+xppjR0aml
 w9F7R42IC6UXqDrwDIo23dM3OQPGm7M+v3hynryCIUc+By4zqIFlgVIux
 3Axd39CI5Vtg/F+kYzUFf3XKxVe6m3SZfIalVMVfTeMkJ6nIGdgjZY/0B
 iqTqRSKPiPnepVLG6mo2P0BPLQweDZlooK8x45tzIYPes7a0BG5ogvCOq
 rok42l1gU9ASoHJbf2zvt4Z3w3+7sSfQsEQ+kDE4QbQc0iIOt9ez1Eme/
 MQwf5ih5VKlSOyLHhvKnqiMIjn/UKYKgpEO+8HGwXyPpEuRercRuc+J1m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323303021"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="323303021"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632356327"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="632356327"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:00:49 -0700
Date: Thu, 23 Mar 2023 12:00:47 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 7/7] accel/ivpu: Fix VPU clock calculation
Message-ID: <20230323110047.GE2130371@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-8-stanislaw.gruszka@linux.intel.com>
 <56d8982a-6d86-19d2-74ca-efede0414af7@quicinc.com>
 <20230322162848.GC2130371@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322162848.GC2130371@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 05:28:48PM +0100, Stanislaw Gruszka wrote:
> On Wed, Mar 22, 2023 at 08:52:56AM -0600, Jeffrey Hugo wrote:
> > On 3/22/2023 3:19 AM, Stanislaw Gruszka wrote:
> > > VPU cpu clock frequency depends on the workpoint configuration
> > > that was granted by the punit. Previously driver was passing
> > > incorrect frequency to the VPU firmware.
> > 
> > This looks like past tense.  I believe the preference is to use the present
> > tense for commit text.  Something like "the driver calculates the wrong
> > frequency because it ignores the workpoint config and this causes X.  Fix
> > this by using the workpoint config in the freq calculations".
> 
> Will do.
> 
> > Should this have a fixes tag?  Sounds like this addresses a bug.
> 
> Not sure how this is done, but seems all my previous patches for ivpu
> have Fixes tag in commit message, even if I did not post the tag in
> the patches. Seems to be a feature of drm git tooling and can be
> easily done by committer ?

Tags were added by Jacek,  I'll add them to the patchset then.

Regards
Stanislaw
