Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5081808A25
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708B10E8CA;
	Thu,  7 Dec 2023 14:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F0110E8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1f33c13ff2so44089066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701958650; x=1702563450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=FdBgdTmcpJ3Plr4AoaQ3/4gVQa7Nd9P8WcdC56pmqyu/fhC6+eD7SeP1EiblmWD6+d
 kZAzStayvG+8FiVL0Yxj/xJQH6iwO5nfzt5tRTAAkiS7Lm+2zAqqQK2KUD30+CUkCW9x
 loGmg9hRmRR2Ow4q4OvGzcl0f253Iu8Zis3eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701958650; x=1702563450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu0Px4Tbxip0tKoFWKIyTvbcuMI1IJ2fyAiFtPcJOWc=;
 b=Uy4kzxKO4CEBtDc9YM85C4Q0/upHxcdm68XnUYKq9NPowBAMLbiG28F0HPM2IZvo7X
 v/t4MIlJn4kBcWm6giB7UJ/l8sqgmBO5B9CRYlWYdTjxpsWT0Dj1USXzytlXgO3v4DNM
 XPmYlvKe3qi6qtbpvdYD/xnrvp0AwDadfDOdDIBYSlFUWFgVddi2YJu3VKTXAhPb+GTz
 DpjevXn/JvpBGFuHIH5n2pksbzONUvgIl4UVO/pgR53QnWhhoo2OuEluVWJ8oOeZXRCt
 KwqqUusHjhiZ+l5/oBFUNzJB4BcUHUYnvlRI6vsYOZ4qKQrZRHm+R9qPrSwJlx2sGbit
 SbLg==
X-Gm-Message-State: AOJu0YwAl2D3D0UTuP+KUcUg4TFKaIGZ+XDqaj4G499DmF6H2i9chWmu
 EbYp14YZ4uNKgJzCW5DKwbP/7Q==
X-Google-Smtp-Source: AGHT+IEKt+m4WcAwGyRNiq3p7RkcN2HRJDZ2ARN/vQ7Yh6kI3tPnmINApVHMQ1D31CBUjdDTe5zvAQ==
X-Received: by 2002:a17:906:ce32:b0:a1c:8b15:fc01 with SMTP id
 sd18-20020a170906ce3200b00a1c8b15fc01mr1663788ejb.33.1701958650470; 
 Thu, 07 Dec 2023 06:17:30 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9bf:959c:3c66:46c2])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906c09800b00a1e814b7155sm885421ejz.62.2023.12.07.06.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:17:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] drm/bridge: Fix a use case in the bridge disable
 logic
Date: Thu,  7 Dec 2023 15:16:31 +0100
Message-ID: <20231207141723.108004-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
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

