Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B333B805138
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F0810E4E6;
	Tue,  5 Dec 2023 10:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD7B10E4E3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 10:54:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50be3eed85aso4292767e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701773645; x=1702378445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=XFUw1wUfPWcFp2JaI2bNO5U3d4H7PaGVShe8WM4NTjz5cxM5XZTuRPvBWSQS5m7O6R
 uPOXp+Sos5BQfYhWET872Ni2K95yHymslyu/Penz/OeLyUT58BebBvOUMoiZbrRvlfyf
 mM/Hvv0g32/J8fyxTpiqdMRI6Benc/Xw0CRSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701773645; x=1702378445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=do8mfLeRVbHV8EVyvXPhLIfa67/jNqBihl6zAgmzG4OJcaazQrhen/N+3fIuYReqwm
 3FX1p/CkFQFuUkoOMjTUl/UFuaiJYefZUVA993Y7uRznTQ6rDjDwU4bWoXuy9RQsqYkz
 k5y10j7rsDbv9JkR7vdMfjIInajIw7fOQV5qwxrkMx/Agluxw/KLfVMbHI5/scjH0SYs
 j1AaI0xVU8NQVV/qXxGqiV9MZjTEL3XofwSOrvJ98IprlofYXcvNTunxhQaYgClNiNZ2
 Zog9mSbNLcTLaFkteiOg/h0CYPhGf55SarMWPpcDgdWR7b93VfUsTPJruojnmRl/MiXL
 c4UQ==
X-Gm-Message-State: AOJu0YwK6ay5PcUvz3t18zRnlEHOhLpJJR6cHDalv4Nddmzgxkv9PKCB
 NfnzoZlDD+2XIVVhsZ/yQ1gVtA==
X-Google-Smtp-Source: AGHT+IH2ACowoJoO+30xriMCkLCXsinUnSHTDGh9ilzVZ9c8a5SVKoBwYjDDlS2Qdi+JBVbyncICpQ==
X-Received: by 2002:ac2:4c8c:0:b0:50b:fe3f:8086 with SMTP id
 d12-20020ac24c8c000000b0050bfe3f8086mr1104607lfl.53.1701773645010; 
 Tue, 05 Dec 2023 02:54:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a170906089700b0099297782aa9sm6413491eje.49.2023.12.05.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 02:54:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
Date: Tue,  5 Dec 2023 11:52:49 +0100
Message-ID: <20231205105341.4100896-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
References: <20231205105341.4100896-1-dario.binacchi@amarulasolutions.com>
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

