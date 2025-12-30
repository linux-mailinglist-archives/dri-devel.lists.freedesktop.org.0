Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB555CE9D99
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F0010E273;
	Tue, 30 Dec 2025 14:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MKWYMYlD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C9910E273
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103409;
 bh=4upZlyGNOfjRwcM6TZxMkwiVrYZupHgE9fEWSopfkLI=;
 h=From:Subject:Date:To:Cc:From;
 b=MKWYMYlD+peIJcCgOi2z7RbSWlMPZM1F49Kmkq6/Kcj5acqm7QMtpKJSUzQgfIgNc
 pRG/NDxxyTEDDJ/KQ4s2W5YvIzRSh7fnRk52X9V492qGB5ue21i/sjdK71MY4BahMd
 XhxSvz9jwIGqmkIkw3OzXoy3/xyoXWdpo4F9B8eoQATB32Kcyc1Igy1KnrZaJG/ZrZ
 +RHbJcspXfvkSS8EM2yf53yG0vaFzPdgvzl5J37dEH3zkU7zA53i9LbhMCXdXrOXrH
 Tc4O/pYwI1G1X6CCU38ia7ugq+TCnARQbGIwUa9pxeD7XxJ6MGLLw5j7Ob1VPuDZBU
 BvoYkTECTXJ3w==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CE3017E0ED3;
 Tue, 30 Dec 2025 15:03:24 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
Date: Tue, 30 Dec 2025 11:03:00 -0300
Message-Id: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJTbU2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNL3dySbN3EtKRk3bTMitRi3SQzU7M0S6OkZKPENCWgpoKiVLAEUE+
 0UpCbs1JsbS0AflewTWUAAAA=
X-Change-ID: 20251229-mtk-afbc-fixes-b656f92bc2af
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

This series contains a handful of fixes for AFBC support on the MediaTek
DRM driver so that it can be re-enabled.

This is sent as an RFC because there are still some issues to work out
before the series can be merged:

1. Patch 4, 'drm/mediatek: ovl: Disallow AFBC buffers with width over
   1920' did not behave well when tested with Weston, so a better
   solution probably needs to be implemented before this can be merged.

2. Remaining AFBC issues:
   
   a. The first 4 pixel rows are always skipped in the displayed output,
      that is, the first displayed pixel, on the top-left corner,
      corresponds to 4x0. And below the end of the displayed output, the
      first 4x32 pixels are displayed.

   b. On some resolutions, there are still artifacts that look like
      misalignment issues, eg 1024x1080, 1080x1080.

   c. On some resolutions, no output at all is displayed, eg 1920x1080.

Tested on the MT8195-Tomato Chromebook.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Ariel D'Alessandro (1):
      drm/mediatek: ovl: Fix misaligned layer source size on AFBC mode

Nícolas F. R. A. Prado (5):
      drm/mediatek: plane: Remove extra block from AFBC data payload offset
      drm/mediatek: plane: Correct AFBC alignment definition to 128
      drm/mediatek: ovl: Disallow AFBC buffers with width over 1920
      drm/mediatek: ovl: Disable AFBC on MT8188
      drm/mediatek: Re-enable AFBC support on MediaTek DRM driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 59 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 48 +++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_plane.h    |  6 +++-
 3 files changed, 104 insertions(+), 9 deletions(-)
---
base-commit: 6f47c4646bee47319cc0980c693ed695c4cfd395
change-id: 20251229-mtk-afbc-fixes-b656f92bc2af

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

