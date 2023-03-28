Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B26CC8D5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7892810E955;
	Tue, 28 Mar 2023 17:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5BC10E955
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:08:14 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id l7so11495320pjg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680023294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O72nQMvXwuS9p7u9XEXsCt0AwfhA6j8fJBtuOxggIi4=;
 b=lL/wtX/BK28lAspoV0bcnfhFo9YyMSJImZLu3fcnopLu2UWxHZ6iaIay4NK8GmQtQc
 p4czGWsZ7rXIrsUY9Ow1ehQYM2QWj5NTyJcz4CWcw4a/COkomue1zLWddbJjyEIdERdF
 JwlVFZEDwXX/0oyxpFeHSJ+fFHxjZEl1qMSzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680023294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O72nQMvXwuS9p7u9XEXsCt0AwfhA6j8fJBtuOxggIi4=;
 b=PYb9MZXkOzkoqZpyDveZLHHos3UK+p/4zl8dZIa/PEs0FmAtRJT6S2RPehbNBwKMEp
 xrHqV1gh0/br7dWyIKrAIfidtvQNd1Ot1GtoEWUfnzSVn8BW0YmBdt1SxJqlzHOQm9HB
 CF36Jl/suiYVJRj3fZ6UmiyQ4uuoet/pwtjp4BfoHMysVJrolDfaktxxJDsGqk2rv995
 Mg24dd9AieSQjGGg5qym5nThmbikQ6DAfxJcJf3N6zT/uNoAtBBHnwV/zSyoYz6vvVqy
 99gEzAKm3rIQRPIwJzMTEvEaFd8+rsahmnhgoALlkdo8LB9F6cKZqT0tLcSxOjHKQZzG
 OQZQ==
X-Gm-Message-State: AAQBX9e3Bu3UJ7woMfAmCz5qZ0ZxpbCpREUg9c1b0VTuDOU3EsiOOSgJ
 TuzAEUW8U2x7a1PJH5pWf64SFw==
X-Google-Smtp-Source: AKy350YuhsqXQq7A3viG2CGEkmLiPHxshG76SZpUwN8GsFu3QZkTvWXeB0lUZfg1tWpyxhC1IzO3zA==
X-Received: by 2002:a17:902:d4c3:b0:19f:36ae:c29f with SMTP id
 o3-20020a170902d4c300b0019f36aec29fmr21442520plg.46.1680023294314; 
 Tue, 28 Mar 2023 10:08:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:2fbc:aff5:d52a:cc2c])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a170902b49100b0019f114570b0sm20470349plr.152.2023.03.28.10.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:08:13 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
Date: Tue, 28 Mar 2023 22:37:51 +0530
Message-Id: <20230328170752.1102347-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Marek Vasut <marex@denx.de>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For a given bridge pipeline if any bridge sets pre_enable_prev_first
flag then the pre_enable for the previous bridge will be called before
pre_enable of this bridge and opposite is done for post_disable.

These are the potential bridge flags to alter bridge init order in order
to satisfy the MIPI DSI host and downstream panel or bridge to function.
However the existing pre_enable_prev_first logic with associated bridge
ordering has broken for both pre_enable and post_disable calls.

[pre_enable]

The altered bridge ordering has failed if two consecutive bridges on a
given pipeline enables the pre_enable_prev_first flag.

Example:
- Panel
- Bridge 1
- Bridge 2 pre_enable_prev_first
- Bridge 3
- Bridge 4 pre_enable_prev_first
- Bridge 5 pre_enable_prev_first
- Bridge 6
- Encoder

In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.

The logic looks for a bridge which enabled pre_enable_prev_first flag
on each iteration and assigned the previou bridge to limit pointer
if the bridge doesn't enable pre_enable_prev_first flags.

If control found Bridge 2 is pre_enable_prev_first then the iteration
looks for Bridge 3 and found it is not pre_enable_prev_first and assigns
it's previous Bridge 4 to limit pointer and calls pre_enable of Bridge 3
and Bridge 2 and assign iter pointer with limit which is Bridge 4.

Here is the actual problem, for the next iteration control look for
Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
found Bridge 6 doesn't pre_enable_prev_first flags so the limit assigned
to Encoder. From next iteration Encoder skips as it is the last bridge
for reverse order pipeline.

So, the resulting pre_enable bridge order would be,
- Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.

This patch fixes this by assigning limit to next pointer instead of
previous bridge since the iteration always looks for bridge that does
NOT request prev so assigning next makes sure the last bridge on a
given iteration what exactly the limit bridge is.

So, the resulting pre_enable bridge order with fix would be,
- Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
  Encoder.

[post_disable]

The altered bridge ordering has failed if two consecutive bridges on a
given pipeline enables the pre_enable_prev_first flag.

Example:
- Panel
- Bridge 1
- Bridge 2 pre_enable_prev_first
- Bridge 3
- Bridge 4 pre_enable_prev_first
- Bridge 5 pre_enable_prev_first
- Bridge 6
- Encoder

In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.

The logic looks for a bridge which enabled pre_enable_prev_first flags
on each iteration and assigned the previou bridge to next and next to
limit pointer if the bridge does enable pre_enable_prev_first flag.

If control starts from Bridge 6 then it found next Bridge 5 is
pre_enable_prev_first and immediately the next assigned to previous
Bridge 6 and limit assignments to next Bridge 6 and call post_enable
of Bridge 6 even though the next consecutive Bridge 5 is enabled with
pre_enable_prev_first. This clearly misses the logic to find the state
of next conducive bridge as everytime the next and limit assigns
previous bridge if given bridge enabled pre_enable_prev_first.

So, the resulting post_disable bridge order would be,
- Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1,
  Panel.

This patch fixes this by assigning next with previou bridge only if the
bridge doesn't enable pre_enable_prev_first flag and the next further
assign it to limit. This way we can find the bridge that NOT requested
prev to disable last.

So, the resulting pre_enable bridge order with fix would be,
- Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1,
  Panel.

Validated the bridge init ordering by incorporating dummy bridges in
the sun6i-mipi-dsi pipeline

Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
alter bridge init order")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- add missing dri-devel in CC

 drivers/gpu/drm/drm_bridge.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..052a8e6c9961 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -684,11 +684,17 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 				 */
 				list_for_each_entry_from(next, &encoder->bridge_chain,
 							 chain_node) {
-					if (next->pre_enable_prev_first) {
+					if (!next->pre_enable_prev_first) {
 						next = list_prev_entry(next, chain_node);
 						limit = next;
 						break;
 					}
+
+					if (list_is_last(&next->chain_node,
+							 &encoder->bridge_chain)) {
+						limit = next;
+						break;
+					}
 				}
 
 				/* Call these bridges in reverse order */
@@ -771,7 +777,7 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					/* Found first bridge that does NOT
 					 * request prev to be enabled first
 					 */
-					limit = list_prev_entry(next, chain_node);
+					limit = next;
 					break;
 				}
 			}
-- 
2.25.1

