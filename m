Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F1ACF647
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4654D10E2BB;
	Thu,  5 Jun 2025 18:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="oGrQd+3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF610E2BB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:12:03 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 555IBWHL4149014;
 Thu, 5 Jun 2025 13:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1749147092;
 bh=ZzS1C5EvMT0MXg6EMhBdqMlyprF5jw+kGcG1nrN8/TI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oGrQd+3pNARA6+k/hmqCeS8+r8m2yRrpoqV4Q4ITGuSDAMxfckwYpHSxgleCR7fDk
 iyhAzea31K2E1n00JOdmffcKv+63NQKkt5R2+DXW7PI2f6S9MZbkwxKrRZs8bzvit6
 onHdWDtH5TgAjln1KxJktBhyPtVVaMTzEGnuU/7Y=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 555IBWWr2938539
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 5 Jun 2025 13:11:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 13:11:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 13:11:31 -0500
Received: from [10.249.137.120] ([10.249.137.120])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 555IBJYT4061280;
 Thu, 5 Jun 2025 13:11:21 -0500
Message-ID: <75d3df52-c6b0-4235-b81f-288009a3c3a7@ti.com>
Date: Thu, 5 Jun 2025 23:41:18 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v13 0/4] drm/atomic-helper: Re-order CRTC and Bridge ops
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: "Thakkar, Devarsh" <devarsht@ti.com>
In-Reply-To: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Aradhya,

Thanks for the patch series.

