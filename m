Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF2552BBB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D59C112719;
	Tue, 21 Jun 2022 07:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC71126F2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655796085; x=1687332085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8xCN16NMVCes5zqwvpgL1iTjCDl7GFfUFwJVxx6Wuk0=;
 b=cXuWxhyFIHVnQqH7EP1vH/BJT2DqtrWQKRlLQRUHbuBpWVWLl2ti1Zcc
 MgEMdSDNdoDRF200+Rfbz23a4WG974HISfL+hmN7z4JYmxnJmtIR8crwW
 iA8CtrdUmv8av6F2ifehpZG+Eaofi87Ffs2UAVs4hnRRX5VQ0K4jgi1db
 tgtcl6CTC/Ffkdwh3Hs0gyKHNnnYtf7nTfg9Jbt2vDPVK+49l4iTvJf9o
 WL5UGGrVcV7WtXzS74u8FLcE2qKetq64Mh84utf7vajSjT9PUGHvpVeaJ
 eQkW9/o3VkSwpAntMpjo1GJ/htESyZn1uoQNK/mrpHTbSw8XwhvLL2WTN w==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650924000"; d="scan'208";a="24565786"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Jun 2022 09:21:22 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 21 Jun 2022 09:21:22 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 21 Jun 2022 09:21:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655796082; x=1687332082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8xCN16NMVCes5zqwvpgL1iTjCDl7GFfUFwJVxx6Wuk0=;
 b=O6ph/phtBx6MZOjv5ZSlXoP1uptZT5jL01zS2fFWrj9yBw0sseP/c12P
 bjFPitm1jONSx9BoCigJdBPe2pkpYiT1yLK+Rs4r/6zyPRrqoRdP9Nn70
 fwT3fYvKTSpdQQF5ky4RVSzoeHWaVWLKlA7/gAJnDcmsSB4P2yp1/j8HO
 dXnQum/YiHYt5j8D+AgXGeJz8u3JrwBE0pliCoX27bKjSb+uJlNPLN0gQ
 e7mNbS5lCNXmMS2+ts7+5ALlYtAYsXiGw39CosMIdFwTetJznjLwJSEtM
 ItTCmDYfaM37DOz54FhnAaRf9zhHAeFQGN8nh7fgcs2PDKvAGSquXvNon g==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650924000"; d="scan'208";a="24565785"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jun 2022 09:21:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E0411280056;
 Tue, 21 Jun 2022 09:21:21 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/panel: panel-simple: Add dev_err_probe if backlight
 could not be found
Date: Tue, 21 Jun 2022 09:21:18 +0200
Message-Id: <20220621072118.513346-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the backlight node is not enabled, this (silently) returns with
-EPROBE_DEFER. /sys/kernel/debug/devices_deferred also shows nothing
helpful:
$ cat /sys/kernel/debug/devices_deferred
display

With this patch, there is a helpful hint:
$ cat /sys/kernel/debug/devices_deferred
display panel-simple: Could not find backlight

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..8fb1c563c96a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -663,8 +663,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
-	if (err)
+	if (err) {
+		dev_err_probe(dev, err, "Could not find backlight\n");
 		goto disable_pm_runtime;
+	}
 
 	drm_panel_add(&panel->base);
 
-- 
2.25.1

