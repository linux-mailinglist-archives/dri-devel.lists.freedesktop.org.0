Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F08C9A54C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8598210E58F;
	Tue,  2 Dec 2025 06:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bEtZ+lTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C7A10E58F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 06:34:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (113x43x203x98.ap113.ftth.arteria-hikari.net [113.43.203.98])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E9B771D50;
 Tue,  2 Dec 2025 07:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764657130;
 bh=0lVjz1z58X5xGr8Xj3mhzxJdvi7xxFSTuPzW/9Lmg6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEtZ+lTHN/RbNEcN3w5KOXb30fjzHHHSv6/kimHA7iwTN4o9dcTxU4DNmWSvoZS41
 Hv8B1L0tMHb5Olsjnpcrp4FwajssnROjxKL1I6Dc3O3AAfUNX1d3TzqZzAZBycwBhs
 +dQIy1gVuGwkJVsNNk6PS53pkFplvstydqFWlLHs=
Date: Tue, 2 Dec 2025 15:34:03 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Message-ID: <20251202063403.GA18267@pendragon.ideasonboard.com>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
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

Hi Linus,

On Sun, Nov 30, 2025 at 01:11:16PM +0100, Linus Walleij wrote:
> This fixes two regressions experienced in the MCDE and
> R-Car DU DRM drivers after
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks.
> 
> This series make it possible to selectively bring back the
> old behaviour with explicit semantics and implements
> the old behaviour as modified commit tails in MCDE and
> R-Car DU.

We now have a third platform broken by
c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
for a revert, to give us the time to implement a correct solution.

[1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com

> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v5:
> - Prefix all exported atomic commit helpers with drm_atomic_helper_commit_*
> - Add kerneldoc to all new exported atmomic commit helpers.
> - Add comments into the MCDE and Rcar DU quirks explaining what is
>   altered as compared to the standard helper functions.
> - Link to v4: https://lore.kernel.org/r/20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org
> 
> Changes in v4:
> - Fix a copypaste-bug in the Renesas Rcar-DU driver.
> - Actually compile this using the shmobile defconfig and make
>   sure it works.
> - Collect Geert's Tested-by.
> - Link to v3: https://lore.kernel.org/r/20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org
> 
> Changes in v3:
> - Switch to a new approach: export helper functions and create the
>   special helper directly in the driver instead.
> - Drop Marek's patch and write a new RFT patch with the same
>   semantic content as the MCDE patch.
> - Link to v2: https://lore.kernel.org/r/20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org
> 
> Changes in v2:
> - Queue Marek's patch first in the series for coherency.
> - Add a patch to also preserve the late CRTC disablement
>   semantic.
> - Rename helper function to reflect the new semantic.
> - Update the MCDE patch to use the new callbacks.
> - Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org
> 
> ---
> Linus Walleij (3):
>       drm/atomic-helper: Export and namespace some functions
>       drm/mcde: Create custom commit tail
>       drm/rcar-du: Modify custom commit tail
> 
>  drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
>  drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
>  include/drm/drm_atomic_helper.h               |  22 +++++
>  4 files changed, 195 insertions(+), 27 deletions(-)
> ---
> base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
> change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

-- 
Regards,

Laurent Pinchart
