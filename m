Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049926CC8D6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138A110E95C;
	Tue, 28 Mar 2023 17:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3910A10E95C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:08:19 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id l7so11495552pjg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680023299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiCO4IDfxsC8fotKJWg3fnLWcorJmHZQyMnMP9mcruw=;
 b=h9ybu4KVjh/juEJlRxHmiHn/Cc+93jxZgGxemtc17HwTS4Q/kAsXg6Vel6VMMIYwuP
 2zIHDaR6NcTffhxS9rS3BO5lmX01w43wevn7nM1LAItduGF8msRsu4wbLpNkdK5V/vOj
 7OAZRJAAlLQuhQQxcRC10MrtjRg+Hvh6TSnIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680023299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiCO4IDfxsC8fotKJWg3fnLWcorJmHZQyMnMP9mcruw=;
 b=s6da+xllyPrCxiJNJtt9yg6zgvPxhLn7oEQ19DIhFrxSytinmwvpQTacFaCBop6SYP
 8qdXOy9srIYCZ5L6BoujJrq9GAp77K2Go/j5ZmoN18/wqLmnb8flAT/2GfwjeGJUZsC/
 ahLjdPqS9XNiADaVW50DXgNfy6ANK5JrONA4UpUccvOh3nEaSDgyoOwJPYpXTEbuKmg3
 +nI2OYypgzUgbThH/Xm2z6OIug/nJgggCBmhAVArTuaU+T2CwQSO53njTQSyMGaTy/RO
 ebfVVyNRZMV4JdffmzDiLueH0ulL//14Pba3V4O7KfAWmRTJD+Yl4iCiMBPi2LxjhJh4
 VNpg==
X-Gm-Message-State: AAQBX9cbYWXCtLXY3U+L5cj0NYMCovnHt6D+Q68k8kCsGB3bcOkoF9qm
 BljYWtdgVQLgBWkgvQJZP/zaDQ==
X-Google-Smtp-Source: AKy350b5+a9upWECjeS/U86vk/Q0eBkVFnSShMcqH0gORCIQMxGjyeyCJHAa+iSoNFipG9syD0Xupg==
X-Received: by 2002:a17:902:d506:b0:1a1:b172:5428 with SMTP id
 b6-20020a170902d50600b001a1b1725428mr20545489plg.18.1680023298915; 
 Tue, 28 Mar 2023 10:08:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:2fbc:aff5:d52a:cc2c])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a170902b49100b0019f114570b0sm20470349plr.152.2023.03.28.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:08:18 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/2] drm/bridge: Document bridge init order with
 pre_enable_prev_first
Date: Tue, 28 Mar 2023 22:37:52 +0530
Message-Id: <20230328170752.1102347-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328170752.1102347-1-jagan@amarulasolutions.com>
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In order to satisfy the MIPI DSI initialization sequence the bridge
init order has been altered with the help of pre_enable_prev_first
in pre_enable and post_disable bridge operations.

Document the affected bridge init order with an example on the
bridge operations helpers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- add missing dri-devel in CC
- prefix @ for bridge helper names

 drivers/gpu/drm/drm_bridge.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 052a8e6c9961..caf0f341e524 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -654,6 +654,13 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
  * bridge will be called before the previous one to reverse the @pre_enable
  * calling direction.
  *
+ * Example:
+ * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
+ *
+ * With pre_enable_prev_first flag enable in Bridge B, D, E then the resulting
+ * @post_disable order would be,
+ * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
@@ -750,6 +757,13 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
  * If a bridge sets @pre_enable_prev_first, then the pre_enable for the
  * prev bridge will be called before pre_enable of this bridge.
  *
+ * Example:
+ * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
+ *
+ * With pre_enable_prev_first flag enable in Bridge B, D, E then the resulting
+ * @pre_enable order would be,
+ * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
+ *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
-- 
2.25.1

