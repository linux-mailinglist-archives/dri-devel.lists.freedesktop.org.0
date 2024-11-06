Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799679BE4A8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85F110E6B6;
	Wed,  6 Nov 2024 10:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iwmaAYVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3110E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:48:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB5D560004;
 Wed,  6 Nov 2024 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730890123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCLa0tO35kgSJnAc+IEReJ7llWiZ9cXdN6mBzaWALkE=;
 b=iwmaAYVcgo+NHt/egv/3PkjhMCjvpztcz+EeVbCapBLbwFRLH5OqjT5Mzck1Y4H40/HLn+
 fpfr3r9+z4vLBtlm58VyKfv+PDXdiJk+gyFZ9npIM4jpZXbgM7bZ93d4wAmG3Lpp8yyM4O
 70zcbYFYoFL1LFWWLNWf3Cj/63Sd0AsTmVQg9rCdadKkkJ91ZKBVf5Q7yMfq9B/8cbVKjg
 SYDc90FGwNBWEuz6yAEcFSYt5l2huPNwLlZm5VlrrpXaIJbFL87vItKN/mrOZVW6bRnCOR
 QU6IcbukSn9avYdZ/YpOeBfDn2yjml+3yg8y440KeAxG8E9OBBmspsthqC7kjg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 06 Nov 2024 11:48:25 +0100
Subject: [PATCH v2 2/4] drm/atomic-helper: improve CRTC enabled/connectors
 mismatch logging message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-drm-small-improvements-v2-2-f6e2aef86719@bootlin.com>
References: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
In-Reply-To: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This message reports a mismatch between new_crtc_state->enable and
has_connectors, which should be either both true or both false. However it
does not mention which one is true and which is false, which can be useful
for debugging. Add the value of both avriables to the log message.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 43cdf39019a44537794cc5a519d139b0cb77073c..3c3bdef9bcf3c4ffcd861744f6607f317ab0c041 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -666,8 +666,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		}
 
 		if (new_crtc_state->enable != has_connectors) {
-			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch\n",
-				       crtc->base.id, crtc->name);
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
+				       crtc->base.id, crtc->name,
+				       new_crtc_state->enable, has_connectors);
 
 			return -EINVAL;
 		}

-- 
2.34.1

