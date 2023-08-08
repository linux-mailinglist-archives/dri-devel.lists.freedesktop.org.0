Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C577392A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7A10E3D0;
	Tue,  8 Aug 2023 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1482E10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691484743; x=1723020743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ehafZ6S74HPtDluSaa8+k6sLP4BNigO57pi1poTWHk=;
 b=nS2NV9ZjnNzDIDFRIJQ73NlSWsYG0gU8UJpph3CYBEOddu+58MMONDwF
 7sZP+SSsu5ApS5HG74AHWufQtsaEgHvgfVXTT0y6XAiRzymDaXGRpZ/ZY
 AMGpxOrLSJtL9t0nFiUeDxE0p6C6FhWX3Fpijn+IDph8Fmk1mb4sSuCm0
 xVRIU00i5I7KrjrCJv/mmBacAV7D5rcqa2dfB22KC8+BLwYSxrT/7HLr2
 nTHLI10hgVbhSjMf2vCtLJMoz72RmnM70DwBsseBMSKafbEZLeILRCZ++
 OHoRINHhVr8jPkFtjKdfvKCnn5jje0rS5wTE/pEaYHzAXV3jyXypsCGOd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360854892"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="360854892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 01:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681168851"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="681168851"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 01:52:21 -0700
Date: Tue, 8 Aug 2023 10:52:19 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Message-ID: <20230808085219.GA3049188@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
 <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
 <20230803083737.GA3023441@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803083737.GA3023441@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 10:37:37AM +0200, Stanislaw Gruszka wrote:
> > Seems like we might want to decide this now, because if we define a iVPU
> > specific ioctl as proposed here, but then switch to an Accel-wide mechanism
> > later, iVPU is going to be stuck supporting both.
> 
> For the record, we do not add new ioctl in this patch, we just extend
> existing DRM_IOCTL_IVPU_GET_PARAM one.

To avoid confusion, I'll change the topic and commit massage
before applying:

accel/ivpu: Extend get_param ioctl to identify capabilities

Add DRM_IVPU_PARAM_CAPABILITIES parameters to get_param ioctl to query
driver capabilities. For now use it for identify metric streamer and
new dma memory range features. Currently upstream version of intel_vpu
does not have those, they will be added it the future.

Regards
Stanislaw
