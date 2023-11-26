Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F67F9374
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 16:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844510E0FE;
	Sun, 26 Nov 2023 15:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A3B10E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 15:46:38 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a08e4352992so278689666b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 07:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701013597; x=1701618397;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZPhojAvgi+YoDilK1ECw25JeY/ntj0LxcVc6MoPKWUg=;
 b=lqoalNzeaAUqtbGJg06caGV5CBuiwH8YQadqP6Sb82kWn4zic4MhM3N6PUt08J58t6
 3p9SP7GCjl0pdDMMvUMzcpqN4+I7dKxAt8nQWkOBW+YcBWX0mXQrOvpTTOEK0izZx98i
 qDCOj/CxD5z9diBGV/kXON+TOy/qkZg26YJJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701013597; x=1701618397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPhojAvgi+YoDilK1ECw25JeY/ntj0LxcVc6MoPKWUg=;
 b=cYd0hFQ/xu4PKFENllIgcgr0WeJjshZ0bXS/TvQot/a1YngzdgJegYgo1yIxAvFkSb
 s/0nuXAhL7KQ68fxfLUh1wqKfUuByhzj6pL1LzapN9i813gz9mkjjvJ+aCWI/3U9WEap
 KxSPrGWI4qhpCFFo0SzqZBikuq01eRCust4ztFkaXbJbbGsGJt/7PmVNTE8Pmmv+Std5
 Xtz7xZ64gN8ABYvWNzpWA2MqLRjQ7LqRJIfZbvkl9L3fc552lPAOqObz9vZuL9Wog/Kh
 d5/9D6TPPYaT+Nv3YO7sPQuB7nXSDA2cEWPfjV74Ax1GFzwk6WYK0fQnoOGgzxtpd0ze
 tnKQ==
X-Gm-Message-State: AOJu0YwK6YPg7jEXz4orgFY7T391UeYFcmb1OJZWidjkPSH4v9JDr4yZ
 gdYcB7OSxmrVF8FQBLYRRdMcdg==
X-Google-Smtp-Source: AGHT+IF2c26zfuOWidFTcrN0JuwK29CG/Vrvyi36DqjR5OBr6Zcl5SPM1wOzXPA5XTBjCtCQwzBZiQ==
X-Received: by 2002:a17:906:2f14:b0:9fe:ab09:4d9 with SMTP id
 v20-20020a1709062f1400b009feab0904d9mr5649578eji.59.1701013596469; 
 Sun, 26 Nov 2023 07:46:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a170906591800b009fdc684a79esm4656158ejq.124.2023.11.26.07.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 07:46:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] drm/bridge: Fix bridge disable logic
Date: Sun, 26 Nov 2023 16:44:53 +0100
Message-ID: <20231126154605.15767-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
References: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As explained by the comment of the fixed code, we need to find the next
bridge that hasn't set the "pre_enable_prev_first" flag to true. The code,
on the contrary, was doing the opposite.
So, the order of disabling the bridges couldn't be altered as required
by setting the "pre_enable_prev_first" flag to true.

Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 30d66bee0ec6..f66bf4925dd8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -686,7 +686,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 				 */
 				list_for_each_entry_from(next, &encoder->bridge_chain,
 							 chain_node) {
-					if (next->pre_enable_prev_first) {
+					if (!next->pre_enable_prev_first) {
 						next = list_prev_entry(next, chain_node);
 						limit = next;
 						break;
-- 
2.42.0

