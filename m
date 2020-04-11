Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E21A64A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3521089DFC;
	Mon, 13 Apr 2020 09:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C27D6E32B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 14:16:31 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25e91d12192c-15b50;
 Sat, 11 Apr 2020 22:16:04 +0800 (CST)
X-RM-TRANSID: 2ee25e91d12192c-15b50
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.104.145.126])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95e91d12012a-e4cb7;
 Sat, 11 Apr 2020 22:16:03 +0800 (CST)
X-RM-TRANSID: 2ee95e91d12012a-e4cb7
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/dp_mst: Fix drm_dp_mst_topology.c selftest compilation
 warning
Date: Sat, 11 Apr 2020 22:17:40 +0800
Message-Id: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: Shengju Zhang <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct drm_dp_desc contains struct drm_dp_dpcd_ident, and the struct
drm_dp_dpcd_ident contains the array, so zero-initialization requires a 
more couple of braces. In the ARM compiler environment, the compile 
warning pointing it out:
    drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
    drivers/gpu/drm/drm_dp_mst_topology.c:5494:9: warning: missing braces around initializer [-Wmissing-braces]
      struct drm_dp_desc desc = { 0 };

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 70c4b7a..4d8d1fd 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5494,7 +5494,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
-	struct drm_dp_desc desc = { 0 };
+	struct drm_dp_desc desc = { { { 0 } } };
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
-- 
2.7.4



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
