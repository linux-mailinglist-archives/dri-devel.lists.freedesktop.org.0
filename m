Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491EE57CD2D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D535C90E3F;
	Thu, 21 Jul 2022 14:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D3B790E3F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BV+yW
 fxEA+xMJa3PirOcmd/xhCXCPvfRwzmn2AyKwR0=; b=JYoXjTpnp7Oqu1/b3wkRg
 T7whYvPcB16X+KkDw8S9KBOaKwKPW1ufUT0c4HE7k0/fVdYq59N9mwvaOEHhOtHD
 +RNfnOE6EO7RrzZ7r9k6de7EfSGbn/GE+pwuHvPXMvo1sLuqRV6S/xUg4tPukj3Z
 FFYk9blQoDbPfMqyfMOuXI=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp9 (Coremail) with SMTP id NeRpCgBXbcLFX9lilqjSGw--.14576S2;
 Thu, 21 Jul 2022 22:16:38 +0800 (CST)
From: Liang He <windhl@126.com>
To: mripard@kernel.org, airlied@linux.ie, wens@csie.org, daniel@ffwll.ch,
 windhl@126.com, jernej.skrabec@gmail.com, samuel@sholland.org,
 p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sun4i: tcon: Fix refcount leak bug in
 sun4i_tcon_of_get_id_from_port()
Date: Thu, 21 Jul 2022 22:16:36 +0800
Message-Id: <20220721141636.1301314-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgBXbcLFX9lilqjSGw--.14576S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF43Gry7Cw43Jr47XF47Jwb_yoW3Zrg_Wr
 W8ZF9xZr1rW3sxAFy2vr4YqryIyF1ruFWxZ3Z7tayfAw17ZrZ7XwnYvry8Xry7AFZ8XFWq
 y3srJrs0vw1SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjpnQ5UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAZFF2JVkePsawAAsu
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should call of_node_put() for the reference returned by
of_graph_get_remote_endpoint() when it is not used anymore.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787921..744379baa9da 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -972,6 +972,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.25.1

