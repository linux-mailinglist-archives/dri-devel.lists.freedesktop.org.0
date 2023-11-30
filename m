Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F297FF17F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20710E703;
	Thu, 30 Nov 2023 14:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E9210E701
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a195a1474easo12697766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701353834; x=1701958634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yGi3UQjgH7vKIKdKQCwE11iHS9JPf1l9kS7cSUyqbg=;
 b=R5epJEbqGlGv4PiwegG1IiItgw5qisHQI1c7eUs62PvWSyY0iDosxDUxzl2yO9+92o
 2OyGOUi9uG1m2SxXv+Bp9Nz/BAus4alO4hBLn98lBXkP9YywWXeen2DWHXrbnvh1Fcs2
 H7+FeRukQcii0PtyERs0lcwJU7ByjpK1RSihw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353834; x=1701958634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yGi3UQjgH7vKIKdKQCwE11iHS9JPf1l9kS7cSUyqbg=;
 b=ZBQLOO3TjJ72DjjaUwL4OvaWcDWjJ1LEkxsxeVg+sxi8G0LJHT+FmLu/FjgeaQlTmP
 E2zs23NrlVEi/o9S6Bx0JFT3/FXlkeO/aVAhTkQG7um0MhwZnXkrbi7CbExeKIa00rar
 vlanoIJC8fNpWkxI0w+mXRFHwg7ZfV3nvKqLPr7Z7+70wM58T8KYtIZYU9l+wVSvQQi4
 0OZFD7/wgpv8bf20XQTfjMF5N4PauG58Vx7HxCJyTVAWscivgh2LX0Ki1VLaa/mZZHQt
 iHFZ+8P7XEObVX3ZpFKYOvg07W6ythzyFl/COMBB6IRO4dwV/GOmvlDr+Ef/bbjAoRhQ
 z+ug==
X-Gm-Message-State: AOJu0YxC8InWvNCdIrYsp/pJ4G8dGHT4bIAZiA1te33/EzXPMBhErZrj
 3M1mEgXfq/LHoSrAoH7dJjFYzw==
X-Google-Smtp-Source: AGHT+IGbutfd86LPxsw38uj7AedD+n1qyjNw1JAgPkJqTtrXi7II4U7qU6uGC2mVffiXY0vpT4uqkg==
X-Received: by 2002:a17:906:15a:b0:9e4:651f:60cf with SMTP id
 26-20020a170906015a00b009e4651f60cfmr14558074ejh.1.1701353834502; 
 Thu, 30 Nov 2023 06:17:14 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009f28db2b702sm716064ejc.209.2023.11.30.06.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:17:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] drm/bridge: Fix bridge disable logic
Date: Thu, 30 Nov 2023 15:16:18 +0100
Message-ID: <20231130141705.1796672-2-dario.binacchi@amarulasolutions.com>
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
2.43.0

