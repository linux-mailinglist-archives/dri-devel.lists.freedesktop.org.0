Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6557938D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 08:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35B10E056;
	Tue, 19 Jul 2022 06:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id A999410E056
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 06:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jogXo
 ndAthVi/CoSKWicgsixOW3HRb111TagFE50hLk=; b=ZXX1f/IX4o+TFdzQ7vOow
 CBRKVSoRRzWju4uO4+3f1myKH3OtmgKtv6qi6RvrVVDKROBIkJSytYR9Ydi+RgDB
 MXYb4FcNjfOaToF2F1AlSfjACTGeoMjdsbwMMa8Le05aUTzgGK3/CHfpBB7sMewE
 Ipp9HqosTF/eyQLWwDWcBI=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp7 (Coremail) with SMTP id DsmowABnEvw4VdZib+YbFQ--.30596S3;
 Tue, 19 Jul 2022 14:54:50 +0800 (CST)
From: Liang He <windhl@126.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 windhl@126.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: tc358767: Add of_node_put() when breaking
 out of loop
Date: Tue, 19 Jul 2022 14:54:47 +0800
Message-Id: <20220719065447.1080817-2-windhl@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719065447.1080817-1-windhl@126.com>
References: <20220719065447.1080817-1-windhl@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABnEvw4VdZib+YbFQ--.30596S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW5tr45XF1DJry7GrWrGrg_yoWkZrg_ua
 4kuFZrur43Zr92krsFyw4av34qkw15uFWxC3W8ta9Ik3W5Ary7J3W7XFZ0qr1xuFWUtryD
 K34DZrsIyr4rCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRieT5JUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hlDF1uwMbkoPAABsh
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

In tc_probe_bridge_endpoint(), we should call of_node_put() when
breaking out of the for_each_endpoint_of_node() which will automatically
increase and decrease the refcount.

Fixes: 71f7d9c03118 ("drm/bridge: tc358767: Detect bridge mode from connected endpoints in DT")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: (1) rebase with drm-misc-next advised by Robert Foss
     (2) use proper title
 v1: https://lore.kernel.org/all/20220707021143.306926-1-windhl@126.com/

 drivers/gpu/drm/bridge/tc358767.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 02bd757a8987..1dc107f13645 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2010,9 +2010,10 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 
 	for_each_endpoint_of_node(dev->of_node, node) {
 		of_graph_parse_endpoint(node, &endpoint);
-		if (endpoint.port > 2)
+		if (endpoint.port > 2) {
+			of_node_put(node);
 			return -EINVAL;
-
+		}
 		mode |= BIT(endpoint.port);
 	}
 
-- 
2.25.1

