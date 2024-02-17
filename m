Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08685904A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9A710E213;
	Sat, 17 Feb 2024 15:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eEqGR0C+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593A10E1C3;
 Sat, 17 Feb 2024 15:03:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 629C76141D;
 Sat, 17 Feb 2024 15:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17518C433B1;
 Sat, 17 Feb 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708182183;
 bh=POmhG3XikVsaXc0RusI64Jf3HUeMzGtS54gIumrv1I0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eEqGR0C+9C6T6cV2g4R/ygaPvBNcGscgTTbDfWpt6RqNCVCSNemlDmMiBjLINFF9K
 vNOWBEXAul5FUj2axKYGDdckCtDO4TfXoy/tk+8sx+M+Nax3pT9M4+S/bHKHCxiynt
 JVidLDi1X3iyquM1kp0a0kub0LV/yLpN3RHEru2kNVYZ1+NxnuinFZsD6q3h74J/bF
 QqKCFNwEidPJOkwPHGJM73U2yVQ+4BuksOAvfFpAIVLuaZV050HXeu1xqCZl2QDBHY
 upv4mvxbKoOiSRj0B/wbcx4RIR8QiHUJlV8SjhAA3Z57ya1yYljjfWRvPgLGCifDKc
 1sh5+H+c0Jn0g==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan+linaro@kernel.org>) id 1rbMDW-000000001Vo-2L8p;
 Sat, 17 Feb 2024 16:03:02 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/6] drm/bridge: aux-hpd: fix OF node leaks
Date: Sat, 17 Feb 2024 16:02:23 +0100
Message-ID: <20240217150228.5788-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
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

The two device node references taken during allocation need to be
dropped when the auxiliary device is freed.

Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index bb55f697a181..9e71daf95bde 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -25,6 +25,7 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
 	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
 
 	of_node_put(adev->dev.platform_data);
+	of_node_put(adev->dev.of_node);
 
 	kfree(adev);
 }
@@ -74,6 +75,8 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
+		of_node_put(adev->dev.platform_data);
+		of_node_put(adev->dev.of_node);
 		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
 		kfree(adev);
 		return ERR_PTR(ret);
-- 
2.43.0

