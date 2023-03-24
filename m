Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C076C766A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 04:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597D610E4AB;
	Fri, 24 Mar 2023 03:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836410E4AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 03:59:17 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id k2so735405pll.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 20:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679630356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5/x6xUHvTwRFsgTrEXeg3pX13bSDLxkZywP1Xe73le4=;
 b=iyt5GhYfKzDwjTCCM2vwOrvEZrKVVwF1OOD9H302ql6dH6poTrgoPMp8ygoN2Bhicn
 r1l6jrTA8nJIqDGo0frRFR7LsNrYuw8H+U68OZEl2Fd7mwqeklVWVjZh+pQY366GsAgh
 Re3VHLJcpN/dxNA3DXLuyp1ZlMw2JevPwpEE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679630356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5/x6xUHvTwRFsgTrEXeg3pX13bSDLxkZywP1Xe73le4=;
 b=rL8hXx/GMuPxEkXOBolHe+QROvb8w8Y+96LxJEo6q2/A24dggAoWUuB1HgBJlEy4AM
 Fr6mWRBJRucFgqM4MV/Jr29P0dmelhsOMacRLqZjdGTxJnGFGe+QvFX792403XAGW2QF
 lfXnYPtIfxPU/fFUShRG9I9NMe+3PVPQ4PogqwzbQqbvl9Udn0KOTRGp+CGbSLo5csCm
 9tX1LmNjhikgNUd0QqiTtKkqTmNFtuuin/kcTy32EO3RbpfQuiXDG2Q8UcNBzLmizzxk
 kNZkl56i9xPuQfkh6HUJ3KtLai3mnnLb8BhQjSQFgjWYdcrdrjavVRh+dWhcpkgi7V3y
 kNzA==
X-Gm-Message-State: AAQBX9dCpRNm8krB2Jwm/ZvQ6kWjkMsoFwWHacjoJREivn7KY0nvs9YP
 U7/e81eHt/8G9gzu8zs/c9MywA==
X-Google-Smtp-Source: AKy350YXePktJl6QG8JfXu8oz4ywLlmXo0h3VIMfdQ/+aoFk6hcK0sXWE6MT5Q7/X8C92Frhv1CMBg==
X-Received: by 2002:a17:90a:1a05:b0:23d:5485:b80e with SMTP id
 5-20020a17090a1a0500b0023d5485b80emr1489596pjk.6.1679630356510; 
 Thu, 23 Mar 2023 20:59:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:e6f6:fe75:aa75:56cc])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b001a04ff0e2eesm13069249pll.58.2023.03.23.20.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 20:59:16 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: ps8640: Return NULL immediately when EDID read
 fail
Date: Fri, 24 Mar 2023 11:59:09 +0800
Message-Id: <20230324035909.1727356-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
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
Cc: Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_edid_read returns NULL on error, so feeding it directly into
drm_edid_duplicate may lead to NULL pointer dereference. Add a check to
guard this.

Fixes: 6a17b4d1b52f ("drm/bridge: ps8640: Add a cache for EDID")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index cddbfe91f75e..b823e55650b1 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -543,6 +543,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
 	bool poweroff = !ps_bridge->pre_enabled;
 
 	if (!ps_bridge->edid) {
@@ -574,6 +575,11 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 							     connector->state->state);
 	}
 
+	if (!ps_bridge->edid) {
+		dev_err(dev, "Failed to get EDID\n");
+		return NULL;
+	}
+
 	return drm_edid_duplicate(ps_bridge->edid);
 }
 
-- 
2.40.0.348.gf938b09366-goog

