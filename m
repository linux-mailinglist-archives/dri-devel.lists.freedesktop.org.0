Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D669F6B2F38
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 22:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330DF10E2B8;
	Thu,  9 Mar 2023 21:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2039010E2B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 21:05:32 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id l13so3605771qtv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678395931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5fdk5ddG0VI4+eLcH5P8m0R0KTm1sGVdyuOV57yiRLM=;
 b=RBqNVCm8GUHGKKA3VwyZcbBavXznAkMiwwEZ2Eulet3wzdElxSkFVXad1g1rMIlR2Y
 FGf9HpescsayfQswXulDzaf1RxBm9Le4JfAx2ANqoHZm1kEOkzz+JyOPf5Ofj9dTHHHv
 XJlKkUHI/0gRhYUePhLV1dYdxm9bx/WuPJ8tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fdk5ddG0VI4+eLcH5P8m0R0KTm1sGVdyuOV57yiRLM=;
 b=4hSGBH5CyD83bPe4GLHzNsO9oxFvHz3ZSpoAS+e2cAUYzjR42wOxTaK+bDHmyZEwni
 V3xueI2eDgYjdfGNb7m/Qo6cMenh/rsl0Cxa3um1oZ0osa4jsOdYPM0uQGSBXjCi/9AW
 +uQlsDP7Q2taiU46imOqYmmB+PweHB0rFJYnrjbFxXhMQNhsYbRbdINhVYb3roYVKvM1
 e77D4olhyfRcRAqYkxDOAJr5qdPcMM8Vwt8Bk+jpXb7YvjrSd/X50pK+fQjISjzDsBc7
 NP6jASmCHYRRprBwWunk5CnVPX4xgyTWIKDdktsw1iBDuTRnateh1XHJy/46e7mGmaCu
 7q0g==
X-Gm-Message-State: AO0yUKUchWo7o1Gj1WC8EkwnCIk1Z8BO7KYdwVbvYeCpG9pjmvv93MmW
 +WPFeehDU150BKJTOO318aANkw==
X-Google-Smtp-Source: AK7set+w4EWBSOO5zfRJ+E2Yd08TsXQt0IbgUpDwnMvWNZ+EuowMhItpb0iWBXDHVpAub6dbY1Q2cw==
X-Received: by 2002:a05:622a:44a:b0:3bf:da1b:8023 with SMTP id
 o10-20020a05622a044a00b003bfda1b8023mr3569483qtx.38.1678395930899; 
 Thu, 09 Mar 2023 13:05:30 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:a575:2520:a8e1:989d])
 by smtp.gmail.com with ESMTPSA id
 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 13:05:30 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/3] drm/mediatek: Add support for 10-bit overlays
Date: Thu,  9 Mar 2023 16:04:13 -0500
Message-Id: <20230309210416.1167020-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, greenjustin@chromium.org,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to overlay driver.

3. Enable AR30 and BA30 overlays on MT8195.


Version history:
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.
v7:
 * Gate setting OVL_CLRFMT_EXT register on compatibility.
 * Split patches for adding 10-bit support and enabling 10-bit support on
   MT8195.
v8:
 * Updated descriptions for patches 2 and 3 in the series.


Justin Green (3):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays
  drm/mediatek: Enable AR30 and BA30 overlays on MT8195

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 173 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog

