Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906277244BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 15:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672E10E13A;
	Tue,  6 Jun 2023 13:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B910E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686059087; x=1717595087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PaIJytGDdxNgeGTVbZhkwE+nqMUss+3fC+Bsy9FPcPQ=;
 b=XGhVn0t/1PrzNr4Jh99nAlQPdESIwacmFKBsymPuQTuybf8/30VAgp2f
 /gjysQuGhei7gwyM+cLJ4Sa9vutGMzCqESnQ2ytx9vB5CtMGtv1UFVt2Y
 oM53ZuCwQGWvDD/m3kyOkjaR7n5luwxc6cgf5mQWv+TsbyHQGWggy6rGN
 mM7PgiHGgd1e/VtQPsBkRch8waEAuDq1xV60dGo90c/wPALmPv2kZKwIv
 05BGJkluW22BFdNFlOqhVGL06KR0lUX+9mvEteqTZENy3IZ/P61XCGMEQ
 qsPvAeZ7KrbO1wknFrKsv1ZrUXbeTSgVdkiwu7vCMRbFKMNaZdxuApay2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354167952"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="354167952"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778997994"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="778997994"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:44:45 -0700
Date: Tue, 6 Jun 2023 15:44:43 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Message-ID: <20230606134443.GC324119@linux.intel.com>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
 <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
 <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Jun 02, 2023 at 11:30:31AM -0600, Jeffrey Hugo wrote:
> On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
> > If we get signal when waiting for the mmu->lock we do not invalidate
> > current MMU configuration what might result on undefined behavior.
> 
> "that might result in"
> 
> > Additionally there is little or no benefit on break waiting for
> > ipc->lock. In current code base, we keep this lock for short periods.
> 
> What about error cases?  Nothing where say the hardware can be unresponsive
> and a process from userspace is blocked?  Without interruptible(), ctrl+c
> will have no effect.

I believe we do not have any infinite loops while holding the mutexe's,
all loops will end with timeout on unresponsive hardware and sooner or
later SIGINT will be delivered. This time can take quite long on simulated
environment, but in such case we can just break the simulation.

Regards
Stanislaw

