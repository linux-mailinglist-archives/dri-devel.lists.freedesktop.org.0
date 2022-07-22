Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC457E332
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 16:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9411331A;
	Fri, 22 Jul 2022 14:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5862912A3AB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=D2clI
 FUfyusg4+mq/cv/sCoD7tUC48/X4goIlAw2jY0=; b=LGT554WRKWO0FGypmeppR
 HB/K55oYkX3Vl6uXSwxWhmFH4Ud3aU1PF8H8oMAkqF1OIJrsuVrlfO9CfXKxvU9K
 i8RW9KWr56BbtKDHzOGnHxX6EtNyJjkOUW/c8doIJeZ7mhJWp8U5izCxZF/64Mcb
 DJQApjlpVOwwe1O/9+cJp0=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp1 (Coremail) with SMTP id C8mowAAHNyekt9pijkCjHQ--.40099S2;
 Fri, 22 Jul 2022 22:43:49 +0800 (CST)
From: Liang He <windhl@126.com>
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, windhl@126.com
Subject: [PATCH] drm/omap: dss: Fix refcount leak bugs
Date: Fri, 22 Jul 2022 22:43:48 +0800
Message-Id: <20220722144348.1306569-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowAAHNyekt9pijkCjHQ--.40099S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWUKw1rGFy3urW3uF4UJwb_yoWDJFb_CF
 1IgrnxWr1UGFykJr43ZasIvr1qkan7uFWrXr4xtFySk3y2kry7X347ZasrXw1UCF4UJay7
 W3WDCry7A34ftjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUBWlJUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3AZGF1pED92SugAAsv
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

In dss_init_ports() and __dss_uninit_ports(), we should call
of_node_put() for the reference returned by of_graph_get_port_by_id()
in fail path or when it is not used anymore.

Fixes: 09bffa6e5192 ("drm: omap: use common OF graph helpers")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 0399f3390a0a..c4febb861910 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1176,6 +1176,7 @@ static void __dss_uninit_ports(struct dss_device *dss, unsigned int num_ports)
 		default:
 			break;
 		}
+		of_node_put(port);
 	}
 }
 
@@ -1208,11 +1209,13 @@ static int dss_init_ports(struct dss_device *dss)
 		default:
 			break;
 		}
+		of_node_put(port);
 	}
 
 	return 0;
 
 error:
+	of_node_put(port);
 	__dss_uninit_ports(dss, i);
 	return r;
 }
-- 
2.25.1

