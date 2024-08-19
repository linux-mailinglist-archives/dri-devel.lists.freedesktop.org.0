Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD595738D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E1A10E1D9;
	Mon, 19 Aug 2024 18:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="CbM97Au7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D326D10E1D9;
 Mon, 19 Aug 2024 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724092775;
 bh=Ltk+QjD6TRFkUieOvzjHHGmhAHcUXUyF1zlxMr4s/ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbM97Au747P0rOaRji839hbO98/BxUXvWF9WV/wWVTPme6eer9Z0LvQ/K2qStjoKj
 1O5DMBb+SZmGnY8bjAGoR/FZbrS2Y+kY5L9lcgkeD5sqL5rt4zC/4AGNaKsQHitgvq
 h2G/EJ6INozifm97jdsmsp3RZDgphxUT9t/sF8+A=
Date: Mon, 19 Aug 2024 20:39:34 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] drm/amd: Switch over to struct drm_edid
Message-ID: <f2664caa-8bf5-4f6d-903c-3de01977e89e@t-8ch.de>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
 <3v3yvr6adlnqgbwbnvhfwj3ylpptunqyvosazyebvov3osdprb@znkx32uxku5q>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3v3yvr6adlnqgbwbnvhfwj3ylpptunqyvosazyebvov3osdprb@znkx32uxku5q>
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

Hi Melissa,

On 2024-08-19 11:31:44+0000, Melissa Wen wrote:
> On 08/18, Thomas Weißschuh wrote:
> > The AMD DRM drivers use 'struct edid', raw pointers and even custom
> > structs to represent EDID data.
> > Uniformly switch to the safe and recommended "struct drm_edid".
> > 
> > Some uses of "struct edid" are left because some ad-hoc parsing is still
> > being done inside the drivers.
> 
> Hi Thomas,
> 
> It's great to see more people working on removing raw edid from amd
> display driver in favor of drm_edid.
> 
> I glanced over your series and I found it similar to my recent proposal
> to migrate amdgpu_dm_connector from edid to drm_edid. You can find the
> v5 of this work here:
> https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/

thanks for the pointer.

> I believe it's more productive if we can join efforts and improve that
> proposal instead of duplicating work. I'll look at your patches more
> carefully this week. If you can review my work, I'd be happy to hear
> your feedback too.

Indeed. I'll take a look at your patches.
Let's see how they can be combined.

> Thanks,
> 
> Melissa
> 
> > 
> > The patch "drm/amd/display: Switch amdgpu_dm_connector to struct drm_edid"
> > will conflict with my backlight quirk series [0].
> > The conflict will result in an obvious and easy to fix build failure.
> > 
> > Patches 1 and 2 delete some dead code.
> > Patches 3 to 6 constify some arguments and shuffle around some code.
> > The remaining patches perform the actual conversion in steps.
> > 
> > [0] https://lore.kernel.org/lkml/20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net/
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Thomas Weißschuh (12):
> >       drm/amd/display: remove spurious definition for dm_helpers_get_sbios_edid()
> >       drm/amd/display: Remove EDID members of ddc_service
> >       drm/edid: constify argument of drm_edid_is_valid()
> >       drm/amd/display: Simplify raw_edid handling in dm_helpers_parse_edid_caps()
> >       drm/amd/display: Constify raw_edid handling in dm_helpers_parse_edid_caps()
> >       drm/amd/display: Constify 'struct edid' in parsing functions
> >       drm/amd/display: Use struct edid in dc_link_add_remote_sink()
> >       drm/amdgpu: Switch amdgpu_connector to struct drm_edid
> >       drm/amd/display: Switch amdgpu_dm_connector to struct drm_edid
> >       drm/edid: add a helper to compare two EDIDs
> >       drm/amd/display: Switch dc_sink to struct drm_edid
> >       drm/amd/display: Switch dc_link_add_remote_sink() to struct drm_edid
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     | 56 ++++++++-------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  3 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  4 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  4 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  4 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  4 +-
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 84 +++++++++++-----------
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  5 +-
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 34 +++++----
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 28 ++++----
> >  .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  5 +-
> >  drivers/gpu/drm/amd/display/dc/dc.h                |  8 +--
> >  drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |  7 --
> >  drivers/gpu/drm/amd/display/dc/dc_types.h          |  5 --
> >  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  4 +-
> >  drivers/gpu/drm/amd/display/dc/inc/link.h          |  3 +-
> >  .../gpu/drm/amd/display/dc/link/link_detection.c   | 42 ++++-------
> >  .../gpu/drm/amd/display/dc/link/link_detection.h   |  3 +-
> >  drivers/gpu/drm/drm_edid.c                         | 20 +++++-
> >  include/drm/drm_edid.h                             |  3 +-
> >  20 files changed, 155 insertions(+), 171 deletions(-)
> > ---
> > base-commit: 207565ee2594ac47261cdfc8a5048f4dc322c878
> > change-id: 20240615-amdgpu-drm_edid-32d969dfb899
> > 
> > Best regards,
> > -- 
> > Thomas Weißschuh <linux@weissschuh.net>
> > 
