Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74175AE9AB3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5975810E851;
	Thu, 26 Jun 2025 10:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R4581Oin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C382F10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:05:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63A4E4342A;
 Thu, 26 Jun 2025 10:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE2AC4CEEB;
 Thu, 26 Jun 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750932309;
 bh=bztUm11bzIIz+ufx6vgwEyDXl6PPou2zghLXJd6roOM=;
 h=From:Subject:Date:To:Cc:From;
 b=R4581Oinml9tzbAYr2fAVMbuPItNawPCT8+CLi3CPjakS2Zlb9VRw5KhOSsPOYIRE
 HqwCciJkgnhV0GSwPfNkAVQrLnTTGVBzUya4EC1iM0EzXW6pq84fpIR9q6AWDGTojT
 Y+9dfy+yRX+qxQLzU0Bfux/kSUQaiHpaCymkqb9ikYFpSezBJh+jvAB2+BiyvnDnvA
 CUr7YtOmEJ5fBkSsEdKx7zSv9DO1YyPkCPKED2M+VjUs0RWF5aXyd7TezHB0TNN25I
 +BqNedi9V7zZ5Vs1s3nbPuSuOteJrd19ocsg+NGc7Zo2N5r6scRRkUY4YYXq173aIX
 mcjXPgRnxbxVQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Date: Thu, 26 Jun 2025 12:04:58 +0200
Message-Id: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEobXWgC/3WNSw6CMBCGr0Jm7ZhSCxZW3sOwKDDARF6ZmkZDu
 LuVxKXL739u4EmYPJTJBkKBPS9zBH1KoBnc3BNyGxm00pnKtcFWJlzdTCN6ntaRsOMXeXTttbO
 2LtxFW4jlVegwYvdeRR7YPxd5Hz8h/aq/yezfZEhRYWO0NYVxNq/t7UESU+dFeqj2ff8As7pd0
 L0AAAA=
X-Change-ID: 20250624-drm-panel-simple-fixes-ad7f88b9a328
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bztUm11bzIIz+ufx6vgwEyDXl6PPou2zghLXJd6roOM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0v4KDws2sa97Zri0Z20tS1Sfj0z1yctiyV4Ms21n7
 fWv+5vbMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZiw87Y8OXYvTyx9hBW662F
 7zYXcr8t7j98J3gT53TOr08mO9jtXeB08nnvXua+R9OizypsUNEoYayVXqWmqyPvtipDdRd7y/8
 0i7DXx5R4bBbkMX32XCD/S1wpI5TXL3Li9vM/Au78Oq/e4wkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Here's a series fixing (hopefully) the panel-simple regression for
panels with a panel-dpi compatible.

It's only build tested, so if you could give that series a try
Francesco, I'd really appreciate it.

Thanks!
Maxime 

Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@francesco-nb/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Fix build failure if !DRM_MIPI_DSI and DRM_PANEL_SIMPLE=m
- Link to v1: https://lore.kernel.org/r/20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org

---
Maxime Ripard (5):
      drm/mipi-dsi: Add dev_is_mipi_dsi function
      drm/panel: panel-simple: make panel_dpi_probe return a panel_desc
      drm/panel: panel-simple: Make panel_simple_probe return its panel
      drm/panel: panel-simple: Add function to look panel data up
      drm/panel: panel-simple: get rid of panel_dpi hack

 drivers/gpu/drm/drm_mipi_dsi.c       |   3 +-
 drivers/gpu/drm/panel/panel-simple.c | 132 ++++++++++++++++++++++-------------
 include/drm/drm_mipi_dsi.h           |   3 +
 3 files changed, 87 insertions(+), 51 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250624-drm-panel-simple-fixes-ad7f88b9a328

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

