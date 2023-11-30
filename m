Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10377FF18D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB0410E70C;
	Thu, 30 Nov 2023 14:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E38E10E702
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a178d491014so130378066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701353836; x=1701958636;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=W2ecBuKfAOL1CFzeEVw/DcrdbYGn8/MEEzTz18rFVrezd3uSXBdQtZ9khJ8wzlnLBb
 7cvqMnwpxiYEvSt25tOP59sFTbMnonNKVLPNbowzZxH/KeH1JHZv+xiyzj/hmDnc6Kaf
 tBVuLvaqdf+ylxA2z72XyXTnwzl17RczPDgos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353836; x=1701958636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=nOK0/CUpXZXzIJjvSDSp4dmc9K3A0+yqbKDBISv2WBS+jTd+l39E8VWQ2kTzgIki7r
 RfM3F8q1w5snqpb+GJ4tcq9y7+GC5E7U+9nE5B96Amb4gyi6LRIoGg7IWwKCY1DA48ze
 7lutS/hp6WRoxZmGbRsIkZ4ga0IyuOMCh6PxHyHH/G5JbEZb7l0dPTJVNq1XwuAha6Kk
 OwPur/xy6Xfq6NO+jEcknDU0fJHt6jrom6e5g86+I/LyW/LmjvkPCb0AGO12bX9R8O4O
 Jys596tcQVoNP6w/nmR0TNl3qMliC4V8kVcgKLETLNXPoG/qTUnA7BgEBKq8XKj+fiIt
 dtqg==
X-Gm-Message-State: AOJu0Yybsg9gXp1zITcwldvKrHVFiG6zeRZYE2mfIRszJQYoh+Sj8Qhx
 RNF49IW8UNFg7r66+1c2qqcHRw==
X-Google-Smtp-Source: AGHT+IGPJFSHiwsvUjkjxeqqI3O330KX4fQMrY818rLAIKFMtGBlIdjSgFv6U+hzidftmcj4vVW8XQ==
X-Received: by 2002:a17:907:1051:b0:a18:bb79:9a0 with SMTP id
 oy17-20020a170907105100b00a18bb7909a0mr1186409ejb.58.1701353835975; 
 Thu, 30 Nov 2023 06:17:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009f28db2b702sm716064ejc.209.2023.11.30.06.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:17:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
Date: Thu, 30 Nov 2023 15:16:19 +0100
Message-ID: <20231130141705.1796672-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
References: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
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

The patch fixes the code for finding the next bridge with the
"pre_enable_prev_first" flag set to false. In case this condition is
not verified, i. e. there is no subsequent bridge with the flag set to
false, the whole bridge list is traversed, invalidating the "next"
variable.

The use of a new iteration variable (i. e. "iter") ensures that the value
of the "next" variable is not invalidated.

Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f66bf4925dd8..2e5781bf192e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -662,7 +662,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *next, *limit;
+	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
 		return;
@@ -680,14 +680,15 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 				 * was enabled first, so disabled last
 				 */
 				limit = next;
+				iter = next;
 
 				/* Find the next bridge that has NOT requested
 				 * prev to be enabled first / disabled last
 				 */
-				list_for_each_entry_from(next, &encoder->bridge_chain,
+				list_for_each_entry_from(iter, &encoder->bridge_chain,
 							 chain_node) {
-					if (!next->pre_enable_prev_first) {
-						next = list_prev_entry(next, chain_node);
+					if (!iter->pre_enable_prev_first) {
+						next = list_prev_entry(iter, chain_node);
 						limit = next;
 						break;
 					}
-- 
2.43.0

