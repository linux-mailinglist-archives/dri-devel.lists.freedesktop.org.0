Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBF727784
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909910E58F;
	Thu,  8 Jun 2023 06:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370710E591
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686206601; x=1717742601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fI40wiaR+0iKkpEJJfv/U0ZRi4pghOiYPOHiJGHp8V0=;
 b=AXcpL6GZ8U0Dgrmrd1WU1TpbYk3Lw8SoMPH/LxN9FFcPciYqcPd84qQA
 VPs0r6+Y5rBXrVBP2Z5CNVErFnAsdfhmFZcH2FmgoKGNpRXmwbvPXPKYG
 VbMsBnhH6meNrgMRkxnuda3hhkzmnCOEVAcre6HlhmLaPzSWkuRlsiLHb
 DD6wQVG0nyesCHUhTO1In0JMsaJH7JCyP8w7Zt/PEiG4WoTkhR+QX4MFP
 jwnJ/vm/QnUeJslPs07C/Y6KAzdTfDp65pcoksLwgAJhX7OK9Q0V8bc57
 VXz2nfWANbRTuWJnOcrnd33L9ZVAydx34TaWCOhRgPgF9nEIgEOn0s20C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360560083"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360560083"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="834043511"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="834043511"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:43:18 -0700
Date: Thu, 8 Jun 2023 08:43:15 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Message-ID: <20230608064315.GI324119@linux.intel.com>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
 <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
 <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
 <20230606134443.GC324119@linux.intel.com>
 <b8f3b911-a883-272c-b2ac-d57e10318f75@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f3b911-a883-272c-b2ac-d57e10318f75@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 08:50:52AM -0600, Jeffrey Hugo wrote:
> On 6/6/2023 7:44 AM, Stanislaw Gruszka wrote:
> > Hi
> > 
> > On Fri, Jun 02, 2023 at 11:30:31AM -0600, Jeffrey Hugo wrote:
> > > On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
> > > > If we get signal when waiting for the mmu->lock we do not invalidate
> > > > current MMU configuration what might result on undefined behavior.
> > > 
> > > "that might result in"
> > > 
> > > > Additionally there is little or no benefit on break waiting for
> > > > ipc->lock. In current code base, we keep this lock for short periods.
> > > 
> > > What about error cases?  Nothing where say the hardware can be unresponsive
> > > and a process from userspace is blocked?  Without interruptible(), ctrl+c
> > > will have no effect.
> > 
> > I believe we do not have any infinite loops while holding the mutexe's,
> > all loops will end with timeout on unresponsive hardware and sooner or
> > later SIGINT will be delivered. This time can take quite long on simulated
> > environment, but in such case we can just break the simulation.
> 
> Ok, then I'm not missing anything.  It does look like all the hardware
> interactions have short timeouts.  Feels odd to me to avoid interruptible()
> in user context, but I don't see anything that is wrong based on the code
> today.

In this context it should not matter much, because we hold locks for
short periods But we have also wait_event_interruptible_timeout(),
which I want to get rid of as well, because we can free and reuse
memory that could still be used by FW, if we break that wait_event. 
And solving this differently will require much complication, which I
don't really want goto into. I will need to think about that ...

Anyways thanks for the insights, appreciated.

Regards
Stanislaw
