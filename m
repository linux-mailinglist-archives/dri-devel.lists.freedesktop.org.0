Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF7808A24
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA710E8CF;
	Thu,  7 Dec 2023 14:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D028410E8C9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:30 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1e2ded3d9fso119455166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701958649; x=1702563449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yGi3UQjgH7vKIKdKQCwE11iHS9JPf1l9kS7cSUyqbg=;
 b=DOcoz1LwwR3BfigHY9Q3OcBBVhCXEZ96GESnHa3zZh5jaN+FWZzR6dael+ei3jD/If
 IltXczvk62j5s4bDeIVi5klCaR8bXfXCgHvAsnC3s79EkyxA8xlPHZuajhWUZAxP+xhq
 BuCFO4n0mt6ElE2l2KSHcMoBoTn6M30pK4KtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701958649; x=1702563449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yGi3UQjgH7vKIKdKQCwE11iHS9JPf1l9kS7cSUyqbg=;
 b=t4VpeUq32EA9AeVWnBa6KVIgz+BxRkcq5XWnMJuRFbf2Zfmm3e9LC6z/biBuX02tKl
 lYjbdimBkSyweh/rUCx6+SxGp+QG5f5QRbZtGBsBgnT8wFCG0uh7RlQMJthS7hjiwHzN
 IY5Yy/7Ck9DtabICpU4VvQWA79eYWz/aDUQ9YZO8zdm0l01sUekPOnr/6C5i1RrUsg8i
 1QFE5bb0hZE2FPcC++DQW4Ez8XZVMoG9Y2zzUozX+QSd+mOiJ8I+M+uCkaqcEDhnk/bD
 4wh673UeO7rZity+5BJ5ixstg7aecevo2G7bTB6XQyiPVwYn0zH/qQ62pp3wn+6b56P2
 saVQ==
X-Gm-Message-State: AOJu0YyUCs898GEam5jZ85QkXL2+2R9HlK9kKWBDPDfYOdWSLhCkbbGS
 cwsrNSHQOdZKa3FY6zF2aVJMwA==
X-Google-Smtp-Source: AGHT+IFX6FD85qiXsRa0p4UVyWkTnzhrOQVGm8xEczpecb8umzKPb/58NcpsvdEbtAuJxOrQVkuD7A==
X-Received: by 2002:a17:907:b88:b0:a1c:eea8:e34b with SMTP id
 ey8-20020a1709070b8800b00a1ceea8e34bmr1371325ejc.100.1701958649228; 
 Thu, 07 Dec 2023 06:17:29 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9bf:959c:3c66:46c2])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906c09800b00a1e814b7155sm885421ejz.62.2023.12.07.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:17:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/10] drm/bridge: Fix bridge disable logic
Date: Thu,  7 Dec 2023 15:16:30 +0100
Message-ID: <20231207141723.108004-2-dario.binacchi@amarulasolutions.com>
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

