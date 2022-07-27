Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31D5839D3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619929513E;
	Thu, 28 Jul 2022 07:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6EB10FACA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:31:26 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id y15so15424209plp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JAMO694Oo6l0rJ9WHvA6jFiTH+suc0dOkuX3t1F6TQo=;
 b=SrZZh4amzZ2qIwoFA52mW+urWPH+uedlcGdJG7StMSHrH0RoU+IpR2Z2wFfiESXP6U
 GuqZ6uhVDccHR2XDiYtxlPjkrCJaMczYYWUCek/WXZfxfRQgYdUdywVU1c5J0AtUZVgx
 cZizK5eBLnntpeJPhhppNeSyUx6aAcacB4PuVfSnRhCONDVXbvdnOICBzxG+cfqmH4NV
 QlQvB+o3ahES0Ce3FGA2N1Gt9HJwAC5ffUWKObrceeLgPfLnv9rjAT+SkgkmnZltsNgL
 iQT2+TdV0pzC/3KGYQqNQdTu61xN4pbneyxHl93yvQPxNeJkgqi9HI65Dzegj6dRFT9U
 1J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JAMO694Oo6l0rJ9WHvA6jFiTH+suc0dOkuX3t1F6TQo=;
 b=CZbtduiBErKA6xpUCV2CrbFyd1Dq7gj39cw7PIWCAWWWS6R+BP4lKR5WQjVkEqF7Sy
 pDfZBCpsDD0hjNpY582sDqNqRHI3PbOi1AJ0vI5dYXkWvhy1BfLvBg2h2qOq1biCvCvf
 NUcn/h72IjGRajmZTAp2d7s9urRmUw4eatGScfBWI5TkjT6+//keon1ycldhZJqUbJ/+
 t7fN/Kjjo3Bjp63AUzTb4TsLJSuvlk25SZCJJ1IKVHt7M3l4Urzjzfvf8/9nKFiNDmqP
 4X6g4BGH48G9gr5ayw8aGKp3Fylecui+HFwrigFBCG4c5F6WXHx5Q4QwfhBHc/noMdMy
 QTTQ==
X-Gm-Message-State: AJIora+AS9DY6GgKGLJzKiXlLT4DohRCVyJdbilP/60WyJs7fwS1Mb95
 LMllPU4gGtwjuwPQyDnOaUY=
X-Google-Smtp-Source: AGRyM1v0TikaoZXfPRYExckx6I0q+Dh/vK5TzQMBoH7oEpGz7bf6kXLR0mBBip/ifIV7mqt+ze/zVA==
X-Received: by 2002:a17:90b:1c04:b0:1f2:91be:b6f0 with SMTP id
 oc4-20020a17090b1c0400b001f291beb6f0mr3145473pjb.139.1658907085539; 
 Wed, 27 Jul 2022 00:31:25 -0700 (PDT)
Received: from localhost.localdomain ([43.132.141.3])
 by smtp.gmail.com with ESMTPSA id
 63-20020a621942000000b005255263a864sm12956915pfz.169.2022.07.27.00.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:31:25 -0700 (PDT)
From: Zeng Jingxiang <zengjx95@gmail.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu: lontium-lt9611: Fix NULL pointer dereference in
 lt9611_connector_init()
Date: Wed, 27 Jul 2022 15:31:19 +0800
Message-Id: <20220727073119.1578972-1-zengjx95@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Jul 2022 07:49:19 +0000
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zeng Jingxiang <linuszeng@tencent.com>

A NULL check for bridge->encoder shows that it may be NULL, but it
already been dereferenced on all paths leading to the check.
812	if (!bridge->encoder) {

Dereference the pointer bridge->encoder.
810	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7ef8fe5abc12..81a4751573fa 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -807,13 +807,14 @@ static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt961
 
 	drm_connector_helper_add(&lt9611->connector,
 				 &lt9611_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
 	}
 
+	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
+
 	return 0;
 }
 
-- 
2.27.0

