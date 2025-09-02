Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C93B406B0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA9C10E753;
	Tue,  2 Sep 2025 14:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZCs+V7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7AC10E753
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756823279; x=1788359279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SgoVGE0nvwzHp4yiQ79SeUmtMRue7DoGWu8+GcPVz6Y=;
 b=YZCs+V7+CuTnWfGPa1uFhgGMHFjCvIhlcKTDNycDS9WMllOb3vUeVp1/
 CkzNLLNe2c4kZjgBP2nN5OzdL+Upc8yWBb3kBu/V8x0uUMA+d78CHo8zF
 o+ZuCFgxOReB+vfv8Iuc3DvDc5waN5MbiYmksnh8Gq9yzh3Vd30ZQaMsg
 3a7thlpJfWEElGaRrEUVy34RVxDjdd+r4MGN9YUTB/tFAE4ZUfNBVRBGQ
 IW0zqTBOeSP139i25DnwEioYhMcDuJ4lfhY9HjIAWu+uiWiFOcyPqLb93
 DrP2FZEs6JSBI5w5D47e/m06DNemrSvBc3CXDUYLK2j466g3a5sM/o1ll w==;
X-CSE-ConnectionGUID: qCB91wwdSgu5M6+pw/+YMw==
X-CSE-MsgGUID: 89lVeUm0TZivinVZJSjglQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70480819"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70480819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 07:27:59 -0700
X-CSE-ConnectionGUID: fatX4FH7Tx66qXDZpCTUgQ==
X-CSE-MsgGUID: RLHLx8mvSp+cm653lO8tug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176601919"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.118])
 by orviesa005.jf.intel.com with SMTP; 02 Sep 2025 07:27:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 Sep 2025 17:27:54 +0300
Date: Tue, 2 Sep 2025 17:27:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 36/37] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
Message-ID: <aLb-6ikKRwIUQe6o@intel.com>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-36-de98fc5f6d66@kernel.org>
 <tmph723nw4bdmekhgvgrcyk6hngu7dw5stajeiskmaugfdhfa2@bcmbqpzeavy4>
 <aLb723DdsIC2jTva@intel.com>
 <pc2ux3nerxltc5h5g6cdyh5tgfrnh75j7i2edzc572og2zx2ws@623doofedid4>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pc2ux3nerxltc5h5g6cdyh5tgfrnh75j7i2edzc572og2zx2ws@623doofedid4>
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

On Tue, Sep 02, 2025 at 05:17:24PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 05:14:51PM +0300, Ville Syrjälä wrote:
> > On Tue, Sep 02, 2025 at 04:25:12PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, Sep 02, 2025 at 11:35:35AM +0200, Maxime Ripard wrote:
> > > > The drm_atomic_get_private_obj_state() function tries to find if a
> > > > private_obj had already been allocated and was part of the given
> > > > drm_atomic_state. If one is found, it returns the existing state
> > > > pointer.
> > > > 
> > > > At the point in time where drm_atomic_get_private_obj_state() can be
> > > > called (ie, during atomic_check), the existing state is the new state
> > > > and we can thus replace the hand-crafted logic by a call to
> > > > drm_atomic_get_new_private_obj_state().
> > > 
> > > 
> > > This function is being used in e.g. this call stack:
> > > ingenic_drm_crtc_atomic_enable -> ingenic_drm_get_priv_state ->
> > > drm_atomic_get_private_obj_state(). Please correct me if I'm wrong,
> > > doesn't it happen already after the state switch?
> > 
> > Looks like it should just use the get_new_state() there.
> > 
> > Hmm, I wonder if we should make the get_state() functions warn
> > (and maybe return NULL) if they get called after the state has
> > been swapped?
> 
> Might be.
> 
> Note: I just quickly git grepped the function and stumbled upon the
> first questionable use. There might be uther users which call it after
> swapping the state.

I tried to have a quick look at all the callers and didn't spot
other obviously wrong uses, but I can't guarantee that I didn't
miss some by accident.

> 
> > 
> > > 
> > > > 
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> 
> -- 
> With best wishes
> Dmitry

-- 
Ville Syrjälä
Intel
