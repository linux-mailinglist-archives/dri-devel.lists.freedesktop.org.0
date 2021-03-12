Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56E3386D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 08:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269DA6F468;
	Fri, 12 Mar 2021 07:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 941 seconds by postgrey-1.36 at gabe;
 Fri, 12 Mar 2021 07:35:39 UTC
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253606F457
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=E1I51
 7xxvK7g3rGfwB8KIhZ2f7fCT3nY+bZTzzZ3FbM=; b=BiOu+anaQsAwAPlBp9LZ7
 xeCCYjX8TxUHzzs+WrE52Bb9a2LbU9z1R+fg+qLsFFT1I410tG0IKWpXmt9dnXj6
 HIf8bock8fp9qnumOImtmQVy98E7CftNMBMd0ZmvOiZomh0DpYIyBXKvKxmOq2+s
 qCxm0UHtwme/dfKQ7X0YrY=
Received: from yangjunlin.ccdomain.com (unknown [119.137.52.39])
 by smtp13 (Coremail) with SMTP id EcCowAAHBo7VFUtg3tQRpg--.3254S2;
 Fri, 12 Mar 2021 15:18:46 +0800 (CST)
From: angkery <angkery@163.com>
To: tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 sebastian.reichel@collabora.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH] drm/omap: dsi: fix unsigned expression compared with zero
Date: Fri, 12 Mar 2021 15:14:45 +0800
Message-Id: <20210312071445.1721-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: EcCowAAHBo7VFUtg3tQRpg--.3254S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1DCr1fKr4rGr4xtw1UKFg_yoWDCFc_CF
 1Ivr13WrWUCF9rZr4ayay7Zry09F1SvFWrWr12qa4fA3yaqr9rJ3srCFyxXw1DCF4UtF95
 G3WDur1fZan7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0j0P7UUUUU==
X-Originating-IP: [119.137.52.39]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/1tbiKxZTI1QHWs6ysAAAsI
X-Mailman-Approved-At: Fri, 12 Mar 2021 07:53:44 +0000
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
Cc: Junlin Yang <yangjunlin@yulong.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Junlin Yang <yangjunlin@yulong.com>

r is "u32" always >= 0,mipi_dsi_create_packet may return little than zero.
so r < 0 condition is never accessible.

Fixes coccicheck warnings:
./drivers/gpu/drm/omapdrm/dss/dsi.c:2155:5-6:
WARNING: Unsigned expression compared with zero: r < 0

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8e11612..b31d750 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2149,11 +2149,12 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
 			     const struct mipi_dsi_msg *msg)
 {
 	struct mipi_dsi_packet pkt;
+	int ret;
 	u32 r;
 
-	r = mipi_dsi_create_packet(&pkt, msg);
-	if (r < 0)
-		return r;
+	ret = mipi_dsi_create_packet(&pkt, msg);
+	if (ret < 0)
+		return ret;
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
-- 
1.9.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
