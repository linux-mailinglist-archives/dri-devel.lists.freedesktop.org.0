Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65570C267
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C53310E35E;
	Mon, 22 May 2023 15:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94010E35A;
 Mon, 22 May 2023 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684769441; x=1716305441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1h58ZQUHXGC1ZaEIX3g8910ZlYcctBJnyEpWq7xsxqM=;
 b=gZ6rW49y4Q/LLAMi9Vq4JAJ2ToUeyJUlvPhqIE6xeAUqXhNrUbCFiDRX
 4zUzzWlk6+gkvTa1E9RvARqEOHbbWgdOXIsBJt1Dd2sztG8ZuJcVQpa7N
 8fnmq6YKIEpRksLS3BkV9jdvvV1HMY7jGZTHGwMb8JIyytyNrHLGH6Brj
 IA443RpXcBlwKetLMml5Tqi4QnG90RWzRn9vtsKEAfv+Z9w9CqgVi8Q1K
 2j+FuF6Mr5L23a+6LZ9tPTCTvyD1Rhu9Hv9xghq0PSfo68qZdXvMkN1aU
 a/2o35i/mooP1FhF7iVNTUIu2yPAx+C0KYZ9KPMe77wIjoCbcFBYDJIAk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="418661090"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="418661090"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 08:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="847869060"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="847869060"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 08:30:29 -0700
Date: Mon, 22 May 2023 17:30:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [PATCH v10 2/2] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZGuKk2N7Q+/usqZK@ashyti-mobl2.lan>
References: <20230519051103.3404990-1-fei.yang@intel.com>
 <20230519051103.3404990-3-fei.yang@intel.com>
 <ZGtXmBh42oLIxcyi@ashyti-mobl2.lan>
 <168476913389.1509813.15102550159463496187@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168476913389.1509813.15102550159463496187@jljusten-skl>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, fei.yang@intel.com, rohan.garg@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > To comply with the design that buffer objects shall have immutable
> > > cache setting through out their life cycle, {set, get}_caching ioctl's
> > > are no longer supported from MTL onward. With that change caching
> > > policy can only be set at object creation time. The current code
> > > applies a default (platform dependent) cache setting for all objects.
> > > However this is not optimal for performance tuning. The patch extends
> > > the existing gem_create uAPI to let user set PAT index for the object
> > > at creation time.
> > > The new extension is platform independent, so UMD's can switch to using
> > > this extension for older platforms as well, while {set, get}_caching are
> > > still supported on these legacy paltforms for compatibility reason.
> > > 
> > > Test igt@gem_create@create_ext_set_pat posted at
> > > https://patchwork.freedesktop.org/series/117695/
> > > 
> > > Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> > > 
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > > Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> > 
> > last call for comments and reviews on this patch. If nothing
> > comes I am going to push it tomorrow morning (Europe).
> > 
> > There is also a merge request from Mesa pending on this so that I
> > don't want to keep it hanging any longer.
> 
> No need to wait any longer with regard to feedback from Mesa.
> 
> I definitely was hoping for more consideration of the userspace
> request, but it's been decisively rejected. My ack was not readily
> given, but it stands.

Thanks, Jordan!

> -Jordan
