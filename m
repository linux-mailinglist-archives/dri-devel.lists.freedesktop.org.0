Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE34206EF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A69E6E94E;
	Mon,  4 Oct 2021 08:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402FE6E17D;
 Mon,  4 Oct 2021 08:01:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="311528379"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="311528379"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 01:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="482808264"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 04 Oct 2021 01:01:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 11:01:01 +0300
Date: Mon, 4 Oct 2021 11:01:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2 00/17] drm: cleanup: Use
 DRM_MODESET_LOCK_ALL_* helpers where possible
Message-ID: <YVq0vZgFUpSXEBFh@intel.com>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com>
 <20211001204815.GA2515@art_vandelay> <YVeGOyLzuhN7zzV7@intel.com>
 <YVfEWaLfYWdhezCa@intel.com>
 <YVgGklsHT5fkavDL@zacax395.localdomain>
 <YViWomXZWdy/81uT@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YViWomXZWdy/81uT@zacax395.localdomain>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 02, 2021 at 07:28:02PM +0200, Fernando Ramos wrote:
> On 21/10/02 09:13AM, Fernando Ramos wrote:
> > On 21/10/02 05:30AM, Ville Syrjälä wrote:
> > > On Sat, Oct 02, 2021 at 01:05:47AM +0300, Ville Syrjälä wrote:
> > > > On Fri, Oct 01, 2021 at 04:48:15PM -0400, Sean Paul wrote:
> > > > > On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrjälä wrote:
> > > > > > On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > > > > > > 
> > > > > > > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > > > > > > with the necessary drm-tip conflict resolutions).
> > > > > > 
> > > > > > Ugh. Did anyone actually review the locking changes this does?
> > > > > > I shot the previous i915 stuff down because the commit messages
> > > > > > did not address any of it.
> > > > > 
> > > > > I reviewed the set on 9/17, I didn't see your feedback on that thread.
> > > > 
> > > > It was much earlir than that.
> > > > https://lists.freedesktop.org/archives/dri-devel/2021-June/313193.html
> 
> Sorry, I'm new to this and it did not occur to me to search for similar patches
> in the mailing list archives in case there were additional comments that applied
> to my change set.
> 
> In case I had done that I would have found that, as you mentioned, you had
> already raised two issues back in June:
> 
>     On Tue, Jun 29, 2021, Ville Syrjälä wrote:
>     >
>     > That looks wrong. You're using a private ctx here, but still
>     > passing dev->mode_config.acquire_ctx to the lower level stuff.
>     > 
>     > Also DRM_MODESET_LOCK_ALL_{BEGIN,END}() do not seem to be
>     > equivalent to drm_modeset_{lock,unlock}_all() when it comes to 
>     > mode_config.mutex. So would need a proper review whether we
>     > actually need that lock or not.
> 
> The first one was pointing out the same error I would later repeat in my patch
> series (ups).
> 
> After further inspection of the code it looks to me that changing this:
> 
>     intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
> 
> ...into this:
> 
>     intel_modeset_setup_hw_state(dev, &ctx);
> 
> ...would be enough.

Yes.

> 
> Why? The only difference between the old drm_modeset_{lock,unlock}_all()
> functions and the new DRM_MODESET_LOCK_ALL_{BEGIN,END}() macros is that the
> former use a global context stored in dev->mode_config.acquire_ctx while the
> latter depend on a user provided one (typically in the stack).
> 
> In the old (working) code the global context structure is freed in
> drm_modeset_unlock_all() thus we are sure no one is holding a reference to it at
> that point. This means that as long as no one accesses the global
> dev->mode_config.acquire_ctx context in the block that runs between lock/BEGIN
> and unlock/END, the code should be equivalent before and after my changes.
> 
> In fact, now that my patch series removes the drm_modeset_{lock,unlock}_all()
> functions, the acquire_ctx field of the drm_mode_config structure should be
> deleted:
> 
>     /**
>      * @acquire_ctx:
>      *
>      * Global implicit acquire context used by atomic drivers for legacy
>      * IOCTLs. Deprecated, since implicit locking contexts make it
>      * impossible to use driver-private &struct drm_modeset_lock. Users of
>      * this must hold @mutex.
>      */
>     struct drm_modeset_acquire_ctx *acquire_ctx;
> 
> If I had done that (ie. removing this field) I would have detected the problem
> when compiling.
> 
> There is another place (in the amdgpu driver) where this field is still being
> referenced, but before I investigate that I would like to know if you agree that
> this is a good path to follow.

Yeah, removing the mode_config.acquire_ctx is a good idea if it's
no longer needed.

> 
> Regarding the second issue you raised...
> 
>     > Also DRM_MODESET_LOCK_ALL_{BEGIN,END}() do not seem to be
>     > equivalent to drm_modeset_{lock,unlock}_all() when it comes to 
>     > mode_config.mutex. So would need a proper review whether we
>     > actually need that lock or not.
> 
> ...the only difference regarding mode_config.mutex I see is that in the new
> macros the mutex is locked only under this condition:
> 
>     if (!drm_drv_uses_atomic_modeset(dev))
> 
> ...which seems reasonable, right? Is this what you were referring to or is it
> something else?

In order to eliminate the lock one first has to determine what that lock
might be protecting here, and then prove that such protection is not
actually needed.

-- 
Ville Syrjälä
Intel
