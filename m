Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6CB716D93
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE5D10E419;
	Tue, 30 May 2023 19:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FE510E419
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:33:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7ADB1847C0;
 Tue, 30 May 2023 21:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685475219;
 bh=ELgNuljcJ5vjsEuIuG/eTRGtxGXlcKyvsMtI/VuuJhM=;
 h=From:To:Cc:Subject:Date:From;
 b=ULfmCKR73OrmYI81jN1FpKqWdIPkFFmcaeBbL59Rup9p2uCGLfK/GbI4BUaKp9uSc
 5QqOhmHGB+Zx3XuroV6tOexbR84ND89O+656bDlV6VvYwZijEpa1XCsGacJ5ugXJgp
 nG860yuIgCwdI8wptIgwqnQMSMDKCB7OY7WTMb9cGPSBLn4aCnQ8JqkhkvQS7uxraY
 brHj8AgkSqAlnO3Azy4OyqSNgfgp0hrXjSH9DldmwwZ6syQPepyGIS0hveDH01pQrR
 j78gb7yrWLJLagX37qGjC2DfOMdZ35AxXVIbdPQ+Ty6VS5rbES4xL5T9I7mGuYOznE
 BjBAmK/PoFJ0A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Fix Powertip PH800480T013 bpc specifier
Date: Tue, 30 May 2023 21:33:29 +0200
Message-Id: <20230530193329.653526-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is 8 bits per channel DPI panel, add the missing .bpc
specifier otherwise the kernel is complaining about it as follows:
"
panel-simple panel: Expected bpc in {6,8} but got: 0
"

Fixes: d69de69f2be1 ("drm/panel: simple: Add Powertip PH800480T013 panel")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 108ebe95590bc..02e3ddf58af07 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3327,6 +3327,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
 static const struct panel_desc powertip_ph800480t013_idf02  = {
 	.modes = &powertip_ph800480t013_idf02_mode,
 	.num_modes = 1,
+	.bpc = 8,
 	.size = {
 		.width = 152,
 		.height = 91,
-- 
2.39.2

