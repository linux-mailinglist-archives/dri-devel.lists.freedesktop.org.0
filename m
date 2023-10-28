Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183757DA5C8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 10:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811310E087;
	Sat, 28 Oct 2023 08:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB3C10E087
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698481336; x=1730017336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xq+eewzdBxGi5gZipCSS9k7mDj0Se3yvHYrV8/xXCpA=;
 b=Lmx8BD2rh9Vn2dE70o/896S4mS2D70exs7oAOzyzq6lwo7NfCsUfAXwP
 jpi7yHlyZ56gaituWUEumBJv08eqkZeNz9DEybwEPsFJasQebOIveGtuc
 gEBxejoPRlWR4qnRHfJcOUXMbtQV1OCeIwD8tJRiELTLjaTy0B07H1rBG
 0D+yQ/il7rzGD9XjgOiztw2x0Aimc4LHiafKkJNiffAHfQA6x55VY1RtM
 RqH/1Uf1cwU8V1n9QZAideGXlzwlzZm3ADG6XazcQfbhYIDGpnGXg63WY
 rsdLW6dVQOywQsnMMUemBDJnXeVPcdLpPeLYrbSiwcRy863I02nnrmE7M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="385092327"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="385092327"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="825593617"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="825593617"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:22:14 -0700
Date: Sat, 28 Oct 2023 10:22:12 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 11/11] accel/ivpu: Wait for VPU to enter idle state after
 D0i3 entry message
Message-ID: <ZTzEtPGRNrGZI++V@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-12-stanislaw.gruszka@linux.intel.com>
 <74227a8f-f89f-ed3d-1d39-ad771801c172@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74227a8f-f89f-ed3d-1d39-ad771801c172@quicinc.com>
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

On Fri, Oct 27, 2023 at 09:09:16AM -0600, Jeffrey Hugo wrote:
> On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> > From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> > 
> > The VPU needs non zero time to enter IDLE state after responding to
> > D0i3 entry message. If the driver does not wait for the VPU to enter
> > IDLE state it could cause warm boot failures.
> > 
> > Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> > Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Should this be squashed into the previous change?  Feels like this is a bug
> fix to an issue that the previous change introduced.

Yes, I can squash those 2 patches.

Regards
Stanislaw
