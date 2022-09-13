Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFF5B6A3E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51310E68C;
	Tue, 13 Sep 2022 09:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFE910E69B;
 Tue, 13 Sep 2022 09:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663059871; x=1694595871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eXJHPM5bFFbK9+IDs/tF7qRV4uE9ZPju71CgpinOXZg=;
 b=lksyGzVvV1ypKBXkIb7Xv7Z875ND8caHzHKOGBAXZqdeANTwKnzHtKtS
 PIJJWecWnYT+8020bPLbW+OIv0CMqWvbdJv2M6+iPuhSG/A39dgsp5QVo
 7INdETzAKMlkXV2sVsZhBij4VrKSLIfaSRONx65omuBIP24l/D8ISOTgr
 M0fp0w391IFFkrNf0ZjPw3WUpGZtdYrPpTvU/i6lJlJ/p3u1Fr4M1F6vQ
 /E89tOLKZZF5wFPFd1vqcdLsHopv91e26+dmIasvLAgYMKYCO8Lq8L26R
 D/eWpanQYVSceok82TfS705JzxwAEGz2CAaiXQqvcXzryfVmgbIdpb00k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298090032"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="298090032"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 02:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="678478832"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 13 Sep 2022 02:04:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Sep 2022 12:04:18 +0300
Date: Tue, 13 Sep 2022 12:04:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
Message-ID: <YyBHkmeIy5VD36u1@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220823112920.352563-1-jouni.hogander@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 02:29:16PM +0300, Jouni Högander wrote:
> Currently damage clips handling is broken for planes when using big
> framebuffer + offset in case kms driver adjusts drm_plane_state.src
> coords. This is because damage clips are using coords relative to
> original coords from user-space.
> 
> This patchset is fixing this by using original
> coords from user-space instead of drm_plane_state.src when iterating
> damage_clips.
> 
> v2: Modify drm unit tests accordingly
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Maíra Canal <mairacanal@riseup.net>
> 
> Jouni Högander (4):
>   drm: Use original src rect while initializing damage iterator
>   drm/i915/display: Use original src in psr2 sel fetch area calculation
>   drm/i915/display: Use drm helper instead of own loop for damage clips
>   drm/tests: Set also mock plane src_x, src_y, src_w and src_h

Do these need to be applied into the same tree, or can
the drm vs. i915 stuff go in separately?

> 
>  drivers/gpu/drm/drm_damage_helper.c           | 11 ++++++----
>  drivers/gpu/drm/i915/display/intel_psr.c      | 20 +++++++------------
>  .../gpu/drm/tests/drm_damage_helper_test.c    |  5 +++++
>  3 files changed, 19 insertions(+), 17 deletions(-)
> 
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