On 6/5/2025 10:45 PM, Aradhya Bhatia wrote:
> Hello all,
> 
> This series re-orders the sequences in which the drm CRTC and the drm
> Bridge get enabled and disabled with respect to each other.
> 
> The bridge pre_enable calls have been shifted before the crtc_enable and
> the bridge post_disable calls have been shifted after the crtc_disable.
> 
> This has been done as per the definition of bridge pre_enable.
> "The display pipe (i.e. clocks and timing signals) feeding this bridge will
> not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled.
> 
> The original sequence. for display pipe enable looks like:
> 
>       crtc_enable
> 
>       bridge[n]_pre_enable
>       ...
>       bridge[1]_pre_enable
> 
>       encoder_enable
> 
>       bridge[1]_enable
>       ...
>       bridge[n]_enable
> 
> The sequence of enable after this patch-set will look like:
> 
>       bridge[n]_pre_enable
>       ...
>       bridge[1]_pre_enable
> 
>       crtc_enable
>       encoder_enable
> 
>       bridge[1]_enable
>       ...
>       bridge[n]_enable
> 
> 
> For the disable sequence, this is what the original looks like:
> 
>       bridge[n]_disable
>       ...
>       bridge[1]_disable
> 
>       encoder_disable
> 
>       bridge[1]_post_disable
>       ...
>       bridge[n]_post_disable
> 
>       crtc_disable
> 	        
> This is what the disable sequence will be, after this series of patches:
> 
>       bridge[n]_disable
>       ...
>       bridge[1]_disable
> 
>       encoder_disable
>       crtc_disable
> 
>       bridge[1]_post_disable
>       ...
>       bridge[n]_post_disable
> 
> This series further updates the bridge API definitions to accurately
> reflect the updated scenario.
> 
> This series is a subset of its v11[0] which had 14 patches in the revision.
> 9 of those 14 patches (which were specific to the cdns-dsi bridge driver)
> were merged[1].
> 
> Regards
> Aradhya
> 
> ---
> 
> References:
> [0]: Revision v11 of this series.
> https://lore.kernel.org/all/20250329113925.68204-1-aradhya.bhatia@linux.dev/
> 
> [1]: Patches 1 through 9 getting merged.
> https://lore.kernel.org/all/174335361171.2556605.12634785416741695829.b4-ty@oss.qualcomm.com/
> 
> 
> ---
> Change Log:
> 
>   - Changes in v13:
>     - Style  changes in patch 2/4. (Thomas)
>     - Squash patch v12:4/5 into v12:3/5, which is now v13:3/4. (Thomas)
>     - Add R-b tags from Thomas Zimmermann in patches 1-3.
>     - Rebase onto latest drm-misc-next.
> 
>   - Changes in v12:
>     - Drop patches 1 through 9 since they have been merged.
>     - Rebase onto newer drm-misc-next.
>     - Re-word the patch 3/4, ("drm/bridge: Update the bridge enable/disable doc")
>       to make it more readable.
> 
>   - Changes in v11:
>     - Add patch v11:13/14 ("drm/bridge: Update the bridge enable/disable doc"),
>       that updates the documentation about the order of the various bridge
>       enable/disable hooks being called wrt the CRTC and encoder hooks.
>     - Rebase on drm-misc-next instead of linux-next.
>       As part of rebase, accommodate the following change:
>       - Change patch v10:08/13 ("drm/bridge: cdns-dsi: Support atomic bridge
>         APIs") to v11:08/13 ("drm/bridge: cdns-dsi: Add input format
>         negotiation"), since Maxime has already updated the bridge hooks to
>         their atomic versions in commit 68c98e227a96 ("drm/bridge: cdns-csi:
>         Switch to atomic helpers").
>         My new patch now only adds the format negotiation hook for the cdns-dsi.
>         (Note: Since the new patch is now only a subset of the old one, without
>         any change in logic, I decided to carry forward the R-b and T-b tags.)
>     - Add Alexander Sverdlin's T-b in patches 10, 11, 12.
> 
>   - Changes in v10:
>     - Rebase on latest linux-next (next-20250226).
>     - As part of rebase, update the patches to accommodate a couple of
>       widespread changes in DRM Framework -
>         - All the ("drm/atomic-helper: Change parameter name of ***") commits.
>         - All the ("drm/bridge: Pass full state to ***") commits.
>       (These updates are only trivial substitutions.)
>     - Add Tomi Valkeinen's T-b tags in all the patches.
> 
>   - Changes in v9:
>     - Fix the oops in 11/13 - where the encoder_bridge_enable _was_ pre_enabling
>       the bridges instead of enabling.
>     - Add the following tags:
>       - Dmitry Baryshkov's R-b in patches 2, 10, 11, and A-b in patch 12.
>       - Jayesh Choudhary's R-b in patch 12.
>       - Tomi Valkeinen's R-b in patches 2, 10, 11, 12.
> 
>   - Changes in v8:
>     - Move the phy de-initialization to bridge post_disable() instead of bridge
>       disable() in patch-3.
>     - Copy the private bridge state (dsi_cfg), in addition to the bridge_state,
>       in patch-9.
>     - Split patch v7:11/12 into three patches, v8:{10,11,12}/13, to separate out
>       different refactorings into different patches, and improve bisectability.
>     - Move patch v7:02/12 down to v8:06/12, to keep the initial patches for
>       fixes only.
>     - Drop patch v7:04/12 as it doesn't become relevant until patch v7:12/12.
>     - Add R-b tags of Dmitry Baryshkov in patch-9 and patch-3, and of
>       Tomi Valkeinen in patch-9.
>    
>   - Changes in v7:
>     - phy_init()/exit() were called from the PM path in v6. Change it back to
>       the bridge enable/disable path in patch-3, so that the phy_init() can go
>       back to being called after D-Phy reset assert.
>     - Reword commit text in patch-5 to explain the need of the fix.
>     - Drop the stray code in patch-10.
>     - Add R-b tag of Dmitry Baryshkov in patch-6.
> 
>   - Changes in v6:
>     - Reword patch 3 to better explain the fixes around phy de-init.
>     - Fix the Lane ready timeout condition in patch 7.
>     - Fix the dsi _bridge_atomic_check() implementation by adding a new
>       bridge state structure in patch 10.
>     - Rework and combine patches v5:11/13 and v5:12/13 to v6:11/12.
>     - Generate the patches of these series using the "patience" algorithm.
>       Note: All patches, except v6:11/12, *do not* differ from their default
>       (greedy) algorithm variants.
>       For patch 11, the patience algorithm significantly improves the readability.
>     - Rename and move the Bridge enable/disable enums from public to private
>       in patch 11.
>     - Add R-b tags of Tomi Valkeinen in patch 6, and Dmitry Baryshkov in patch 2.
> 
>   - Changes in v5:
>     - Fix subject and description in patch 1/13.
>     - Add patch to check the return value of
>       phy_mipi_dphy_get_default_config() (patch: 6/13).
>     - Change the Clk and Data Lane ready timeout from forever to 5s.
>     - Print an error instead of calling WARN_ON_ONCE in patch 7/13.
>     - Drop patch v4-07/11: "drm/bridge: cdns-dsi: Reset the DCS write FIFO".
>       There has been some inconsistencies found with this patch upon further
>       testing. This patch was being used to enable a DSI panel based on ILITEK
>       ILI9881C bridge. This will be debugged separately.
>     - Add patch to move the DSI mode check from _atomic_enable() to
>       _atomic_check() (patch: 10/13).
>     - Split patch v4-10/11 into 2 patches - 11/13 and 12/13.
>       Patch 11/13 separates out the Encoder-Bridge operations into a helper
>       function *without* changing the logic. Patch 12/13 then changes the order
>       of the encoder-bridge operations as was intended in the original patch.
>     - Add detailed comment for patch 13/13.
>     - Add Tomi Valkeinen's R-b in patches 1, 2, 4, 5, 7, 8, 9, 13.
> 
>   - Changes in v4:
>     - Add new patch, "drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()",
>       to update to an auto-managed way of finding next bridge in the chain.
>     - Drop patch "drm/bridge: cdns-dsi: Fix the phy_initialized variable" and
>       add "drm/bridge: cdns-dsi: Fix Phy _init() and _exit()" that properly
>       de-initializes the Phy and maintains the initialization state.
>     - Reword patch "drm/bridge: cdns-dsi: Reset the DCS write FIFO" to explain
>       the HW concerns better.
>     - Add R-b tag from Dmitry Baryshkov for patches 1/11 and 8/11.
> 
>   - Changes in v3:
>     - Reword the commit message for patch "drm/bridge: cdns-dsi: Fix OF node
>       pointer".
>     - Add a new helper API to figure out DSI host input pixel format
>       in patch "drm/mipi-dsi: Add helper to find input format".
>     - Use a common function for bridge pre-enable and enable, and bridge disable
>       and post-disable, to avoid code duplication.
>     - Add T-b tag from Dominik Haller in patch 5/10. (Missed to add it in v2).
>     - Add R-b tag from Dmitry Baryshkov for patch 8/10.
> 
>   - Changes in v2:
>     - Drop patch "drm/tidss: Add CRTC mode_fixup"
>     - Split patch "drm/bridge: cdns-dsi: Fix minor bugs" into 4 separate ones
>     - Drop support for early_enable/late_disable APIs and instead re-order the
>       pre_enable / post_disable APIs to be called before / after crtc_enable /
>       crtc_disable.
>     - Drop support for early_enable/late_disable in cdns-dsi and use
>       pre_enable/post_disable APIs instead to do bridge enable/disable.
> 
> 
> Previous versions:
> 
> v1:  https://lore.kernel.org/all/20240511153051.1355825-1-a-bhatia1@ti.com/
> v2:  https://lore.kernel.org/all/20240530093621.1925863-1-a-bhatia1@ti.com/
> v3:  https://lore.kernel.org/all/20240617105311.1587489-1-a-bhatia1@ti.com/
> v4:  https://lore.kernel.org/all/20240622110929.3115714-1-a-bhatia1@ti.com/
> v5:  https://lore.kernel.org/all/20241019195411.266860-1-aradhya.bhatia@linux.dev/
> v6:  https://lore.kernel.org/all/20250111192738.308889-1-aradhya.bhatia@linux.dev/
> v7:  https://lore.kernel.org/all/20250114055626.18816-1-aradhya.bhatia@linux.dev/
> v8:  https://lore.kernel.org/all/20250126191551.741957-1-aradhya.bhatia@linux.dev/
> v9:  https://lore.kernel.org/all/20250209121032.32655-1-aradhya.bhatia@linux.dev/
> v10: https://lore.kernel.org/all/20250226155228.564289-1-aradhya.bhatia@linux.dev/
> v11: https://lore.kernel.org/all/20250329113925.68204-1-aradhya.bhatia@linux.dev/
> v12: https://lore.kernel.org/all/20250406131642.171240-1-aradhya.bhatia@linux.dev/
> 
> ---
> 
> Aradhya Bhatia (4):
>   drm/atomic-helper: Refactor crtc & encoder-bridge op loops into
>     separate functions
>   drm/atomic-helper: Separate out bridge pre_enable/post_disable from
>     enable/disable
>   drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
>   drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
> 

For the series,
Tested-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    |  64 +++--
>  drivers/gpu/drm/drm_atomic_helper.c           | 160 +++++++++--
>  include/drm/drm_bridge.h                      | 249 +++++++++++++-----
>  3 files changed, 355 insertions(+), 118 deletions(-)
> 
> 
> base-commit: 0b3d99425891e3c4a87259afb88fbd1168dc7707

