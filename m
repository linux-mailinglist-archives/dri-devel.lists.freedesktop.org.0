Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D829CAFC62F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 10:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B024110E167;
	Tue,  8 Jul 2025 08:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JjmroEvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A7910E160
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 08:52:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3867463A6;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19A0C4CEF0;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751964740;
 bh=BSVHRxRLMFx5rMeJ/BkvsNjbrXj2x9tNMDRCvByqmBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JjmroEvo8g0tqzcmsCu1MlR+6FKQd8ao9JNSZhOeL+aY/0csyqCC12AkPuLo+E41M
 sYSzarU6nRWXKe95H8EJiNPQwcPv3KQpWiNprojvDkdm57KIhKSo7oSF7mwuayDo27
 Un4cJriwCUJGh5K3rK0exD5AaMovVoVijf6khuwvMGUsge6DS4MPMilQiu/5Tit6XK
 F87+qQgUyC9cJc0/OWbwx5I/pOFwGtX9hsjF4v52Ft52v3SKj8J9OEG07QWaUxsJ6v
 TakYntM4yGVB4KQU68wbYtIGhd+qsdrdbjDXvFhZRXwayGTaBJAkvE78Hfui+VbTZr
 hB5a6OmE2qsmA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uZ43g-0000000042J-2JGA;
 Tue, 08 Jul 2025 10:52:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] drm/bridge: ti-sn65dsi86: fix OF node leak
Date: Tue,  8 Jul 2025 10:51:24 +0200
Message-ID: <20250708085124.15445-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708085124.15445-1-johan@kernel.org>
References: <20250708085124.15445-1-johan@kernel.org>
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

Make sure to drop the OF node reference taken when creating the bridge
device when the device is later released.

Fixes: a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev")
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index de9c23537465..79f4d02f24cb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -467,6 +467,7 @@ static void ti_sn65dsi86_aux_device_release(struct device *dev)
 {
 	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
 
+	of_node_put(dev->of_node);
 	kfree(aux);
 }
 
@@ -490,6 +491,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	device_set_of_node_from_dev(&aux->dev, dev);
 	ret = auxiliary_device_init(aux);
 	if (ret) {
+		of_node_put(aux->dev.of_node);
 		kfree(aux);
 		return ret;
 	}
-- 
2.49.0

