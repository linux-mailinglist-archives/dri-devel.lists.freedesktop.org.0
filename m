Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171385A5251
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2857D10E3C8;
	Mon, 29 Aug 2022 16:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D7210E3C8;
 Mon, 29 Aug 2022 16:55:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DB24611BD;
 Mon, 29 Aug 2022 16:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01FAC433C1;
 Mon, 29 Aug 2022 16:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661792103;
 bh=HiXBOm9dvzWK6mHglRBKim5I3iQDy4svVep8E5b0sME=;
 h=From:To:Cc:Subject:Date:From;
 b=FoHQL1KrEzneppmN3SgxX1IImlY1zrOwvKJF+GUdJRm5+H/HpCnTOtgJ6h/aNK/J4
 JM2GTtzIl/wrW9a9+cmiP629/xcU8pZmfxHUA7R+HulqRJ7dWt7eTLiQnyT+725A5j
 XcVNJUAlfLSx8hSA29R+DX++apn0uqdeFHVPhTDAUIEDGXcq5yVtMoQiFEKrzn0lWs
 jCyEob3iychWRCGKEn3iLg7EYBwckUhb1c6jEBku8PHjerkshTRWyowPeiBiv6gVPx
 L3+bvNz+IWCI1ePD5z1S6HukDWKta+RxSBSwaXEGZg/zGor8U6PgwxWpTskJKfcSTZ
 7cguOZzgEcctg==
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dsi: Remove use of device_node in dsi_host_parse_dt()
Date: Mon, 29 Aug 2022 09:54:50 -0700
Message-Id: <20220829165450.217628-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Tom Rix <trix@redhat.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

  drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_node' is uninitialized when used here [-Werror,-Wuninitialized]
          of_node_put(device_node);
                      ^~~~~~~~~~~
  drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variable 'device_node' to silence this warning
          struct device_node *endpoint, *device_node;
                                                    ^
                                                    = NULL
  1 error generated.

device_node's assignment was removed but not all of its uses. Remove the
call to of_node_put() and the variable declaration to clean up the
warning.

Fixes: 5f8cdece42ff ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
Link: https://github.com/ClangBuiltLinux/linux/issues/1700
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 57a4c0fa614b..7fbf391c024f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1867,7 +1867,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *endpoint, *device_node;
+	struct device_node *endpoint;
 	int ret = 0;
 
 	/*
@@ -1900,8 +1900,6 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		}
 	}
 
-	of_node_put(device_node);
-
 err:
 	of_node_put(endpoint);
 

base-commit: 5f8cdece42ff0c615e213b6619d29487f9f409d7
-- 
2.37.2

