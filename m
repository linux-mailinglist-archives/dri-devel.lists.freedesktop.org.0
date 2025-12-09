Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AEDCAFAD9
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD8110E1CD;
	Tue,  9 Dec 2025 10:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZqtqcZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAD910E1C9;
 Tue,  9 Dec 2025 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765277250; x=1796813250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cQJ6q+t+HQPTF0InR/nsGs1RBO11HdTHKx24l1no36A=;
 b=VZqtqcZ/Zi9+i2zxiS8ZzGRu75z2pziq2GvMJlaEhw34KYUzrvKQLgDR
 OmK8A4X9lCRk2zoYFRgn4nKGnVvN02B89IxiuZJaqqHU/LEJH6guZjV7a
 S9uw17d53wwSlgSzUJ/VeAOgbD+ZfDqY4XmcKZ9VX5v6qrtPKnkjeZiXs
 yeGlJsGvr9PHikrbfkXztERtjC9HN94fzofokvhXmeMcqA9+wEm1Y8+LN
 CbxQqGDfQt/eP1UD9SSu2por6ty17kdRm9Fjhhlcl9Q/NKKbklIVNY9+V
 l6r/NOdCoU1BhNYsW3uPZjhDb4UI4KUqktFkR0Mbe28tdT2oAjCdJYYwy Q==;
X-CSE-ConnectionGUID: NzdELh74Tt6xrUpcSGOZ9Q==
X-CSE-MsgGUID: iFFkegQbREuECnCfSX6P7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67160587"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67160587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:47:29 -0800
X-CSE-ConnectionGUID: hVhXkGH5Tc2xRCYNOXtJ4A==
X-CSE-MsgGUID: SlA4mYZiRAmzVDkL3LVyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="200630801"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 02:47:27 -0800
Date: Tue, 9 Dec 2025 12:47:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Harry.Wentland@amd.com,
 Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <aTf-O8DFcCJPhrPd@intel.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
 <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Dec 09, 2025 at 12:05:31PM +0200, Jani Nikula wrote:
> On Mon, 01 Dec 2025, <sunpeng.li@amd.com> wrote:
> > From: Leo Li <sunpeng.li@amd.com>
> >
> > Some drivers need to perform blocking operations prior to enabling
> > vblank interrupts. A display hardware spin-up from a low-power state
> > that requires synchronization with the rest of the driver via a mutex,
> > for example.
> >
> > To support this, introduce a new drm_crtc_vblank_prepare() helper that
> > calls back into the driver -- if implemented -- for the driver to do
> > such preparation work.
> >
> > In DRM core, call this helper before drm_vblank_get(). Drivers can
> > choose to call this if they implement the callback in the future.
> 
> Have you considered hiding all of this inside drm_vblank.c? Call prepare
> in drm_crtc_vblank_get() and a couple of other places? And actually
> don't call it on !drm_dev_has_vblank(dev)?
> 
> There's just so much littering all over the place with the prepare, and
> it seems brittle. Especially when you expect not only the drm core but
> also the relevant drivers to call drm_crtc_vblank_prepare() when needed.
> 
> There does seem to be a few places in amdgpu that wrap the
> drm_crtc_vblank_get() inside dev->event_lock, but is there really any
> need to do so? Do the get first, and grab the event_lock after?
> 
> Some random comments inline.
> 
> Cc: Ville

drm_vblank_get() can get called from any kind of context.
The only workable solution might be the schedule a work from
.vblank_enable() and do whatever is needed from there.

-- 
Ville Syrjälä
Intel
