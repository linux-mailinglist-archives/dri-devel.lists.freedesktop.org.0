Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE443AA5D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 04:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402B6E212;
	Tue, 26 Oct 2021 02:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8976E212
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 02:37:08 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id t1so8583576qvb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DTETaP1KHJxtdRGnmmwFS1JhyLh5JLZ7RKeF7+RrWiA=;
 b=OrBodLzIXlm6nxqfY+94yHCUYNEcJnqFjcdyih3/zIslBn7l9+A9n9y89La2RyhoVr
 8XntsxU3cmaoYTIMx5nsDUnmJAsdZGq8lWqNX5HUi4VeileOrEdk1TKAoM7xRUO+3Dqa
 vzn6yHKSyi0lawa1kTR+BP7TDMPwZqWJSR0P0vwSIkCTDHstZsSiq3O6KpLbDWGNWeNg
 9hLsDiEt7D6e71ZiGAx1BDnmRxlfdHrpV6bdf6nLnCququ4N/vNLfrZWaZc0p2mUN6as
 imlFVUc4jH6JS/Kbw9q9wX0dcemiHd5FMBtAJl4xYONxy7Eh77S/7VIATd2T1aNeB0D5
 o1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DTETaP1KHJxtdRGnmmwFS1JhyLh5JLZ7RKeF7+RrWiA=;
 b=Qe0Mbevc5gSa2v7Foki3ePCHUpXj4GzX23zZhEBLhBL7NKIReoUMztkKaZ5RjzAjQS
 I98ApIXs2XCyjANUk7sR/zDScn0hRESKqHszQvvVyqY/nrWMG5TYN9Il1spevpKgOnUY
 0/tymrlBEkWatY/vcA6Zsx4qsVjPtdG3jSrtVdwH5haXeRnyFxaPgsRvuoIaVVWWkr2e
 f90ytxXSM4+R33CEKbPslG6PtQ2NnhJ/H2RqAjHKT80MdtTKbGrtvRoxFO12RJKd780J
 2ZpzFLZOg/8royolvT6C4NVctbKLbJ9lw1ASD4+sKTIAcKGVPNaSf23noUZp3U2SbIrI
 fuVg==
X-Gm-Message-State: AOAM533kaQCmW293VStD3Q2xagms5KWcloAyptZFnyb2YHXL9FbeRhFx
 hXt1Krq+rsazBUnqGLp+zV4=
X-Google-Smtp-Source: ABdhPJyplLk91Tr+sae/eJApG3oOhuPL/YK5EjJO+0q6JfySRWctAIEqlx8TukbyjBuFt8elF81YIw==
X-Received: by 2002:ad4:5903:: with SMTP id ez3mr14330933qvb.14.1635215827851; 
 Mon, 25 Oct 2021 19:37:07 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id q196sm9948468qke.27.2021.10.25.19.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 19:37:07 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: robert.foss@linaro.org, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Mon, 25 Oct 2021 22:36:38 -0400
Message-Id: <20211026023638.41646-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
  Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
  Selected by [y]:
  - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]

This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
without depending on or selecting DRM_KMS_HELPER,
despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig.
Please advise if this is not the appropriate solution.

v2:
- changed from "select" to "depends on"

Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..a630cb8fd1c8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -30,6 +30,7 @@ config DRM_CDNS_DSI
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
+  depends on DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
 	help
--
2.30.2
