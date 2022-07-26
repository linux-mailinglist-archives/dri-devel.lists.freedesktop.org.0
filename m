Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9A5808E6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 03:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75D3113F11;
	Tue, 26 Jul 2022 01:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50B7C113F11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 01:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lvbhG
 MrtTullxjZx01jQpF6ivXWHh1XL/NmfhOLf2sE=; b=AoI0tCAASJWvRxpnWjhzf
 jpePc29tH/vJ1VbQA7pBfCGPj+28mFlxtFsYJjnz3RdHXjH5dQwRv8sWI0bLGaBA
 GPJ66Of7gBqNWncn7UeUshrpkR1aJx8d+x8/RFJm2dXzvr4fXGHkiccVsZ6bC6DJ
 O7d1TbuBsMkuXDzY7bJ034=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp8 (Coremail) with SMTP id NORpCgDniZZLPt9ia0IKIg--.28429S2;
 Tue, 26 Jul 2022 09:07:24 +0800 (CST)
From: Liang He <windhl@126.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, windhl@126.com
Subject: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
Date: Tue, 26 Jul 2022 09:07:22 +0800
Message-Id: <20220726010722.1319416-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDniZZLPt9ia0IKIg--.28429S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1xKw4kKr43Ar13CF48JFb_yoWkurc_WF
 W8XFZrWr4UZr48AF4ayFy7uF9FkF1xurWfCF15ta4fCa4UAr1UZr1j9r90qw1fZFW3ZrZr
 A3ykCF1Ykry3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFdyUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAxKF2JVkiHHxAAAsu
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

In this function, there are two refcount leak bugs:
(1) when breaking out of for_each_endpoint_of_node(), we need call
the of_node_put() for the 'ep';
(2) we should call of_node_put() for the reference returned by
of_graph_get_remote_port() when it is not used anymore.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Liang He <windhl@126.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 1b70938cfd2c..bd4ca11d3ff5 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -115,8 +115,11 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	for_each_endpoint_of_node(dev->of_node, ep) {
 		/* If the endpoint node exists, consider it enabled */
 		remote = of_graph_get_remote_port(ep);
-		if (remote)
+		if (remote) {
+			of_node_put(remote);
+			of_node_put(ep);
 			return true;
+		}
 	}
 
 	return false;
-- 
2.25.1

