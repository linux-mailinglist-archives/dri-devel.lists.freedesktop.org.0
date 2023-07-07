Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3D74B6E7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99510E178;
	Fri,  7 Jul 2023 19:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516D210E178
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:09:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2230748f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688756947; x=1691348947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EhjADJtp0nquqcDpxB6UxubGora2hMOTttGWENjgrAs=;
 b=ZVNe//Rm/YVC1n2rYGKZu9ldb0uovlvi1jqqMcAkPPRguMRiggz+vs3MgrGCItV3VY
 dtBocLUcoapGmuutOoDiHOU1bhT645gaFeMxvnQYEIavJA92bYTIG/GiYPtjg5ngvCzZ
 0hlPTW1iy26/7Ju2xQg5MdSCJZnkhxigU8C6KYIIXHdRAnfqRjBvvu3tetIzXem/PVf0
 bQU0okiB4DF01+Di6m4noXn4eejU69CXRBpljkuwvxzbAYZ47q7nRFTEFwVHFcBaRhwW
 O81MBgT2STQWm18zha7jFGUu9f0NPrU/upiCKoNRqDFPNUcB2oAFOuTBqu4gEHYFIFBn
 nJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688756947; x=1691348947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EhjADJtp0nquqcDpxB6UxubGora2hMOTttGWENjgrAs=;
 b=WmiGNQr7WrLsjDuRkeh+MD3CcBQzNy7Vzq5kQdFV6Ps1Ir7NH2mcQq+NIGYV8YrShI
 w5nd3HHL/+NsxmHHTBpQSOeNkQTljSLQ96OEFatVf9zCsHAbTUEpAKqEmcViA9+Nbz2W
 zIUzgohf+0vmyLYEOEGVRKtD3kK/t9xuTZFS+UZIPFajeGiYcIj3APuBIy/NcOoaJ0LP
 Bm2TZnyf+Dl1FsHZ9jWHqJxRGymecJd10BB7AOzUr+Fqo4tJkWZMmC25X/XNuakd5jHm
 T9osX1oBx2aOAe3vbLGUc1bvLIS4pBaku0j3+eokWha9R7FzaonQdh3aPqpr5xKP+H3d
 YeDA==
X-Gm-Message-State: ABy/qLaq/YCwXDjzphjzINJ4EFfMqJPdc+afgjwOCcXaoxNqCB6ZZKZU
 205Xu0Wz6kAXSA/1IQrH/0o=
X-Google-Smtp-Source: APBJJlHm1ZY+TFebf1Am1eya9vkNuRMCMc4ssUAXvLg9CDO+pLeZ4dlirNOk4QNRemU0RE4LXyVXCQ==
X-Received: by 2002:a5d:4288:0:b0:314:5f4a:5a63 with SMTP id
 k8-20020a5d4288000000b003145f4a5a63mr2893630wrq.54.1688756946996; 
 Fri, 07 Jul 2023 12:09:06 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b00301a351a8d6sm5114483wru.84.2023.07.07.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:09:06 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 1/1] drm/bridge: Fix handling of bridges with
 pre_enable_prev_first flag
Date: Fri,  7 Jul 2023 22:00:19 +0300
Message-ID: <20230707190020.6280-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function drm_atomic_bridge_chain_post_disable handling of
pre_enable_prev_first flag is broken because "next" variable will always
end up set to value of "bridge". This breaks loop which should disable
bridges in reverse:

 next = list_next_entry(bridge, chain_node);

 if (next->pre_enable_prev_first) {
        /* next bridge had requested that prev
         * was enabled first, so disabled last
         */
        limit = next;

        /* Find the next bridge that has NOT requested
         * prev to be enabled first / disabled last
         */
        list_for_each_entry_from(next, &encoder->bridge_chain,
                                 chain_node) {
// Next condition is always true. It is likely meant to be inversed
// according to comment above. But doing this uncovers another problem:
// it won't work if there are few bridges with this flag set at the end.
                if (next->pre_enable_prev_first) {
                        next = list_prev_entry(next, chain_node);
                        limit = next;
// Here we always set next = limit = branch at first iteration.
                        break;
                }
        }

        /* Call these bridges in reverse order */
        list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
                                         chain_node) {
// This loop never executes past this branch.
                if (next == bridge)
                        break;

                drm_atomic_bridge_call_post_disable(next, old_state);

In this patch logic for handling the flag is simplified. Temporary
"iter" variable is introduced instead of "next" which is used only
inside inner loops.

Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..7a5b39a46325 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -660,7 +660,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_state *old_state)
 {
 	struct drm_encoder *encoder;
-	struct drm_bridge *next, *limit;
+	struct drm_bridge *iter, *limit;
 
 	if (!bridge)
 		return;
@@ -670,36 +670,26 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
 		limit = NULL;
 
-		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
-			next = list_next_entry(bridge, chain_node);
-
-			if (next->pre_enable_prev_first) {
-				/* next bridge had requested that prev
-				 * was enabled first, so disabled last
-				 */
-				limit = next;
-
-				/* Find the next bridge that has NOT requested
-				 * prev to be enabled first / disabled last
-				 */
-				list_for_each_entry_from(next, &encoder->bridge_chain,
-							 chain_node) {
-					if (next->pre_enable_prev_first) {
-						next = list_prev_entry(next, chain_node);
-						limit = next;
-						break;
-					}
-				}
+		/* Find sequence of bridges (bridge, limit] which requested prev to
+		 * be enabled first and disabled last
+		 */
+		iter = list_next_entry(bridge, chain_node);
+		list_for_each_entry_from(iter, &encoder->bridge_chain, chain_node) {
+			if (!iter->pre_enable_prev_first)
+				break;
+
+			limit = iter;
+		}
 
-				/* Call these bridges in reverse order */
-				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
-								 chain_node) {
-					if (next == bridge)
-						break;
-
-					drm_atomic_bridge_call_post_disable(next,
-									    old_state);
-				}
+		if (limit) {
+			/* Call these bridges in reverse order */
+			iter = limit;
+			list_for_each_entry_from_reverse(iter,
+					&encoder->bridge_chain, chain_node) {
+				if (iter == bridge)
+					break;
+
+				drm_atomic_bridge_call_post_disable(iter, old_state);
 			}
 		}
 
-- 
2.41.0

