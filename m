Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A101F624952
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E086910E02B;
	Thu, 10 Nov 2022 18:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB9910E02B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:24:10 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id w4so1443183qts.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cljhpp/VlDLcEVefT+kbc4kwwtaLkI+8qYwF7PdRUXM=;
 b=GpWCPf1cycf6Ch31K2Q6u/AJaCOOf+b0CMrlVN2WaJPkSMQyocniK29bVR7NjZH6xi
 OXu7Gav4MZLIAw1P8ATbxNPxYfpaZY0bhpp5NdNle0ZN+AMfbEMUw3BnN0MWXpGUx+s8
 RNe5naDKt6dzFcsrx9mxdrObJXZch/NPuAfcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cljhpp/VlDLcEVefT+kbc4kwwtaLkI+8qYwF7PdRUXM=;
 b=u3mtwJSzcQQkH2mhowv1jpdGwKtEPdfmhxGnbmV4ku+8utJlZb7Dd1qdiJoqNT262y
 Ij2iddsOH8I9uCxeu/fJ/eLSpob7hUl4TDYM2T/ZNeYmlCPGWuXPbNsTxI/FxUZFfZRD
 ZSw0TL0dhlS3uNH0wy0uAwTsibBaVmsnmtTxl9IGBob3VzkuJ0UTn4XL0XsgXc6LSuxE
 KqPHtIrkKq+q6QzQSFhNVVU6U3QtpQ8jKTuEM9ThALZd5ZBczF8Ia/i0ysk8StFWJnj4
 Wv92B/jB82woFqBfz68FHqy62IJ4H2sZNPgXvYCVSFK1jSsHtR6s2Rjc25fTD+5i/cQN
 jhBA==
X-Gm-Message-State: ANoB5pm9+C6LzBzDGJ9CfWc2ejFGmIdof3pCbu2soxUCxQ9+d7q3N8Xj
 eqPLuWKh7RF/g+IUJ2Mp3dvEcw==
X-Google-Smtp-Source: AA0mqf4Of8vLngtSdsgjV/ZJ3PB2ZskScQ8EXTfBrxSKC9jWqoPaDUiAuDXTH6ikQjCgNSuRdmPMCQ==
X-Received: by 2002:a05:622a:14c8:b0:3a5:95dd:6aa0 with SMTP id
 u8-20020a05622a14c800b003a595dd6aa0mr14913063qtx.673.1668104649466; 
 Thu, 10 Nov 2022 10:24:09 -0800 (PST)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:4101:1159:30f8:2e7d])
 by smtp.gmail.com with ESMTPSA id
 bk40-20020a05620a1a2800b006fa4b111c76sm12677qkb.36.2022.11.10.10.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:24:08 -0800 (PST)
From: Gil Dekel <gildekel@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: make eDP panel as the first connected connector
Date: Thu, 10 Nov 2022 13:23:25 -0500
Message-Id: <20221110182325.1841369-1-gildekel@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
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
Cc: chunkuang.hu@kernel.org, Gil Dekel <gildekel@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 seanpaul@chromium.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some userspace presumes that the first connected connector is the main
display, where it's supposed to display e.g. the login screen. For
laptops, this should be the main panel.

This patch call drm_helper_move_panel_connectors_to_head() after
drm_bridge_connector_init() to make sure eDP stay at head of
connected connector list. This fixes unexpected corruption happen
at eDP panel if eDP is not placed at head of connected connector
list.

Tested by ensuring the internal panels are at the top of the connector
list via modetest -c.

This patch does to mediatek what the following patch
https://www.spinics.net/lists/stable/msg590605.html
did to qualcomm.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
Tested-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..76daaf6a0945 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;
 
+	/*
+	 * Ensure internal panels are at the top of the connector list before
+	 * crtc creation.
+	 */
+	drm_helper_move_panel_connectors_to_head(drm);
+
 	/*
 	 * We currently support two fixed data streams, each optional,
 	 * and each statically assigned to a crtc:
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

