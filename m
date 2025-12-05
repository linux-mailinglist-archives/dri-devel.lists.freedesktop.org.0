Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF93CA7F95
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 15:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69DE10E25C;
	Fri,  5 Dec 2025 14:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="F4NoGPDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Fri, 05 Dec 2025 14:35:35 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A372410E25C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:35:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251205142556euoutp017e92b74afbcb5f61d9fca588842bb178~_V_egOsz02649926499euoutp01E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:25:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251205142556euoutp017e92b74afbcb5f61d9fca588842bb178~_V_egOsz02649926499euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1764944756;
 bh=6gmqcOwSNc0+xhzL2UsZFCz72iWFcGpUCCkzE2dmMWA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=F4NoGPDcG2LPkzlCRHCJrQdt7ggfb1R20wG+ILP7OURnlGKEu5jogmZcG73MZwegx
 VhtNsYtFdcpzIf0fBX5yIQ30ttmmFtM4PuEBdFNe59bQ3qlKeiHuq00UxvE5r0eyRj
 Jc+4Yub/CsoXVnqZFJJ88gWVoQ0eOsVo8gCnWuZs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251205142555eucas1p2e96cf9def9641e26e060f05139d24941~_V_d9WlrN2971629716eucas1p2H;
 Fri,  5 Dec 2025 14:25:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251205142553eusmtip11d66a1f54e847d5d4b609dd79aef82bb~_V_b7m79k0312503125eusmtip1E;
 Fri,  5 Dec 2025 14:25:53 +0000 (GMT)
Message-ID: <b2f3e15c-1a15-427d-90d9-ea0e33b50ecb@samsung.com>
Date: Fri, 5 Dec 2025 15:25:52 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Aradhya Bhatia
 <aradhya.bhatia@linux.dev>, Linus Walleij <linusw@kernel.org>, Chaoyi Chen
 <chaoyi.chen@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Marek
 Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251205142555eucas1p2e96cf9def9641e26e060f05139d24941
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251205095238eucas1p1b7cf95d86a9aecf19877ac568148e265
X-EPHeader: CA
X-CMS-RootMailID: 20251205095238eucas1p1b7cf95d86a9aecf19877ac568148e265
References: <CGME20251205095238eucas1p1b7cf95d86a9aecf19877ac568148e265@eucas1p1.samsung.com>
 <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
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

On 05.12.2025 10:51, Tomi Valkeinen wrote:
> Changing the enable/disable sequence in commit c9b1150a68d9
> ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.
>
> This is an alternate series to Linus' series:
>
> https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa%40kernel.org/
>
> This series first reverts the original commit and reverts a fix for
> mediatek which is no longer needed. It then exposes helper functions
> from DRM core, and finally implements the new sequence only in the tidss
> driver.
>
> There is one more fix in upstream for the original commit, commit
> 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
> runtime PM calls"), but I have not reverted that one as it looks like a
> valid patch in its own.

Right, that patch is a fix on its own, the changes in the atomic 
sequence just revealed the issue.

> I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, as
> I wasn't sure what should they point to. But I could perhaps add Fixes:
> <original commit> to all of these.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Linus Walleij (1):
>        drm/atomic-helper: Export and namespace some functions
>
> Tomi Valkeinen (3):
>        Revert "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
>        Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order"
>        drm/tidss: Fix enable/disable order
>
>   drivers/gpu/drm/drm_atomic_helper.c | 122 ++++++++++++++----
>   drivers/gpu/drm/mediatek/mtk_dsi.c  |   6 -
>   drivers/gpu/drm/tidss/tidss_kms.c   |  30 ++++-
>   include/drm/drm_atomic_helper.h     |  22 ++++
>   include/drm/drm_bridge.h            | 249 ++++++++++--------------------------
>   5 files changed, 214 insertions(+), 215 deletions(-)
> ---
> base-commit: 88e721ab978a86426aa08da520de77430fa7bb84
> change-id: 20251205-drm-seq-fix-b4ed1f56604b

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

