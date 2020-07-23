Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8D22B51B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 19:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2236E2D7;
	Thu, 23 Jul 2020 17:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976E6E2D7;
 Thu, 23 Jul 2020 17:44:10 +0000 (UTC)
IronPort-SDR: Grw6GeDzqg6YLDk5VR6YBPJHsFsiiInI/G3dDQxuAeGPs76aBznqCIE566Xj7aYAlCsrZHvEve
 Sh5+OLpYHDKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="130664632"
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="130664632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 10:44:09 -0700
IronPort-SDR: qoDZPp8xaBOFuq8BdYHacEb11LDbs/vj66/URjxsNfr5myN8nr/LqL2N4HUSA2SvLpJwgXlG9N
 21tyO8bxADPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,387,1589266800"; d="scan'208";a="328639284"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga007.jf.intel.com with ESMTP; 23 Jul 2020 10:44:09 -0700
Received: from orsmsx121.amr.corp.intel.com (10.22.225.226) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 23 Jul 2020 10:44:09 -0700
Received: from orsmsx163.amr.corp.intel.com ([169.254.9.101]) by
 ORSMSX121.amr.corp.intel.com ([169.254.10.71]) with mapi id 14.03.0439.000;
 Thu, 23 Jul 2020 10:44:09 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/i915/gem: Move context decoupling from
 postclose to preclose
Thread-Topic: [PATCH 2/3] drm/i915/gem: Move context decoupling from
 postclose to preclose
Thread-Index: AQHWYRW0ju6h2xQdSEex8T/aQszD5akVbtQQ
Date: Thu, 23 Jul 2020 17:44:08 +0000
Message-ID: <1D440B9B88E22A4ABEF89F9F1F81BC290117BC5431@ORSMSX163.amr.corp.intel.com>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <20200723172119.17649-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200723172119.17649-2-chris@chris-wilson.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Thursday, July 23, 2020 10:21 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Chris Wilson <chris@chris-wilson.co.uk>;
> Tang, CQ <cq.tang@intel.com>; Vetter, Daniel <daniel.vetter@intel.com>;
> stable@vger.kernel.org
> Subject: [PATCH 2/3] drm/i915/gem: Move context decoupling from
> postclose to preclose
> 
> Since the GEM contexts refer to other GEM state, we need to nerf those
> pointers before that state is freed during drm_gem_release(). We need to
> move i915_gem_context_close() from the postclose callback to the preclose.
> 
> In particular, debugfs likes to peek into the GEM contexts, and from there
> peek at the drm core objects. If the context is closed during the peeking, we
> may attempt to dereference a stale core object.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: CQ Tang <cq.tang@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.c
> b/drivers/gpu/drm/i915/i915_drv.c index 5fd5af4bc855..15242a8c70f7 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1114,11 +1114,15 @@ static void i915_driver_lastclose(struct
> drm_device *dev)
>  	vga_switcheroo_process_delayed_switch();
>  }
> 
> +static void i915_driver_preclose(struct drm_device *dev, struct
> +drm_file *file) {
> +	i915_gem_context_close(file);
> +}
> +
>  static void i915_driver_postclose(struct drm_device *dev, struct drm_file
> *file)  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> 
> -	i915_gem_context_close(file);
>  	i915_gem_release(dev, file);

Now we separate i915_gem_context_close() from i915_gem_release() and other freeing code in postclose(), is there any side effect to allow code to run in between?
Can we move all postclose() code into preclose()?

--CQ

> 
>  	kfree_rcu(file_priv, rcu);
> @@ -1850,6 +1854,7 @@ static struct drm_driver driver = {
>  	.release = i915_driver_release,
>  	.open = i915_driver_open,
>  	.lastclose = i915_driver_lastclose,
> +	.preclose  = i915_driver_preclose,
>  	.postclose = i915_driver_postclose,
> 
>  	.gem_close_object = i915_gem_close_object,
> --
> 2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
