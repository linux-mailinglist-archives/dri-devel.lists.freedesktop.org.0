Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3F2436F8D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 03:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB289C93;
	Fri, 22 Oct 2021 01:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1162 seconds by postgrey-1.36 at gabe;
 Fri, 22 Oct 2021 01:43:56 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D866A89C93
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 01:43:56 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hb66B3D3Cz1DHqH;
 Fri, 22 Oct 2021 09:22:42 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Fri, 22
 Oct 2021 09:24:30 +0800
From: He Ying <heying24@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Fix possible memleak in drm_client_modeset_probe
Date: Thu, 21 Oct 2021 21:26:23 -0400
Message-ID: <20211022012623.97631-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
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

I got memory leak as follows when doing fault injection test:

WARNING: CPU: 0 PID: 1214 at drm_mode_config_cleanup+0x689/0x890 [drm]
RIP: 0010:drm_mode_config_cleanup+0x689/0x890 [drm]
Call Trace:
 ? tracer_hardirqs_on+0x33/0x520
 ? drm_mode_config_reset+0x3f0/0x3f0 [drm]
 ? trace_event_raw_event_rcu_torture_read+0x2c0/0x2c0
 ? __sanitizer_cov_trace_pc+0x1d/0x50
 ? call_rcu+0x489/0x15e0
 ? trace_hardirqs_on+0x63/0x2d0
 ? write_comp_data+0x2a/0x90
 ? drm_mode_config_cleanup+0x890/0x890 [drm]
 drm_managed_release+0x1fa/0x4f0 [drm]
 drm_dev_release+0x72/0xb0 [drm]
 devm_drm_dev_init_release+0x81/0xa0 [drm]
 release_nodes+0xba/0x3b0
 ...
 entry_SYSCALL_64_after_hwframe+0x44/0xae

and then an error message:

[drm:drm_mode_config_cleanup [drm]] *ERROR* connector SPI-1 leaked!

When krealloc() in drm_client_modeset_probe() fails, it
goes to the label 'free_connectors'. However, krealloc()
is between drm_connector_list_iter_begin() and *_end().
Going to the label directly is not a good idea. Because
iter->conn is not cleaned up if so. Fix the problem by
going to the label outside drm_connector_list_iter_end().

Signed-off-by: He Ying <heying24@huawei.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..7ac88ae93f38 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -789,7 +789,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 		tmp = krealloc(connectors, (connector_count + 1) * sizeof(*connectors), GFP_KERNEL);
 		if (!tmp) {
 			ret = -ENOMEM;
-			goto free_connectors;
+			break;
 		}
 
 		connectors = tmp;
@@ -798,6 +798,9 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
+	if (ret)
+		goto free_connectors;
+
 	if (!connector_count)
 		return 0;
 
-- 
2.17.1

