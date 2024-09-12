Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4FE976A99
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2110EB87;
	Thu, 12 Sep 2024 13:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yg25aqL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2B10EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726147827; x=1757683827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OnAHtlModD3HN9QVHtPCU0r+HMeTJuzd7Va2+Q7poGg=;
 b=Yg25aqL2OubA2Nx5t+SMYVUzebcCaxwzLXghQ40cY/CNvhiX7Ww1/5yW
 e1P81glTJUP9XoESZmOPI2yQ8fN7UqhGsUqKRQQq88RU1Cerx/yWeXoLk
 2CVDBPTd5VI/FD1wG00qM9s6UsTfEKUjfYoLAYLJ6wpB6IWEg4dSA7uVS
 Mbwh99jIGXGOsOZDMq1bK7d5mO3Sodgr4ZQg9UZO0w4cjDNFwqQXc2PDx
 /u0o/ttr/mm2nk3WChkpI7NTbfY5vVXQlxopmKWvNrKaxQ02BZc8Wjutl
 h0ACdsysIToJpV118ojFlN2I/5bh3rpzWClC+zVneUqdDceq4K6wyRfXh w==;
X-CSE-ConnectionGUID: 3nktFJO9SViAUMgMG+LFCw==
X-CSE-MsgGUID: IpYkIS6RQL+CjEPjT0nDwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36137176"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="36137176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:30:24 -0700
X-CSE-ConnectionGUID: LLYuoqszQKyQO++59u7nwA==
X-CSE-MsgGUID: fPlCJ5yBTaWUWXmka/MJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67784955"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Sep 2024 06:30:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Sep 2024 16:30:18 +0300
Date: Thu, 12 Sep 2024 16:30:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tejas Vipin <tejasvipin76@gmail.com>,
 Laurent.pinchart@ideasonboard.com, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Message-ID: <ZuLs6squDEHUKJS-@intel.com>
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de>
 <87o74ti7g5.fsf@intel.com>
 <42b27020-a68e-4c43-800e-61977324be78@suse.de>
 <871q1pi5i3.fsf@intel.com>
 <f360d860-e02b-4751-b55d-6a078b261a7f@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f360d860-e02b-4751-b55d-6a078b261a7f@suse.de>
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

On Thu, Sep 12, 2024 at 01:08:06PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.09.24 um 11:30 schrieb Jani Nikula:
> > On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >> Hi
> >>
> >> Am 12.09.24 um 10:48 schrieb Jani Nikula:
> >>> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>> Hi
> >>>>
> >>>> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
> >>>>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
> >>>>> monitor HDMI information is available after EDID is parsed. Additionally
> >>>>> rewrite the code the code to have fewer indentation levels.
> >>>> The problem is that the entire logic is outdated. The content
> >>>> of cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detect_ctx
> >>>> callback should be set to drm_connector_helper_detect_from_ddc() and
> >>>> cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx
> >>>> will detect the presence of a display and ->get_modes will update EDID
> >>>> and other properties.
> >>> I guess I didn't get the memo on this one.
> >>>
> >>> What's the problem with reading the EDID at detect? The subsequent
> >>> drm_edid_connector_add_modes() called from .get_modes() does not need to
> >>> read the EDID again.
> >> With drm_connector_helper_detect_from_ddc() there is already a helper
> >> for detection. It makes sense to use it. And if we continue to update
> >> the properties in detect (instead of get_modes), what is the correct
> >> connector_status on errors? Right now and with the patch applied, detect
> >> returns status_disconnected on errors. But this isn't correct if there
> >> actually is a display. By separating detect and get_modes cleanly, we
> >> can detect the display reliably, but also handle errors better than we
> >> currently do in gma500. Get_modes is already expected to update the EDID
> >> property, [1] for detect it's not so clear AFAICT. I think that from a
> >> design perspective, it makes sense to have a read-only function that
> >> only detects the physical state of the connector and a read-write
> >> function that updates the connector's properties. Best regards Thomas
> >> [1]
> >> https://elixir.bootlin.com/linux/v6.10.9/source/include/drm/drm_modeset_helper_vtables.h#L865
> > So what if you can probe DDC but can't actually read an EDID of any
> > kind? IMO that's a detect failure.
> 
> Not being able to read the EDID is not a failure IMHO. It's better to 
> report a detected display and only provide minimal support, than to 
> outright reject it. The display is essential for most users being able 
> to use the computer at all, so it's often better to display something at 
> lower quality than display nothing at all.
> 
> >
> > Or how about things like CEC attach? Seems natural to do it at
> > .detect(). Doing it at .get_modes() just seems wrong. However, it needs
> > the EDID for physical address.
> >
> > I just don't think one size fits all here.
> 
> The good thing about the EDID probe helpers is that it only reads a 
> minimal amount of data, like a single byte or the EDID header, so 
> something like that. Many drivers poll the DDC every 10 seconds via 
> ->detect. Which means that code running in ->detect possibly runs 
> concurrently to other DRM operations, such as page flips. Hence, 
> ->detect can interfere with the driver's hot path. The call to 
> ->get_modes usually only runs after the connector status changes to 
> connected, which rarely happens. It's also not time critical as no 
> modeset has happened yet.

I don't see how you can really optimize polling with this because
the only way to figure out if the EDID changed is to read it.

Anyways, my gut feeling is that we need things in .detect()
because that's also where DPCD is read, and we defintiely need that
to do anything sensible. And dongles can also snoop the EDID reads
and I think even potentially change their DPCD based on that, so
having that go out of sync by skipping the EDID read might end up
with weird behaviour.

-- 
Ville Syrjälä
Intel
