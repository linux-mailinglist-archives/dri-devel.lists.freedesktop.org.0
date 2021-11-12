Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1044E58C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652006E4C5;
	Fri, 12 Nov 2021 11:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84006E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 11:24:38 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so6012927pjj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 03:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T9wqkH9bvAwB8f9F9+uOBqJWqvyAq2GKd5TaGm+pXFw=;
 b=k7djde65D5+bmsyDgCCkkGPdyGUKZx5wHM2Gz/IZywZVkhc/emt5dcOQ3YPEMCPZay
 jiJA9vkV4aUT9EIoVvs6ixJuh8KL3RRSE3avHfdgNsUbxUz5hFUTThi+HHTU+JGRdLaZ
 jmSQZ2ubSqFZClQ1bzewDUOhe0MnDKUb9M4Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T9wqkH9bvAwB8f9F9+uOBqJWqvyAq2GKd5TaGm+pXFw=;
 b=HSXSINXpSLp/rDYpTAs8WMuy2zTYzDW5ewP/AM1zcSwdxvgMd1gK/7hHjg0QgBT71c
 D9+ZwF57nnCQTRkOmlpid0Kn6QoVA1Eg4ROCciezH9VQwTuE12i5bf/sJGs2RCQXY+o6
 RdwBXPr0eeF7tWLV/fidyP85BWvp2vR1BbQEOO120ciTzEqRAG46OEttC/p0SdCiltjO
 IRgVSWv78n+/HDoGlMXiGCLRGobz/H0CQ5AkZ+hFTVNAoZA+lzXG+FApw7whMSuvfOGh
 9gYPvEhT0A8fT+bLxfv8VZUwX+e2VeShtKIHQhnn0M4S8ge4YUoGdFPqH9yO7EfLqEfU
 ICnA==
X-Gm-Message-State: AOAM531qqZXmgTaEiaoZllNr13TJiswXaYYlzg3HxkP5WYLUWPCWcGRA
 AYmr+gpKe77i9ZVhwnT5PmS24g==
X-Google-Smtp-Source: ABdhPJyM2vw9g4VA5zsJdYxFWjZh3TPf2EHpv8A/1s8edDOEdfNdR8rUMtnS/ylrCpGHjtadhkTwWg==
X-Received: by 2002:a17:90b:4c44:: with SMTP id
 np4mr16710355pjb.195.1636716278293; 
 Fri, 12 Nov 2021 03:24:38 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6a1a:b806:e064:392a])
 by smtp.gmail.com with ESMTPSA id j9sm3431093pgt.54.2021.11.12.03.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:24:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
Date: Fri, 12 Nov 2021 19:24:33 +0800
Message-Id: <20211112112433.942075-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

edid_read() was assumed to return 0 on success. After
7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
the function can return >= 0 for successful case. Fix the g_edid_break
condition in sp_tx_edid_read().

Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 1a871f6b6822ee..392203b576042b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 				g_edid_break = edid_read(ctx, offset,
 							 pblock_buf);
 
-				if (g_edid_break)
+				if (g_edid_break < 0)
 					break;
 
 				memcpy(&pedid_blocks_buf[offset],
-- 
2.34.0.rc1.387.gb447b232ab-goog

