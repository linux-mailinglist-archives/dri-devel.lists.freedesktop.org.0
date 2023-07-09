Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D874C472
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 15:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFBE10E0D2;
	Sun,  9 Jul 2023 13:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47A510E0D2
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 13:52:42 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4EAAE8509B;
 Sun,  9 Jul 2023 15:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688910761;
 bh=tcMWqk4BjPRMtBDZ+wroHjmNDROv6omG5uAT50OSHBA=;
 h=From:To:Cc:Subject:Date:From;
 b=xrLJ72u0B9I3SnZ07VF74x7ljfnZuNEuLzpR6OdO7YojGn6IS6zyMgijfCc/DlCFH
 6hy4VWgbxiU7uEouoHYtxSspy79m+LJVcac/4YgxveWFFe+P/1IaUyjE7TvOq6PwfZ
 bDVhs8a70NqfPA/+HvuhH/Q11LY3H7N32Boj6fpmoPBvd2H2yoe+TdR0GUt27l4FYr
 JSgoWn/CgCvw4gR8yYRXGcAfCOvzSEQIPHcVWfRJpVqytwlMIruLcZmSv9s60qtdBE
 U8Gw01SbJBADcCjZx4F5SjhAE9nsZS2HtE6bsJYR1w0u8E85Uftdv84zEA1uZOKqYt
 bLkS0fj02rA1g==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
Date: Sun,  9 Jul 2023 15:52:31 +0200
Message-Id: <20230709135231.449636-1-marex@denx.de>
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

The unprepared_time has to be initialized during probe to probe time
ktime, otherwise panel_simple_resume() panel_simple_wait() call may
wait too short time, or no time at all, which would violate the panel
timing specification. Initializing the unprepared_time() to probe time
ktime assures the delay is at least what the panel requires from the
time kernel started. The unprepared_time is then updated every time
the panel is suspended in panel_simple_suspend() too.

Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next prepare to shorten it")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d3238088b7f80..37afed67fea7e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -567,6 +567,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	panel->enabled = false;
 	panel->prepared_time = 0;
+	panel->unprepared_time = ktime_get_boottime();
 	panel->desc = desc;
 
 	panel->supply = devm_regulator_get(dev, "power");
-- 
2.40.1

