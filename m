Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8881A55A8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20A6E3C1;
	Sat, 11 Apr 2020 23:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16EE6E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 23:12:43 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75B36215A4;
 Sat, 11 Apr 2020 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646763;
 bh=5UsvlezZ3gawy/8qMW6v0/D9MDFAi7dSSLfdliInNTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bp0SZ0VqmAF4MyLbLlH/bSa7LpoA9Vap8/Kkh6/a4rlK74jQ8nTOV1XA5DL0wYiKb
 O53vAPGklNyoBSeylkQD0HxyL/R6E1/moMj1uxlq21EAPOf6eUrPn9ryPGb2bydcOl
 06DNDYMR6BnoHwwSkmhBufULdDY6NF+HzSvlzpfE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 33/66] drm/omap: fix possible object reference
 leak
Date: Sat, 11 Apr 2020 19:11:30 -0400
Message-Id: <20200411231203.25933-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411231203.25933-1-sashal@kernel.org>
References: <20200411231203.25933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 Mukesh Ojha <mojha@codeaurora.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Wen Yang <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 47340e46f34a3b1d80e40b43ae3d7a8da34a3541 ]

The call to of_find_matching_node returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:212:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.
drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:237:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 209, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1554692313-28882-2-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index 3bfb95d230e0e..d8fb686c1fda9 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -193,7 +193,7 @@ static int __init omapdss_boot_init(void)
 	dss = of_find_matching_node(NULL, omapdss_of_match);
 
 	if (dss == NULL || !of_device_is_available(dss))
-		return 0;
+		goto put_node;
 
 	omapdss_walk_device(dss, true);
 
@@ -218,6 +218,8 @@ static int __init omapdss_boot_init(void)
 		kfree(n);
 	}
 
+put_node:
+	of_node_put(dss);
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
