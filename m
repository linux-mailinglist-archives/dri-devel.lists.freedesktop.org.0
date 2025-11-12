Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA47C521FB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A02210E6FE;
	Wed, 12 Nov 2025 11:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3S4dT2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFCB10E6F9;
 Wed, 12 Nov 2025 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762948596; x=1794484596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AVUD6eSuWEjv4InZpwk+lcJ+65UeuGzOmw6/FJ3aLZo=;
 b=g3S4dT2VNUSp9jpZH9kYkEnHW/y6EYWFXEXBgrMp71DsO6TLbP7kDdT1
 P8evlI1XZhvq91QQqafFn97Nyuib13Jq64R8ac5JacTQhQ2/0nfyunWU6
 D4CB0noE8n9esTYvDSMr0Y0SWuPb6svLbXydleuBTxFO+jq9VZ1VHOJxU
 itY5m9NJ9v2QDQhZlsotMx7A9AvoZI41mMjycjz6V5H3L8P560ZGTuqpQ
 aHfxSaGXmDxA1oWz66z/1Gj3Jnn0LVNXsUIXt5xhndtO6vkQ7G2KRRyk7
 7H2R7IEq3+dFC8hNKNADjuOUBnzeebyrM3cWBWq91zSWkQkVsN/lJV16M g==;
X-CSE-ConnectionGUID: ZhJWEu8+Sfu0Vc/iDgH2Qw==
X-CSE-MsgGUID: P1srKvFsRPSjlQmB6DuRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467752"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76467752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 03:56:36 -0800
X-CSE-ConnectionGUID: 2LsT2KlWTIy87Mona4VpBA==
X-CSE-MsgGUID: AvTSvI+aRWu9PcN6/I8sHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="193323520"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.223.106])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 03:56:34 -0800
Date: Wed, 12 Nov 2025 13:56:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/24] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
Message-ID: <aRR171myQR6TvTIM@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
 <2a20632181adc85a737b0a87dce7e753ff8d5b0d.1762791343.git.jani.nikula@intel.com>
 <bcdc1246-d589-4769-b89f-d779ac4984b2@suse.de>
 <acce5e2b3827d8dfa12e571f8a4dfef475f7f232@intel.com>
 <aRNdpcS79vWmeuHL@intel.com>
 <3388028ad51de9b229cc39a24f657e327c14cc2e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3388028ad51de9b229cc39a24f657e327c14cc2e@intel.com>
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

On Wed, Nov 12, 2025 at 10:26:15AM +0200, Jani Nikula wrote:
> On Tue, 11 Nov 2025, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Nov 11, 2025 at 10:43:15AM +0200, Jani Nikula wrote:
> >> On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> > Am 10.11.25 um 17:17 schrieb Jani Nikula:
> >> >> Use the higher level function where crtc is available.
> >> >>
> >> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >
> >> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> >
> >> > Is there a long-term plan to replace drm_vblank_crtc() entirely? 
> >> > Otherwise this looks a bit pointless.
> >> 
> >> Well, almost entirely. There are a few cases (plus the one that Ville
> >> mentioned later in the series) that need to operate on dev + pipe
> >> alone. The main point is that when you have a crtc and use that for the
> >> source of pipe, you don't have to do range checks on the pipe. This
> >> becomes gradually more evident in the series.
> >
> > I've actaully been thinking about doing the exact opposite.
> > Ie. switch drm_vblank.c over to drm_vblank_crtc completely.
> >
> > That is one of those things that might help with implementing
> > pipe/crtc virtualization in i915. We basically want all interrupt
> > stuff (including vblanks) to be tied to our hardware pipes and
> > not the uapi drm_crtc. So we'd make drm_vblank_crtc==pipe, and
> > introduce some kind of dynamic drm_crtc<->drm_vblank_crtc mapping
> > for the uapi facing parts of drm_vblank.c...
> 
> Ugh, so you're saying the series at hand is counter-productive?

No, I think it's fine for the most part. The only worry would be
anything that starts to depend on drm_crtc rather than drm_vblank_crtc,
but I don't think you had a lot of that.

-- 
Ville Syrjälä
Intel
