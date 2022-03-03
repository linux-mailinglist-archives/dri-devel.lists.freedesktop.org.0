Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7E4CC71C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5004210EE13;
	Thu,  3 Mar 2022 20:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E7A10EE13;
 Thu,  3 Mar 2022 20:37:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0879061CD0;
 Thu,  3 Mar 2022 20:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB6DC340EF;
 Thu,  3 Mar 2022 20:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646339831;
 bh=OXGr1PhWd90UciyXoThMqMTWRA8qGdjyNBBLaOztyWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+KjScztBhjYUP8tJdR/XaLnR53G+5qb3QCupyPWaIdUxaHN+ARp5NZXvwhmUeXF1
 caA0cXxRDYeCEs9kFx7eMBcZJUStWa2CkvacrvJGG1jGYCqhSxii4zPdxZnUZYdD38
 PwDrY5sqlJNDieJtf7Oddv3DFhjIlYPEGGqyBNhwqY9ESjiqyxeGW3N0NE0xpQ/pht
 RA9kyBDi4MJkNrQPHuNQBWwO5QxU259tlde65nIodNx6FHnKZ/1lj14a0Otn4DQonf
 zjxhHxSU/WGYWCxBv2QYi8ZxbmmPQJbi3JMmlbSp0MJx3WM2KxzFZFr5YDIIKkHUH/
 /t+H2u+oVsKdQ==
Date: Thu, 3 Mar 2022 14:45:26 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] drm/amd/display: Fix Wstringop-overflow warnings
 in dc_link_dp.c
Message-ID: <20220303204526.GA1733280@embeddedor>
References: <20220303172503.GA1731116@embeddedor>
 <202203030937.5BFE3EF@keescook>
 <20220303181957.GA1731711@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303181957.GA1731711@embeddedor>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 12:19:57PM -0600, Gustavo A. R. Silva wrote:
> On Thu, Mar 03, 2022 at 09:43:28AM -0800, Kees Cook wrote:
> > On Thu, Mar 03, 2022 at 11:25:03AM -0600, Gustavo A. R. Silva wrote:
> > > Fix the following Wstringop-overflow warnings when building with GCC-11:
> > > 
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpia.c:493:17: warning: ‘dp_decide_lane_settings’ accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
> > 
> > Can you "show your work" a little more here? I don't actually see the
> > what is getting fixed:
> > 
> > enum dc_lane_count {
> > 	...
> >         LANE_COUNT_FOUR = 4,
> > 	...
> >         LANE_COUNT_DP_MAX = LANE_COUNT_FOUR
> > };
> > 
> > struct link_training_settings {
> > 	...
> >         union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX];
> > };
> > 
> > void dp_hw_to_dpcd_lane_settings(
> > 		...
> > 		union dpcd_training_lane dpcd_lane_settings[LANE_COUNT_DP_MAX])
> > {
> > 	...
> > }
> > 
> > static enum link_training_result dpia_training_cr_transparent(
> > 		...
> >                 struct link_training_settings *lt_settings)
> > {
> > 	...
> >                 dp_decide_lane_settings(lt_settings, dpcd_lane_adjust,
> >                                 lt_settings->hw_lane_settings, lt_settings->dpcd_lane_settings);
> > 	...
> > }
> > 
> > Everything looks to be the correct size?
> 
> Yep; this fix is similar to the one for intel_pm.c in this
> 
> 	commit e7c6e405e171fb33990a12ecfd14e6500d9e5cf2
> 
> where the array size of 8 seems to be fine for all the
> struct members related (pri_latency, spr_latency, cur_latency
> and skl_latency):
> 
> drivers/gpu/drm/i915/i915_drv.h:465:struct drm_i915_private {
> ...
> 
> drivers/gpu/drm/i915/i915_drv.h-739-    struct {
> 
> ...
> drivers/gpu/drm/i915/i915_drv.h-745-            /* primary */
> drivers/gpu/drm/i915/i915_drv.h-746-            u16 pri_latency[5];
> drivers/gpu/drm/i915/i915_drv.h-747-            /* sprite */
> drivers/gpu/drm/i915/i915_drv.h-748-            u16 spr_latency[5];
> drivers/gpu/drm/i915/i915_drv.h-749-            /* cursor */
> drivers/gpu/drm/i915/i915_drv.h-750-            u16 cur_latency[5];
> drivers/gpu/drm/i915/i915_drv.h-751-            /*
> drivers/gpu/drm/i915/i915_drv.h-752-             * Raw watermark memory latency values
> drivers/gpu/drm/i915/i915_drv.h-753-             * for SKL for all 8 levels
> drivers/gpu/drm/i915/i915_drv.h-754-             * in 1us units.
> drivers/gpu/drm/i915/i915_drv.h-755-             */
> drivers/gpu/drm/i915/i915_drv.h-756-            u16 skl_latency[8];
> 
> ...
> drivers/gpu/drm/i915/i915_drv.h-773-    } wm;
> ...
> }

and in this case the ilk_wm_max_level() returns the right maximum size for the
corresponding 'struct wm' member:

drivers/gpu/drm/i915/intel_pm.c:2993:int ilk_wm_max_level(const struct drm_i915_private *dev_priv)
drivers/gpu/drm/i915/intel_pm.c-2994-{
drivers/gpu/drm/i915/intel_pm.c-2995-   /* how many WM levels are we expecting */
drivers/gpu/drm/i915/intel_pm.c-2996-   if (HAS_HW_SAGV_WM(dev_priv))
drivers/gpu/drm/i915/intel_pm.c-2997-           return 5;
drivers/gpu/drm/i915/intel_pm.c-2998-   else if (DISPLAY_VER(dev_priv) >= 9)
drivers/gpu/drm/i915/intel_pm.c-2999-           return 7;
drivers/gpu/drm/i915/intel_pm.c-3000-   else if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
drivers/gpu/drm/i915/intel_pm.c-3001-           return 4;
drivers/gpu/drm/i915/intel_pm.c-3002-   else if (DISPLAY_VER(dev_priv) >= 6)
drivers/gpu/drm/i915/intel_pm.c-3003-           return 3;
drivers/gpu/drm/i915/intel_pm.c-3004-   else
drivers/gpu/drm/i915/intel_pm.c-3005-           return 2;
drivers/gpu/drm/i915/intel_pm.c-3006-}

drivers/gpu/drm/i915/intel_pm.c:3009:static void intel_print_wm_latency(struct drm_i915_private *dev_priv,
drivers/gpu/drm/i915/intel_pm.c-3010-                              const char *name,
drivers/gpu/drm/i915/intel_pm.c-3011-                              const u16 wm[])
drivers/gpu/drm/i915/intel_pm.c-3012-{
drivers/gpu/drm/i915/intel_pm.c-3013-   int level, max_level = ilk_wm_max_level(dev_priv);
drivers/gpu/drm/i915/intel_pm.c-3014-
drivers/gpu/drm/i915/intel_pm.c-3015-   for (level = 0; level <= max_level; level++) {
drivers/gpu/drm/i915/intel_pm.c-3016-           unsigned int latency = wm[level];
drivers/gpu/drm/i915/intel_pm.c-3017-
...
}

still GCC warns about this with Wstringop-overread, as it is explained
in commit e7c6e405e171.

--
Gustavo

> 
> however GCC warns about accessing bytes beyond the limits, and turning the
> argument declarations into pointers (removing the over-specified array
> size from the argument declaration) silence the warnings.
> 
> --
> Gustavo
