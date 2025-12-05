Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94609CA7002
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468510E114;
	Fri,  5 Dec 2025 09:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fbiRk4tg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FA110E114
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:52:27 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33843EAE;
 Fri,  5 Dec 2025 10:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764928208;
 bh=MwhXgW4rnOQ3KSc+GudAM5PShTGwJykoDUKEmfRikoI=;
 h=From:Subject:Date:To:Cc:From;
 b=fbiRk4tg7s7BEQm0DNSKCqvfONzM9PYmpxTgwuUqk3nVU0a6Mw5JW/J+mF/3lS0bp
 tEoHuNKYGONHG1MSvZ3UFqM9g8gUSCpa/u3xVDMpq4uppgxXYvoP+eZG/z0LOMGyjP
 moCJLA2vjrejj4nuB7QX7z1vCpPaEzLiQaFJr+qU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/4] drm: Revert and fix enable/disable sequence
Date: Fri, 05 Dec 2025 11:51:47 +0200
Message-Id: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSrMmkC/x2MQQqAIBAAvyJ7bkFFPfSV6JC51h6yUohA/HvSc
 QZmKhTKTAVGUSHTw4XP1EENAtZ9SRshh86gpbZKS4shH1joxsgvekNBReucNB56cWXq+r9Nc2s
 fls7cZF0AAAA=
X-Change-ID: 20251205-drm-seq-fix-b4ed1f56604b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=MwhXgW4rnOQ3KSc+GudAM5PShTGwJykoDUKEmfRikoI=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGkyq1Gj1d8xlj6diu63t7iZIaLIFc3fvXjAEHe/VLZfrvIfQ
 okCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJpMqtRAAoJEPo9qoy8lh717W0P+wRa
 1bq77t/4zLJJmCAjxcRV1DhoWfVPncOTXA2HSsEIMgPBHpUKZyan6fBYxHp6XkG0gNVZlwTrYhW
 pSyAvXsrnTNhW8q5otmzGyWpCw023NDpDDWbiGUgGg43yQml50nFn6Ij48jk2lXLvpfPWvcsvk6
 bpX+tDXMn0m+FLf1bYvhoJdJIyvq/0wvT5ZIgRfzsZZjWqjDR+WXbdtPV/hyleczIwGaJWqFNhV
 9op0yeeanXhucwBN2xqL73naXLUq9EBNDWtFE4LSmBBXBBLtqTx2K4b5Tsr8g3C9Ch5pf+Qqodm
 OVcabnpPmbZVlxRiBF11N0zi0chMynlCJDfFX0HjltHxOaqXW/LySuusslTdBU0FFpkdS9AwyEa
 lbdnRRJFwaU18kSgasLNEzSBV77gug1YhZ4kkVVTyblKCLlK0GojYFPsQEdPXoIjIXQcpurCr22
 Ln5os9CZuhApjyd3l241B6ZIvimL2MMi6eJE+MGkg6dRaD6GQdslRy1cbxJsY+nhPrku/DS5+58
 IwydYy0PKmXzLH4IcgDqAnmLcFnUstEvCq5lXmvbOPzAGKbIHyIIcxuy9vMmnG03hpyeD+7JY53
 EC2vrgEsPyrVDzXTj+rH5LCRxtu0UFsfuArS7xPBa95f4PCtPr5Cf4MCstwKNERRerTYeCdl8b1
 C77QO
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Changing the enable/disable sequence in commit c9b1150a68d9
("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.

This is an alternate series to Linus' series:

https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa%40kernel.org/

This series first reverts the original commit and reverts a fix for
mediatek which is no longer needed. It then exposes helper functions
from DRM core, and finally implements the new sequence only in the tidss
driver.

There is one more fix in upstream for the original commit, commit
5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
runtime PM calls"), but I have not reverted that one as it looks like a
valid patch in its own.

I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, as
I wasn't sure what should they point to. But I could perhaps add Fixes:
<original commit> to all of these.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Linus Walleij (1):
      drm/atomic-helper: Export and namespace some functions

Tomi Valkeinen (3):
      Revert "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
      Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order"
      drm/tidss: Fix enable/disable order

 drivers/gpu/drm/drm_atomic_helper.c | 122 ++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dsi.c  |   6 -
 drivers/gpu/drm/tidss/tidss_kms.c   |  30 ++++-
 include/drm/drm_atomic_helper.h     |  22 ++++
 include/drm/drm_bridge.h            | 249 ++++++++++--------------------------
 5 files changed, 214 insertions(+), 215 deletions(-)
---
base-commit: 88e721ab978a86426aa08da520de77430fa7bb84
change-id: 20251205-drm-seq-fix-b4ed1f56604b

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

