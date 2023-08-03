Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649776E34B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A393C10E5D5;
	Thu,  3 Aug 2023 08:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CA110E5D5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691051915; x=1722587915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rUqrXsCO/ioEbCU4w5fq00GGoaiUPSgY0Ko1fdhm+2s=;
 b=Gfj0C2iO4chtFzT+T4CzaNGPiUQnjDubUFwjWxH7SocM9av02wSLw/ol
 rxYoJOVoQn2Wo8qKTFGQOuJhJ68G5mYVwJ8EpAjLezvpsOcf0wwM4IZSR
 cjlcecQ5x8E3mIDq/BbVfXV1IkzI7/VfaLHjnsqXhzBkSH7laFgykOrVP
 IpXMf87kHKgxMfcgEixDzgcgGudI/pwtoG5AdYZjpwTaZ3lb08pf5vAvr
 I0TzQ9SsLNO5r/edHjp987dzJie33MWYyyZBjXHoAoDdiXSLcZQHLeLZ/
 1rbfHTrTfzRc38SacftwvzziFUj/UJZQWvzWg3OmVra93E4Ti3C00BiGI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368712886"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="368712886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="723143816"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="723143816"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:37:39 -0700
Date: Thu, 3 Aug 2023 10:37:37 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Message-ID: <20230803083737.GA3023441@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
 <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
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

Hi

On Wed, Aug 02, 2023 at 11:07:09AM -0600, Jeffrey Hugo wrote:
> On 7/31/2023 10:12 AM, Stanislaw Gruszka wrote:
> > Add DRM_IVPU_PARAM_CAPABILITIES ioctl to query driver capabilities.
> > For now use it for identify metric streamer and new dma memory range
> > features. Currently upstream version of intel_vpu does not have those,
> > they will be added it the future.
> 
> Hmm.  So I happened to remember this from Oded in the reviews for the first
> iVPU series -
> 
> "btw, I talked to Daniel about this and he told me this
> major/minor/patchlevel is legacy in drm and should be deprecated, so
> I'm going to send a patch to document that it is deprecated and how to
> use getcap ioctl to find out the features the driver support."
> 
> So, I went to look at DRM_IOCTL_GET_CAP and it feels like something you
> should be using as it fits the purpose I see in this patch, but also I don't
> see how given that it doesn't hook to the driver.

Indeed it does not have such extension. I considered DRM_IOCTL_GET_CAP, but
did not use it because of that. Seems that DRM drivers that need provide
set of capabilities just create own "getcap" ioctl.

> I suspect at some point, QAIC would have its own need for a "getcap" API.
> Feels like something we should have a common entry in uAPI for
> (ACCEL_IOCTL_GET_CAP ? ), but I don't yet see that we'll have a lot a
> commonality of the capabilities across Accel drivers.  I don't think the DRM
> method of globally defined caps is useful for Accel.
> 
> Does it make sense to have a framework level ioctl, but something that calls
> into the drivers and would allow the drivers to advertise custom
> capabilities?

Perhaps such thing would make sense, resembles to me ethtool for network
devices. But not sure, maybe just having separate ioctls per driver and one
common for common features is simpler.

> Seems like we might want to decide this now, because if we define a iVPU
> specific ioctl as proposed here, but then switch to an Accel-wide mechanism
> later, iVPU is going to be stuck supporting both.

For the record, we do not add new ioctl in this patch, we just extend
existing DRM_IOCTL_IVPU_GET_PARAM one.

> What do you think?

My understating was that this is more like design patter, i.e. drivers
that have to advertise supported features should not use minor/major
numbers but "getcap" ioctl. And that not necessary mean we should have
common ioctl for that for all ACCEL/DRM drivers.

Regards
Stanislaw
