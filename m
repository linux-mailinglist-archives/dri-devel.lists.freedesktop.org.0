Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B825E711
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8C6ED64;
	Sat,  5 Sep 2020 10:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4F96ED43
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+kekVY1ysXXVxtQl2+Ofqk1YNgrLDl1hS21TPN9wUu4=; b=Q6rnyjereYVs3tsgZqs0O48Cql
 ZfqPpyYzGI4N8qcbkKHLNxCGOQiV3q/BXMWmAR44OBABcXoP0TAPWmOPFSZL6Ko6L4Zp00oIo4yQ1
 c9WWiOQRCzMSELisQjSs6prCtJ+LUMd8eN5ITBoMnrDFCUlLRtsfyOsroOGBdpgdtRcKzgIBO6vmi
 o+ty/wz8p1t1b4yiWSmv+eJPCaVKU9w31sJLjzvOOZvUOcuzjcW3vciRl4MR00SgoPkAYAxImIA5e
 0FEghTOd6MylrtC/S6+12El91qfQe+phaQiuv1EcpoMKhqYpOKNmYBRw3HRWT7sAU8a5NYqHhsGIi
 9Jri5RKQ==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kEVXw-0003SS-Oe; Sat, 05 Sep 2020 13:35:48 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH v2 03/17] gpu: host1x: Show number of pending waiters in
 debugfs
Date: Sat,  5 Sep 2020 13:34:06 +0300
Message-Id: <20200905103420.3021852-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Show the number of pending waiters in the debugfs status file.
This is useful for testing to verify that waiters do not leak
or accumulate incorrectly.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/debug.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 3eee4318b158..2d06a7406b3b 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 
 static void show_syncpts(struct host1x *m, struct output *o)
 {
+	struct list_head *pos;
 	unsigned int i;
 
 	host1x_debug_output(o, "---- syncpts ----\n");
@@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
 	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
 		u32 max = host1x_syncpt_read_max(m->syncpt + i);
 		u32 min = host1x_syncpt_load(m->syncpt + i);
+		unsigned int waiters = 0;
 
-		if (!min && !max)
+		spin_lock(&m->syncpt[i].intr.lock);
+		list_for_each(pos, &m->syncpt[i].intr.wait_head)
+			waiters++;
+		spin_unlock(&m->syncpt[i].intr.lock);
+
+		if (!min && !max && !waiters)
 			continue;
 
-		host1x_debug_output(o, "id %u (%s) min %d max %d\n",
-				    i, m->syncpt[i].name, min, max);
+		host1x_debug_output(o,
+				    "id %u (%s) min %d max %d (%d waiters)\n",
+				    i, m->syncpt[i].name, min, max, waiters);
 	}
 
 	for (i = 0; i < host1x_syncpt_nb_bases(m); i++) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
