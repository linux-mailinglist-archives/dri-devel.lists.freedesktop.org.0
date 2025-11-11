Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED51C4EE72
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D18310E623;
	Tue, 11 Nov 2025 16:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDa9k4+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD5810E611;
 Tue, 11 Nov 2025 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762876844; x=1794412844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ezwp7FKQzQQ4EuqMTBJO86ttBFMAlheVE/TQQKcZsik=;
 b=hDa9k4+x9R2iHKBKxpFv0zKtZOavlbEKjpwS7TNdHoWUQQAwSFwZqRdm
 Iud+s3bTix5hrpr+cJljVOdwkSYp+97Ox0RI0LiNwl6+VH6UhpGD1KWRn
 isWTynO2mRv65U8H0VT2cNQiUpDFHqmOg/cpi1ERnJyongnz2ZyzhhtwB
 QCNs6E1bKIAmc1l9KJFGtXntaIW/XHDRxpp4nDFl2zOScaBjCzWVbRCBA
 oFdR45BM1OFxrjZiI9tpAM4KXGZtYUsYcGGA/Lx2xetgDXgbVD6ofvQ5i
 2Rbq4lBjvus+TZXb+UZTOmbuaHAgUgaUZBMKECrQOFUXYYSPD/ejR8QNV w==;
X-CSE-ConnectionGUID: xDXD3tffTZWFVSWzCtkqDQ==
X-CSE-MsgGUID: DqZ57dseTX6fp43GBOHqYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75240070"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="75240070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:00:44 -0800
X-CSE-ConnectionGUID: AckXOcNoQOKvStd18mP5mQ==
X-CSE-MsgGUID: MRlnE7nUTa2golu0RtPdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188255454"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.124.223.47])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:00:40 -0800
Date: Tue, 11 Nov 2025 18:00:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/24] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
Message-ID: <aRNdpcS79vWmeuHL@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
 <2a20632181adc85a737b0a87dce7e753ff8d5b0d.1762791343.git.jani.nikula@intel.com>
 <bcdc1246-d589-4769-b89f-d779ac4984b2@suse.de>
 <acce5e2b3827d8dfa12e571f8a4dfef475f7f232@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acce5e2b3827d8dfa12e571f8a4dfef475f7f232@intel.com>
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

On Tue, Nov 11, 2025 at 10:43:15AM +0200, Jani Nikula wrote:
> On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 10.11.25 um 17:17 schrieb Jani Nikula:
> >> Use the higher level function where crtc is available.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Is there a long-term plan to replace drm_vblank_crtc() entirely? 
> > Otherwise this looks a bit pointless.
> 
> Well, almost entirely. There are a few cases (plus the one that Ville
> mentioned later in the series) that need to operate on dev + pipe
> alone. The main point is that when you have a crtc and use that for the
> source of pipe, you don't have to do range checks on the pipe. This
> becomes gradually more evident in the series.

I've actaully been thinking about doing the exact opposite.
Ie. switch drm_vblank.c over to drm_vblank_crtc completely.

That is one of those things that might help with implementing
pipe/crtc virtualization in i915. We basically want all interrupt
stuff (including vblanks) to be tied to our hardware pipes and
not the uapi drm_crtc. So we'd make drm_vblank_crtc==pipe, and
introduce some kind of dynamic drm_crtc<->drm_vblank_crtc mapping
for the uapi facing parts of drm_vblank.c...

-- 
Ville Syrjälä
Intel
