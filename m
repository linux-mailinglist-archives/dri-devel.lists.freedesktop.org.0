Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677C57040F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 15:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26F48DD50;
	Mon, 11 Jul 2022 13:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A77A14A415
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=83SF3
 SCI6ro5rywd/05deoKsdsUdEXy2kfWFExIymC8=; b=oXfry2dlk+jMmDaqPUfKT
 p090r1VkcseAJWhBhCSOf451z3CdL55VuDBOFFx3DsZGXtw8TKNSjA9qWdnCUGEI
 XYxwPTkdRCDzyR0rZXOf8PWRnX6DP1qvOvNQzloGs7jWfGgpq+cdRviPrGtM/QyN
 6KuGler9Uo2Goi7TR1/pzc=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp2 (Coremail) with SMTP id DMmowAA3QwaGIsxi8ea7Eg--.45865S2;
 Mon, 11 Jul 2022 21:15:51 +0800 (CST)
From: Liang He <windhl@126.com>
To: emma@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, windhl@126.com
Subject: [PATCH] drm:pl111: Add of_node_put() when breaking out of
 for_each_available_child_of_node()
Date: Mon, 11 Jul 2022 21:15:50 +0800
Message-Id: <20220711131550.361350-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAA3QwaGIsxi8ea7Eg--.45865S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr13trWkAw17tF4UXw48Xrb_yoW8JFyfpF
 43urWS9F48Gw129w4jyw18ZF93K3WYyFWrWryfGF98Ca43ZF95AryUtrW7C398Xa4fAw1Y
 grWqgw17XFWxZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY_MfUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgg7F18RPeT+XQAAse
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

The reference 'child' in the iteration of for_each_available_child_of_node()
is only escaped out into a local variable which is only used to check
its value. So we still need to the of_node_put() when breaking of the
for_each_available_child_of_node() which will automatically increase
and decrease the refcount.

Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
Signed-off-by: Liang He <windhl@126.com>
---

As 'Check-after-Put' has been widely accepted in kernel source, we just
use it. If the maintainer thinks it is harmful, I'd like also to use
'Check-and-Put' coding style but with a bit more work.

 drivers/gpu/drm/pl111/pl111_versatile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index bdd883f4f0da..963a5d5e6987 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -402,6 +402,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 		if (of_device_is_compatible(child, "arm,pl111")) {
 			has_coretile_clcd = true;
 			ct_clcd = child;
+			of_node_put(child);
 			break;
 		}
 		if (of_device_is_compatible(child, "arm,hdlcd")) {
-- 
2.25.1

