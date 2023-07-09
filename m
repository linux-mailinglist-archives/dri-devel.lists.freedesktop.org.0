Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4CB74C666
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 18:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E6910E108;
	Sun,  9 Jul 2023 16:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5534310E108
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 16:23:03 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3593C84783;
 Sun,  9 Jul 2023 18:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688919781;
 bh=CyHVVopjKzlJEhvNoeCA7jHi0qLEWalN+3B+7eTggDc=;
 h=From:To:Cc:Subject:Date:From;
 b=O0pLQUP+a2t3lfbqaY31Zl8zJSYe25ERsCAESq08YOp+IAbLoLrZ5vm12x7g3nKok
 Uoiae7lXR03ulmOPMi2WeVe87ZVjnsi/vJsZDFhZx+RqXHazOj+O1hALrHc/B4iZv/
 zJwSWwm0hcycGVnRagL7gB/Loc32i42BsS8HEvC3bsVD8S6xDWzz2GROO6h61sw9fF
 Bei/e0YzlrncpIn9kxRRw8JKAaSJtN1hWgLHdHoyKeii1V3Bpqy+59hHfnNFVMq5pi
 EVHxwHabalI8hKpLsbM3XpR44i4nzVEM3Y9DsHyTtcWp7DxhwTYaCL/JdHVZp/FLIs
 MHKFwsnY86IMQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Drop prepared_time
Date: Sun,  9 Jul 2023 18:22:53 +0200
Message-Id: <20230709162253.464299-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
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
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This has been superseded by RPM in commit
3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
and the last user of the non-RPM case has been dropped in commit
b6d5ffce11dd ("drm/panel-simple: Non-eDP panels don't need "HPD" handling")
whatever is left in this driver is just assigned and never used.
Drop the remaining parts.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 37afed67fea7e..e943148dd2b0c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -141,7 +141,6 @@ struct panel_simple {
 
 	bool prepared;
 
-	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
 	const struct panel_desc *desc;
@@ -351,8 +350,6 @@ static int panel_simple_resume(struct device *dev)
 	if (p->desc->delay.prepare)
 		msleep(p->desc->delay.prepare);
 
-	p->prepared_time = ktime_get_boottime();
-
 	return 0;
 }
 
@@ -566,7 +563,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return -ENOMEM;
 
 	panel->enabled = false;
-	panel->prepared_time = 0;
 	panel->unprepared_time = ktime_get_boottime();
 	panel->desc = desc;
 
-- 
2.40.1

