Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A926C50AE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 17:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A64D10E3C3;
	Wed, 22 Mar 2023 16:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390610E3C3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679502534; x=1711038534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G4MzRzjMulpJ5Vd99GoHlm0096RBRP+4E0+u+35JWbM=;
 b=m6w/FuuKD3Q8/gqZ8Zuo7d24u/3BXqUjIjokMHLVu4FlsVw4MDSzV6pw
 P9bxYspcfuJtu3WeoXd0cRlmSW27sn6slbclHuJmxKUCm5horLeR26orj
 vzCUVbSjhO57TWNcT0SMLi8yj/36AawNVXj76kKe9WFvnlEde9LNRKId6
 Vkyeq5faCo0aEGOO/M7VnWShJlaNOWqRKqe6VM4bSpw5fy6mWjyr4gSqQ
 Y7qpLSax1WAMQ4NLwPYkwQWDLyibcPEWfuJIwPb9XEE1kLFVn818q422y
 ZNT6ggIORPqC9XqwDyUSMPazkNVBnOwD1L++9yrl3+Zu77dBB7vtDMCYu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404152543"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="404152543"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="681960127"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="681960127"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 09:28:50 -0700
Date: Wed, 22 Mar 2023 17:28:48 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 7/7] accel/ivpu: Fix VPU clock calculation
Message-ID: <20230322162848.GC2130371@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-8-stanislaw.gruszka@linux.intel.com>
 <56d8982a-6d86-19d2-74ca-efede0414af7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56d8982a-6d86-19d2-74ca-efede0414af7@quicinc.com>
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

On Wed, Mar 22, 2023 at 08:52:56AM -0600, Jeffrey Hugo wrote:
> On 3/22/2023 3:19 AM, Stanislaw Gruszka wrote:
> > VPU cpu clock frequency depends on the workpoint configuration
> > that was granted by the punit. Previously driver was passing
> > incorrect frequency to the VPU firmware.
> 
> This looks like past tense.  I believe the preference is to use the present
> tense for commit text.  Something like "the driver calculates the wrong
> frequency because it ignores the workpoint config and this causes X.  Fix
> this by using the workpoint config in the freq calculations".

Will do.

> Should this have a fixes tag?  Sounds like this addresses a bug.

Not sure how this is done, but seems all my previous patches for ivpu
have Fixes tag in commit message, even if I did not post the tag in
the patches. Seems to be a feature of drm git tooling and can be
easily done by committer ?

Regards
Stanislaw

