Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1A6A71D5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 18:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672C10E338;
	Wed,  1 Mar 2023 17:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C04C10E34B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677690506; x=1709226506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TSRL946VCrVcN13ijj0Qy0zPtQX22bNXoJ0kYvHRn2U=;
 b=LuRzHbxvJQxkLXQCydwcVLjlitS/lG2x1cr5rSShS+OtacKCi6ft1xeS
 e7dX6jUwp6FfwXHW30XX/XPiwoWl6j1SumMITtwiCKsy7KAJ8u2+5kpvR
 vvnERWPsHwU2Cw1miJ7PjoY34AmNqhnS0/WBWCpMp8xd5TyylY2s1nXlQ
 F0rohK8rGdTbDsHrxhQB3kr/mpSaCSnGF84N/2p3LOUEMMF0Ix28Qrxtt
 Nk3Z34Qa9Mg4wHwLL1ZpL6fUzHcfnsNDZ9q6uWRa15TG+foslOJ78FIBD
 TKsgGbIhQEkyeSN27D4uDfQVIWPF0ew6Ym1fxWJ5gU2JLM58E1Tzfxv0q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="314885440"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="314885440"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 09:05:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738703536"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="738703536"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 09:05:16 -0800
Date: Wed, 1 Mar 2023 18:05:14 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Message-ID: <20230301170514.GB3963532@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
 <20230227171454.GF3547587@linux.intel.com>
 <83543d98-e624-fadc-7f92-490efa602805@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83543d98-e624-fadc-7f92-490efa602805@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 01, 2023 at 09:08:03AM -0700, Jeffrey Hugo wrote:
> > This looks a bit suspicious. Are you sure you can modify
> > sg->dma_address and still use it as valid value ?
> 
> A single entry in the sg table is a contiguous mapping of memory.  If it
> wasn't contiguous, it would have to be broken up into multiple entries.  In
> the simple case, a driver is going to take the dma_address/len pair and hand
> that directly to the device.  Then the device is going to access every
> address in that range.
> 
> If the device can access every address from dma_address to dma_address +
> len, why can't it access a subset of that?

Required address alignment can be broken. Not sure if only that.

> > > Are you suggesting renaming
> > > this function?  I guess I'm not quite understanding your comment here. Can
> > > you elaborate?
> > 
> > Renaming would be nice. I was thinking by simplifying it, not sure
> > now if that's easy achievable, though.
> 
> Ok.  I'll think on this.

Maybe this function could be removed ? And create sg lists
that hardware can handle without any modification.
Just idea to consider, not any requirement.

Regards
Stanislaw
