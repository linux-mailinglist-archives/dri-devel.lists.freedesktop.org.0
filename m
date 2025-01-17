Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C2A14E7F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 12:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3871B10EAD0;
	Fri, 17 Jan 2025 11:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNyhJPE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9E110EAD0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737113553; x=1768649553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AfDGpHESyc1zgDyFDFxzT4DuGT0R/BIGxgTzd17JmLs=;
 b=PNyhJPE0W+I6IJvi4YmbUAjq+DdFOFmM594uFZWYDFlM9/WhqTI3TFwc
 6MaFJaf/uGZ7UM+8e30fyua2IbYFQhvnWopwVAYISPi6jaPYmJubkxrMG
 f40Vm/Wg8ZXGvASnhDvbSdqIFrvjC0P7Ai9KKgkRjNATArnN/dzgACFpG
 r40TTLSkFRyUqcrUWQcLpojWY104Q+kVK1/1IoNXtEpoKV3EGNyrXBot/
 FAFuT69nHZdLDygIZ279h9hQ3OXE71FtN53chDxrjjPCyYkT0riVZumUQ
 8S6zni4u2X6SOWVpZg32M7PnL+WQbBPd3cMO2t4yGaBBzudfkHCrrUY/G A==;
X-CSE-ConnectionGUID: ANCRALzqTWm1aadn+8iS2A==
X-CSE-MsgGUID: NM+RfAAARpWOtXm8EvNXVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37454494"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37454494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 03:32:33 -0800
X-CSE-ConnectionGUID: zyUisJjVSgm4qN8pfEJjZw==
X-CSE-MsgGUID: eRVSpHkqRGScfSUOe8aRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="105968500"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 17 Jan 2025 03:32:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Jan 2025 13:32:30 +0200
Date: Fri, 17 Jan 2025 13:32:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <Z4o_zteNVH6gqn2h@intel.com>
References: <20250116162528.2235991-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116162528.2235991-1-contact@emersion.fr>
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

On Thu, Jan 16, 2025 at 04:25:35PM +0000, Simon Ser wrote:
> It's not obvious off-hand which CRTCs will get a page-flip event
> when using this flag in an atomic commit, because it's all
> implicitly implied based on the contents of the atomic commit.
> Document requirements for using this flag and
> 
> Note, because prepare_signaling() runs right after
> drm_atomic_set_property() calls, page-flip events are not delivered
> for CRTCs pulled in later by DRM core (e.g. on modeset by
> drm_atomic_helper_check_modeset()) or the driver (e.g. other CRTCs
> sharing a DP-MST connector).
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: David Turner <david.turner@raspberrypi.com>
> ---
>  include/uapi/drm/drm_mode.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..a122bea25593 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -962,6 +962,14 @@ struct hdr_output_metadata {
>   * Request that the kernel sends back a vblank event (see
>   * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
>   * page-flip is done.
> + *
> + * When used with atomic uAPI, one event will be delivered per CRTC included in
> + * the atomic commit. A CRTC is included in an atomic commit if one of its
> + * properties is set, or if a property is set on a connector or plane linked
> + * via the CRTC_ID property to the CRTC. At least one CRTC must be included,
> + * and all pulled in CRTCs must be either previously or newly powered on (in
> + * other words, a powered off CRTC which stays off cannot be included in the
> + * atomic commit).

I don't understand all this stuff about powered off crtcs? If 
someone sucks in a powered off thing then things will generally
work just fine.

There is a bit of corner case with the way we internally complete
the commits for disabled things (not just crtcs, but also planes
and connectors) and that can apparently happen a bit later than
the commit completion for the enabled things. That seems to be
causing a bit of grief for sway which insists on adding all kinds
of disabled planes to every commit:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13410

-- 
Ville Syrjälä
Intel
