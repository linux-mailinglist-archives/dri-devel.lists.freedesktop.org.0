Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B157276F6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 07:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ECA10E537;
	Thu,  8 Jun 2023 05:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01E210E537
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 05:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686203968; x=1717739968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Sl73sOaEWgKZ3chOAx8UuPqphgVCkPJC59Vo6kBzHbo=;
 b=hohzbIaRtIoQyOnrDa0JM/uL3BkVp8e6jrtVAnP0RFtdSvs5X8hEjcst
 Lg4dsfZqKCOjBW1pQktbC1xEOlDLTkfIjJ/9PYPGDI1Fx6ujgqDKukMrj
 2VzkkdsIFgadTL0APS1NysWUkOgzvOw7LBiRQvwTVIb2BBSuCbQAliGvJ
 bC35MRLg49fpk+4zg86MeFHIzWLDsSPti5FlgeInDZmYPPsupv8BYtOkt
 rUvYCW7pwKoJTHWnpCkiHNKCCmB3TVCVLtgLQWvIuSoXyh40TexsoQap+
 8HeoSpZyLZpGxekNxdv+MPLE6XG0IVz+V6eaTga1nhmPIjj5HYdya0RbA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385555163"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="385555163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="834030927"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="834030927"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:59:26 -0700
Date: Thu, 8 Jun 2023 07:59:22 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 5/5] accel/ivpu: Mark 64 kB contiguous areas as
 contiguous in PTEs
Message-ID: <20230608055922.GE324119@linux.intel.com>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
 <20230518131605.650622-6-stanislaw.gruszka@linux.intel.com>
 <71225f48-c1fc-9aef-2ef9-94e2ca5b1ab6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71225f48-c1fc-9aef-2ef9-94e2ca5b1ab6@quicinc.com>
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

On Thu, May 18, 2023 at 08:17:02AM -0600, Jeffrey Hugo wrote:
> On 5/18/2023 7:16 AM, Stanislaw Gruszka wrote:
> > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > 
> > Whenever KMD maps region larger than 64kB that is both aligned and
> > contiguous, set contiguous bit (52) in MMU PTE descriptor for each page
> > in that region.
> > 
> > This allows to treat 16 contiguous pages as one and reduce
> > number of MMU page walks required what results in lower latency.
> 
> what -> which

Fixed this and applied the set to drm-misc-next

Thanks
Stanislaw

