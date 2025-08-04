Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E2B1A527
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C66610E20B;
	Mon,  4 Aug 2025 14:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCC4789364
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:43:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82F7D22BE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:43:37 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5285D3F738
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:43:45 -0700 (PDT)
Date: Mon, 4 Aug 2025 15:43:12 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <aJDHAF69VOEHwcKO@e110455-lin.cambridge.arm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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

Hi,

On Fri, Aug 01, 2025 at 04:51:08PM +0300, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> to use drmm_writeback_connector_init(), drop
> drm_writeback_connector_init() and drm_writeback_connector::encoder
> (it's unused afterwards).
> 
> This series leaves former drm_writeback_connector_init_with_encoder()
> (renamed to drm_writeback_connector_init as a non-managed counterpart
> for drmm_writeback_connector_init()). It is supposed to be used by
> drivers which can not use drmm functions (like Intel). However I think
> it would be better to drop it completely.

The intent of _init_with_encoder() was to be a special case for drivers
that use their own specific encoder and the rest use the generic function
that creates the virtual encoder inside the call. The API for
_init_with_encoder() was actually introduced 4 years after the original
patch, so that should give a hint.

drmm_writeback_connector_init() is more like _init_with_encoder() and
I don't remember reviewing it, so I'm not sure why that was considered
to be the better behaviour for the managed version. Now you're moving
all the drivers to the managed version and you have to duplicate code
in each driver to create the ENCODER_VIRTUAL encoder.

I'm not against the changes being made in the series, I just want to
see a better justification on why _init_with_encoder() behaviour is
better than the previous default that you're removing.

Best regards,
Liviu


> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (8):
>       drm/amd/display: use drmm_writeback_connector_init()
>       drm/komeda: use drmm_writeback_connector_init()
>       drm/mali: use drmm_writeback_connector_init()
>       drm/msm/dpu: use drmm_writeback_connector_init()
>       drm/msm/dpu: use drmm_writeback_connector_init()
>       drm/vc4: use drmm_writeback_connector_init()
>       drm: writeback: drop excess connector initialization functions
>       drm: writeback: rename drm_writeback_connector_init_with_encoder()
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
>  .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
>  drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
>  drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 10 +---
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
>  drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
>  include/drm/drm_writeback.h                        | 22 +------
>  9 files changed, 77 insertions(+), 131 deletions(-)
> ---
> base-commit: 94f208ff622b09309358abaf26d7acca0c318fae
> change-id: 20250801-wb-drop-encoder-97a0c75bd5d7
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
