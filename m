Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FA485160
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 11:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF1410E623;
	Wed,  5 Jan 2022 10:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB4710E623
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 10:48:33 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id r5so35181450pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 02:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=nBmNBAQ4hWVtra8c2jSUbNZPXDwdJxy3lN7QmYn/eTU=;
 b=FrtT2pI+Irbd3Aj5ERh5/QdY2C+8WwZYcvyoiDoOBHzPkv5svtVS9sDDfWwsvvNclT
 q08BZAfQ7cv8v89JJHnEY+LZijGtgJ9287Oqrt1pI4DC46DgPM3M4ZxwkDZwrBpkE+8q
 Qqo+CRHXSwiLUAAUsTqalYkrecvWqX83vUgKlXDaFMbPDuEVNrRtFA/TBcCNtY/y48Ff
 vf2aiXH+truLbK6Ny003rLCWMbAal1vU/HK3eUlpZRyuGbraQDqGYLXJf8faOlkJ4IuI
 ga/+PAGCXBjg//NJlNF2sRIf8aS8fjS2qlbadbgR8DFyWfs0i9FKhyhWD+N/6lm+oGN4
 Zfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nBmNBAQ4hWVtra8c2jSUbNZPXDwdJxy3lN7QmYn/eTU=;
 b=aklplvkPpWqkMx6fSUz7ngV29soIIXxp8CnXt9T96lM0YA8fcTfqZB8Ow4mRA7oPWl
 PkCYkMW1w0w4zq4t8+zB7T4kaov/IbExJxOO6756Cd3f+Rf/0ua2vYG2sKwb+EoTqMcx
 QZhGSiv9TqPZjlLVzEjLtncSaHTNVOUDdzfxrImmUMf12l1U1tVh7EWDO7LA++DH5X0v
 wYW+VmwdfoCOvdPoqfRnliimwjWuyY4OByEySpM8U2Tu3DTuyF/vgCNNaqvDowyXZ1oy
 6jtz9pLujx3OvXM+reR/Vq+QGAyMn4bxWKuW99sq9pJl6HceEGamCTynxL3jALlXChdN
 G64w==
X-Gm-Message-State: AOAM531FvGvhyRKsBD4GA36B8jhJK+m7e0Z/zpFrVRVbfraCW8t9+8U+
 zgGtdbPs0VSJrWnFtZ6xj5g=
X-Google-Smtp-Source: ABdhPJyRYj9zO9mX7/fkJBF4fCaILWvFlHOwDxKg4WhdQkF5WcUHW0h4c7JZWHsQOCyNDd96N6HP2Q==
X-Received: by 2002:a05:6a00:198a:b0:4bb:4621:f074 with SMTP id
 d10-20020a056a00198a00b004bb4621f074mr54759563pfl.69.1641379713067; 
 Wed, 05 Jan 2022 02:48:33 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id 27sm34878181pgx.81.2022.01.05.02.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 02:48:32 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/bridge: nwl-dsi: Fix PM disable depth imbalance in
 nwl_dsi_probe
Date: Wed,  5 Jan 2022 10:48:26 +0000
Message-Id: <20220105104826.1418-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pm_runtime_enable will increase power disable depth.
Thus a pairing decrement is needed on the error handling
path to keep it balanced according to context.

Fixes: 44cfc62 ("drm/bridge: Add NWL MIPI DSI host controller support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a7389a0facfb..fc3ad9fab867 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1206,6 +1206,7 @@ static int nwl_dsi_probe(struct platform_device *pdev)
 
 	ret = nwl_dsi_select_input(dsi);
 	if (ret < 0) {
+		pm_runtime_disable(dev);
 		mipi_dsi_host_unregister(&dsi->dsi_host);
 		return ret;
 	}
-- 
2.17.1

