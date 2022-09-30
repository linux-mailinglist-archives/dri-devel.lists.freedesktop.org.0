Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840895F0E76
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E1010ED4C;
	Fri, 30 Sep 2022 15:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE12B10ED55;
 Fri, 30 Sep 2022 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664550601; x=1696086601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=33ck28zDomSo1GtlXqvigs79si3EFvQUGqtynOtDxqA=;
 b=fIAgsXjfWow0RovJtSQGAlyCi+85gb9BwGfIuJOuIQblVSJ5bb7LXXBg
 /Q6AKep15BAkS+dVqdVVsp6KRkqgGsc8WL6XTTSciZYY4P0B59g46HFBn
 OZemurpTNBqCpOExb8At4wCobrldmemxkVT2NdkvDk9B9jyLM+CeACXLI
 3pvmWIIYGF4q/0aPRQ+iZcRO/G7OflpELAVTcxyNlrFLvKWCJ1BowAwPV
 uFORRhDrgzDkJtEu6EGHtFovO5LhXg/MDPjslgaT+AMEFcqkZEzLONUDr
 xzha7/FmyfLUhW1i+irmFbzSGJAt9WIite3BeG9JZxJOcVSkhwahg0cn8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="328595515"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="328595515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 08:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="600441522"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="600441522"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga006.jf.intel.com with SMTP; 30 Sep 2022 08:09:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 18:09:55 +0300
Date: Fri, 30 Sep 2022 18:09:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Message-ID: <YzcGw9myJotLRTVl@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yzb6203nHF8fVH/W@intel.com>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 05:19:07PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 30, 2022 at 04:52:56PM +0300, Ville Syrjälä wrote:
> > On Thu, Sep 29, 2022 at 06:43:15PM +0000, Simon Ser wrote:
> > > This series adds support for DRM_MODE_PAGE_FLIP_ASYNC for atomic
> > > commits, aka. "immediate flip" (which might result in tearing).
> > > The feature was only available via the legacy uAPI, however for
> > > gaming use-cases it may be desirable to enable it via the atomic
> > > uAPI too.
> > > 
> > > - Patchwork: https://patchwork.freedesktop.org/series/107683/
> > > - User-space patch: https://github.com/Plagman/gamescope/pull/595
> > > - IGT patch: https://patchwork.freedesktop.org/series/107681/
> > 
> > So no tests that actually verify that the kernel properly rejects
> > stuff stuff like modesets, gamma LUT updates, plane movement,
> > etc.?
> 
> Pondering this a bit more, it just occurred to me the current driver
> level checks might easily lead to confusing behaviour. Eg. is
> the ioctl going to succeed if you ask for an async change of some
> random property while the crtc disabled, but fails if you ask for
> the same async property change when the crtc is active?
> 
> So another reason why rejecting most properties already at
> the uapi level might be a good idea.

And just to be clear this is pretty much what I suggest:

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 79730fa1dd8e..471a2c703847 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1392,6 +1392,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 				goto out;
 			}
 
+			if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC &&
+			    prop != dev->mode_config.prop_fb_id) {
+				drm_mode_object_put(obj);
+				ret = -EINVAL;
+				goto out;
+			}
+
 			if (copy_from_user(&prop_value,
 					   prop_values_ptr + copied_props,
 					   sizeof(prop_value))) {


That would actively discourage people from even attempting the
"just dump all the state into the ioctl" approach with async flips
since even the props whose value isn't even changing would be rejected.

-- 
Ville Syrjälä
Intel
