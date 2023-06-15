Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3237320C4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92AA10E538;
	Thu, 15 Jun 2023 20:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEAB10E538
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:16:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EED948474E;
 Thu, 15 Jun 2023 22:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686860172;
 bh=QsyiD42cUO4JJqkFFnHbvOONkj3EFsLvbRKMIv4UTU0=;
 h=From:To:Cc:Subject:Date:From;
 b=LbWzh7lBS2ai+zvG9XiZrWbqYKPcQ2sRVaJDE08TbPJNiVihFQN77cdJxmuEXxpGJ
 G4adLDRBpBzgeZ3jdLQQNYjRzoPVL8YAxAqnbWzQDGNzg/im3y53+s5nrp4bPVBB6M
 nzxBEQIAUuMGeR5rZ5F1gVu13J+GCoNm8Lm8RP9kVQpYZnTJSvlt3I+wXat74eSE0V
 m7TDczg+wqnAUvg99Ql0yCSnzX/zW2av3n5MrTJ+aaCTTec1FKu1YxPbeAmx8zmTtV
 5TZSVTdBuftOaQKKTPKytwLbpBSpMQFt8/zA4o0YGMnmRx0/PDcaV8/rGIzkZhU3hE
 nU2aQY/vTCfXw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Add Powertip PH800480T013 drm_display_mode
 flags
Date: Thu, 15 Jun 2023 22:16:02 +0200
Message-Id: <20230615201602.565948-1-marex@denx.de>
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

Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
flags. Those are used by various bridges in the pipeline to correctly
configure its sync signals polarity.

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
index b81b21901940b..a0f4302de130a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3202,6 +3202,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
 	.vsync_start = 480 + 49,
 	.vsync_end = 480 + 49 + 2,
 	.vtotal = 480 + 49 + 2 + 22,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
 static const struct panel_desc powertip_ph800480t013_idf02  = {
-- 
2.39.2

