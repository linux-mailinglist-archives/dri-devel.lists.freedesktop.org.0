Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055EB7DBC70
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C35010E2F5;
	Mon, 30 Oct 2023 15:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7810E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698678814; x=1730214814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eoIJl8UnE5v1mmbK0DZLQOvumduNGYpw3BaKSO7dqJs=;
 b=oHruL7HbgsOCB5Bj/I9XGypDHsvLOwa9YLfs0efG2gkKF0SDZ/olt2aq
 TohHX+AOnS1vZxAleejhDObMqwHXdTZbOKtPjX60s+nuIZF/KomUxuzFR
 SQwS3Pn7vrKy2AoGyDeMfic05LW/Mte8cAUMi27bxbDlvoWNfZVwmLI/r
 rXQaUcTKhAPYLaPh9tXx69v/m3ID9xFpmaC2+GuJgoChEDMIT265FKPTK
 Ptsk2ChzqkPXb8azZYmwc2OBrSXGZkytgjTV1YkzH4QOWTGdmx/EIl9zu
 +0krV4Vmvl0c8UyewabHEHoNkfe63+VT3vA9t5J0ABcCHvujC1Vidzo3x w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="452348459"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="452348459"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="877160704"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="877160704"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 08:07:34 -0700
Date: Mon, 30 Oct 2023 16:07:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 06/11] accel/ivpu: Change test_mode module param to bitmask
Message-ID: <ZT/GtISVeWQuRjBa@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-7-stanislaw.gruszka@linux.intel.com>
 <e53dabb3-e8ec-b033-60f0-462f6e225e51@quicinc.com>
 <ZTzD364/1CC736AE@linux.intel.com>
 <f11d2815-71cd-224b-01e1-365a560e9208@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f11d2815-71cd-224b-01e1-365a560e9208@quicinc.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 08:05:28AM -0600, Jeffrey Hugo wrote:
> On 10/28/2023 2:18 AM, Stanislaw Gruszka wrote:
> > On Fri, Oct 27, 2023 at 08:47:11AM -0600, Jeffrey Hugo wrote:
> > > On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> > > > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > > > 
> > > > Change meaning of test_mode module parameter from integer value
> > > > to bitmask allowing setting different test features with corresponding
> > > > bits.
> > > > 
> > > > Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > > > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > 
> > > Seems like this changes the uAPI.  You still haven't made a release of the
> > > userspace, correct?
> > 
> > Yes the user space is not yet released. However I think module parameter
> > is not considered part of the linux kernel uAPI and there are no guaranties
> > regarding not changing or removing or change the semantics.
> 
> Patch 3 of [1] seems to suggest otherwise (module parameters are part of the
> uAPI)

I hope it will not be applied :-) Will be quite burden to maintain module
parameters compatibility.

Regards
Stanislaw

