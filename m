Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8435383BEDE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 11:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673810F88A;
	Thu, 25 Jan 2024 10:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E810F882;
 Thu, 25 Jan 2024 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706178768; x=1737714768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zCOT4jByjYRQOwy8cdwIUFw1Xl/m54aWsDvK0r9pbHs=;
 b=jRrYL5jeSaVVhlbFhQIbBHAmkdKPkbKC1BpvYYr37nKH0yPNBkfxx07v
 8kAKC1A0y1qb0QH2NOEIKgGO2yC2CGCk+dJBG9mGqsUpmqpTsztMvosZJ
 6Ya3qafod7TYS+hmf2DOn8XMkZ3fgdi2bi1/Qm3uKR3bvjIrK6wXNH/GJ
 ux9TaFAr8erT5FrSmIn/zRwfcWXne/iMSK8KbI/jCONAIgYSsfovt7pzk
 HsjDE9CwoAI46mDFwGNRcA1G0VGcy/1beNIuhID8XRNZnhcebx2n64h2t
 pZM3xNrHUE3+438L3rdyMqqN2CQyHLqg7u7fAzCLsMSGCKaYB/H1ingqk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9236632"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9236632"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820754699"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820754699"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 25 Jan 2024 02:32:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 25 Jan 2024 12:32:24 +0200
Date: Thu, 25 Jan 2024 12:32:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
Message-ID: <ZbI4uD3iK-CChNlz@intel.com>
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com>
 <Zaq-r7UZpEy7_Rrn@intel.com>
 <68171ce1-3ccb-4699-8577-434d9b717acf@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68171ce1-3ccb-4699-8577-434d9b717acf@igalia.com>
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
Cc: daniel@ffwll.ch, 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 11:14:40AM -0300, André Almeida wrote:
> Hi Ville,
> 
> Em 19/01/2024 15:25, Ville Syrjälä escreveu:
> > On Fri, Jan 19, 2024 at 03:12:35PM -0300, André Almeida wrote:
> >> AMD GPUs can do async flips with changes on more properties than just
> >> the FB ID, so implement a custom check_async_props for AMD planes.
> >>
> >> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
> >> properties. For userspace to check if a driver support this two
> >> properties, the strategy for now is to use TEST_ONLY commits.
> >>
> >> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> >> ---
> >> v2: Drop overlay plane option for now
> >>
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
> >>   1 file changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> index 116121e647ca..7afe8c1b62d4 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> >> @@ -25,6 +25,7 @@
> >>    */
> >>   
> >>   #include <drm/drm_atomic_helper.h>
> >> +#include <drm/drm_atomic_uapi.h>
> >>   #include <drm/drm_blend.h>
> >>   #include <drm/drm_gem_atomic_helper.h>
> >>   #include <drm/drm_plane_helper.h>
> >> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
> >>   	drm_atomic_helper_plane_destroy_state(plane, state);
> >>   }
> >>   
> >> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
> >> +					  struct drm_plane *plane,
> >> +					  struct drm_plane_state *plane_state,
> >> +					  struct drm_mode_object *obj,
> >> +					  u64 prop_value, u64 old_val)
> >> +{
> >> +	struct drm_mode_config *config = &plane->dev->mode_config;
> >> +	int ret;
> >> +
> >> +	if (prop != config->prop_fb_id &&
> >> +	    prop != config->prop_in_fence_fd &&
> > 
> > IN_FENCE should just be allowed always.
> 
> Do you mean that the common path should allow IN_FENCE_FD for all drivers?

Yes.

-- 
Ville Syrjälä
Intel
