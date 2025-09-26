Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C2BBA4863
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 18:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B3410EA94;
	Fri, 26 Sep 2025 16:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pSEdxGvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4D110EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:00:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 35C8C4E40E0C;
 Fri, 26 Sep 2025 16:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C058606B5;
 Fri, 26 Sep 2025 16:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 927C4102F197A; 
 Fri, 26 Sep 2025 18:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758902446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Pyl7McX8p/BvXq+1eS++mIsDEQYJnykZVE13rAURX84=;
 b=pSEdxGvoMSA2wLwDyKPNC11bCZHACQd7041B62ZaVy8r3Cin3eZ6ivrLAgkw51kf5hTl/B
 /eVefzTFdgRc9Gw3dJns3lX5lEwyvV4IuNjrkIqLWUAbUJvcZpHKm4fpAQ6UyaaJxieb7q
 Ziy+KKKwAqPnm9o15Y/3FWc+litHwWYSYXl+cZRZEQkOPJIzYtnhCdEUIIkPiiP8ahq380
 QuLFg/7RnbvTMFRC46BHyEdb7kkPjDBCpdJEeHmQLRzPTFFcArGE6PsAuG4+Wjh00usNCY
 kVbO5WBYl+d2Vn5fS75bXtrlpKJdLFtcPex4N2qgu40POPOYIzvnLxdADx4IGA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 26 Sep 2025 17:59:43 +0200
Subject: [PATCH 2/7] drm/encoder: drm_encoder_cleanup: take chain mutex
 while tearing down
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-2-23b62c47356a@bootlin.com>
References: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
In-Reply-To: <20250926-drm-bridge-alloc-encoder-chain-mutex-v1-0-23b62c47356a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

drm_encoder_cleanup() modifies the encoder chain by removing bridges via
drm_bridge_detach(). Protect this whole operation by taking the mutex, so
any users iterating over the chain will not access it during the change.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 3261f142baea30c516499d23dbf8d0acf5952cd6..3a04bedf9b759acd6826864b7f2cc9b861a8f170 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -195,9 +195,11 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 	 * the indices on the drm_encoder after us in the encoder_list.
 	 */
 
+	mutex_lock(&encoder->bridge_chain_mutex);
 	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
 				 chain_node)
 		drm_bridge_detach(bridge);
+	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	drm_mode_object_unregister(dev, &encoder->base);
 	kfree(encoder->name);

-- 
2.51.0

